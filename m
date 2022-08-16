Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C15A00E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 19:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4ECBF5DD;
	Wed, 24 Aug 2022 17:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74EE5113DEB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 17:28:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8EBE153B;
 Tue, 16 Aug 2022 10:28:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E39B33F67D;
 Tue, 16 Aug 2022 10:28:15 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH 3/3] iommu/dma: Make header private
Date: Tue, 16 Aug 2022 18:28:05 +0100
Message-Id: <b237e06c56a101f77af142a54b629b27aa179d22.1660668998.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
In-Reply-To: <cover.1660668998.git.robin.murphy@arm.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, cohuck@redhat.com, sw0312.kim@samsung.com,
 alex.williamson@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 kyungmin.park@samsung.com, maz@kernel.org, tglx@linutronix.de, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that dma-iommu.h only contains internal interfaces, make it
private to the IOMMU subsytem.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/acpi/viot.c                          |  1 -
 drivers/gpu/drm/exynos/exynos_drm_dma.c      |  1 -
 drivers/iommu/amd/iommu.c                    |  2 +-
 drivers/iommu/apple-dart.c                   |  3 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c  |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c        |  2 +-
 drivers/iommu/dma-iommu.c                    |  3 ++-
 {include/linux => drivers/iommu}/dma-iommu.h | 17 +----------------
 drivers/iommu/intel/iommu.c                  |  2 +-
 drivers/iommu/iommu.c                        |  3 ++-
 drivers/iommu/virtio-iommu.c                 |  3 ++-
 11 files changed, 13 insertions(+), 26 deletions(-)
 rename {include/linux => drivers/iommu}/dma-iommu.h (67%)

diff --git a/drivers/acpi/viot.c b/drivers/acpi/viot.c
index 6132092dab2a..ed752cbbe636 100644
--- a/drivers/acpi/viot.c
+++ b/drivers/acpi/viot.c
@@ -19,7 +19,6 @@
 #define pr_fmt(fmt) "ACPI: VIOT: " fmt
 
 #include <linux/acpi_viot.h>
-#include <linux/dma-iommu.h>
 #include <linux/fwnode.h>
 #include <linux/iommu.h>
 #include <linux/list.h>
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index d819ee69dfb7..7012aa8ed4c6 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -4,7 +4,6 @@
 // Author: Inki Dae <inki.dae@samsung.com>
 // Author: Andrzej Hajda <a.hajda@samsung.com>
 
-#include <linux/dma-iommu.h>
 #include <linux/dma-map-ops.h>
 #include <linux/iommu.h>
 #include <linux/platform_device.h>
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 2df1bfa884e5..b339bf13259d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -18,7 +18,6 @@
 #include <linux/scatterlist.h>
 #include <linux/dma-map-ops.h>
 #include <linux/dma-direct.h>
-#include <linux/dma-iommu.h>
 #include <linux/iommu-helper.h>
 #include <linux/delay.h>
 #include <linux/amd-iommu.h>
@@ -40,6 +39,7 @@
 #include <asm/dma.h>
 
 #include "amd_iommu.h"
+#include "../dma-iommu.h"
 #include "../irq_remapping.h"
 
 #define CMD_SET_TYPE(cmd, t) ((cmd)->data[1] |= ((t) << 28))
diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index ed6b5fa538af..716f34a768b1 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -15,7 +15,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/dev_printk.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -33,6 +32,8 @@
 #include <linux/swab.h>
 #include <linux/types.h>
 
+#include "dma-iommu.h"
+
 #define DART_MAX_STREAMS 16
 #define DART_MAX_TTBR 4
 #define MAX_DARTS_PER_DEVICE 2
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c13b46a15dcb..f1785e518a90 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -14,7 +14,6 @@
 #include <linux/bitops.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
-#include <linux/dma-iommu.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-pgtable.h>
@@ -29,6 +28,7 @@
 #include <linux/platform_device.h>
 
 #include "arm-smmu-v3.h"
