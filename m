Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E98023F3515
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 22:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4825C6EB23;
	Fri, 20 Aug 2021 20:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CEA6EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 20:18:35 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mHAyI-000258-0j; Fri, 20 Aug 2021 22:18:34 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [PATCH 7/8] drm/etnaviv: reference MMU context when setting up
 hardware state
Date: Fri, 20 Aug 2021 22:18:29 +0200
Message-Id: <20210820201830.2005563-7-l.stach@pengutronix.de>
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

Move the refcount manipulation of the MMU context to the point where the
hardware state is programmed. At that point it is also known if a previous
MMU state is still there, or the state needs to be reprogrammed with a
potentially different context.

Cc: stable@vger.kernel.org # 5.4
Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Michael Walle <michael@walle.cc>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c      | 24 +++++++++++-----------
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c    |  4 ++++
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c |  8 ++++++++
 3 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index f420c4f14657..1fa98ce870f7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -641,17 +641,19 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
 	gpu->fe_running = true;
 }
 
-static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu)
+static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
+					  struct etnaviv_iommu_context *context)
 {
-	u32 address = etnaviv_cmdbuf_get_va(&gpu->buffer,
-				&gpu->mmu_context->cmdbuf_mapping);
 	u16 prefetch;
+	u32 address;
 
 	/* setup the MMU */
-	etnaviv_iommu_restore(gpu, gpu->mmu_context);
+	etnaviv_iommu_restore(gpu, context);
 
 	/* Start command processor */
 	prefetch = etnaviv_buffer_init(gpu);
+	address = etnaviv_cmdbuf_get_va(&gpu->buffer,
+					&gpu->mmu_context->cmdbuf_mapping);
 
 	etnaviv_gpu_start_fe(gpu, address, prefetch);
 }
@@ -1369,14 +1371,12 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 		goto out_unlock;
 	}
 
-	if (!gpu->fe_running) {
-		gpu->mmu_context = etnaviv_iommu_context_get(submit->mmu_context);
-		etnaviv_gpu_start_fe_idleloop(gpu);
-	} else {
-		if (submit->prev_mmu_context)
-			etnaviv_iommu_context_put(submit->prev_mmu_context);
-		submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
-	}
+	if (!gpu->fe_running)
+		etnaviv_gpu_start_fe_idleloop(gpu, submit->mmu_context);
+
+	if (submit->prev_mmu_context)
+		etnaviv_iommu_context_put(submit->prev_mmu_context);
+	submit->prev_mmu_context = etnaviv_iommu_context_get(gpu->mmu_context);
 
 	if (submit->nr_pmrs) {
 		gpu->event[event[1]].sync_point = &sync_point_perfmon_sample_pre;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
index 1a7c89a67bea..afe5dd6a9925 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu.c
@@ -92,6 +92,10 @@ static void etnaviv_iommuv1_restore(struct etnaviv_gpu *gpu,
 	struct etnaviv_iommuv1_context *v1_context = to_v1_context(context);
 	u32 pgtable;
 
+	if (gpu->mmu_context)
+		etnaviv_iommu_context_put(gpu->mmu_context);
+	gpu->mmu_context = etnaviv_iommu_context_get(context);
+
 	/* set base addresses */
 	gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_RA, context->global->memory_base);
 	gpu_write(gpu, VIVS_MC_MEMORY_BASE_ADDR_FE, context->global->memory_base);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
index f8bf488e9d71..d664ae29ae20 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c
@@ -172,6 +172,10 @@ static void etnaviv_iommuv2_restore_nonsec(struct etnaviv_gpu *gpu,
 	if (gpu_read(gpu, VIVS_MMUv2_CONTROL) & VIVS_MMUv2_CONTROL_ENABLE)
 		return;
 
+	if (gpu->mmu_context)
+		etnaviv_iommu_context_put(gpu->mmu_context);
+	gpu->mmu_context = etnaviv_iommu_context_get(context);
+
 	prefetch = etnaviv_buffer_config_mmuv2(gpu,
 				(u32)v2_context->mtlb_dma,
 				(u32)context->global->bad_page_dma);
@@ -192,6 +196,10 @@ static void etnaviv_iommuv2_restore_sec(struct etnaviv_gpu *gpu,
 	if (gpu_read(gpu, VIVS_MMUv2_SEC_CONTROL) & VIVS_MMUv2_SEC_CONTROL_ENABLE)
 		return;
 
+	if (gpu->mmu_context)
+		etnaviv_iommu_context_put(gpu->mmu_context);
+	gpu->mmu_context = etnaviv_iommu_context_get(context);
+
 	gpu_write(gpu, VIVS_MMUv2_PTA_ADDRESS_LOW,
 		  lower_32_bits(context->global->v2.pta_dma));
 	gpu_write(gpu, VIVS_MMUv2_PTA_ADDRESS_HIGH,
-- 
2.30.2

