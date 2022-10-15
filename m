Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E45FF83D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 05:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7660010E347;
	Sat, 15 Oct 2022 03:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BB910E335;
 Sat, 15 Oct 2022 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665804385; x=1697340385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UaQcCAILqWettjSDCtb5WTJiR6sjlsRyhbijPhv763w=;
 b=BiYDmruxGPOgs+PJybxXa1+eB08Si3QvrncCpt1c3CSFWcnIYwnDUBc2
 kF8vMJEuqfJ27M6mgh2wXVr7E74d62VJ4jAwTBkCd3BkYH89YS4OO6QZ1
 dUMHuXKbZ2H0/iyBJeBTIeWqmRuk5cIkOepScquAuW+HYmhNGliTQdj9T
 GM2Opb5OHeuSu1ARCeYVo7HPDoR7zr/j42QjMWFydR1kX7AVmhaZdRBhq
 gw6MZWWDEVSKo74VKJ7Unp7Srqr8Xraglw4S+h68uiU1Tig7+e3+mcwuI
 BAkG38NgohjTLdacn0yTYd4G3tzlQMUDBLsfgj9bDwqEFrlqFNkht5Tci g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="332035142"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="332035142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10500"; a="660937802"
X-IronPort-AV: E=Sophos;i="5.95,186,1661842800"; d="scan'208";a="660937802"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2022 20:26:24 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/mtl: C6 residency and C state type for MTL
 SAMedia
Date: Fri, 14 Oct 2022 20:26:18 -0700
Message-Id: <20221015032618.2458429-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
References: <20221015032618.2458429-1-ashutosh.dixit@intel.com>
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
Cc: Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

Add support for C6 residency and C state type for MTL SAMedia. Also add
mtl_drpc.

v2: Fixed review comments (Ashutosh)
v3: Sort registers and fix whitespace errors in intel_gt_regs.h (Matt R)
    Remove MTL_CC_SHIFT (Ashutosh)
    Adapt to RC6 residency register code refactor (Jani N)

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 57 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  5 ++
 drivers/gpu/drm/i915/gt/intel_rc6.c           | 17 ++++--
 3 files changed, 75 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 1fb053cbf52db..3a9bb4387248e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -256,6 +256,61 @@ static int ilk_drpc(struct seq_file *m)
 	return 0;
 }
 
+static int mtl_drpc(struct seq_file *m)
+{
+	struct intel_gt *gt = m->private;
+	struct intel_uncore *uncore = gt->uncore;
+	u32 gt_core_status, rcctl1, global_forcewake;
+	u32 mtl_powergate_enable = 0, mtl_powergate_status = 0;
+
+	gt_core_status = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
+
+	global_forcewake = intel_uncore_read(uncore, FORCEWAKE_GT_GEN9);
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
+		seq_puts(m, "on\n");
+		break;
+	case MTL_CC6:
+		seq_puts(m, "RC6\n");
+		break;
+	default:
+		seq_puts(m, "Unknown\n");
+		break;
+	}
+
+	if (gt->type == GT_MEDIA)
+		seq_printf(m, "Media Power Well: %s\n",
+			   (mtl_powergate_status &
+			    GEN9_PWRGT_MEDIA_STATUS_MASK) ? "Up" : "Down");
+	else
+		seq_printf(m, "Render Power Well: %s\n",
+			   (mtl_powergate_status &
+			    GEN9_PWRGT_RENDER_STATUS_MASK) ? "Up" : "Down");
+
+	intel_rc6_print_rc6_res(m, "RC6 residency since boot:", RC6_RES_REG_RC6);
+
+	seq_printf(m, "Global Forcewake Requests: 0x%x\n", global_forcewake);
+
+	return fw_domains_show(m, NULL);
+}
+
 static int drpc_show(struct seq_file *m, void *unused)
 {
 	struct intel_gt *gt = m->private;
@@ -266,6 +321,8 @@ static int drpc_show(struct seq_file *m, void *unused)
 	with_intel_runtime_pm(gt->uncore->rpm, wakeref) {
 		if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
 			err = vlv_drpc(m);
+		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
+			err = mtl_drpc(m);
 		else if (GRAPHICS_VER(i915) >= 6)
 			err = gen6_drpc(m);
 		else
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 66867747f643e..0493ea324b846 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -11,6 +11,9 @@
 /* MTL workpoint reg to get core C state and actual freq of 3D, SAMedia */
 #define MTL_MIRROR_TARGET_WP1			_MMIO(0xc60)
 #define   MTL_CAGF_MASK				REG_GENMASK(8, 0)
+#define   MTL_CC0				0x0
+#define   MTL_CC6				0x3
+#define   MTL_CC_MASK				REG_GENMASK(12, 9)
 
 /* RPM unit config (Gen8+) */
 #define RPM_CONFIG0				_MMIO(0xd00)
@@ -1494,6 +1497,8 @@
 #define FORCEWAKE_MEDIA_VLV			_MMIO(0x1300b8)
 #define FORCEWAKE_ACK_MEDIA_VLV			_MMIO(0x1300bc)
 
+#define MTL_MEDIA_MC6				_MMIO(0x138048)
+
 #define GEN6_GT_THREAD_STATUS_REG		_MMIO(0x13805c)
 #define   GEN6_GT_THREAD_STATUS_CORE_MASK	0x7
 
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 794f77fa10c55..1a1b2289c706c 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -553,10 +553,19 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
 
 static void rc6_res_reg_init(struct intel_rc6 *rc6)
 {
-	rc6->res_reg[RC6_RES_REG_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
-	rc6->res_reg[RC6_RES_REG_RC6] = GEN6_GT_GFX_RC6;
-	rc6->res_reg[RC6_RES_REG_RC6p] = GEN6_GT_GFX_RC6p;
-	rc6->res_reg[RC6_RES_REG_RC6pp] = GEN6_GT_GFX_RC6pp;
+	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
+
+	switch (rc6_to_gt(rc6)->type) {
+	case GT_MEDIA:
+		rc6->res_reg[RC6_RES_REG_RC6] = MTL_MEDIA_MC6;
+		break;
+	default:
+		rc6->res_reg[RC6_RES_REG_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
+		rc6->res_reg[RC6_RES_REG_RC6] = GEN6_GT_GFX_RC6;
+		rc6->res_reg[RC6_RES_REG_RC6p] = GEN6_GT_GFX_RC6p;
+		rc6->res_reg[RC6_RES_REG_RC6pp] = GEN6_GT_GFX_RC6pp;
+		break;
+	}
 }
 
 void intel_rc6_init(struct intel_rc6 *rc6)
-- 
2.38.0

