Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7503A5EED26
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 07:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F34610E7F8;
	Thu, 29 Sep 2022 05:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8736410E7F8;
 Thu, 29 Sep 2022 05:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664428835; x=1695964835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dFHlWtfVQJYmcGCrajdltHKMLDhKOsr8e5j6DydueJ4=;
 b=S5WJ44/DM0WxjK3mmxIcU15aIRcEUmIpsMq3T7UAIGPQPmbsCsE+cE31
 9IxG22689LZkeQvRPd52PVQ3wu3E2gikRwQvSvlYUnSsZdK0BwBXR/RZZ
 Mq2x8Nqih/X2E1Q4DWMcZqDiMViqIlMefFBqH/4o+FkjB/vFx6mg4ptWl
 hArm6NcKvlUJwbVeV4tCLH8x41Q/A0rj3KO1d2iOSj7VvFL5aVvxqnvCg
 7BFEHtubEhopXwsRasF4I+BbKZwyfJPnG4Q3nVJsLzEI2n0crkvC/QMWG
 xYpxB0bEcD86D/Nei6cFGF15CQvjZynndp5WD4qAH9TLepwW33XfQPDaQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="303282313"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="303282313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 22:20:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="690675641"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="690675641"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 22:20:34 -0700
Date: Wed, 28 Sep 2022 22:20:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 02/16] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Message-ID: <20220929052012.GG16345@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-3-niranjana.vishwanathapura@intel.com>
 <6243198e-8b93-2e45-8f49-cd6dd4e4c3a8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6243198e-8b93-2e45-8f49-cd6dd4e4c3a8@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 06:39:05PM +0100, Matthew Auld wrote:
>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>Add function __i915_sw_fence_await_reservation() for
>>asynchronous wait on a dma-resv object with specified
>>dma_resv_usage. This is required for async vma unbind
>>with vm_bind.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_sw_fence.c | 28 +++++++++++++++++++++-------
>>  drivers/gpu/drm/i915/i915_sw_fence.h | 23 +++++++++++++++++------
>>  2 files changed, 38 insertions(+), 13 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
>>index cc2a8821d22a..b7a10c374a08 100644
>>--- a/drivers/gpu/drm/i915/i915_sw_fence.c
>>+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>>@@ -7,7 +7,6 @@
>>  #include <linux/slab.h>
>>  #include <linux/dma-fence.h>
>>  #include <linux/irq_work.h>
>>-#include <linux/dma-resv.h>
>>  #include "i915_sw_fence.h"
>>  #include "i915_selftest.h"
>>@@ -569,11 +568,26 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>>  	return ret;
>>  }
>>-int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>-				    struct dma_resv *resv,
>>-				    bool write,
>>-				    unsigned long timeout,
>>-				    gfp_t gfp)
>>+/**
>>+ * __i915_sw_fence_await_reservation() - Setup a fence to wait on a dma-resv
>>+ * object with specified usage.
>>+ * @fence: the fence that needs to wait
>>+ * @resv: dma-resv object
>>+ * @usage: dma_resv_usage (See enum dma_resv_usage)
>>+ * @timeout: how long to wait in jiffies
>>+ * @gfp: allocation mode
>>+ *
>>+ * Setup the @fence to asynchronously wait on dma-resv object @resv for usage
>>+ * @usage to complete before signaling.
>
>s/usage @usage/@usage/ ?

Thanks for the review Matt.
Sure, will fix.

>
>>+ *
>>+ * Returns 0 if there is nothing to wait on, -ve upon error and >0 upon
>
>What does "-ve" mean btw?
>

-ve error code. Will update

Regards,
Niranjana

>Acked-by: Matthew Auld <matthew.auld@intel.com>
>
>>+ * successfully setting up the wait.
>>+ */
>>+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+				      struct dma_resv *resv,
>>+				      enum dma_resv_usage usage,
>>+				      unsigned long timeout,
>>+				      gfp_t gfp)
>>  {
>>  	struct dma_resv_iter cursor;
>>  	struct dma_fence *f;
>>@@ -582,7 +596,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>  	debug_fence_assert(fence);
>>  	might_sleep_if(gfpflags_allow_blocking(gfp));
>>-	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
>>+	dma_resv_iter_begin(&cursor, resv, usage);
>>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>>  		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>>  							gfp);
>>diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
>>index f752bfc7c6e1..9c4859dc4c0d 100644
>>--- a/drivers/gpu/drm/i915/i915_sw_fence.h
>>+++ b/drivers/gpu/drm/i915/i915_sw_fence.h
>>@@ -10,13 +10,13 @@
>>  #define _I915_SW_FENCE_H_
>>  #include <linux/dma-fence.h>
>>+#include <linux/dma-resv.h>
>>  #include <linux/gfp.h>
>>  #include <linux/kref.h>
>>  #include <linux/notifier.h> /* for NOTIFY_DONE */
>>  #include <linux/wait.h>
>>  struct completion;
>>-struct dma_resv;
>>  struct i915_sw_fence;
>>  enum i915_sw_fence_notify {
>>@@ -89,11 +89,22 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>>  				  unsigned long timeout,
>>  				  gfp_t gfp);
>>-int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>-				    struct dma_resv *resv,
>>-				    bool write,
>>-				    unsigned long timeout,
>>-				    gfp_t gfp);
>>+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+				      struct dma_resv *resv,
>>+				      enum dma_resv_usage usage,
>>+				      unsigned long timeout,
>>+				      gfp_t gfp);
>>+
>>+static inline int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+						  struct dma_resv *resv,
>>+						  bool write,
>>+						  unsigned long timeout,
>>+						  gfp_t gfp)
>>+{
>>+	return __i915_sw_fence_await_reservation(fence, resv,
>>+						 dma_resv_usage_rw(write),
>>+						 timeout, gfp);
>>+}
>>  bool i915_sw_fence_await(struct i915_sw_fence *fence);
>>  void i915_sw_fence_complete(struct i915_sw_fence *fence);
