Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24FD5B2991
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 00:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038EB10E544;
	Thu,  8 Sep 2022 22:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B243610E544;
 Thu,  8 Sep 2022 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662677156; x=1694213156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DpvR/cJFF4D68ZyFKEQu76bpq1GMoxvxTNcdUY/cN60=;
 b=JETr7IgxDZJb7+anPvmDiZm0X/KhE1l93xpFbaIy1Nhpf6qMLF2rVNL4
 f0crnwIYjdulehj67Qb952e9op07JTye3/bkI5iF0+S1O3iAUwKKSrMja
 sZHI3um6TmAj9kw9UJGSgM648fMuXBki8j66HQcrJwBpQ1nFPKZxSDugD
 QKiKtXJuCYT6ckZd8gf135X/2e/QezR+BmCl+GG7kR9eaeupQNXY6Bp+y
 iUNnfelRiAl4NnIi/XNEt2DHZ3shrX6/jxGkk2HzMAMmhM3k5hWJPC5H5
 8o6+EMlZmWVu/MRFngdVswoHE2cet+c/VH/4jLMe7C+llPxSFN4p4CsYW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298145309"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298145309"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 15:45:56 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740846550"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 15:45:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3.1 10/14] drm/i915/uncore: Add GSI offset to uncore
Date: Thu,  8 Sep 2022 15:45:50 -0700
Message-Id: <20220908224550.821257-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906234934.3655440-11-matthew.d.roper@intel.com>
References: <20220906234934.3655440-11-matthew.d.roper@intel.com>
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

v2:
 - Add comment on raw_reg_*() macros explaining why we don't bother with
   GSI offsets in them.  (Daniele)

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
 drivers/gpu/drm/i915/intel_uncore.c      | 10 +++++--
 drivers/gpu/drm/i915/intel_uncore.h      | 34 ++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 0e139f7d75ed..82dc28643572 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -274,6 +274,7 @@ struct intel_gt_definition {
 	enum intel_gt_type type;
 	char *name;
 	u32 mapping_base;
+	u32 gsi_offset;
 	intel_engine_mask_t engine_mask;
 };
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 452b3a31e965..5cd423c7b646 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -928,6 +928,9 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
 {
 	const struct intel_forcewake_range *entry;
 
+	if (IS_GSI_REG(offset))
+		offset += uncore->gsi_offset;
+
 	entry = BSEARCH(offset,
 			uncore->fw_domains_table,
 			uncore->fw_domains_table_entries,
@@ -1143,6 +1146,9 @@ static bool is_shadowed(struct intel_uncore *uncore, u32 offset)
 	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
 		return false;
 
+	if (IS_GSI_REG(offset))
+		offset += uncore->gsi_offset;
+
 	return BSEARCH(offset,
 		       uncore->shadowed_reg_table,
 		       uncore->shadowed_reg_table_entries,
@@ -1995,8 +2001,8 @@ static int __fw_domain_init(struct intel_uncore *uncore,
 
 	d->uncore = uncore;
 	d->wake_count = 0;
-	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set);
-	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack);
+	d->reg_set = uncore->regs + i915_mmio_reg_offset(reg_set) + uncore->gsi_offset;
+	d->reg_ack = uncore->regs + i915_mmio_reg_offset(reg_ack) + uncore->gsi_offset;
 
 	d->id = domain_id;
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 4acb78a03233..5022bac80b67 100644
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
@@ -447,6 +465,18 @@ static inline int intel_uncore_write_and_verify(struct intel_uncore *uncore,
 	return (reg_val & mask) != expected_val ? -EINVAL : 0;
 }
 
+/*
+ * The raw_reg_{read,write} macros are intended as a micro-optimization for
+ * interrupt handlers so that the pointer indirection on uncore->regs can
+ * be computed once (and presumably cached in a register) instead of generating
+ * extra load instructions for each MMIO access.
+ *
+ * Given that these macros are only intended for non-GSI interrupt registers
+ * (and the goal is to avoid extra instructions generated by the compiler),
+ * these macros do not account for uncore->gsi_offset.  Any caller that needs
+ * to use these macros on a GSI register is responsible for adding the
+ * appropriate GSI offset to the 'base' parameter.
+ */
 #define raw_reg_read(base, reg) \
 	readl(base + i915_mmio_reg_offset(reg))
 #define raw_reg_write(base, reg, value) \
-- 
2.37.3

