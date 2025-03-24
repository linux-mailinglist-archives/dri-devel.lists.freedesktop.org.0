Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4857A6E2EE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 20:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DB910E4C5;
	Mon, 24 Mar 2025 19:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="W75w4+ft";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EAB10E4BE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 18:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742842786; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V7KwSuTZM276rmgQmSLEPw54WQANBaMqAWoaOGka/Rq6dfqYLdDXqJzk5lCLeO/Ds28UodDHpXvCWDz7Yoy8Ul8xAGEBtIq/uM2gL+2bnniCHSoCxVbVGsX2BkcF7hrCCn9cYnGWhHwiP/lxAJz7JxgkzcGWtJF8ODOFxsscoyQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742842786;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Bj5yXfmBPwRzsmAwjPYTdWmi46IcCPFntC7kwXsmXvQ=; 
 b=lZiUd1EHVEElrfmXdt1MX+ZbmHv3wSIMTdiuC6UgbAqtUWIUt/Y0IEugxC2dpLRG4UFBAcB3iylJLRApwHLEg3KbYTjIZkb7zQurc8kF7PMHWdxhsWZC+tM/s+/OID4kAT4ZUT00U5g8xJC38FXKw5bHe/Gd3yjthSHh8IcUEn4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742842786; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Bj5yXfmBPwRzsmAwjPYTdWmi46IcCPFntC7kwXsmXvQ=;
 b=W75w4+ftSWBY5pHRDz+hNmgUEKEpjJDjHhbO5cX/E9qEWz8KspXIOtJFC30QX1k1
 mydZxq2bPsU+TNPeJJjtk5HQIXnyuOCqp9Ay6Ke2/WBFNU/qMjS0PYrE60Ixa0YytTg
 Wu+8+2zNPL7x9Q9hx5ELF5lOA/HE7S9+P5wmlkVQ=
Received: by mx.zohomail.com with SMTPS id 1742842785535133.096863750397;
 Mon, 24 Mar 2025 11:59:45 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com, angelogioacchino.delregno@collabora.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v5 4/6] drm/panfrost: Add support for AARCH64_4K page table
 format
Date: Mon, 24 Mar 2025 15:57:59 -0300
Message-ID: <20250324185801.168664-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
References: <20250324185801.168664-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently, Panfrost only supports MMU configuration in "LEGACY" (as
Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
Address Extension", which in Linux we've called "mali_lpae".

This commit adds support for conditionally enabling AARCH64_4K page
table format. To achieve that, a "GPU optional quirks" field was added
to `struct panfrost_features` with the related flag.

Note that, in order to enable AARCH64_4K mode, the GPU variant must have
the HW_FEATURE_AARCH64_MMU feature flag present.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 140 +++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 +++++
 3 files changed, 183 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index cffcb0ac7c11..ad95f2ed31d9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
 	GPU_PM_VREG_OFF,
 };
 