+#include "../../dma-iommu.h"
 #include "../../iommu-sva-lib.h"
 
 static bool disable_bypass = true;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 2cece34f4824..c30f82c19240 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -21,7 +21,6 @@
 #include <linux/acpi_iort.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -40,6 +39,7 @@
 #include <linux/fsl/mc.h>
 
 #include "arm-smmu.h"
+#include "../../dma-iommu.h"
 
 /*
  * Apparently, some Qualcomm arm64 platforms which appear to expose their SMMU
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 6809b33ac9df..9297b741f5e8 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -13,7 +13,6 @@
 #include <linux/crash_dump.h>
 #include <linux/device.h>
 #include <linux/dma-direct.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-map-ops.h>
 #include <linux/gfp.h>
 #include <linux/huge_mm.h>
@@ -30,6 +29,8 @@
 #include <linux/swiotlb.h>
 #include <linux/vmalloc.h>
 
+#include "dma-iommu.h"
+
 struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
diff --git a/include/linux/dma-iommu.h b/drivers/iommu/dma-iommu.h
similarity index 67%
rename from include/linux/dma-iommu.h
rename to drivers/iommu/dma-iommu.h
index e83de4f1f3d6..c6d0235feb6e 100644
--- a/include/linux/dma-iommu.h
+++ b/drivers/iommu/dma-iommu.h
@@ -5,15 +5,10 @@
 #ifndef __DMA_IOMMU_H
 #define __DMA_IOMMU_H
 
-#include <linux/errno.h>
-#include <linux/types.h>
+#include <linux/iommu.h>
 
 #ifdef CONFIG_IOMMU_DMA
-#include <linux/dma-mapping.h>
-#include <linux/iommu.h>
-#include <linux/msi.h>
 
-/* Domain management interface for IOMMU drivers */
 int iommu_get_dma_cookie(struct iommu_domain *domain);
 void iommu_put_dma_cookie(struct iommu_domain *domain);
 
@@ -21,16 +16,10 @@ int iommu_dma_init_fq(struct iommu_domain *domain);
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
-void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
-		struct iommu_domain *domain);
-
 extern bool iommu_dma_forcedac;
 
 #else /* CONFIG_IOMMU_DMA */
 
-struct iommu_domain;
-struct device;
-
 static inline int iommu_dma_init_fq(struct iommu_domain *domain)
 {
 	return -EINVAL;
@@ -45,9 +34,5 @@ static inline void iommu_put_dma_cookie(struct iommu_domain *domain)
 {
 }
 
-static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
-{
-}
-
 #endif	/* CONFIG_IOMMU_DMA */
 #endif	/* __DMA_IOMMU_H */
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 9441c070c811..4375d1ee9389 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -15,7 +15,6 @@
 
 #include <linux/crash_dump.h>
 #include <linux/dma-direct.h>
-#include <linux/dma-iommu.h>
 #include <linux/dmi.h>
 #include <linux/intel-svm.h>
 #include <linux/memory.h>
@@ -26,6 +25,7 @@
 #include <linux/tboot.h>
 
 #include "iommu.h"
+#include "../dma-iommu.h"
 #include "../irq_remapping.h"
 #include "../iommu-sva-lib.h"
 #include "pasid.h"
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 07eda7c41aee..862d4e73efd2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -8,7 +8,6 @@
 
 #include <linux/amba/bus.h>
 #include <linux/device.h>
-#include <linux/dma-iommu.h>
 #include <linux/kernel.h>
 #include <linux/bits.h>
 #include <linux/bug.h>
@@ -30,6 +29,8 @@
 #include <linux/cc_platform.h>
 #include <trace/events/iommu.h>
 
+#include "dma-iommu.h"
+
 static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
 
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index bdae3939260a..e355cb5d1e5b 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -8,7 +8,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/delay.h>
-#include <linux/dma-iommu.h>
 #include <linux/dma-map-ops.h>
 #include <linux/freezer.h>
 #include <linux/interval_tree.h>
@@ -23,6 +22,8 @@
 
 #include <uapi/linux/virtio_iommu.h>
 
+#include "dma-iommu.h"
+
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
-- 
2.36.1.dirty

