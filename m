Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF357126DC
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 14:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E09A110E1CD;
	Fri, 26 May 2023 12:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2801B10E1C8;
 Fri, 26 May 2023 12:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685104923; x=1716640923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iHnTy+rGdynPSN2oUg3l6ddZoSKYljpn1oATVCjWczE=;
 b=IJM6IZCjyeIcMRMI6gtXTFFmg6Ajw2AZFx5X4hgX10iNCQIfUFPc9m2s
 mYEYzaLDYDO/FanbOaLVSnIECoOJTZbatysRp33ychPI5Cb0EJexfYYhG
 fIfwpBUba2CkRmBJIvAMTRTQGKBdqpUwNncitDIj5LpUI6LGdWkQtHvEi
 GvSJu6Z/8wMExJHUEmRg0DETBQ7QvaG2SYeLu5NMPmvuuG2OPVpuigtK8
 kp7d3WY5luhRQRD2z6GalMzMaeeB5AB2dR8DQfxMWbGcWX14rYkDBtD6O
 BVgxDUCKTOXQrHoCBe2uNwBtj5vsjgLTiAsiQ0PZIrIlY2GpXcUTcV4XN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="353034628"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="353034628"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795079654"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795079654"
Received: from schoenfm-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.39.253])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 05:41:59 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/gt: Use the correct error value when
 kernel_context() fails
Date: Fri, 26 May 2023 14:41:38 +0200
Message-Id: <20230526124138.2006110-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

kernel_context() returns an error pointer. Use pointer-error
conversion functions to evaluate its return value, rather than
checking for a '0' return.

Fixes: eb5c10cbbc2f ("drm/i915: Remove I915_USER_PRIORITY_SHIFT")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson < chris@chris-wilson.co.uk>
Cc: <stable@vger.kernel.org> # v5.13+
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 736b89a8ecf54..4202df5b8c122 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -1530,8 +1530,8 @@ static int live_busywait_preempt(void *arg)
 	struct drm_i915_gem_object *obj;
 	struct i915_vma *vma;
 	enum intel_engine_id id;
-	int err = -ENOMEM;
 	u32 *map;
+	int err;
 
 	/*
 	 * Verify that even without HAS_LOGICAL_RING_PREEMPTION, we can
@@ -1539,13 +1539,17 @@ static int live_busywait_preempt(void *arg)
 	 */
 
 	ctx_hi = kernel_context(gt->i915, NULL);
-	if (!ctx_hi)
-		return -ENOMEM;
+	if (IS_ERR(ctx_hi))
+		return PTR_ERR(ctx_hi);
+
 	ctx_hi->sched.priority = I915_CONTEXT_MAX_USER_PRIORITY;
 
 	ctx_lo = kernel_context(gt->i915, NULL);
-	if (!ctx_lo)
+	if (IS_ERR(ctx_lo)) {
+		err = PTR_ERR(ctx_lo);
 		goto err_ctx_hi;
+	}
+
 	ctx_lo->sched.priority = I915_CONTEXT_MIN_USER_PRIORITY;
 
 	obj = i915_gem_object_create_internal(gt->i915, PAGE_SIZE);
-- 
2.40.1

