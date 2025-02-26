Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638ECA469CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801E10E9B2;
	Wed, 26 Feb 2025 18:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Nrsxk+PL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5F510E9AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1740594666; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IFjmowSn2brvCNGXW8wmjdv/yKwCOdb1y5vHDIviHW9il1cXQWnSP4XHd9R45dV5nZAlzq6jfmiz1YKzMpE/iu/WnBB35dDR1tKNRP4YX9cwzQaSxGSrie6NM3BcqmityOdrgAZjjG6EkPgqsykx8Ea8gOKVLfLveV0v3PKpbGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1740594666;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4tPfmilrVNqizmJkoDPKLzE59AVdZxOsEJYx5U3H5Co=; 
 b=gpuaGou3JuFg13lZzQtNiMl4GtF8EuoMdMwTuVNH2HGvipN6dqC/usDVcf6PpeV8hEYNbBIw49IjH540yLWwshidlV044U8YzCMMExqFXJONuoILN5gY2l5Ur7qlTJ9VvTIXSHNGVc8UcnTodLkQLVNELouKeXjCUhimEjkf4vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740594666; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4tPfmilrVNqizmJkoDPKLzE59AVdZxOsEJYx5U3H5Co=;
 b=Nrsxk+PL65wQmj/2PcD7o3cEQDHggjceFm+0psAVTBg4IUDNg257WPgCCcjr4xd+
 4WUZHXXYuI1FmyGT2Ny+B2jnAlqc7qin3mKxpcrVENl4qXEIjM9edbTWRahxV/aOLzE
 Ir4yysTNCkA6vHtv1w7cGOCMA6pgUOcCzcQSIYzc=
Received: by mx.zohomail.com with SMTPS id 1740594663923418.7985362887397;
 Wed, 26 Feb 2025 10:31:03 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
Date: Wed, 26 Feb 2025 15:30:42 -0300
Message-ID: <20250226183043.140773-4-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Bifrost MMUs support AArch64 4kB granule specification. However,
panfrost only enables MMU in legacy mode, despite the presence of the
HW_FEATURE_AARCH64_MMU feature flag.

