Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175CC44C041
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 12:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE156EC1A;
	Wed, 10 Nov 2021 11:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753CF6EC11;
 Wed, 10 Nov 2021 11:43:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="213381396"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="213381396"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:43:35 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="602177521"
Received: from dkeohane-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.222.153])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:43:34 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Skip error capture when wedged on init
Date: Wed, 10 Nov 2021 11:43:27 +0000
Message-Id: <20211110114327.200470-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.30.2

