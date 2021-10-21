Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61800436CFC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F496E4C9;
	Thu, 21 Oct 2021 21:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6170A6E4C9;
 Thu, 21 Oct 2021 21:45:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252653409"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="252653409"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 14:45:21 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="568595138"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 14:45:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>
Subject: [PATCH] drm/i915/selftests: Update live.evict to wait on requests /
 idle GPU after each loop
Date: Thu, 21 Oct 2021 14:40:40 -0700
Message-Id: <20211021214040.33292-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update live.evict to wait on last request and idle GPU after each loop.
This not only enhances the test to fill the GGTT on each engine class
but also avoid timeouts from igt_flush_test when using GuC submission.
igt_flush_test (idle GPU) can take a long time with GuC submission if
losts of contexts are created due to H2G / G2H required to destroy
contexts.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gpu/drm/i915/selftests/i915_gem_evict.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
index f99bb0113726..7e0658a77659 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_evict.c
@@ -442,6 +442,7 @@ static int igt_evict_contexts(void *arg)
 	/* Overfill the GGTT with context objects and so try to evict one. */
 	for_each_engine(engine, gt, id) {
 		struct i915_sw_fence fence;
+		struct i915_request *last = NULL;
 
 		count = 0;
 		onstack_fence_init(&fence);
@@ -479,6 +480,9 @@ static int igt_evict_contexts(void *arg)
 
 			i915_request_add(rq);
 			count++;
+			if (last)
+				i915_request_put(last);
+			last = i915_request_get(rq);
 			err = 0;
 		} while(1);
 		onstack_fence_fini(&fence);
@@ -486,6 +490,21 @@ static int igt_evict_contexts(void *arg)
 			count, engine->name);
 		if (err)
 			break;
+		if (last) {
+			if (i915_request_wait(last, 0, HZ) < 0) {
+				err = -EIO;
+				i915_request_put(last);
+				pr_err("Failed waiting for last request (on %s)",
+				       engine->name);
+				break;
+			}
+			i915_request_put(last);
+		}
+		err = intel_gt_wait_for_idle(engine->gt, HZ * 3);
+		if (err) {
+			pr_err("Failed to idle GT (on %s)", engine->name);
+			break;
+		}
 	}
 
 	mutex_lock(&ggtt->vm.mutex);
-- 
2.32.0