This commit adds support to use page tables according to AArch64 4kB
granule specification. This feature is enabled conditionally based on
the GPU model's HW_FEATURE_AARCH64_MMU feature flag.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 118 +++++++++++++++++----
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  29 +++++
 3 files changed, 128 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..dea252f43c58 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -153,6 +153,7 @@ struct panfrost_device {
 };
 
 struct panfrost_mmu {
+	void (*enable)(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
 	struct panfrost_device *pfdev;
 	struct kref refcount;
 	struct io_pgtable_cfg pgtbl_cfg;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 7df2c8d5b0ae..30b8e2723254 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -26,6 +26,48 @@
 #define mmu_write(dev, reg, data) writel(data, dev->iomem + reg)
 #define mmu_read(dev, reg) readl(dev->iomem + reg)
 
+static u64 mair_to_memattr(u64 mair, bool coherent)
+{
+	u64 memattr = 0;
+	u32 i;
+
+	for (i = 0; i < 8; i++) {
+		u8 in_attr = mair >> (8 * i), out_attr;
+		u8 outer = in_attr >> 4, inner = in_attr & 0xf;
+
+		/* For caching to be enabled, inner and outer caching policy
+		 * have to be both write-back, if one of them is write-through
+		 * or non-cacheable, we just choose non-cacheable. Device
+		 * memory is also translated to non-cacheable.
+		 */
+		if (!(outer & 3) || !(outer & 4) || !(inner & 4)) {
+			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_NC |
+				   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER |
+				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(false, false);
+		} else {
+			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_WB |
+				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(inner & 1, inner & 2);
+			/* Use SH_MIDGARD_INNER mode when device isn't coherent,
+			 * so SH_IS, which is used when IOMMU_CACHE is set, maps
+			 * to Mali's internal-shareable mode. As per the Mali
+			 * Spec, inner and outer-shareable modes aren't allowed
+			 * for WB memory when coherency is disabled.
+			 * Use SH_CPU_INNER mode when coherency is enabled, so
+			 * that SH_IS actually maps to the standard definition of
+			 * inner-shareable.
+			 */
+			if (!coherent)
+				out_attr |= AS_MEMATTR_AARCH64_SH_MIDGARD_INNER;
+			else
+				out_attr |= AS_MEMATTR_AARCH64_SH_CPU_INNER;
+		}
+
+		memattr |= (u64)out_attr << (8 * i);
+	}
+
+	return memattr;
+}
+
 static int wait_ready(struct panfrost_device *pfdev, u32 as_nr)
 {
 	int ret;
@@ -121,38 +163,66 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
 	return ret;
 }
 
-static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
+static void
+_panfrost_mmu_as_control_write(struct panfrost_device *pfdev, u32 as_nr,
+			       u64 transtab, u64 memattr, u64 transcfg)
 {
-	int as_nr = mmu->as;
-	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
-	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
-	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
-
 	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 
 	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
 	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
 
-	/* Need to revisit mem attrs.
-	 * NC is the default, Mali driver is inner WT.
-	 */
 	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
 	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
 
+	mmu_write(pfdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
+	mmu_write(pfdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
+
+	dev_dbg(pfdev->dev, "mmu_as_control: as=%d, transtab=0x%016llx, memattr=0x%016llx, transcfg=0x%016llx",
+		as_nr, transtab, memattr, transcfg);
 }
 
-static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
+static void mmu_lpae_s1_enable(struct panfrost_device *pfdev,
+			       struct panfrost_mmu *mmu)
 {
-	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
+	int as_nr = mmu->as;
 
-	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), 0);
-	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), 0);
+	u64 transtab =
+		cfg->arm_lpae_s1_cfg.ttbr & AS_TRANSTAB_LPAE_ADDR_SPACE_MASK;
+	u64 memattr =
+		mair_to_memattr(cfg->arm_lpae_s1_cfg.mair, pfdev->coherent);
+	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
+	u64 transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
+		       AS_TRANSCFG_PTW_RA |
+		       AS_TRANSCFG_ADRMODE_AARCH64_4K |
+		       AS_TRANSCFG_INA_BITS(55 - va_bits);
 
-	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), 0);
-	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), 0);
+	if (pfdev->coherent)
+		transcfg |= AS_TRANSCFG_PTW_SH_OS;
 
-	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
+	_panfrost_mmu_as_control_write(pfdev, as_nr, transtab, memattr,
+				       transcfg);
+}
+
+static void mmu_mali_lpae_enable(struct panfrost_device *pfdev,
+				 struct panfrost_mmu *mmu)
+{
+	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
+	int as_nr = mmu->as;
+
+	_panfrost_mmu_as_control_write(pfdev, as_nr,
+				       cfg->arm_mali_lpae_cfg.transtab,
+				       cfg->arm_mali_lpae_cfg.memattr,
+				       AS_TRANSCFG_ADRMODE_LEGACY);
+}
+
+static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
+{
+	_panfrost_mmu_as_control_write(pfdev, as_nr, 0, 0,
+				       AS_TRANSCFG_ADRMODE_UNMAPPED);
 }
 
 u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
@@ -182,7 +252,7 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 			mmu_write(pfdev, MMU_INT_CLEAR, mask);
 			mmu_write(pfdev, MMU_INT_MASK, ~pfdev->as_faulty_mask);
 			pfdev->as_faulty_mask &= ~mask;
-			panfrost_mmu_enable(pfdev, mmu);
+			mmu->enable(pfdev, mmu);
 		}
 
 		goto out;
@@ -214,7 +284,7 @@ u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 
 	dev_dbg(pfdev->dev, "Assigned AS%d to mmu %p, alloc_mask=%lx", as, mmu, pfdev->as_alloc_mask);
 
-	panfrost_mmu_enable(pfdev, mmu);
+	mmu->enable(pfdev, mmu);
 
 out:
 	spin_unlock(&pfdev->as_lock);
@@ -618,6 +688,7 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
 	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
 	struct panfrost_mmu *mmu;
+	enum io_pgtable_fmt fmt;
 
 	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
 	if (!mmu)
@@ -642,8 +713,15 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 		.iommu_dev	= pfdev->dev,
 	};
 
