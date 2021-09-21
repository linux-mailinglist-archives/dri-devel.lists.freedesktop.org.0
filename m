Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C568413A45
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 20:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C8E89D00;
	Tue, 21 Sep 2021 18:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104D189D00;
 Tue, 21 Sep 2021 18:46:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="245872222"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="245872222"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:46:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="557057412"
Received: from twallyn-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.83.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:46:37 -0700
Date: Tue, 21 Sep 2021 11:46:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: fix blank screen booting crashes
Message-ID: <20210921184637.ullcwswqd6z5hi4j@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210921174332.30784-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210921174332.30784-1-matthew.brost@intel.com>
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

On Tue, Sep 21, 2021 at 10:43:32AM -0700, Matthew Brost wrote:
>From: Hugh Dickins <hughd@google.com>
>
>5.15-rc1 crashes with blank screen when booting up on two ThinkPads
>using i915.  Bisections converge convincingly, but arrive at different
>and surprising "culprits", none of them the actual culprit.
>
>netconsole (with init_netconsole() hacked to call i915_init() when
>logging has started, instead of by module_init()) tells the story:
>
>kernel BUG at drivers/gpu/drm/i915/i915_sw_fence.c:245!
>with RSI: ffffffff814d408b pointing to sw_fence_dummy_notify().
>I've been building with CONFIG_CC_OPTIMIZE_FOR_SIZE=y, and that
>function needs to be 4-byte aligned.
>
>v2:
> (Jani Nikula)
>  - Change BUG_ON to WARN_ON
>v3:
> (Jani / Tvrtko)
>  - Short circuit __i915_sw_fence_init on WARN_ON
>
>Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
>Signed-off-by: Hugh Dickins <hughd@google.com>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_context.c |  4 ++--
> drivers/gpu/drm/i915/i915_sw_fence.c    | 17 ++++++++++-------
> 2 files changed, 12 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>index ff637147b1a9..e7f78bc7ebfc 100644
>--- a/drivers/gpu/drm/i915/gt/intel_context.c
>+++ b/drivers/gpu/drm/i915/gt/intel_context.c
>@@ -362,8 +362,8 @@ static int __intel_context_active(struct i915_active *active)
> 	return 0;
> }
>

>-static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
>-				 enum i915_sw_fence_notify state)
>+static int __i915_sw_fence_call
>+sw_fence_dummy_notify(struct i915_sw_fence *sf, enum i915_sw_fence_notify state)
> {
> 	return NOTIFY_DONE;
> }
>diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
>index c589a681da77..08cea73264e7 100644
>--- a/drivers/gpu/drm/i915/i915_sw_fence.c
>+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>@@ -13,9 +13,9 @@
> #include "i915_selftest.h"
>
> #if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
>-#define I915_SW_FENCE_BUG_ON(expr) BUG_ON(expr)
>+#define I915_SW_FENCE_WARN_ON(expr) WARN_ON(expr)
> #else
>-#define I915_SW_FENCE_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
>+#define I915_SW_FENCE_WARN_ON(expr) BUILD_BUG_ON_INVALID(expr)
> #endif
>
> static DEFINE_SPINLOCK(i915_sw_fence_lock);
>@@ -129,7 +129,10 @@ static int __i915_sw_fence_notify(struct i915_sw_fence *fence,
> 	i915_sw_fence_notify_t fn;
>
> 	fn = (i915_sw_fence_notify_t)(fence->flags & I915_SW_FENCE_MASK);
>-	return fn(fence, state);
>+	if (likely(fn))
>+		return fn(fence, state);
>+	else
>+		return 0;

since the knowledge for these being NULL (or with the wrong alignment)
are in the init/reinit functions,  wouldn't it be better to just add a
fence_nop() and assign it there instead this likely() here?

> }
>
> #ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS
>@@ -242,9 +245,9 @@ void __i915_sw_fence_init(struct i915_sw_fence *fence,
> 			  const char *name,
> 			  struct lock_class_key *key)
> {
>-	BUG_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK);
>-
> 	__init_waitqueue_head(&fence->wait, name, key);
>+	if (WARN_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK))
>+		return;

like:
	if (WARN_ON(!fn || (unsigned long)fn & ~I915_SW_FENCE_MASK))
		fence->flags = (unsigned long)sw_fence_dummy_notify;
	else
		fence->flags = (unsigned long)fn;


f you return here instead of calling i915_sw_fence_reinit(), aren't you
just going to use uninitialized memory later? At least in the selftests,
which allocate it with kmalloc()... I didn't check others.


For the bug fix we could just add the __aligned(4) and leave the rest to a
separate patch.


Lucas De Marchi

> 	fence->flags = (unsigned long)fn;
>
> 	i915_sw_fence_reinit(fence);
>@@ -257,8 +260,8 @@ void i915_sw_fence_reinit(struct i915_sw_fence *fence)
> 	atomic_set(&fence->pending, 1);
> 	fence->error = 0;
>
>-	I915_SW_FENCE_BUG_ON(!fence->flags);
>-	I915_SW_FENCE_BUG_ON(!list_empty(&fence->wait.head));
>+	I915_SW_FENCE_WARN_ON(!fence->flags);
>+	I915_SW_FENCE_WARN_ON(!list_empty(&fence->wait.head));
> }
>
> void i915_sw_fence_commit(struct i915_sw_fence *fence)
>-- 
>2.32.0
>
