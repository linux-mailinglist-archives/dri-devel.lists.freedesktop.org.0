Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14E522C09
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 08:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF8810ECBD;
	Wed, 11 May 2022 06:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439EC10E3F1;
 Wed, 11 May 2022 06:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652248958; x=1683784958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PccuXPZNhJptlBB4X3xZoOVQ8bdLAfjzi9nV4Noz0u4=;
 b=PH3wFMz7xJ+lfJvcXDw+9IrlE3Sg6z1riY/YUBwfgqMQAs9O7lY2+sCr
 XV6kb6PdvcS49Fg8wXATkS5SC50JZrZMd8G1Rt0XexTHdchAI8T+dMGO8
 S48/G1rTdvlbQ+ue+ixfemFqIpJxki3EzFvjLdSITYwk9dmb10XbiSNYI
 0tW6NrnnkDzH9p1lCflBhJZsUcP6T/YghGjmlMfLKX06IcltwLkYdXcc9
 7nlWyimLeJ9Swqab+COk7gx4KD0SAnW5Qcq3AqRG3GK/YJj5+pALvsLSh
 xXBZ1yiOgj0N7/kz1yF4fbpJWSJe3+ot5aSTtgZh4/4cSPRdLTGbjEAm6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="332633556"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="332633556"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:37 -0700
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="520375205"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:02:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/i915/uncore: Reorganize and document shadow and
 forcewake tables
Date: Tue, 10 May 2022 23:02:24 -0700
Message-Id: <20220511060228.1179450-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511060228.1179450-1-matthew.d.roper@intel.com>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
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
Cc: Stuart Summers <stuart.summers@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's reorganize some of the forcewake/shadow handling in intel_uncore.c
and consolidate the cargo-cult comments on each table into more general
comments that apply to all tables.

We'll probably move forcewake handling to its own dedicated file in the
near future and further enhance this with true kerneldoc.  But this is a
good intermediate step to help clarify the behavior a bit.

Cc: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 125 ++++++++++++++++++----------
 1 file changed, 80 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 83517a703eb6..095e071e4053 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -938,36 +938,32 @@ find_fw_domain(struct intel_uncore *uncore, u32 offset)
 	return entry->domains;
 }
 
-#define GEN_FW_RANGE(s, e, d) \
-	{ .start = (s), .end = (e), .domains = (d) }
-
-/* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
-static const struct intel_forcewake_range __vlv_fw_ranges[] = {
-	GEN_FW_RANGE(0x2000, 0x3fff, FORCEWAKE_RENDER),
-	GEN_FW_RANGE(0x5000, 0x7fff, FORCEWAKE_RENDER),
-	GEN_FW_RANGE(0xb000, 0x11fff, FORCEWAKE_RENDER),
-	GEN_FW_RANGE(0x12000, 0x13fff, FORCEWAKE_MEDIA),
-	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_MEDIA),
-	GEN_FW_RANGE(0x2e000, 0x2ffff, FORCEWAKE_RENDER),
-	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_MEDIA),
-};
-
-#define __fwtable_reg_read_fw_domains(uncore, offset) \
-({ \
-	enum forcewake_domains __fwd = 0; \
-	if (NEEDS_FORCE_WAKE((offset))) \
-		__fwd = find_fw_domain(uncore, offset); \
-	__fwd; \
-})
+/*
+ * Shadowed register tables describe special register ranges that i915 is
+ * allowed to write to without acquiring forcewake.  If these registers' power
+ * wells are down, the hardware will save values written by i915 to a shadow
+ * copy and automatically transfer them into the real register the next time
+ * the power well is woken up.  Shadowing only applies to writes; forcewake
+ * must still be acquired when reading from registers in these ranges.
+ *
+ * The documentation for shadowed registers is somewhat spotty on older
+ * platforms.  However missing registers from these lists is non-fatal; it just
+ * means we'll wake up the hardware for some register accesses where we didn't
+ * really need to.
+ *
+ * The ranges listed in these tables must be sorted by offset.
+ *
+ * When adding new tables here, please also add them to
+ * intel_shadow_table_check() in selftests/intel_uncore.c so that they will be
+ * scanned for obvious mistakes or typos by the selftests.
+ */
 
-/* *Must* be sorted by offset! See intel_shadow_table_check(). */
 static const struct i915_range gen8_shadowed_regs[] = {
 	{ .start =  0x2030, .end =  0x2030 },
 	{ .start =  0xA008, .end =  0xA00C },
 	{ .start = 0x12030, .end = 0x12030 },
 	{ .start = 0x1a030, .end = 0x1a030 },
 	{ .start = 0x22030, .end = 0x22030 },
-	/* TODO: Other registers are not yet used */
 };
 
 static const struct i915_range gen11_shadowed_regs[] = {
@@ -1107,11 +1103,71 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
 	return FORCEWAKE_RENDER;
 }
 
