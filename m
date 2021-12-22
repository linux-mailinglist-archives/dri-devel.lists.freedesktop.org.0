Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D432147CA2B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 01:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD6210E15E;
	Wed, 22 Dec 2021 00:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5910E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:17:31 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mzpJy-0000wa-0U; Wed, 22 Dec 2021 01:17:30 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH] drm/etnaviv: consider completed fence seqno in hang check
Date: Wed, 22 Dec 2021 01:17:28 +0100
Message-Id: <20211222001728.2514705-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Joerg Albert <joerg.albert@iav.de>, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some GPU heavy test programs manage to trigger the hangcheck quite often.
If there are no other GPU users in the system and the test program
exhibits a very regular structure in the commandstreams that are being
submitted, we can end up with two distinct submits managing to trigger
the hangcheck with the FE in a very similar address range. This leads
the hangcheck to believe that the GPU is stuck, while in reality the GPU
is already busy working on a different job. To avoid those spurious
GPU resets, also remember and consider the last completed fence seqno
in the hang check.

Reported-by: Joerg Albert <joerg.albert@iav.de>
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 1c75c8ed5bce..85eddd492774 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -130,6 +130,7 @@ struct etnaviv_gpu {
 
 	/* hang detection */
 	u32 hangcheck_dma_addr;
+	u32 hangcheck_fence;
 
 	void __iomem *mmio;
 	int irq;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 180bb633d5c5..58f593b278c1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -107,8 +107,10 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	 */
 	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
 	change = dma_addr - gpu->hangcheck_dma_addr;
-	if (change < 0 || change > 16) {
+	if (gpu->completed_fence != gpu->hangcheck_fence ||
+	    change < 0 || change > 16) {
 		gpu->hangcheck_dma_addr = dma_addr;
+		gpu->hangcheck_fence = gpu->completed_fence;
 		goto out_no_timeout;
 	}
 
-- 
2.30.2

