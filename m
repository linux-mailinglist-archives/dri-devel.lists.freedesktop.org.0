Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB77244D6FD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 14:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F6689DFE;
	Thu, 11 Nov 2021 13:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E289DEA;
 Thu, 11 Nov 2021 13:06:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="213632517"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="213632517"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 05:06:43 -0800
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="470781114"
Received: from hscahill-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.223.189])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 05:06:41 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/i915: Skip error capture when wedged on init
Date: Thu, 11 Nov 2021 13:06:34 +0000
Message-Id: <20211111130634.266098-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110114327.200470-1-tvrtko.ursulin@linux.intel.com>
References: <20211110114327.200470-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Trying to capture uninitialised engines when we wedged on init ends in
tears. Skip that together with uC capture, since failure to initialise the
latter can actually be one of the reasons for wedging on init.

v2:
 * Use i915_disable_error_state when wedging on init/fini.

v3:
 * Handle mock tests.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
---
 drivers/gpu/drm/i915/gt/intel_reset.c            | 2 ++
 drivers/gpu/drm/i915/selftests/mock_gem_device.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 51b56b8e5003..0fbd6dbadce7 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1448,6 +1448,7 @@ void intel_gt_set_wedged_on_init(struct intel_gt *gt)
 	BUILD_BUG_ON(I915_RESET_ENGINE + I915_NUM_ENGINES >
 		     I915_WEDGED_ON_INIT);
 	intel_gt_set_wedged(gt);
+	i915_disable_error_state(gt->i915, -ENODEV);
 	set_bit(I915_WEDGED_ON_INIT, &gt->reset.flags);
 
 	/* Wedged on init is non-recoverable */
@@ -1457,6 +1458,7 @@ void intel_gt_set_wedged_on_init(struct intel_gt *gt)
 void intel_gt_set_wedged_on_fini(struct intel_gt *gt)
 {
 	intel_gt_set_wedged(gt);
+	i915_disable_error_state(gt->i915, -ENODEV);
 	set_bit(I915_WEDGED_ON_FINI, &gt->reset.flags);
 	intel_gt_retire_requests(gt); /* cleanup any wedged requests */
 }
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index 9ab3f284d1dd..d0e2e61de8d4 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -177,6 +177,8 @@ struct drm_i915_private *mock_gem_device(void)
 
 	mock_uncore_init(&i915->uncore, i915);
 
+	spin_lock_init(&i915->gpu_error.lock);
+
 	i915_gem_init__mm(i915);
 	intel_gt_init_early(&i915->gt, i915);
 	atomic_inc(&i915->gt.wakeref.count); /* disable; no hw support */
-- 
2.30.2

