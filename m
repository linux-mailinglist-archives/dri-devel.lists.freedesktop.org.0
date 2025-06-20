Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EEAAE232C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 21:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A92F10EBB3;
	Fri, 20 Jun 2025 19:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CF010E163
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 19:58:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uShsl-0001hM-FT; Fri, 20 Jun 2025 21:58:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <l.stach@pengutronix.de>) id 1uShsl-004VlV-0m;
 Fri, 20 Jun 2025 21:58:39 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-slt@pengutronix.de
Subject: [PATCH] drm/etnaviv: remove unnecessary cache flushes on pipe switch
Date: Fri, 20 Jun 2025 21:58:39 +0200
Message-Id: <20250620195839.2772261-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current pipe switch sequence is ported from the Vivante driver,
which does flush some caches before switching to another pipe. This
however, is not necessary with etnaviv, as we always flush all write
caches before completion of a cmdstream. Thus the caches are already
clean before execution of the next cmdstream, which may
trigger a pipe switch, is started.

Drop the unnecessary cache flushes. This also avoids sending a stall
command into a GPU where the active pipe has not been selected, yet.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index b13a17276d07..09c5d1d0271c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -90,25 +90,6 @@ static inline void CMD_SEM(struct etnaviv_cmdbuf *buffer, u32 from, u32 to)
 static void etnaviv_cmd_select_pipe(struct etnaviv_gpu *gpu,
 	struct etnaviv_cmdbuf *buffer, u8 pipe)
 {
-	u32 flush = 0;
-
-	lockdep_assert_held(&gpu->lock);
-
-	/*
-	 * This assumes that if we're switching to 2D, we're switching
-	 * away from 3D, and vice versa.  Hence, if we're switching to
-	 * the 2D core, we need to flush the 3D depth and color caches,
-	 * otherwise we need to flush the 2D pixel engine cache.
-	 */
-	if (gpu->exec_state == ETNA_PIPE_2D)
-		flush = VIVS_GL_FLUSH_CACHE_PE2D;
-	else if (gpu->exec_state == ETNA_PIPE_3D)
-		flush = VIVS_GL_FLUSH_CACHE_DEPTH | VIVS_GL_FLUSH_CACHE_COLOR;
-
-	CMD_LOAD_STATE(buffer, VIVS_GL_FLUSH_CACHE, flush);
-	CMD_SEM(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
-	CMD_STALL(buffer, SYNC_RECIPIENT_FE, SYNC_RECIPIENT_PE);
-
 	CMD_LOAD_STATE(buffer, VIVS_GL_PIPE_SELECT,
 		       VIVS_GL_PIPE_SELECT_PIPE(pipe));
 }
@@ -382,7 +363,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u32 exec_state,
 
 		/* pipe switch commands */
 		if (switch_context)
-			extra_dwords += 4;
+			extra_dwords += 1;
 
 		/* PTA load command */
 		if (switch_mmu_context && gpu->sec_mode == ETNA_SEC_KERNEL)
-- 
2.39.5

