Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5489440AEC1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E1F89E7C;
	Tue, 14 Sep 2021 13:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEFE89E7C;
 Tue, 14 Sep 2021 13:18:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="307540613"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="307540613"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 06:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="544067834"
Received: from ocascan-mobl.ger.corp.intel.com (HELO [10.213.234.116])
 ([10.213.234.116])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 06:18:14 -0700
Subject: Re: [Intel-gfx] [PATCH 13/26] drm/i915: use the new iterator in
 i915_gem_busy_ioctl
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org
References: <20210913131707.45639-1-christian.koenig@amd.com>
 <20210913131707.45639-14-christian.koenig@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7d5d6454-2d74-53e7-73ea-2d0d60b3c44c@linux.intel.com>
Date: Tue, 14 Sep 2021 14:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913131707.45639-14-christian.koenig@amd.com>
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


On 13/09/2021 14:16, Christian König wrote:
> This makes the function much simpler since the complex
> retry logic is now handled else where.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
>   1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> index 6234e17259c1..c6c6d747b33e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
> @@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
>   {
>   	struct drm_i915_gem_busy *args = data;
>   	struct drm_i915_gem_object *obj;
> -	struct dma_resv_list *list;
> -	unsigned int seq;
> +	struct dma_resv_cursor cursor;
> +	struct dma_fence *fence;
>   	int err;
>   
>   	err = -ENOENT;
> @@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
> +	args->busy = false;
> +	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {

To preserve strictly identical behaviour, I think add before the below 
if-else:

	if (cursor.is_first)
		args->busy = 0;

As mentioned elsewhere in the thread I am not convinced it is hugely 
important, all that can happen without it is that stale read activity 
gets reported, and this ioctl is not really that sensitive to that.

Regards,

Tvrtko

> +		if (cursor.is_exclusive)
> +			/* Translate the exclusive fence to the READ *and* WRITE engine */
> +			args->busy = busy_check_writer(fence);
> +		else
> +			/* Translate shared fences to READ set of engines */
>   			args->busy |= busy_check_reader(fence);
> -		}
>   	}
>   
> -	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
> -		goto retry;
> -
>   	err = 0;
>   out:
>   	rcu_read_unlock();
> 
