Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF9A42D541
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 10:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B4B6EC2E;
	Thu, 14 Oct 2021 08:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2D36EC2E;
 Thu, 14 Oct 2021 08:37:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227528763"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="227528763"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 01:37:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="524981280"
Received: from ebarkhuy-mobl2.ger.corp.intel.com (HELO [10.213.193.241])
 ([10.213.193.241])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 01:37:49 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Use dma_resv_iter for waiting in
 i915_gem_object_wait_reservation.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211013104123.1877827-1-maarten.lankhorst@linux.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8625e3ca-57f8-e387-1742-808e3599786f@linux.intel.com>
Date: Thu, 14 Oct 2021 09:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013104123.1877827-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


On 13/10/2021 11:41, Maarten Lankhorst wrote:
> No memory should be allocated when calling i915_gem_object_wait,
> because it may be called to idle a BO when evicting memory.
> 
> Fix this by using dma_resv_iter helpers to call
> i915_gem_object_wait_fence() on each fence, which cleans up the code a lot.
> Also remove dma_resv_prune, it's questionably.
> 
> This will result in the following lockdep splat.

<snip>

> @@ -37,56 +36,17 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>   				 unsigned int flags,
>   				 long timeout)
>   {
> -	struct dma_fence *excl;
> -	bool prune_fences = false;
> -
> -	if (flags & I915_WAIT_ALL) {
> -		struct dma_fence **shared;
> -		unsigned int count, i;
> -		int ret;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>   
> -		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
> -		if (ret)
> -			return ret;
> -
> -		for (i = 0; i < count; i++) {
> -			timeout = i915_gem_object_wait_fence(shared[i],
> -							     flags, timeout);
> -			if (timeout < 0)
> -				break;
> +	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>   
> -			dma_fence_put(shared[i]);
> -		}
> -
> -		for (; i < count; i++)
> -			dma_fence_put(shared[i]);
> -		kfree(shared);
> -
> -		/*
> -		 * If both shared fences and an exclusive fence exist,
> -		 * then by construction the shared fences must be later
> -		 * than the exclusive fence. If we successfully wait for
> -		 * all the shared fences, we know that the exclusive fence
> -		 * must all be signaled. If all the shared fences are
> -		 * signaled, we can prune the array and recover the
> -		 * floating references on the fences/requests.
> -		 */
> -		prune_fences = count && timeout >= 0;
> -	} else {
> -		excl = dma_resv_get_excl_unlocked(resv);
> +		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
> +		if (timeout <= 0)
> +			break;

You have another change in behaviour here, well a bug really. When 
userspace passes in zero timeout you fail to report activity in other 
than the first fence.

Regards,

Tvrtko
