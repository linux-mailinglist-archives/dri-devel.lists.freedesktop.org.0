Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CF6498312
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141C610EAC2;
	Mon, 24 Jan 2022 15:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCC810EA19;
 Mon, 24 Jan 2022 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036867; x=1674572867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6ZfPNlH1bdVOf0y5koMdz+A5G5QomkOwRH1qLRv67k=;
 b=a8RSpMWZgSu7dVd4g2gxhIwbu4hH41I9yB9KiTXo5isvVk6jpUOXzKB7
 VBrpDC7QPxyHHPe3Y7vLSBjIOfia72qYVwoQ0yehbVr6N3aegR1WPl+I3
 i7jgCCpdljJiHvkTV08llQFPYvhK7KUQB+kiDoNk5tj4vU/AfpdBrJep+
 xQnpvxFpYTYVnE0qBsf6t+q/5qhsdkvsDRRMlwl/52W2IGjm7NTHQR305
 HFOD3LbarrG/bCjYCnsQysqmvRF/B6yg57FKZjqwa42m0eQUkYh5XjZ7o
 mT3+fqdnaoyO5mULJrQ1qPTzMdwO+nyXGQ/aSO8fBRnzB3RLZqikNwMhB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="246282843"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="246282843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="532104901"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:07:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/i915/selftests: Set preemption timeout to zero in
 cancel reset test
Date: Mon, 24 Jan 2022 07:01:57 -0800
Message-Id: <20220124150157.15758-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124150157.15758-1-matthew.brost@intel.com>
References: <20220124150157.15758-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the preemption timeout to zero to prove that request cancellation
with preemption disabled works. Also this seals a race between a
possible preemption and request cancellation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 2a99dd7c2fe8a..e522e24129f9b 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -790,8 +790,9 @@ static int __cancel_completed(struct intel_engine_cs *engine)
  * wait for spinner to start, create a NOP request and submit it, cancel the
  * spinner, wait for spinner to complete and verify it failed with an error,
  * finally wait for NOP request to complete verify it succeeded without an
- * error. Preemption timeout also reduced / restored so test runs in a timely
- * maner.
+ * error. Preemption timeout also set to zero to ensure cancellation works with
+ * preemption disabled and to ensure the NOP request doesn't trigger a
+ * preemption on the spinner sealing a race between a preemption and the cancel.
  */
 static int __cancel_reset(struct drm_i915_private *i915,
 			  struct intel_engine_cs *engine)
@@ -807,7 +808,7 @@ static int __cancel_reset(struct drm_i915_private *i915,
 		return 0;
 
 	preempt_timeout_ms = engine->props.preempt_timeout_ms;
-	engine->props.preempt_timeout_ms = 100;
+	engine->props.preempt_timeout_ms = 0;
 
 	if (igt_spinner_init(&spin, engine->gt))
 		goto out_restore;
-- 
2.34.1

