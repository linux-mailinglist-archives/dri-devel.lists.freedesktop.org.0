Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC1B407249
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 22:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216B76EAAA;
	Fri, 10 Sep 2021 20:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973BC6EAAA;
 Fri, 10 Sep 2021 20:10:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10103"; a="221205107"
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="221205107"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 13:10:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,283,1624345200"; d="scan'208";a="480346568"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 13:10:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v2 1/6] drm/i915/uncore: Convert gen6/gen7 read operations to
 fwtable
Date: Fri, 10 Sep 2021 13:10:25 -0700
Message-Id: <20210910201030.3436066-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210910201030.3436066-1-matthew.d.roper@intel.com>
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
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

On gen6-gen8 (except vlv/chv) we don't use a forcewake lookup table; we
simply check whether the register offset is < 0x40000, and return
FORCEWAKE_RENDER if it is.  To prepare for upcoming refactoring, let's
define a single-entry forcewake table from [0x0, 0x3ffff] and switch
these platforms over to use the fwtable reader functions.

v2:
 - Drop __gen6_reg_read_fw_domains which is no longer used.  (Tvrtko)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index f9767054dbdf..8c09af1e9f7a 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -853,16 +853,6 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
 /* We give fast paths for the really cool registers */
 #define NEEDS_FORCE_WAKE(reg) ((reg) < 0x40000)
 
-#define __gen6_reg_read_fw_domains(uncore, offset) \
-({ \
-	enum forcewake_domains __fwd; \
-	if (NEEDS_FORCE_WAKE(offset)) \
-		__fwd = FORCEWAKE_RENDER; \
-	else \
-		__fwd = 0; \
-	__fwd; \
-})
-
 static int fw_range_cmp(u32 offset, const struct intel_forcewake_range *entry)
 {
 	if (offset < entry->start)
@@ -1064,6 +1054,10 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
 	__fwd; \
 })
 
+static const struct intel_forcewake_range __gen6_fw_ranges[] = {
+	GEN_FW_RANGE(0x0, 0x3ffff, FORCEWAKE_RENDER),
+};
+
 /* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
 static const struct intel_forcewake_range __chv_fw_ranges[] = {
 	GEN_FW_RANGE(0x2000, 0x3fff, FORCEWAKE_RENDER),
@@ -1623,7 +1617,6 @@ __gen_read(func, 64)
 
 __gen_reg_read_funcs(gen11_fwtable);
 __gen_reg_read_funcs(fwtable);
-__gen_reg_read_funcs(gen6);
 
 #undef __gen_reg_read_funcs
 #undef GEN6_READ_FOOTER
@@ -2111,15 +2104,17 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (GRAPHICS_VER(i915) == 8) {
+		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen8);
-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen6);
+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (IS_VALLEYVIEW(i915)) {
 		ASSIGN_FW_DOMAINS_TABLE(uncore, __vlv_fw_ranges);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
 		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	} else if (IS_GRAPHICS_VER(i915, 6, 7)) {
+		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
 		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
-		ASSIGN_READ_MMIO_VFUNCS(uncore, gen6);
+		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
 	}
 
 	uncore->pmic_bus_access_nb.notifier_call = i915_pmic_bus_access_notifier;
-- 
2.25.4

