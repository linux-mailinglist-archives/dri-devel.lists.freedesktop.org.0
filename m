Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC39D6939FB
	for <lists+dri-devel@lfdr.de>; Sun, 12 Feb 2023 21:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127C210E488;
	Sun, 12 Feb 2023 20:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305210E474
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Feb 2023 20:45:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D513E60B35;
 Sun, 12 Feb 2023 20:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617CCC433D2;
 Sun, 12 Feb 2023 20:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676234745;
 bh=dHdx8uSXwdR0AeBdqA2WsjSIeksu2Braq06Ba1WJHmU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QGcCTxaRK9a6W/3c6PCaW3QVI+hi4ZKdrQeU8kZAg2KSKjpx/sND8YxkfrJWhJsG7
 9qAfqYzAlaW/eOlOBuPMlfXJtToSlXBFbVPMHYUxTO0yPF00+QyoAk8jOBSMGAAol9
 1QqvzMTAcqycm/XGIPznrS7AwfD29U3KeR93S8CZ+/97gYzirbpmb/4ush7ru61qFg
 rVdWzF0BeIH8FFy1Vhx49OkmUqNFXzec0KLIghJMYNfrJHsp6vOyZrmVScUGFtPEWL
 zxx4HXwg8Y1cyu8kIG9CiS1WYmbpmF8z/G0+pKOR66aT2H5ihEJh2XXEdNJ1HYnvjB
 tFeHK2QMwtDAw==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 27/27] habanalabs: don't trace cpu accessible dma alloc/free
Date: Sun, 12 Feb 2023 22:44:54 +0200
Message-Id: <20230212204454.2938561-27-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dafna Hirschfeld <dhirschfeld@habana.ai>

The cpu accessible dma allocations use the gen_pool api which actually
does not allocate new memory from the system but manages memory already
allocated before. When tracing this together with real dma
allocation/free it cause confusing logs like a '0' dma address and
a cpu address appearing twice etc.

Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c     | 29 +++++++-------------
 drivers/accel/habanalabs/common/habanalabs.h | 12 ++------
 2 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 8e71793c6ad1..fefe70bbbede 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -22,7 +22,6 @@
 
 enum dma_alloc_type {
 	DMA_ALLOC_COHERENT,
-	DMA_ALLOC_CPU_ACCESSIBLE,
 	DMA_ALLOC_POOL,
 };
 
