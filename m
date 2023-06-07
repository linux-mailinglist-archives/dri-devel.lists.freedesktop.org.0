Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5072605B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3384910E4FC;
	Wed,  7 Jun 2023 13:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0475A10E4F4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:30 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6sny-0004N0-G2; Wed, 07 Jun 2023 15:02:26 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 8/8] drm/etnaviv: expedited MMU fault handling
Date: Wed,  7 Jun 2023 15:02:23 +0200
Message-Id: <20230607130223.3533464-8-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607130223.3533464-1-l.stach@pengutronix.de>
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU is halted when it hits a MMU exception, so there is no point in
waiting for the job timeout to expire or try to work out if the GPU is
still making progress in the timeout handler, as we know that the GPU
won't make any more progress.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 5 +++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index e62761032afe..74fdcaf52fc5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1531,6 +1531,8 @@ static irqreturn_t irq_handler(int irq, void *data)
 
 		if (intr & VIVS_HI_INTR_ACKNOWLEDGE_MMU_EXCEPTION) {
 			dump_mmu_fault(gpu);
+			gpu->state = ETNA_GPU_STATE_FAULT;
+			drm_sched_fault(&gpu->sched);
 			intr &= ~VIVS_HI_INTR_ACKNOWLEDGE_MMU_EXCEPTION;
 		}
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index a4a9253f0d52..d4b9a97f2c72 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -101,6 +101,7 @@ enum etnaviv_gpu_state {
 	ETNA_GPU_STATE_RESET,
 	ETNA_GPU_STATE_INITIALIZED,
 	ETNA_GPU_STATE_RUNNING,
+	ETNA_GPU_STATE_FAULT,
 };
 
 struct etnaviv_gpu {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 1ae87dfd19c4..345fec6cb1a4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -55,8 +55,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	 */
 	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
 	change = dma_addr - gpu->hangcheck_dma_addr;
-	if (gpu->completed_fence != gpu->hangcheck_fence ||
-	    change < 0 || change > 16) {
+	if (gpu->state == ETNA_GPU_STATE_RUNNING &&
+	    (gpu->completed_fence != gpu->hangcheck_fence ||
+	     change < 0 || change > 16)) {
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_fence = gpu->completed_fence;
 		goto out_no_timeout;
-- 
2.39.2

