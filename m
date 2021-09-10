Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EFE4066D3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 07:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E046E971;
	Fri, 10 Sep 2021 05:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997446E972;
 Fri, 10 Sep 2021 05:33:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217832062"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="217832062"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:32 -0700
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; d="scan'208";a="480012430"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 22:33:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 4/6] drm/i915/uncore: Drop gen11/gen12 mmio write handlers
Date: Thu,  9 Sep 2021 22:33:15 -0700
Message-Id: <20210910053317.3379249-5-matthew.d.roper@intel.com>
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

Now that the reference to the shadow table is stored within the uncore,
we don't need to generate separate fwtable, gen11_fwtable, and
gen12_fwtable variants of the register write functions; a single
'fwtable' implementation will work for all of those platforms now.

Note that while consolidating down to __fwtable_reg_write_fw_domains()
we drop the NEEDS_FORCE_WAKE() check.  If an MMIO offset is outside that
range on older platforms, it also won't be part of a range in the
forcewake table, so a '0' will be returned anyway.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 54 +++++++++--------------------
 1 file changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 80533cf24fe8..c181e74fbf43 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1081,23 +1081,6 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
 };
 
 #define __fwtable_reg_write_fw_domains(uncore, offset) \
-({ \
-	enum forcewake_domains __fwd = 0; \
-	if (NEEDS_FORCE_WAKE((offset)) && !is_shadowed(uncore, offset)) \
-		__fwd = find_fw_domain(uncore, offset); \
-	__fwd; \
-})
-
-#define __gen11_fwtable_reg_write_fw_domains(uncore, offset) \
-({ \
-	enum forcewake_domains __fwd = 0; \
-	const u32 __offset = (offset); \
-	if (!is_shadowed(uncore, __offset)) \
-		__fwd = find_fw_domain(uncore, __offset); \
-	__fwd; \
-})
-
-#define __gen12_fwtable_reg_write_fw_domains(uncore, offset) \
 ({ \
 	enum forcewake_domains __fwd = 0; \
 	const u32 __offset = (offset); \
@@ -1685,34 +1668,29 @@ __gen6_write(8)
 __gen6_write(16)
 __gen6_write(32)
 
-#define __gen_write(func, x) \
+#define __gen_fwtable_write(x) \
 static void \
-func##_write##x(struct intel_uncore *uncore, i915_reg_t reg, u##x val, bool trace) { \
+fwtable_write##x(struct intel_uncore *uncore, i915_reg_t reg, u##x val, bool trace) { \
 	enum forcewake_domains fw_engine; \
 	GEN6_WRITE_HEADER; \
-	fw_engine = __##func##_reg_write_fw_domains(uncore, offset); \
+	fw_engine = __fwtable_reg_write_fw_domains(uncore, offset); \
 	if (fw_engine) \
 		__force_wake_auto(uncore, fw_engine); \
 	__raw_uncore_write##x(uncore, reg, val); \
 	GEN6_WRITE_FOOTER; \
 }
 
-#define __gen_reg_write_funcs(func) \
-static enum forcewake_domains \
-func##_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg) { \
-	return __##func##_reg_write_fw_domains(uncore, i915_mmio_reg_offset(reg)); \
-} \
-\
-__gen_write(func, 8) \
-__gen_write(func, 16) \
-__gen_write(func, 32)
-
+static enum forcewake_domains
+fwtable_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
+{
+	return __fwtable_reg_write_fw_domains(uncore, i915_mmio_reg_offset(reg));
+}
 
-__gen_reg_write_funcs(gen12_fwtable);
-__gen_reg_write_funcs(gen11_fwtable);
-__gen_reg_write_funcs(fwtable);
+__gen_fwtable_write(8)
+__gen_fwtable_write(16)
+__gen_fwtable_write(32)
 
-#undef __gen_reg_write_funcs
+#undef __gen_fwtable_write
 #undef GEN6_WRITE_FOOTER
 #undef GEN6_WRITE_HEADER
 
@@ -2090,22 +2068,22 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
-		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
-		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER(i915) >= 12) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
 		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
-		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (GRAPHICS_VER(i915) == 11) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
 		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
-		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen11_fwtable);
+		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
 	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
-- 
2.25.4