@@ -121,9 +120,6 @@ static void *hl_dma_alloc_common(struct hl_device *hdev, size_t size, dma_addr_t
 	case DMA_ALLOC_COHERENT:
 		ptr = hdev->asic_funcs->asic_dma_alloc_coherent(hdev, size, dma_handle, flag);
 		break;
-	case DMA_ALLOC_CPU_ACCESSIBLE:
-		ptr = hdev->asic_funcs->cpu_accessible_dma_pool_alloc(hdev, size, dma_handle);
-		break;
 	case DMA_ALLOC_POOL:
 		ptr = hdev->asic_funcs->asic_dma_pool_zalloc(hdev, size, flag, dma_handle);
 		break;
@@ -147,9 +143,6 @@ static void hl_asic_dma_free_common(struct hl_device *hdev, size_t size, void *c
 	case DMA_ALLOC_COHERENT:
 		hdev->asic_funcs->asic_dma_free_coherent(hdev, size, cpu_addr, dma_handle);
 		break;
-	case DMA_ALLOC_CPU_ACCESSIBLE:
-		hdev->asic_funcs->cpu_accessible_dma_pool_free(hdev, size, cpu_addr);
-		break;
 	case DMA_ALLOC_POOL:
 		hdev->asic_funcs->asic_dma_pool_free(hdev, cpu_addr, dma_handle);
 		break;
@@ -170,18 +163,6 @@ void hl_asic_dma_free_coherent_caller(struct hl_device *hdev, size_t size, void
 	hl_asic_dma_free_common(hdev, size, cpu_addr, dma_handle, DMA_ALLOC_COHERENT, caller);
 }
 
-void *hl_cpu_accessible_dma_pool_alloc_caller(struct hl_device *hdev, size_t size,
-						dma_addr_t *dma_handle, const char *caller)
-{
-	return hl_dma_alloc_common(hdev, size, dma_handle, 0, DMA_ALLOC_CPU_ACCESSIBLE, caller);
-}
-
-void hl_cpu_accessible_dma_pool_free_caller(struct hl_device *hdev, size_t size, void *vaddr,
-						const char *caller)
-{
-	hl_asic_dma_free_common(hdev, size, vaddr, 0, DMA_ALLOC_CPU_ACCESSIBLE, caller);
-}
-
 void *hl_asic_dma_pool_zalloc_caller(struct hl_device *hdev, size_t size, gfp_t mem_flags,
 					dma_addr_t *dma_handle, const char *caller)
 {
@@ -194,6 +175,16 @@ void hl_asic_dma_pool_free_caller(struct hl_device *hdev, void *vaddr, dma_addr_
 	hl_asic_dma_free_common(hdev, 0, vaddr, dma_addr, DMA_ALLOC_POOL, caller);
 }
 
+void *hl_cpu_accessible_dma_pool_alloc(struct hl_device *hdev, size_t size, dma_addr_t *dma_handle)
+{
+	return hdev->asic_funcs->cpu_accessible_dma_pool_alloc(hdev, size, dma_handle);
+}
+
+void hl_cpu_accessible_dma_pool_free(struct hl_device *hdev, size_t size, void *vaddr)
+{
+	hdev->asic_funcs->cpu_accessible_dma_pool_free(hdev, size, vaddr);
+}
+
 int hl_dma_map_sgtable(struct hl_device *hdev, struct sg_table *sgt, enum dma_data_direction dir)
 {
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
index ec0879168adf..7b6b4ff20a3b 100644
--- a/drivers/accel/habanalabs/common/habanalabs.h
+++ b/drivers/accel/habanalabs/common/habanalabs.h
@@ -155,18 +155,12 @@ enum hl_mmu_enablement {
 #define hl_asic_dma_alloc_coherent(hdev, size, dma_handle, flags) \
 	hl_asic_dma_alloc_coherent_caller(hdev, size, dma_handle, flags, __func__)
 
-#define hl_cpu_accessible_dma_pool_alloc(hdev, size, dma_handle) \
-	hl_cpu_accessible_dma_pool_alloc_caller(hdev, size, dma_handle, __func__)
-
 #define hl_asic_dma_pool_zalloc(hdev, size, mem_flags, dma_handle) \
 	hl_asic_dma_pool_zalloc_caller(hdev, size, mem_flags, dma_handle, __func__)
 
 #define hl_asic_dma_free_coherent(hdev, size, cpu_addr, dma_handle) \
 	hl_asic_dma_free_coherent_caller(hdev, size, cpu_addr, dma_handle, __func__)
 
-#define hl_cpu_accessible_dma_pool_free(hdev, size, vaddr) \
-	hl_cpu_accessible_dma_pool_free_caller(hdev, size, vaddr, __func__)
-
 #define hl_asic_dma_pool_free(hdev, vaddr, dma_addr) \
 	hl_asic_dma_pool_free_caller(hdev, vaddr, dma_addr, __func__)
 
@@ -3602,14 +3596,12 @@ static inline bool hl_mem_area_crosses_range(u64 address, u32 size,
 }
 
 uint64_t hl_set_dram_bar_default(struct hl_device *hdev, u64 addr);
+void *hl_cpu_accessible_dma_pool_alloc(struct hl_device *hdev, size_t size, dma_addr_t *dma_handle);
+void hl_cpu_accessible_dma_pool_free(struct hl_device *hdev, size_t size, void *vaddr);
 void *hl_asic_dma_alloc_coherent_caller(struct hl_device *hdev, size_t size, dma_addr_t *dma_handle,
 					gfp_t flag, const char *caller);
 void hl_asic_dma_free_coherent_caller(struct hl_device *hdev, size_t size, void *cpu_addr,
 					dma_addr_t dma_handle, const char *caller);
-void *hl_cpu_accessible_dma_pool_alloc_caller(struct hl_device *hdev, size_t size,
-						dma_addr_t *dma_handle, const char *caller);
-void hl_cpu_accessible_dma_pool_free_caller(struct hl_device *hdev, size_t size, void *vaddr,
-						const char *caller);
 void *hl_asic_dma_pool_zalloc_caller(struct hl_device *hdev, size_t size, gfp_t mem_flags,
 					dma_addr_t *dma_handle, const char *caller);
 void hl_asic_dma_pool_free_caller(struct hl_device *hdev, void *vaddr, dma_addr_t dma_addr,
-- 
2.25.1

