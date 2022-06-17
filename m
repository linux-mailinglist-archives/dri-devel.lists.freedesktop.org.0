Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A69854FE47
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACCF10E365;
	Fri, 17 Jun 2022 20:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A2D10E110;
 Fri, 17 Jun 2022 20:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655497547; x=1687033547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+CboEOXkd8mucnJ3/yuaYbTTRlHgpSJ5XlPeFZhSh9U=;
 b=NplAWOgm+fSqdXokwd/Q256JcotaBLWgDxYh6dcESmZ+L2VQZea7MRt3
 rwrrKdonGCjDlqcDNEPavklL2TbkEQUHKsGUo2MuQK5cumUOho9zxH/Sg
 nGybe5+HWMOz+ECTnIbeXmvfMH1R4N64cBuOQqFH1jxDZ/9fxoYYSDYSr
 aKTAQHcSUo2ec67b6p5vjfxQtMDnNO9cwd1gmbfuRy7bdHP7KaXswPb/9
 5yPxPYf9AGuvqItS2hcDEl7gsaKhdZT74sbVDyI4iyEacvR1RF8IVYRbu
 trG27u6yhgiWKugzMV/CoGFTcebyTbvmvvjQnM7zD7LZY7zHWObd5k40/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259401461"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259401461"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 13:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="613670418"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga008.jf.intel.com with ESMTP; 17 Jun 2022 13:25:46 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add global forcewake status to drpc
Date: Fri, 17 Jun 2022 13:25:34 -0700
Message-Id: <20220617202534.30609-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have seen multiple RC6 issues where it is useful to know
which global forcewake bits are set. Add this to the 'drpc'
debugfs output.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 90a440865037..2a157ca28dda 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -96,18 +96,25 @@ static void print_rc6_res(struct seq_file *m,
 			   intel_rc6_residency_us(&gt->rc6, reg));
 }
 
+static u32 mt_fwake_status(struct intel_uncore *uncore)
+{
+	return intel_uncore_read_fw(uncore, FORCEWAKE_MT);
+}
+
 static int vlv_drpc(struct seq_file *m)
 {
 	struct intel_gt *gt = m->private;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 rcctl1, pw_status;
+	u32 rcctl1, pw_status, mt_fwake;
 
+	mt_fwake = mt_fwake_status(uncore);
 	pw_status = intel_uncore_read(uncore, VLV_GTLC_PW_STATUS);
 	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
 
 	seq_printf(m, "RC6 Enabled: %s\n",
 		   str_yes_no(rcctl1 & (GEN7_RC_CTL_TO_MODE |
 					GEN6_RC_CTL_EI_MODE(1))));
+	seq_printf(m, "Multi-threaded Forcewake: 0x%x\n", mt_fwake);
 	seq_printf(m, "Render Power Well: %s\n",
 		   (pw_status & VLV_GTLC_PW_RENDER_STATUS_MASK) ? "Up" : "Down");
 	seq_printf(m, "Media Power Well: %s\n",
@@ -124,9 +131,10 @@ static int gen6_drpc(struct seq_file *m)
 	struct intel_gt *gt = m->private;
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 gt_core_status, rcctl1, rc6vids = 0;
+	u32 gt_core_status, mt_fwake, rcctl1, rc6vids = 0;
 	u32 gen9_powergate_enable = 0, gen9_powergate_status = 0;
 
+	mt_fwake = mt_fwake_status(uncore);
 	gt_core_status = intel_uncore_read_fw(uncore, GEN6_GT_CORE_STATUS);
 
 	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
@@ -178,6 +186,7 @@ static int gen6_drpc(struct seq_file *m)
 
 	seq_printf(m, "Core Power Down: %s\n",
 		   str_yes_no(gt_core_status & GEN6_CORE_CPD_STATE_MASK));
+	seq_printf(m, "Multi-threaded Forcewake: 0x%x\n", mt_fwake);
 	if (GRAPHICS_VER(i915) >= 9) {
 		seq_printf(m, "Render Power Well: %s\n",
 			   (gen9_powergate_status &
-- 
2.35.1

