Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C935ABB35
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 01:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4410E93F;
	Fri,  2 Sep 2022 23:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1865310E941;
 Fri,  2 Sep 2022 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662161594; x=1693697594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rR8ujyEhSOZEaqoso6tcd9j9dNMG32uVRVM74lX48A=;
 b=KeNNDnUCcxJZAPwl0ckeWQXBoIaGaunkqhBFQdKVRrI/DkzDeueS5Cjg
 BKl+d/449rWczdj2NYD3VgombEaCZyXfJmwVdu4+61Qu6Z92VjCvIYirn
 XIh/sHNkzRZHIbzmOgHkJgU0W1dsF0cOcMvRzUPbcH5pc326YzGWB3XTn
 vJg6Q1ZvGAjRi21VM/M2MlP+5j3o6vyhOnfIC23nLrg/FTVIeP+SOGH9U
 nKydiEAiLedR4qd7u6LsOPNHLQ6FQFQcLyCllzb6MdSyawp2Scl31CX8l
 fRKnONSFVDxyByCOAb+XBe1EcHcS6nKF6aVJUjrTqqMJKv4aZcTLcIt7u Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="360064667"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="360064667"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; d="scan'208";a="941464207"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 16:33:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/12] drm/i915/uncore: Add GSI offset to uncore
Date: Fri,  2 Sep 2022 16:32:54 -0700
Message-Id: <20220902233257.3088492-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902233257.3088492-1-matthew.d.roper@intel.com>
References: <20220902233257.3088492-1-matthew.d.roper@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GT non-engine registers (referred to as "GSI" registers by the spec)
have the same relative offsets on standalone media as they do on the
primary GT, just with an additional "GSI offset" added to their MMIO
address.  If we store this GSI offset in the standalone media's
intel_uncore structure, it can be automatically applied to all GSI reg
reads/writes that happen on that GT, allowing us to re-use our existing
GT code with minimal changes.

Forcewake and shadowed register tables for the media GT (which will be
added in a future patch) are listed as final addresses that already
include the GSI offset, so we also need to add the GSI offset before
doing lookups of registers in one of those tables.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c       | 17 ++++++++++++++---
 drivers/gpu/drm/i915/intel_device_info.h |  4 +++-
 drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
 drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
 4 files changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index fbb5e32979a4..a6ed11b933eb 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -776,10 +776,20 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
 	}
 }
 
-static int intel_gt_tile_setup(struct intel_gt *gt, phys_addr_t phys_addr)
+/*
+ * Note: the gsi_offset parameter here isn't used, but we want to keep the
+ * function signature equivalent to gtdef->setup() so that it can be plugged
+ * in when we enabled remote tiles in the future.
+ */
+static int intel_gt_tile_setup(struct intel_gt *gt,
+			       phys_addr_t phys_addr,
+			       u32 gsi_offset)
 {
 	int ret;
 
+	/* GSI offset is only applicable for media GTs */
+	drm_WARN_ON(&gt->i915->drm, gsi_offset);
+
 	if (!gt_is_root(gt)) {
 		struct intel_uncore *uncore;
 
@@ -832,7 +842,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	gt->info.engine_mask = RUNTIME_INFO(i915)->platform_engine_mask;
 
 	drm_dbg(&i915->drm, "Setting up %s\n", gt->name);
-	ret = intel_gt_tile_setup(gt, phys_addr);
+	ret = intel_gt_tile_setup(gt, phys_addr, 0);
 	if (ret)
 		return ret;
 
@@ -865,7 +875,8 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 			goto err;
 		}
 
-		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base);
+		ret = gtdef->setup(gt, phys_addr + gtdef->mapping_base,
+				   gtdef->gsi_offset);
 		if (ret)
 			goto err;
 
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index b408ce384cd7..85e0ef0e91b1 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -254,8 +254,10 @@ struct intel_gt_definition {
 	enum intel_gt_type type;
 	char *name;
 	int (*setup)(struct intel_gt *gt,
-		     phys_addr_t phys_addr);
+		     phys_addr_t phys_addr,
+		     u32 gsi_offset);
 	u32 mapping_base;
+	u32 gsi_offset;
 	intel_engine_mask_t engine_mask;
 };
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 33bdcbc77ab2..ecb02421502d 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -927,6 +927,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
 {
 	const struct intel_forcewake_range *entry;
 
+	if (IS_GSI_REG(offset))
+		offset += uncore->gsi_offset;
+
 	entry = BSEARCH(offset,
 			uncore->fw_domains_table,
 			uncore->fw_domains_table_entries,
@@ -1142,6 +1145,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
 	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
 		return false;
 
+	if (IS_GSI_REG(offset))
+		offset += uncore->gsi_offset;
+
 	return BSEARCH(offset,
 		       uncore->shadowed_reg_table,
 		       uncore->shadowed_reg_table_entries,
@@ -1994,8 +2000,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
 
 	d->uncore = uncore;
 	d->wake_count = 0;
-	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
-	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
+	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
+	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
 
 	d->id = domain_id;
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 4acb78a03233..7f1d7903a8f3 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -136,6 +136,16 @@ struct intel_uncore {
 
 	spinlock_t lock; /** lock is also taken in irq contexts. */
 
+	/*
+	 * Do we need to apply an additional offset to reach the beginning
+	 * of the basic non-engine GT registers (referred to as "GSI" on
+	 * newer platforms, or "GT block" on older platforms)?  If so, we'll
+	 * track that here and apply it transparently to registers in the
+	 * appropriate range to maintain compatibility with our existing
+	 * register definitions and GT code.
+	 */
+	u32 gsi_offset;
+
 	unsigned int flags;
 #define UNCORE_HAS_FORCEWAKE		BIT(0)
 #define UNCORE_HAS_FPGA_DBG_UNCLAIMED	BIT(1)
@@ -294,19 +304,27 @@ intel_wait_for_register_fw(struct intel_uncore *uncore,
 					    2, timeout_ms, NULL);
 }
 
+#define IS_GSI_REG(reg) ((reg) < 0x40000)
+
 /* register access functions */
 #define __raw_read(x__, s__) \
 static inline u##x__ __raw_uncore_read##x__(const struct intel_uncore *uncore, \
 					    i915_reg_t reg) \
 { \
-	return read##s__(uncore->regs + i915_mmio_reg_offset(reg)); \
+	u32 offset = i915_mmio_reg_offset(reg); \
+	if (IS_GSI_REG(offset)) \
+		offset += uncore->gsi_offset; \
+	return read##s__(uncore->regs + offset); \
 }
 
 #define __raw_write(x__, s__) \
 static inline void __raw_uncore_write##x__(const struct intel_uncore *uncore, \
 					   i915_reg_t reg, u##x__ val) \
 { \
-	write##s__(val, uncore->regs + i915_mmio_reg_offset(reg)); \
+	u32 offset = i915_mmio_reg_offset(reg); \
+	if (IS_GSI_REG(offset)) \
+		offset += uncore->gsi_offset; \
+	write##s__(val, uncore->regs + offset); \
 }
 __raw_read(8, b)
 __raw_read(16, w)
-- 
2.37.2

