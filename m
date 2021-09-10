Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55E4066D6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 07:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09B96E972;
	Fri, 10 Sep 2021 05:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339176E970;
 Fri, 10 Sep 2021 05:33:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217832060"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="217832060"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480012422"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 2/6] drm/i915/uncore: Associate shadow table with uncore
Date: Thu,  9 Sep 2021 22:33:13 -0700
Message-Id: <20210910053317.3379249-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210910053317.3379249-1-matthew.d.roper@intel.com>
References: <20210910053317.3379249-1-matthew.d.roper@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store a reference to a platform's shadow table inside the uncore, the
same as we do with the forcewake table.  This will allow us to use a
single set of functions that operate on the shadow table reference
rather than generating lots of nearly-identical functions via macros
that differ only in terms of the table that they reference.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 40 ++++++++++++++++++++---------
 drivers/gpu/drm/i915/intel_uncore.h |  7 +++++
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 7f92f12d95f2..159880e3e77d 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1036,17 +1036,19 @@ static int mmio_range_cmp(u32 key, const struct i915_range *range)
 		return 0;
 }
 
-#define __is_X_shadowed(x) \
-static bool is_##x##_shadowed(u32 offset) \
-{ \
-	const struct i915_range *regs = x##_shadowed_regs; \
-	return BSEARCH(offset, regs, ARRAY_SIZE(x##_shadowed_regs), \
+static bool
+is_shadowed(struct intel_uncore *uncore, u32 offset)
+{
+	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
+		return false;
+
+	return BSEARCH(offset,
+		       uncore->shadowed_reg_table,
+		       uncore->shadowed_reg_table_entries,
 		       mmio_range_cmp); \
 }
 
-__is_X_shadowed(gen8)
-__is_X_shadowed(gen11)
-__is_X_shadowed(gen12)
+
 
 static enum forcewake_domains
 gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
@@ -1057,7 +1059,7 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
 #define __gen8_reg_write_fw_domains(uncore, offset) \
 ({ \
 	enum forcewake_domains __fwd; \
-	if (NEEDS_FORCE_WAKE(offset) && !is_gen8_shadowed(offset)) \
+	if (NEEDS_FORCE_WAKE(offset) && !is_shadowed(uncore, offset)) \
 		__fwd = FORCEWAKE_RENDER; \
 	else \
 		__fwd = 0; \
@@ -1091,7 +1093,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
 #define __fwtable_reg_write_fw_domains(uncore, offset) \
 ({ \
 	enum forcewake_domains __fwd = 0; \
-	if (NEEDS_FORCE_WAKE((offset)) && !is_gen8_shadowed(offset)) \
+	if (NEEDS_FORCE_WAKE((offset)) && !is_shadowed(uncore, offset)) \
 		__fwd = find_fw_domain(uncore, offset); \
 	__fwd; \
 })
@@ -1100,7 +1102,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
 ({ \
 	enum forcewake_domains __fwd = 0; \
 	const u32 __offset = (offset); \
-	if (!is_gen11_shadowed(__offset)) \
+	if (!is_shadowed(uncore, __offset)) \
 		__fwd = find_fw_domain(uncore, __offset); \
 	__fwd; \
 })
@@ -1109,7 +1111,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
 ({ \
 	enum forcewake_domains __fwd = 0; \
 	const u32 __offset = (offset); \
-	if (!is_gen12_shadowed(__offset)) \
+	if (!is_shadowed(uncore, __offset)) \
 		__fwd = find_fw_domain(uncore, __offset); \
 	__fwd; \
 })
@@ -1715,6 +1717,7 @@ __gen_write(func, 8) \
 __gen_write(func, 16) \
 __gen_write(func, 32)
 
+
 __gen_reg_write_funcs(gen12_fwtable);
 __gen_reg_write_funcs(gen11_fwtable);
 __gen_reg_write_funcs(fwtable);
@@ -1979,6 +1982,12 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
 	(uncore)->fw_domains_table_entries = ARRAY_SIZE((d)); \
 }
 
+#define ASSIGN_SHADOW_TABLE(uncore, d) \
+{ \
+	(uncore)->shadowed_reg_table = d; \
+	(uncore)->shadowed_reg_table_entries = ARRAY_SIZE((d)); \
+}
+
 static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
 					 unsigned long action, void *data)
 {
@@ -2091,30 +2100,37 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER(i915) >= 12) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER(i915) == 11) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen11_fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (IS_CHERRYVIEW(i915)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __chv_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (GRAPHICS_VER(i915) == 8) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
+		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen8);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (IS_VALLEYVIEW(i915)) {
diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
index 531665b08039..2f31c50eeae2 100644
--- a/drivers/gpu/drm/i915/intel_uncore.h
+++ b/drivers/gpu/drm/i915/intel_uncore.h
@@ -142,6 +142,13 @@ struct intel_uncore {
 	const struct intel_forcewake_range *fw_domains_table;
 	unsigned int fw_domains_table_entries;
 
+	/*
+	 * Shadowed registers are special cases where we can safely write
+	 * to the register *without* grabbing forcewake.
+	 */
+	const struct i915_range *shadowed_reg_table;
+	unsigned int shadowed_reg_table_entries;
+
 	struct notifier_block pmic_bus_access_nb;
 	struct intel_uncore_funcs funcs;
 
-- 
2.25.4

