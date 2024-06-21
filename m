Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE868912C48
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 19:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A458510E437;
	Fri, 21 Jun 2024 17:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635BA10E437
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 17:13:09 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKhox-0007Lf-QJ; Fri, 21 Jun 2024 19:13:07 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sKhox-003zT9-BX; Fri, 21 Jun 2024 19:13:07 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 patchwork-lst@pengutronix.de, kernel@pengutronix.de
Subject: [PATCH v2] drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
Date: Fri, 21 Jun 2024 19:13:07 +0200
Message-Id: <20240621171307.414953-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
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

The etnaviv devcoredump is created in the GPU reset path, which
must make forward progress to avoid stalling memory reclaim on
unsignalled dma fences. The currently used __GFP_NORETRY does not
prohibit sleeping on direct reclaim, breaking the forward progress
guarantee. Switch to GFP_NOWAIT, which allows background reclaim
to be triggered, but avoids any stalls waiting for direct reclaim.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
v2: drop __GFP_NORWARN, as it's already part of GFP_NOWAIT
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 898f84a0fc30..2cd223461eba 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -159,8 +159,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
 	file_size += sizeof(*iter.hdr) * n_obj;
 
 	/* Allocate the file in vmalloc memory, it's likely to be big */
-	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
-			__GFP_NORETRY);
+	iter.start = __vmalloc(file_size, GFP_NOWAIT);
 	if (!iter.start) {
 		mutex_unlock(&submit->mmu_context->lock);
 		dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
@@ -230,5 +229,5 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *submit)
 
 	etnaviv_core_dump_header(&iter, ETDUMP_BUF_END, iter.data);
 
-	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start, GFP_KERNEL);
+	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start, GFP_NOWAIT);
 }
-- 
2.39.2

