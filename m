Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E00D928E04
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 22:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8355A10EBC5;
	Fri,  5 Jul 2024 20:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8FC10EBFD
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 20:00:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-0003VL-Kr; Fri, 05 Jul 2024 22:00:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6L-007Ocg-VB; Fri, 05 Jul 2024 22:00:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 2/5] drm/etnaviv: assert GPU lock held in perfmon
 pipe_*_read functions
Date: Fri,  5 Jul 2024 22:00:10 +0200
Message-Id: <20240705200013.2656275-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705200013.2656275-1-l.stach@pengutronix.de>
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
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

The perf counter read functions don't just read registers, but they
also mutate state to direct the reads towards the correct pipe and
engine. Assert that the GPU mutex is held at this point, so that
those state changes don't interfere with others.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2: new patch
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index dc9dea664a28..d53a5c293373 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -62,6 +62,8 @@ static u32 pipe_perf_reg_read(struct etnaviv_gpu *gpu,
 	u32 value = 0;
 	unsigned i;
 
+	lockdep_assert_held(&gpu->lock);
+
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
 		pipe_select(gpu, clock, i);
 		value += perf_reg_read(gpu, domain, signal);
@@ -81,6 +83,8 @@ static u32 pipe_reg_read(struct etnaviv_gpu *gpu,
 	u32 value = 0;
 	unsigned i;
 
+	lockdep_assert_held(&gpu->lock);
+
 	for (i = 0; i < gpu->identity.pixel_pipes; i++) {
 		pipe_select(gpu, clock, i);
 		value += gpu_read(gpu, signal->data);
-- 
2.39.2

