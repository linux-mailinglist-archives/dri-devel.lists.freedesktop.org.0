Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4915AF890
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 01:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DDA10E0A4;
	Tue,  6 Sep 2022 23:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712BD10E0A9;
 Tue,  6 Sep 2022 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662508187; x=1694044187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wAfVGZTmppGTptuyqunLKpjTsu/57ZUBpBca9euXg60=;
 b=Df3zWYWrjE33LAfb3OJuyHcQmxrvYzQrfOJLVRB3Bz+k9C/AHMcyq/Kz
 Xn/o0ZVj3Sw6m30Yrv6E7CvJa66r/wuNDvzUI89vHyL16pYzFleT1d83/
 U212XyGte5/A92Zja2yJt8xTwuCZC6FSrTBYBsPC0Iu8et7iMhZrnbeFv
 gyXQ5KPEHfB9MimBHw8TxIpq0BApOFnHC2i5z7lJvrM2spCWzNfHwuug2
 p2EdiAEBqgKS6ry5OrMnXP8fdSAEACB+cFq1003sQRm5/uxbWUNsBE0Ar
 PSSMCdIwSSn35tZHKvhAvQaWj7hR0NhvOh78CTJtsu9Ni8e6jLDkTX6Q/ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="276477214"
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="276477214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,295,1654585200"; d="scan'208";a="675920334"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 16:49:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/14] drm/i915/uncore: Add GSI offset to uncore
Date: Tue,  6 Sep 2022 16:49:30 -0700
Message-Id: <20220906234934.3655440-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906234934.3655440-1-matthew.d.roper@intel.com>
References: <20220906234934.3655440-1-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_gt_types.h |  1 +
 drivers/gpu/drm/i915/intel_uncore.c      | 10 ++++++++--
 drivers/gpu/drm/i915/intel_uncore.h      | 22 ++++++++++++++++++++--
 3 files changed, 29 insertions(+), 4 deletions(-)

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

