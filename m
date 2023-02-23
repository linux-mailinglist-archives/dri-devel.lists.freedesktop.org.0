Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F36A0F94
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6D610E0D1;
	Thu, 23 Feb 2023 18:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642D10E0CD;
 Thu, 23 Feb 2023 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677177684; x=1708713684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oTqf0Xn+wdMpxPuYN6pszBE3GN18V+nI161YW9cocaY=;
 b=Qoerpmdg5q8spVYUS5ygEV23gFwN7/ED3A/TRm+VercABE9tDwzQyHT8
 NW1/YLEhLhoapb69Gn9K49YrxdhtFYRCw+ubW++hB8Bcv1vrmm1uOKUOE
 3TZJGdEXzjo4cCsnNRwA/tNClG/YZxKePNFAEV3L3jSe/whYZUwhf4vT+
 eN8kE15CJGzlVaGYFbVjCBfoUyXCUPA0aB8zLf7JlPZFfO6+Qnd8vKVfb
 gO1M+DOvTKOlLol9/pkwm6rw7u3gyddl+ashQZUlCaIrpHC5jYKOBFZ8V
 LwFta8/FFXY0hJfZXAQmil1uyo+uGA9Y+s3EM8jRBHNbxL7rLwf3Ngg14 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331972110"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="331972110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:41:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="665892335"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; d="scan'208";a="665892335"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 10:41:21 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Apply Wa_14017073508 for MTL SoC Step
Date: Fri, 24 Feb 2023 00:11:40 +0530
Message-Id: <20230223184140.3452853-1-badal.nilawar@intel.com>
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
Cc: anshuman.gupta@intel.com, dri-devel@lists.freedesktop.org,
 jon.ewins@intel.com, rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 matthew.d.roper@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Apply Wa_14017073508 for MTL SoC die A step instead of graphics step.
To get the SoC die stepping there is no direct interface so using
revid as revid 0 aligns with SoC die A step.

Bspec: 55420

Fixes: 8f70f1ec587d ("drm/i915/mtl: Add Wa_14017073508 for SAMedia")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c     | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index cef3d6f5c34e..4ba3c8c97ccc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -29,7 +29,7 @@
 static void mtl_media_busy(struct intel_gt *gt)
 {
 	/* Wa_14017073508: mtl */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
 	    gt->type == GT_MEDIA)
 		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
 				  PCODE_MBOX_GT_STATE_MEDIA_BUSY,
@@ -39,7 +39,7 @@ static void mtl_media_busy(struct intel_gt *gt)
 static void mtl_media_idle(struct intel_gt *gt)
 {
 	/* Wa_14017073508: mtl */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
 	    gt->type == GT_MEDIA)
 		snb_pcode_write_p(gt->uncore, PCODE_MBOX_GT_STATE,
 				  PCODE_MBOX_GT_STATE_MEDIA_NOT_BUSY,
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index fcf51614f9a4..7429c233ad45 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -19,7 +19,7 @@ static bool __guc_rc_supported(struct intel_guc *guc)
 	 * Do not enable gucrc to avoid additional interrupts which
 	 * may disrupt pcode wa.
 	 */
-	if (IS_MTL_GRAPHICS_STEP(gt->i915, P, STEP_A0, STEP_B0) &&
+	if (IS_METEORLAKE(gt->i915) && INTEL_REVID(gt->i915) == 0 &&
 	    gt->type == GT_MEDIA)
 		return false;
 
-- 
2.25.1