+#define __fwtable_reg_read_fw_domains(uncore, offset) \
+({ \
+	enum forcewake_domains __fwd = 0; \
+	if (NEEDS_FORCE_WAKE((offset))) \
+		__fwd = find_fw_domain(uncore, offset); \
+	__fwd; \
+})
+
+#define __fwtable_reg_write_fw_domains(uncore, offset) \
+({ \
+	enum forcewake_domains __fwd = 0; \
+	const u32 __offset = (offset); \
+	if (NEEDS_FORCE_WAKE((__offset)) && !is_shadowed(uncore, __offset)) \
+		__fwd = find_fw_domain(uncore, __offset); \
+	__fwd; \
+})
+
+#define GEN_FW_RANGE(s, e, d) \
+	{ .start = (s), .end = (e), .domains = (d) }
+
+/*
+ * All platforms' forcewake tables below must be sorted by offset ranges.
+ * Furthermore, new forcewake tables added should be "watertight" and have
+ * no gaps between ranges.
+ *
+ * When there are multiple consecutive ranges listed in the bspec with
+ * the same forcewake domain, it is customary to combine them into a single
+ * row in the tables below to keep the tables small and lookups fast.
+ * Likewise, reserved/unused ranges may be combined with the preceding and/or
+ * following ranges since the driver will never be making MMIO accesses in
+ * those ranges.
+ *
+ * For example, if the bspec were to list:
+ *
+ *    ...
+ *    0x1000 - 0x1fff:  GT
+ *    0x2000 - 0x2cff:  GT
+ *    0x2d00 - 0x2fff:  unused/reserved
+ *    0x3000 - 0xffff:  GT
+ *    ...
+ *
+ * these could all be represented by a single line in the code:
+ *
+ *   GEN_FW_RANGE(0x1000, 0xffff, FORCEWAKE_GT)
+ *
+ * When adding new forcewake tables here, please also add them to
+ * intel_uncore_mock_selftests in selftests/intel_uncore.c so that they will be
+ * scanned for obvious mistakes or typos by the selftests.
+ */
+
 static const struct intel_forcewake_range __gen6_fw_ranges[] = {
 	GEN_FW_RANGE(0x0, 0x3ffff, FORCEWAKE_RENDER),
 };
 
-/* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
+static const struct intel_forcewake_range __vlv_fw_ranges[] = {
+	GEN_FW_RANGE(0x2000, 0x3fff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x5000, 0x7fff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0xb000, 0x11fff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x12000, 0x13fff, FORCEWAKE_MEDIA),
+	GEN_FW_RANGE(0x22000, 0x23fff, FORCEWAKE_MEDIA),
+	GEN_FW_RANGE(0x2e000, 0x2ffff, FORCEWAKE_RENDER),
+	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_MEDIA),
+};
+
+
 static const struct intel_forcewake_range __chv_fw_ranges[] = {
 	GEN_FW_RANGE(0x2000, 0x3fff, FORCEWAKE_RENDER),
 	GEN_FW_RANGE(0x4000, 0x4fff, FORCEWAKE_RENDER | FORCEWAKE_MEDIA),
@@ -1131,16 +1187,6 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
 	GEN_FW_RANGE(0x30000, 0x37fff, FORCEWAKE_MEDIA),
 };
 
-#define __fwtable_reg_write_fw_domains(uncore, offset) \
-({ \
-	enum forcewake_domains __fwd = 0; \
-	const u32 __offset = (offset); \
-	if (NEEDS_FORCE_WAKE((__offset)) && !is_shadowed(uncore, __offset)) \
-		__fwd = find_fw_domain(uncore, __offset); \
-	__fwd; \
-})
-
-/* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
 static const struct intel_forcewake_range __gen9_fw_ranges[] = {
 	GEN_FW_RANGE(0x0, 0xaff, FORCEWAKE_GT),
 	GEN_FW_RANGE(0xb00, 0x1fff, 0), /* uncore range */
@@ -1176,7 +1222,6 @@ static const struct intel_forcewake_range __gen9_fw_ranges[] = {
 	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_MEDIA),
 };
 
-/* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
 static const struct intel_forcewake_range __gen11_fw_ranges[] = {
 	GEN_FW_RANGE(0x0, 0x1fff, 0), /* uncore range */
 	GEN_FW_RANGE(0x2000, 0x26ff, FORCEWAKE_RENDER),
@@ -1215,14 +1260,6 @@ static const struct intel_forcewake_range __gen11_fw_ranges[] = {
 	GEN_FW_RANGE(0x1d4000, 0x1dbfff, 0)
 };
 
-/*
- * *Must* be sorted by offset ranges! See intel_fw_table_check().
- *
- * Note that the spec lists several reserved/unused ranges that don't
- * actually contain any registers.  In the table below we'll combine those
- * reserved ranges with either the preceding or following range to keep the
- * table small and lookups fast.
- */
 static const struct intel_forcewake_range __gen12_fw_ranges[] = {
 	GEN_FW_RANGE(0x0, 0x1fff, 0), /*
 		0x0   -  0xaff: reserved
@@ -1327,8 +1364,6 @@ static const struct intel_forcewake_range __gen12_fw_ranges[] = {
 /*
  * Graphics IP version 12.55 brings a slight change to the 0xd800 range,
  * switching it from the GT domain to the render domain.
- *
- * *Must* be sorted by offset ranges! See intel_fw_table_check().
  */
 #define XEHP_FWRANGES(FW_RANGE_D800)					\
 	GEN_FW_RANGE(0x0, 0x1fff, 0), /*					\
-- 
2.35.1

