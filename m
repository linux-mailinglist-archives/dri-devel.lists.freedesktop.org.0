Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C014454FF4C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 23:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D41210E3B1;
	Fri, 17 Jun 2022 21:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319F110E35B;
 Fri, 17 Jun 2022 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655500845; x=1687036845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9HdYHLtQVy2IMxSRwXr3wVXsSN4Em3FEPjeujL/jnAk=;
 b=aanW9fZIXOWNfGP7ruR4OzurzdKw/Aw8eAgHZMjJLU9MPsPbCU4+GKpz
 TnIzwfJxcSmTk12OJqyGgb5if2L0kcC1Qe/I8T+zvflGpAGlZi92qdsX6
 8t5WJdVE+Brex4W6UGRkhYOLUkMYuRwA93cc8/skeiHxkW9Hez0EYjkiQ
 tkLVWKMU6qp2+8V0N6UazFXLvjRWXnpBOhsPsbD7sISpPbBeOw1TcjDj3
 fLBZ81bXBdJodNvESNa7qfMbZj4HXltXAd+p6+bfMGjANFozNV2sXfj1D
 lrLhHrAMsX3mcmfdUEjd424TA4BwLTDEvUm5QFZr+a38n/LA0Au6MUc3M g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262629491"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="262629491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 14:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="642192537"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jun 2022 14:20:36 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add global forcewake request to drpc
Date: Fri, 17 Jun 2022 14:20:32 -0700
Message-Id: <20220617212032.34577-1-vinay.belgaumkar@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have seen multiple RC6 issues where it is useful to know
which global forcewake bits are set. Add this to the 'drpc'
debugfs output.

v2: Review comments (Ashutosh)

Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 90a440865037..40bdd4cb629f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -100,14 +100,16 @@ static int vlv_drpc(struct seq_file *m)
 {
 	struct intel_gt *gt = m->private;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 rcctl1, pw_status;
+	u32 rcctl1, pw_status, mt_fwake_req;
 
+	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
 	pw_status = intel_uncore_read(uncore, VLV_GTLC_PW_STATUS);
 	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
 
 	seq_printf(m, "RC6 Enabled: %s\n",
 		   str_yes_no(rcctl1 & (GEN7_RC_CTL_TO_MODE |
 					GEN6_RC_CTL_EI_MODE(1))));
+	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
 	seq_printf(m, "Render Power Well: %s\n",
 		   (pw_status & VLV_GTLC_PW_RENDER_STATUS_MASK) ? "Up" : "Down");
 	seq_printf(m, "Media Power Well: %s\n",
@@ -124,9 +126,10 @@ static int gen6_drpc(struct seq_file *m)
 	struct intel_gt *gt = m->private;
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore = gt->uncore;
-	u32 gt_core_status, rcctl1, rc6vids = 0;
+	u32 gt_core_status, mt_fwake_req, rcctl1, rc6vids = 0;
 	u32 gen9_powergate_enable = 0, gen9_powergate_status = 0;
 
+	mt_fwake_req = intel_uncore_read_fw(uncore, FORCEWAKE_MT);
 	gt_core_status = intel_uncore_read_fw(uncore, GEN6_GT_CORE_STATUS);
 
 	rcctl1 = intel_uncore_read(uncore, GEN6_RC_CONTROL);
@@ -178,6 +181,7 @@ static int gen6_drpc(struct seq_file *m)
 
 	seq_printf(m, "Core Power Down: %s\n",
 		   str_yes_no(gt_core_status & GEN6_CORE_CPD_STATE_MASK));
+	seq_printf(m, "Multi-threaded Forcewake Request: 0x%x\n", mt_fwake_req);
 	if (GRAPHICS_VER(i915) >= 9) {
 		seq_printf(m, "Render Power Well: %s\n",
 			   (gen9_powergate_status &
-- 
2.35.1