+/**
+ * enum panfrost_gpu_quirks - GPU optional quirks
+ * @GPU_QUIRK_FORCE_AARCH64_PGTABLE: Use AARCH64_4K page table format
+ */
+enum panfrost_gpu_quirks {
+	GPU_QUIRK_FORCE_AARCH64_PGTABLE,
+};
+
 struct panfrost_features {
 	u16 id;
 	u16 revision;
@@ -95,6 +103,9 @@ struct panfrost_compatible {
 
 	/* Allowed PM features */
 	u8 pm_features;
+
+	/* GPU configuration quirks */
+	u8 gpu_quirks;
 };
 
 struct panfrost_device {
@@ -162,6 +173,11 @@ struct panfrost_mmu {
 	int as;
 	atomic_t as_count;
 	struct list_head list;
+	struct {
+		u64 transtab;
+		u64 memattr;
+		u64 transcfg;
+	} cfg;
 };
 
 struct panfrost_engine_usage {
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 294f86b3c25e..ccf51fd5f9c0 100644
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
@@ -124,9 +166,9 @@ static int mmu_hw_do_operation(struct panfrost_device *pfdev,
 static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 {
 	int as_nr = mmu->as;
-	struct io_pgtable_cfg *cfg = &mmu->pgtbl_cfg;
-	u64 transtab = cfg->arm_mali_lpae_cfg.transtab;
-	u64 memattr = cfg->arm_mali_lpae_cfg.memattr;
+	u64 transtab = mmu->cfg.transtab;
+	u64 memattr = mmu->cfg.memattr;
+	u64 transcfg = mmu->cfg.transcfg;
 
 	mmu_hw_do_operation_locked(pfdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 
@@ -139,6 +181,9 @@ static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct panfrost_m
 	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
 	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
 
+	mmu_write(pfdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
+	mmu_write(pfdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
+
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
 }
 
@@ -152,9 +197,67 @@ static void panfrost_mmu_disable(struct panfrost_device *pfdev, u32 as_nr)
 	mmu_write(pfdev, AS_MEMATTR_LO(as_nr), 0);
 	mmu_write(pfdev, AS_MEMATTR_HI(as_nr), 0);
 
+	mmu_write(pfdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
+	mmu_write(pfdev, AS_TRANSCFG_HI(as_nr), 0);
+
 	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
 }
 
+static int mmu_cfg_init_mali_lpae(struct panfrost_mmu *mmu)
+{
+	struct io_pgtable_cfg *pgtbl_cfg = &mmu->pgtbl_cfg;
+
+	/* TODO: The following fields are duplicated between the MMU and Page
+	 * Table config structs. Ideally, should be kept in one place.
+	 */
+	mmu->cfg.transtab = pgtbl_cfg->arm_mali_lpae_cfg.transtab;
+	mmu->cfg.memattr = pgtbl_cfg->arm_mali_lpae_cfg.memattr;
+	mmu->cfg.transcfg = AS_TRANSCFG_ADRMODE_LEGACY;
+
+	return 0;
+}
+
+static int mmu_cfg_init_aarch64_4k(struct panfrost_mmu *mmu)
+{
+	struct io_pgtable_cfg *pgtbl_cfg = &mmu->pgtbl_cfg;
+	struct panfrost_device *pfdev = mmu->pfdev;
+
+	if (drm_WARN_ON(pfdev->ddev, pgtbl_cfg->arm_lpae_s1_cfg.ttbr &
+				     ~AS_TRANSTAB_AARCH64_4K_ADDR_MASK))
+		return -EINVAL;
+
+	mmu->cfg.transtab = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
+
+	mmu->cfg.memattr = mair_to_memattr(pgtbl_cfg->arm_lpae_s1_cfg.mair,
+					   pgtbl_cfg->coherent_walk);
+
+	mmu->cfg.transcfg = AS_TRANSCFG_PTW_MEMATTR_WB |
+			    AS_TRANSCFG_PTW_RA |
+			    AS_TRANSCFG_ADRMODE_AARCH64_4K |
+			    AS_TRANSCFG_INA_BITS(55 - pgtbl_cfg->ias);
+	if (pgtbl_cfg->coherent_walk)
+		mmu->cfg.transcfg |= AS_TRANSCFG_PTW_SH_OS;
+
+	return 0;
+}
+
+static int panfrost_mmu_cfg_init(struct panfrost_mmu *mmu,
+				  enum io_pgtable_fmt fmt)
+{
+	struct panfrost_device *pfdev = mmu->pfdev;
+
+	switch (fmt) {
+	case ARM_64_LPAE_S1:
+		return mmu_cfg_init_aarch64_4k(mmu);
+	case ARM_MALI_LPAE:
+		return mmu_cfg_init_mali_lpae(mmu);
+	default:
+		/* This should never happen */
+		drm_WARN(pfdev->ddev, 1, "Invalid pgtable format");
+		return -EINVAL;
+	}
+}
+
 u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
 {
 	int as;
@@ -618,6 +721,19 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
 	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
 	struct panfrost_mmu *mmu;
+	enum io_pgtable_fmt fmt;
+	int ret;
+
+	if (pfdev->comp->gpu_quirks & BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE)) {
+		if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
+			dev_err_once(pfdev->dev,
+				     "AARCH64_4K page table not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
+		fmt = ARM_64_LPAE_S1;
+	} else {
+		fmt = ARM_MALI_LPAE;
+	}
 
 	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
 	if (!mmu)
@@ -642,16 +758,26 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
 		.iommu_dev	= pfdev->dev,
 	};
 
-	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
-					      mmu);
+	mmu->pgtbl_ops = alloc_io_pgtable_ops(fmt, &mmu->pgtbl_cfg, mmu);
 	if (!mmu->pgtbl_ops) {
-		kfree(mmu);
-		return ERR_PTR(-EINVAL);
+		ret = -EINVAL;
+		goto err_free_mmu;
 	}
 
+	ret = panfrost_mmu_cfg_init(mmu, fmt);
+	if (ret)
+		goto err_free_io_pgtable;
+
 	kref_init(&mmu->refcount);
 
 	return mmu;
+
+err_free_io_pgtable:
+	free_io_pgtable_ops(mmu->pgtbl_ops);
+
+err_free_mmu:
+	kfree(mmu);
+	return ERR_PTR(ret);
 }
 
 static const char *access_type_name(struct panfrost_device *pfdev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index b5f279a19a08..2b8f1617b836 100644
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
 
@@ -326,6 +355,11 @@
 #define AS_TRANSTAB_LPAE_READ_INNER		BIT(2)
 #define AS_TRANSTAB_LPAE_SHARE_OUTER		BIT(4)
 
+/*
+ * Begin AARCH64_4K MMU TRANSTAB register values
+ */
+#define AS_TRANSTAB_AARCH64_4K_ADDR_MASK	0xfffffffffffffff0
+
 #define AS_STATUS_AS_ACTIVE			0x01
 
 #define AS_FAULTSTATUS_ACCESS_TYPE_MASK		(0x3 << 8)
-- 
2.49.0

