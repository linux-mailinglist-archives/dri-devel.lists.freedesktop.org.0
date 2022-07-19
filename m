Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7F0578F91
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 03:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E9611A2C5;
	Tue, 19 Jul 2022 01:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57311A2A4;
 Tue, 19 Jul 2022 01:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658192833; x=1689728833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+4b/1lFuaXG9mvofr8bWgXtDV107btTsZh/nvIwXys0=;
 b=aMF7FQTC+aHQwuGFwOCYDrsiKGsZftPDroKYiilCZyHAzFBAmuqAYoeF
 /LX8baFvTbQmefw07EhZ+hTJNK+2DveEOxXBS+1xm7TWCWbMyQNFPwEH8
 NgbfnCHdlBfW7KwIApHGeSWq2d9Zi+iy7s3o3whT2HRr23zC2csaQHTWI
 N4/waVc/GT+RivZXOqT9i14OxsmxDz793gUeaHNLmPS+/ZAlL2l5auYth
 yneWLloB2cIE6bF2+yVcMLwh/2jJ9tGwu88HWOZGT7Vop4AJKsvpEG3KE
 YCDadklzcYkZXA8Ww8fC4Z57fsOpYpLppObuq4botJTqPUlPdkkKg+9P0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266759609"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="266759609"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 18:07:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="630128385"
Received: from orsosgc001.jf.intel.com ([10.165.21.135])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 18:07:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gt: Create gt/gtN/.defaults/ for per gt sysfs
 defaults
Date: Mon, 18 Jul 2022 18:07:07 -0700
Message-Id: <be7c30d0ae58be9d8d5b8242ba00a1b2825e63ad.1658192398.git.ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1658192398.git.ashutosh.dixit@intel.com>
References: <cover.1658192398.git.ashutosh.dixit@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a gt/gtN/.defaults/ directory (similar to
engine/<engine-name>/.defaults/) to expose default parameter values for
each gt in sysfs. This allows userspace to restore default parameter values
after they have changed. The empty 'struct gt_defaults' will be populated
by subsequent patches.

v2: Changed 'struct intel_rps_defaults rps_defaults' to
    'struct gt_defaults defaults' (Andi)

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 5 +++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 9e4ebf53379b..6447c0376dbd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -101,6 +101,10 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 				 gt->i915->sysfs_gt, "gt%d", gt->info.id))
 		goto exit_fail;
 
+	gt->sysfs_defaults = kobject_create_and_add(".defaults", &gt->sysfs_gt);
+	if (!gt->sysfs_defaults)
+		goto exit_fail;
+
 	intel_gt_sysfs_pm_init(gt, &gt->sysfs_gt);
 
 	return;
@@ -113,5 +117,6 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 
 void intel_gt_sysfs_unregister(struct intel_gt *gt)
 {
+	kobject_put(gt->sysfs_defaults);
 	kobject_put(&gt->sysfs_gt);
 }
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index df708802889d..92839b9adb12 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -75,6 +75,9 @@ enum intel_submission_method {
 	INTEL_SUBMISSION_GUC,
 };
 
+struct gt_defaults {
+};
+
 struct intel_gt {
 	struct drm_i915_private *i915;
 	struct intel_uncore *uncore;
@@ -235,6 +238,10 @@ struct intel_gt {
 
 	/* gt/gtN sysfs */
 	struct kobject sysfs_gt;
+
+	/* sysfs defaults per gt */
+	struct gt_defaults defaults;
+	struct kobject *sysfs_defaults;
 };
 
 enum intel_gt_scratch_field {
-- 
2.34.1

