Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C7627DC7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 13:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A706210E0BE;
	Mon, 14 Nov 2022 12:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8B110E297;
 Mon, 14 Nov 2022 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668429013; x=1699965013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xe4ne8eLBX4OZqn9CoyWwb8H4uX3KNaYFDmoYslC7QM=;
 b=PfgwzMmQoOdm3X9Zce1bla9ew1eEu/0xFP98BVQ0gmKNr0QvduDRwc1S
 OdqL+rxpWevXGQ01nyipCJNHtpWPVCD3IELYf/L+lnbqxXsXligybD8L4
 IKKHpnQzoCufxDFizaZmonF5bNW3VuRHfPg9UufMS5cUaQ1hsH+RSovVm
 lo7iSi2mnF3mnqJGNj0cTitwV9Q9aL48+yuBWpPkD7pPldHffACF3LMYG
 Xfr45iGoO3GaH1pXHREzIzHhkzkdv1Ztoh9UtOkFKOMN59NUkPY4O8ZUm
 goFbZZKfsqKlvSpYTAXaaTvJhCCirTg1aHA1+CwsTQnRCFqfEZHEocnSa A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="311960598"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="311960598"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="727509110"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727509110"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 04:30:11 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/mtl: C6 residency and C state type for MTL
 SAMedia
Date: Mon, 14 Nov 2022 18:03:48 +0530
Message-Id: <20221114123348.3474216-6-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114123348.3474216-1-badal.nilawar@intel.com>
References: <20221114123348.3474216-1-badal.nilawar@intel.com>
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
Cc: ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for C6 residency and C state type for MTL SAMedia. Also add
mtl_drpc.

v2: Fixed review comments (Ashutosh)
v3: Sort registers and fix whitespace errors in intel_gt_regs.h (Matt R)
    Remove MTL_CC_SHIFT (Ashutosh)
    Adapt to RC6 residency register code refactor (Jani N)
v4: Move MTL branch to top in drpc_show
v5: Use FORCEWAKE_MT identical to gen6_drpc (Ashutosh)
v6: Add MISSING_CASE for gt_core_status switch statement (Rodrigo)
    Change state name for MTL_CC0 to C0 (from "on") (Rodrigo)
v7: Change state name for MTL_CC0 to RC0 (Rodrigo)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 59 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  5 ++
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 17 ++++--
 3 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 5d6b34683139..83df4cd5e06c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -256,6 +256,61 @@ static int ilk_drpc(struct seq_file *m)
 	return 0;
 }
 
+static int mtl_drpc(struct seq_file *m)
+{
+	struct intel_gt *gt = m->private;
+	struct intel_uncore *uncore = gt->uncore;
+	u32 gt_core_status, rcctl1, mt_fwake_req;
+	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
+
+	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
+	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
+
+	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
+	mtl_powergate_enable = intel_uncore_read(uncore, GEN9_PG_ENABLE);
+	mtl_powergate_status = intel_uncore_read(uncore,
+						 GEN9_PWRGT_DOMAIN_STATUS);
+
+	seq_printf(m, "RC6 Enabled: %s\n",
+		   str_yes_no(rcctl1 & GEN6_RC_CTL_RC6_ENABLE));
+	if (gt->type == GT_MEDIA) {
+		seq_printf(m, "Media Well Gating Enabled: %s\n",
+			   str_yes_no(mtl_powergate_enable & GEN9_MEDIA_PG_ENABLE));
+	} else {
+		seq_printf(m, "Render Well Gating Enabled: %s\n",
+			   str_yes_no(mtl_powergate_enable & GEN9_RENDER_PG_ENABLE));
+	}
+
+	seq_puts(m, "Current RC state: ");
+	switch (REG_FIELD_GET(MTL_CC_MASK, gt_core_status)) {
+	case MTL_CC0:
+		seq_puts(m, "RC0\n");
+		break;
+	case MTL_CC6:
+		seq_puts(m, "RC6\n");
+		break;
+	default:
+		MISSING_CASE(REG_FIELD_GET(MTL_CC_MASK, gt_core_status));
+		seq_puts(m, "Unknown\n");
+		break;
+	}
+
+	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
+	if (gt->type == GT_MEDIA)
+		seq_printf(m, "Media Power Well: %s\n",
+			   (mtl_powergate_status &
+			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");
+	else
+		seq_printf(m, "Render Power Well: %s\n",
+			   (mtl_powergate_status &
+			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
+
+	/* Works for both render and media gt's */
+	intel_rc6_print_residency(m, "RC6 residency since boot:", INTEL_RC6_RES_RC6);
+
+	return fw_domains_show(m, NULL);
+}
+
 static int drpc_show(struct seq_file *m, void *unused)
 {
 	struct intel_gt *gt = m->private;
@@ -264,7 +319,9 @@ static int drpc_show(struct seq_file *m, void *unused)
 	int err = -ENODEV;
 
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
-		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+			err = mtl_drpc(m);
+		else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 			err = vlv_drpc(m);
 		else if (GRAPHICS_VER(i915) >= 6)
 			err = gen6_drpc(m);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index a4da7de78420..684ac79a18b0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -25,6 +25,9 @@
 /* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
 #define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
 #define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
+#define   MTL_CC0				0x0
+#define   MTL_CC6				0x3
+#define   MTL_CC_MASK				REG_GENMASK(12, 9)
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
@@ -1519,6 +1522,8 @@
 #define FORCEWAKE_MEDIA_VLV			_MMIO(0x1300b8)
 #define FORCEWAKE_ACK_MEDIA_VLV			_MMIO(0x1300bc)
 
+#define MTL_MEDIA_MC6				_MMIO(0x138048)
+
 #define GEN6_GT_THREAD_STATUS_REG		_MMIO(0x13805c)
 #define   GEN6_GT_THREAD_STATUS_CORE_MASK	0x7
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 6db4e60d5fba..2ee4051e4d96 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -553,10 +553,19 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 
 static void rc6_res_reg_init(struct intel_rc6 *rc6)
 {
-	rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
-	rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
-	rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
-	rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
+	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
+
+	switch (rc6_to_gt(rc6)->type) {
+	case GT_MEDIA:
+		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
+		break;
+	default:
+		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
+		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
+		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
+		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
+		break;
+	}
 }
 
 void intel_rc6_init(struct intel_rc6 *rc6)
-- 
2.25.1