-	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
-					      mmu);
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
+		fmt = ARM_64_LPAE_S1;
+		mmu->enable = mmu_lpae_s1_enable;
+	} else {
+		fmt = ARM_MALI_LPAE;
+		mmu->enable = mmu_mali_lpae_enable;
+	}
+	mmu->pgtbl_ops = alloc_io_pgtable_ops(fmt, &mmu->pgtbl_cfg, mmu);
+
 	if (!mmu->pgtbl_ops) {
 		kfree(mmu);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 4e6064d5feaa..a5ca36f583ff 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -301,6 +301,17 @@
 #define AS_TRANSTAB_HI(as)		(MMU_AS(as) + 0x04) /* (RW) Translation Table Base Address for address space n, high word */
 #define AS_MEMATTR_LO(as)		(MMU_AS(as) + 0x08) /* (RW) Memory attributes for address space n, low word. */
 #define AS_MEMATTR_HI(as)		(MMU_AS(as) + 0x0C) /* (RW) Memory attributes for address space n, high word. */
+#define   AS_MEMATTR_AARCH64_INNER_ALLOC_IMPL		(2 << 2)
+#define   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(w, r)	((3 << 2) | \
+							 ((w) ? BIT(0) : 0) | \
+							 ((r) ? BIT(1) : 0))
+#define   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER		(0 << 4)
+#define   AS_MEMATTR_AARCH64_SH_CPU_INNER		(1 << 4)
+#define   AS_MEMATTR_AARCH64_SH_CPU_INNER_SHADER_COH	(2 << 4)
+#define   AS_MEMATTR_AARCH64_SHARED			(0 << 6)
+#define   AS_MEMATTR_AARCH64_INNER_OUTER_NC		(1 << 6)
+#define   AS_MEMATTR_AARCH64_INNER_OUTER_WB		(2 << 6)
+#define   AS_MEMATTR_AARCH64_FAULT			(3 << 6)
 #define AS_LOCKADDR_LO(as)		(MMU_AS(as) + 0x10) /* (RW) Lock region address for address space n, low word */
 #define AS_LOCKADDR_HI(as)		(MMU_AS(as) + 0x14) /* (RW) Lock region address for address space n, high word */
 #define AS_COMMAND(as)			(MMU_AS(as) + 0x18) /* (WO) MMU command register for address space n */
@@ -311,6 +322,24 @@
 /* Additional Bifrost AS registers */
 #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
 #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
+#define   AS_TRANSCFG_ADRMODE_LEGACY			(0 << 0)
+#define   AS_TRANSCFG_ADRMODE_UNMAPPED			(1 << 0)
+#define   AS_TRANSCFG_ADRMODE_IDENTITY			(2 << 0)
+#define   AS_TRANSCFG_ADRMODE_AARCH64_4K		(6 << 0)
+#define   AS_TRANSCFG_ADRMODE_AARCH64_64K		(8 << 0)
+#define   AS_TRANSCFG_INA_BITS(x)			((x) << 6)
+#define   AS_TRANSCFG_OUTA_BITS(x)			((x) << 14)
+#define   AS_TRANSCFG_SL_CONCAT				BIT(22)
+#define   AS_TRANSCFG_PTW_MEMATTR_NC			(1 << 24)
+#define   AS_TRANSCFG_PTW_MEMATTR_WB			(2 << 24)
+#define   AS_TRANSCFG_PTW_SH_NS				(0 << 28)
+#define   AS_TRANSCFG_PTW_SH_OS				(2 << 28)
+#define   AS_TRANSCFG_PTW_SH_IS				(3 << 28)
+#define   AS_TRANSCFG_PTW_RA				BIT(30)
+#define   AS_TRANSCFG_DISABLE_HIER_AP			BIT(33)
+#define   AS_TRANSCFG_DISABLE_AF_FAULT			BIT(34)
+#define   AS_TRANSCFG_WXN				BIT(35)
+#define   AS_TRANSCFG_XREADABLE				BIT(36)
 #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
 #define AS_FAULTEXTRA_HI(as)		(MMU_AS(as) + 0x3C) /* (RO) Secondary fault address for address space n, high word */
 
-- 
2.47.2

