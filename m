Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F396C722709
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 15:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96A610E1C4;
	Mon,  5 Jun 2023 13:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D93510E1C4;
 Mon,  5 Jun 2023 13:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685970702; x=1717506702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=15tXzVK0hqa9Ay0VBybMbijA8gfS/nmzKd2r0C5PNAo=;
 b=c8uANIOjaw3l6I15m2RM5elFuYj4JUPalHd9Hl8tKNNG9XfulwhVaRPe
 0Yg6BZZSIFOuaHsytX4wjZXvuzu+qw3wc6iWLQZOi1Z0n7JpHAa+1Nl31
 LhGaZm4aMUi9AvlzZCvDZNOfGPwPzy1+ibN5YSRUiRFzWF7qwQAMzmSnx
 rjoewzk9/9kraa9B4VNWDq5nz5z7QDjZvlm/+EJMAugzcG7NmdOSuoxYh
 Sl7RMqRzg0Rz8wd4tia1Sh6Y5uLuYajQi+6w+4o9EHNS+mCBgwrHWaynl
 TkQbTOxGF+H4gZ5uZ1DFF6FYh8PhwRFjJ6VTNd+yeXkWc7Nh9DmSf9QVp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="359674028"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="359674028"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="882903118"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="882903118"
Received: from mloughma-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.238.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:11:39 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Add some missing error propagation
Date: Mon,  5 Jun 2023 14:11:35 +0100
Message-Id: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Add some missing error propagation in live_parallel_switch.

To avoid needlessly burdening the various backport processes, note I am
not marking it as a fix against any patches and not copying stable since
it is debug/selftests only code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index ad6a3b2fb387..7021b6e9b219 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -348,8 +348,10 @@ static int live_parallel_switch(void *arg)
 				continue;
 
 			ce = intel_context_create(data[m].ce[0]->engine);
-			if (IS_ERR(ce))
+			if (IS_ERR(ce)) {
+				err = PTR_ERR(ce);
 				goto out;
+			}
 
 			err = intel_context_pin(ce);
 			if (err) {
@@ -369,8 +371,10 @@ static int live_parallel_switch(void *arg)
 
 		worker = kthread_create_worker(0, "igt/parallel:%s",
 					       data[n].ce[0]->engine->name);
-		if (IS_ERR(worker))
+		if (IS_ERR(worker)) {
+			err = PTR_ERR(worker);
 			goto out;
+		}
 
 		data[n].worker = worker;
 	}
@@ -399,8 +403,10 @@ static int live_parallel_switch(void *arg)
 			}
 		}
 
-		if (igt_live_test_end(&t))
-			err = -EIO;
+		if (igt_live_test_end(&t)) {
+			err = err ?: -EIO;
+			break;
+		}
 	}
 
 out:
-- 
2.39.2

