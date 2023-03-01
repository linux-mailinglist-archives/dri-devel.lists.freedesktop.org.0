Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC86A6A8A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 11:10:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57F210E224;
	Wed,  1 Mar 2023 10:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1CB10E224;
 Wed,  1 Mar 2023 10:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677665444; x=1709201444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wnkml8Qo6VHhtcb4WlL13FeLSM4zOLKHRLAS8GkJeaA=;
 b=gPlbEIX+fLDzzajBbB2c2cnlOv+cisvAsR676oXs+y1+6PvUwmfXlOps
 CmUNKepy0rPV5olVYlYj52km1fYgqfzPbbKexhdtCP0/YYyjbeJOsNqS9
 05GwKMwLCshM5H3CbrGPAFKdYzbBFUmSkwS9Fir+G8z8+v8nTxAID2NEk
 2riptQ06/O/lJQZA37QowxDwTc3g7FTc78wRFeJUcavERF88m2xJcWVx9
 Xh0tw5e9T/GSjwuzTzZMp7wiajHbgt39s0mgTPK3DEuKaFSaTdIJiRT3W
 L5hXdR43tvNR7/op9OBoW4fDIQXKRx1B75kFlcEs4VMj+D75hWopuxxuu g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="336662925"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="336662925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 02:10:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="706917242"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="706917242"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 02:10:39 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915/mtl: Apply Wa_14017073508 for MTL Media Step
Date: Wed,  1 Mar 2023 15:42:51 +0530
Message-Id: <20230301101251.1203215-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@intel.com, anshuman.gupta@intel.com,
 dri-devel@lists.freedesktop.org, jon.ewins@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, matthew.d.roper@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apply Wa_14017073508 for MTL Media step instead of graphics step.

v2: Use Media stepping instead of SoC die stepping (Matt)

Bspec: 66623

Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index cef3d6f5c34e..a14f23b3355a 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -29,7 +29,7 @@
 static void mtl_media_busy(struct intel_gt *gt)
 {
 	/* Wa_14017073508: mtl */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
 	    gt->type == GT_MEDIA)
 		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
 				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
@@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
 static void mtl_media_idle(struct intel_gt *gt)
 {
 	/* Wa_14017073508: mtl */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
 	    gt->type == GT_MEDIA)
 		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
 				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index fcf51614f9a4..a53a995c3950 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
 	 * Do not enable gucrc to avoid additional interrupts which
 	 * may disrupt pcode wa.
 	 */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0) &&
 	    gt->type == GT_MEDIA)
 		return false;
 
-- 
2.25.1

