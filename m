Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD545C05A9
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 19:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04D510E1CA;
	Wed, 21 Sep 2022 17:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F3210E364;
 Wed, 21 Sep 2022 17:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663782658; x=1695318658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PDKW79EjVqYF1ZGR6dfRKzakMjBubkyhFaOnutk7X/w=;
 b=aoMyxwozofTXnD9hs4aMa0s3N/eBGxZHSW2zif0JkrETicz+7+Qogj9l
 CEZKE1295B2y30ko4mGLEKPxqLZvs+0zDE39qZVzQOO1CSXhCveMEG9X8
 c2dtWcYfwPZv6dL6F2oy7QC8sLKXmQbtE6RECfyeSAI9t6VvzxTWwjnvH
 9kqkhvYDgRlA7wMobDsL54vfD3TbIEDTryTjWv9zlLhx60x32+JD+14+W
 5+NQUdt2MPUktOzhRsHg+K2tspIsVnBFBtLikqX6IU+mwvQ/xOfkpdiAC
 cA+kVOkDZue1EztEmSKo35BN9O2KStpUAY3A4mOMbq9mHGCaM2uFprIii g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="287152102"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="287152102"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 10:47:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="570641868"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 10:47:57 -0700
Date: Wed, 21 Sep 2022 10:47:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v4 02/14] drm/i915/vm_bind: Add
 __i915_sw_fence_await_reservation()
Message-ID: <20220921174735.GC28263@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-3-niranjana.vishwanathapura@intel.com>
 <e3e2ebd8-7886-c040-fc56-2be3478fb1dc@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e3e2ebd8-7886-c040-fc56-2be3478fb1dc@linux.intel.com>
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 21, 2022 at 10:06:48AM +0100, Tvrtko Ursulin wrote:
>
>On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>Add function __i915_sw_fence_await_reservation() for
>>asynchronous wait on a dma-resv object with specified
>>dma_resv_usage. This is required for async vma unbind
>>with vm_bind.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/i915/i915_sw_fence.c | 25 ++++++++++++++++++-------
>>  drivers/gpu/drm/i915/i915_sw_fence.h |  7 ++++++-
>>  2 files changed, 24 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
>>index 6fc0d1b89690..0ce8f4efc1ed 100644
>>--- a/drivers/gpu/drm/i915/i915_sw_fence.c
>>+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
>>@@ -569,12 +569,11 @@ int __i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>>  	return ret;
>>  }
>>-int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>-				    struct dma_resv *resv,
>>-				    const struct dma_fence_ops *exclude,
>>-				    bool write,
>>-				    unsigned long timeout,
>>-				    gfp_t gfp)
>>+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+				      struct dma_resv *resv,
>>+				      enum dma_resv_usage usage,
>>+				      unsigned long timeout,
>>+				      gfp_t gfp)
>>  {
>>  	struct dma_resv_iter cursor;
>>  	struct dma_fence *f;
>>@@ -583,7 +582,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>  	debug_fence_assert(fence);
>>  	might_sleep_if(gfpflags_allow_blocking(gfp));
>>-	dma_resv_iter_begin(&cursor, resv, dma_resv_usage_rw(write));
>>+	dma_resv_iter_begin(&cursor, resv, usage);
>>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>>  		pending = i915_sw_fence_await_dma_fence(fence, f, timeout,
>>  							gfp);
>>@@ -598,6 +597,18 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>  	return ret;
>>  }
>>+int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+				    struct dma_resv *resv,
>>+				    const struct dma_fence_ops *exclude,
>>+				    bool write,
>>+				    unsigned long timeout,
>>+				    gfp_t gfp)
>>+{
>>+	return __i915_sw_fence_await_reservation(fence, resv,
>>+						 dma_resv_usage_rw(write),
>>+						 timeout, gfp);
>>+}
>
>Drive by observation - it looked dodgy that you create a wrapper here 
>which ignores one function parameter.
>
>On a more detailed look it seems no callers actually use exclude and 
>it's even unused inside this function since 1b5bdf071e62 ("drm/i915: 
>use the new iterator in i915_sw_fence_await_reservation v3").
>
>So a cleanup patch before this one?
>

Thanks Tvrtko.
Yah, I noticed it, but did not want to fix that here.
Sure, will post a patch beforehand to fix that.

Niranjana

>Regards,
>
>Tvrtko
>
>
>>+
>>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>  #include "selftests/lib_sw_fence.c"
>>  #include "selftests/i915_sw_fence.c"
>>diff --git a/drivers/gpu/drm/i915/i915_sw_fence.h b/drivers/gpu/drm/i915/i915_sw_fence.h
>>index 619fc5a22f0c..3cf4b6e16f35 100644
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
>>@@ -89,6 +89,11 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
>>  				  unsigned long timeout,
>>  				  gfp_t gfp);
>>+int __i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>+				      struct dma_resv *resv,
>>+				      enum dma_resv_usage usage,
>>+				      unsigned long timeout,
>>+				      gfp_t gfp);
>>  int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
>>  				    struct dma_resv *resv,
>>  				    const struct dma_fence_ops *exclude,
