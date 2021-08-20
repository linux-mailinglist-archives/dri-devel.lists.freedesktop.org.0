Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61353F3519
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 22:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5DD6EB27;
	Fri, 20 Aug 2021 20:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CE06EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 20:18:34 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mHAyG-000258-C6; Fri, 20 Aug 2021 22:18:32 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 3/8] drm/etnaviv: stop abusing mmu_context as FE running marker
Date: Fri, 20 Aug 2021 22:18:25 +0200
Message-Id: <20210820201830.2005563-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210820201830.2005563-1-l.stach@pengutronix.de>
References: <20210820201830.2005563-1-l.stach@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the DMA frontend can only be active when the MMU context is set, the
reverse isn't necessarily true, as the frontend can be stopped while the
MMU state is kept. Stop treating mmu_context being set as a indication that
the frontend is running and instead add a explicit property.

Cc: stable@vger.kernel.org # 5.4
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 10 ++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c1b9c5cbed11..325858cfc2c3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -569,6 +569,8 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 	/* We rely on the GPU running, so program the clock */
 	etnaviv_gpu_update_clock(gpu);
 
+	gpu->fe_running = false;
+
 	return 0;
 }
 
@@ -631,6 +633,8 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
 			  VIVS_MMUv2_SEC_COMMAND_CONTROL_ENABLE |
 			  VIVS_MMUv2_SEC_COMMAND_CONTROL_PREFETCH(prefetch));
 	}
+
+	gpu->fe_running = true;
 }
 
 static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu)
@@ -1364,7 +1368,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 		goto out_unlock;
 	}
 
-	if (!gpu->mmu_context) {
+	if (!gpu->fe_running) {
 		gpu->mmu_context = etnaviv_iommu_context_get(submit->mmu_context);
 		etnaviv_gpu_start_fe_idleloop(gpu);
 	} else {
@@ -1573,7 +1577,7 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
 
 static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 {
-	if (gpu->initialized && gpu->mmu_context) {
+	if (gpu->initialized && gpu->fe_running) {
 		/* Replace the last WAIT with END */
 		mutex_lock(&gpu->lock);
 		etnaviv_buffer_end(gpu);
@@ -1588,6 +1592,8 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 
 		etnaviv_iommu_context_put(gpu->mmu_context);
 		gpu->mmu_context = NULL;
+
+		gpu->fe_running = false;
 	}
 
 	gpu->exec_state = -1;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 8ea48697d132..1c75c8ed5bce 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -101,6 +101,7 @@ struct etnaviv_gpu {
 	struct workqueue_struct *wq;
 	struct drm_gpu_scheduler sched;
 	bool initialized;
+	bool fe_running;
 
 	/* 'ring'-buffer: */
 	struct etnaviv_cmdbuf buffer;
-- 
2.30.2

