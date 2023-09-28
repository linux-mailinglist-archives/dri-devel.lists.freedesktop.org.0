Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA887B1D2B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228010E05C;
	Thu, 28 Sep 2023 13:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E59410E18A;
 Thu, 28 Sep 2023 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695906026; x=1727442026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nHwNiMu5Fc7CG6ZQdftjQu4SuYpnxtML6Q/gKnQj8oA=;
 b=SC5KHVEa0ZTGxSkG+r+ENoYOVrBuulJw0EoezWwBwAEV34sS6x3lJ4xN
 gMUnAHMyL6CSegmrDqmTjCQiC5Q/JqwY6q7VXtaT1/VQfDbTAbjWZS9Mo
 Be7q/7a6Wzc4l9AX4dASPjbS/E8FACMToKROKMpE3+9Mvvyg3KhlZc53i
 Y7a0UwWHNWVpEPCjt0aS3oM06T6JmsbkUKNkvFQnmaUOA7TvSsWyotUVH
 uDs5GTWA30XXGn4cIVrI9tu+qqhE5ClVTjHEKGN5zky5vZRiMcPxUiPIS
 dY3MaVUcnxeSbb86/j5oA+1gJIXyJWDOSoulCaKW83DqTVcgF70YkitNK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380925489"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380925489"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="865247781"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="865247781"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:24 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 2/4] drm/i915: Introduce the intel_gt_resume_early()
Date: Thu, 28 Sep 2023 15:00:13 +0200
Message-ID: <20230928130015.6758-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move early resume functions of gt to a proper file.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_pm.c | 6 ++++++
 drivers/gpu/drm/i915/gt/intel_gt_pm.h | 1 +
 drivers/gpu/drm/i915/i915_driver.c    | 6 ++----
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
index 5a942af0a14e..dab73980c9f1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
@@ -216,6 +216,12 @@ void intel_gt_pm_fini(struct intel_gt *gt)
 	intel_rc6_fini(&gt->rc6);
 }
 
+void intel_gt_resume_early(struct intel_gt *gt)
+{
+	intel_uncore_resume_early(gt->uncore);
+	intel_gt_check_and_clear_faults(gt);
+}
+
 int intel_gt_resume(struct intel_gt *gt)
 {
 	struct intel_engine_cs *engine;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index 6c9a46452364..b1eeb5b33918 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -78,6 +78,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
 void intel_gt_suspend_prepare(struct intel_gt *gt);
 void intel_gt_suspend_late(struct intel_gt *gt);
 int intel_gt_resume(struct intel_gt *gt);
+void intel_gt_resume_early(struct intel_gt *gt);
 
 void intel_gt_runtime_suspend(struct intel_gt *gt);
 int intel_gt_runtime_resume(struct intel_gt *gt);
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d50347e5773a..78501a83ba10 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1327,10 +1327,8 @@ static int i915_drm_resume_early(struct drm_device *dev)
 		drm_err(&dev_priv->drm,
 			"Resume prepare failed: %d, continuing anyway\n", ret);
 
-	for_each_gt(gt, dev_priv, i) {
-		intel_uncore_resume_early(gt->uncore);
-		intel_gt_check_and_clear_faults(gt);
-	}
+	for_each_gt(gt, dev_priv, i)
+		intel_gt_resume_early(gt);
 
 	intel_display_power_resume_early(dev_priv);
 
-- 
2.41.0

