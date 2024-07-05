Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3A928E08
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 22:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D2A10EC30;
	Fri,  5 Jul 2024 20:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FE110EBC5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 20:00:18 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-0003VY-Lo; Fri, 05 Jul 2024 22:00:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sPp6M-007Ocg-6s; Fri, 05 Jul 2024 22:00:14 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH v2 5/5] drm/etnaviv: take current primitive into account when
 checking for hung GPU
Date: Fri,  5 Jul 2024 22:00:13 +0200
Message-Id: <20240705200013.2656275-5-l.stach@pengutronix.de>
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

Large draws can make the GPU appear to be stuck to the current hangcheck
logic as the FE address will not move until the draw is finished. However,
the FE has a debug register, which records the current primitive ID within
a draw. Using this debug register we can extend the timeout as long as the
draw progresses.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
v2:
- dropped debug register enable/disable
- locked against concurrent debug register access
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 31322195b9e4..4d8a7d48ade3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -144,6 +144,7 @@ struct etnaviv_gpu {
 
 	/* hang detection */
 	u32 hangcheck_dma_addr;
+	u32 hangcheck_primid;
 	u32 hangcheck_fence;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 62dcfdc7894d..01f927430bc6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -11,6 +11,7 @@
 #include "etnaviv_gpu.h"
 #include "etnaviv_sched.h"
 #include "state.xml.h"
+#include "state_hi.xml.h"
 
 static int etnaviv_job_hang_limit = 0;
 module_param_named(job_hang_limit, etnaviv_job_hang_limit, int , 0444);
@@ -35,7 +36,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
 	struct etnaviv_gpu *gpu = submit->gpu;
-	u32 dma_addr;
+	u32 dma_addr, primid = 0;
 	int change;
 
 	/*
@@ -52,10 +53,22 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	 */
 	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
 	change = dma_addr - gpu->hangcheck_dma_addr;
+	if (submit->exec_state == ETNA_PIPE_3D) {
+		/* guard against concurrent usage from perfmon_sample */
+		mutex_lock(&gpu->lock);
+		gpu_write(gpu, VIVS_MC_PROFILE_CONFIG0,
+			  VIVS_MC_PROFILE_CONFIG0_FE_CURRENT_PRIM <<
+			  VIVS_MC_PROFILE_CONFIG0_FE__SHIFT);
+		primid = gpu_read(gpu, VIVS_MC_PROFILE_FE_READ);
+		mutex_unlock(&gpu->lock);
+	}
 	if (gpu->state == ETNA_GPU_STATE_RUNNING &&
 	    (gpu->completed_fence != gpu->hangcheck_fence ||
-	     change < 0 || change > 16)) {
+	     change < 0 || change > 16 ||
+	     (submit->exec_state == ETNA_PIPE_3D &&
+	      gpu->hangcheck_primid != primid))) {
 		gpu->hangcheck_dma_addr = dma_addr;
+		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
 		goto out_no_timeout;
 	}
-- 
2.39.2

