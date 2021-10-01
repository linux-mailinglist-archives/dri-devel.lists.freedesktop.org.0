Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C5F41EB09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34C46EDD8;
	Fri,  1 Oct 2021 10:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54856ED93;
 Fri,  1 Oct 2021 10:37:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="222196517"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="222196517"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 03:37:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="619007698"
Received: from howells-mobl.ger.corp.intel.com (HELO [10.213.208.92])
 ([10.213.208.92])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 03:37:40 -0700
Subject: Re: [PATCH 17/28] drm/i915: use the new iterator in
 i915_gem_busy_ioctl v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
References: <20211001100610.2899-1-christian.koenig@amd.com>
 <20211001100610.2899-18-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c6837f74-0ba5-e3c2-5778-a9d120c6ea67@linux.intel.com>
Date: Fri, 1 Oct 2021 11:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001100610.2899-18-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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


On 01/10/2021 11:05, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled else where.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Sorry I retract until you add the text about the increased cost of the 
added atomics. I think the point is important to discuss given proposal 
goes from zero atomics to num_fences * 2 (fence get/put unless I am 
mistaken) atomics per busy ioctl. That makes me lean towards just 
leaving this as is since it is not that complex.

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
>   1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..dc72b36dae54 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_i915_gem_busy *args = data;
>   	struct drm_i915_gem_object *obj;
> -	struct dma_resv_list *list;
> -	unsigned int seq;
> +	struct dma_resv_iter cursor;
> +	struct dma_fence *fence;
>   	int err;
>   
>   	err = -ENOENT;
> @@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   	 * to report the overall busyness. This is what the wait-ioctl does.
>   	 *
>   	 */
> -retry:
> -	seq = raw_read_seqcount(&obj->base.resv->seq);
> -
> -	/* Translate the exclusive fence to the READ *and* WRITE engine */
> -	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
> -
> -	/* Translate shared fences to READ set of engines */
> -	list = dma_resv_shared_list(obj->base.resv);
> -	if (list) {
> -		unsigned int shared_count = list->shared_count, i;
> -
> -		for (i = 0; i < shared_count; ++i) {
> -			struct dma_fence *fence =
> -				rcu_dereference(list->shared[i]);
> -
> +	args->busy = 0;
> +	dma_resv_iter_begin(&cursor, obj->base.resv, true);
> +	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> +		if (dma_resv_iter_is_restarted(&cursor))
> +			args->busy = 0;
> +
> +		if (dma_resv_iter_is_exclusive(&cursor))
> +			/* Translate the exclusive fence to the READ *and* WRITE engine */
> +			args->busy |= busy_check_writer(fence);
> +		else
> +			/* Translate shared fences to READ set of engines */
>   			args->busy |= busy_check_reader(fence);
> -		}
>   	}
> -
> -	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> -		goto retry;
> +	dma_resv_iter_end(&cursor);
>   
>   	err = 0;
>   out:
> 
