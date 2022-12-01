Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8563FA71
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37D610E683;
	Thu,  1 Dec 2022 22:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF9A10E67A;
 Thu,  1 Dec 2022 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669933337; x=1701469337;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d0z0quau9HIEizO84HgGpDbmGG7MEuJVApnfXdw69rY=;
 b=X/QrI3I88inI8UEBkKmNttT2wa5qdMSbNbFeIshkgXwq8Y6Qrc9WShwc
 IDcC58U8LvaTfIRTM6beMvsimfhFw6mxsauWOl7vJb1GSXTCh595UwOnq
 Ar12BTqLVCMB6dZPXQwbEogml4Cnlo92JEX18zdirX6BOPw4VmRrLTVvL
 5x+KFJgvNxu6U63f8fAcRHv/GcCedVuyQ/AGtHs8x5YVD9bY/QQQdPwZn
 TsFqBVattSYpYD21qp64PJg2Q3kPV+/wYhkFwaNyXgoX2B9Lclxg8ADp7
 VeasKQRbYvVAz1zlYH2ZC1lf2wKTD6KPoyvqSIMae6CfUqg5JceFu8nTB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="303416359"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="303416359"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:22:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="677380323"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; d="scan'208";a="677380323"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 14:22:15 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gen12: Apply recommended L3 hashing mask
Date: Thu,  1 Dec 2022 14:22:10 -0800
Message-Id: <20221201222210.344152-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TGL/RKL/DG1/ADL performance tuning guide suggests programming a
literal value of 0x2FC0100F for this register.  The register's hardware
default value is 0x2FC0108F, so this translates to just clearing one
bit.

Take this opportunity to also clean up the register definition and
re-write its existing bits/fields in the preferred notation.

Bspec: 31870
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 9 +++++----
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 61a5c9a83b1b..f8eb807b56f9 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -958,10 +958,11 @@
 #define   GEN7_DISABLE_SAMPLER_PREFETCH		(1 << 30)
 
 #define GEN8_GARBCNTL				_MMIO(0xb004)
-#define   GEN9_GAPS_TSV_CREDIT_DISABLE		(1 << 7)
-#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	(0x3f << 22)
-#define   GEN11_HASH_CTRL_EXCL_MASK		(0x7f << 0)
-#define   GEN11_HASH_CTRL_EXCL_BIT0		(1 << 0)
+#define   GEN11_ARBITRATION_PRIO_ORDER_MASK	REG_GENMASK(27, 22)
+#define   GEN12_BUS_HASH_CTL_BIT_EXC		REG_BIT(7)
+#define   GEN9_GAPS_TSV_CREDIT_DISABLE		REG_BIT(7)
+#define   GEN11_HASH_CTRL_EXCL_MASK		REG_GENMASK(6, 0)
+#define   GEN11_HASH_CTRL_EXCL_BIT0		REG_FIELD_PREP(GEN11_HASH_CTRL_EXCL_MASK, 0x1)
 
 #define GEN9_SCRATCH_LNCF1			_MMIO(0xb008)
 #define   GEN9_LNCF_NONIA_COHERENT_ATOMICS_ENABLE	REG_BIT(0)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 85822ebb0d64..2f13a92f77d3 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2937,6 +2937,10 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
 		wa_mcr_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
 					THREAD_EX_ARB_MODE_RR_AFTER_DEP);
+
+	if (GRAPHICS_VER(i915) == 12 && GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
+		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
+	}
 }
 
 /*
-- 
2.38.1

