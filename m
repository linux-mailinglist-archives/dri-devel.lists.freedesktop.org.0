Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED461A73389
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 14:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A44610E8D8;
	Thu, 27 Mar 2025 13:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h/8X69cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2910E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vVBtdpirSdW1qSQo8SV51ORw9M5zOSbn7/yyGWrqvhM=; b=h/8X69cgn/niCnMURz/7zHse2p
 gN4sI+WrgErf1pnvUTTVz3pbxafPzq+SsIe+369ndLdxJu9SGEeAdVxTN5yVr+Khg5RAfblLWwKS0
 DgHlOgW/Pp8GN6eOCOPx58/vUykXBf1T4jQbbv0mMBvAhCjtbQ7i9YjRTCFbpSBab7DiF7ylNz2IY
 xljdpT2jmAngkw9ij3hANq68RWK9GxaNyKRhWXAfY604gLduJtofAvLji2NDQRGZNJ0kXTUl5xgb5
 ixy66/66+5hU7n5hOxTa1VDozkDPmNw4xxgzCjYvONxZ9Ac2dAFWkcyMvDfNm/ndKfjTGJcX0D+Qz
 YcT2enKw==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1txnYJ-007FK6-Cc; Thu, 27 Mar 2025 14:45:47 +0100
Message-ID: <978a5c93-0d95-4718-9ba0-afa762bda32f@igalia.com>
Date: Thu, 27 Mar 2025 10:45:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
 <20250327084215.26662-8-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250327084215.26662-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Tvrtko,

On 27/03/25 05:42, Tvrtko Ursulin wrote:
> Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
> is relatively hot, but the 97% of the calls are for a single object. (~3%
> for two points, and never more than three points. While a more trivial
> workload like vkmark under Plasma is even more skewed to single point
> lookups.)
> 
> Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
> pre-allocated stack array for those cases.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> ---
> v2:
>   * Added comments describing how the fast path arrays were sized.
>   * Make container freeing criteria clearer by using a boolean.
> ---
>   drivers/gpu/drm/drm_syncobj.c | 71 ++++++++++++++++++++++++++---------
>   1 file changed, 53 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index b906d6acb4ef..d5b99bfea9a5 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -236,6 +236,14 @@ static void
>   syncobj_eventfd_entry_func(struct drm_syncobj *syncobj,
>   			   struct syncobj_eventfd_entry *entry);
>   
> +/*
> + * Empirically vast majority of ioctls pass in a single syncobj (96%) and never
> + * more than three points. Therefore implement a fast path with a small stack
> + * array to avoid going into the allocator sometimes several times per
> + * userspace rendered frame.
> + */
> +#define DRM_SYNCOBJ_FAST_PATH_ENTRIES 4
> +
>   /**
>    * drm_syncobj_find - lookup and reference a sync object.
>    * @file_private: drm file private pointer
> @@ -1035,12 +1043,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  uint32_t *idx,
>   						  ktime_t *deadline)
>   {
> -	/*
> -	 * Empirically vast majority of calls here works with just a single
> -	 * point (96%) and never more than three points. Therefore a small stack
> -	 * array can cheaply avoid multiple per frame allocations.
> -	 */
> -	struct syncobj_wait_entry stack_entries[4];
> +	struct syncobj_wait_entry stack_entries[DRM_SYNCOBJ_FAST_PATH_ENTRIES];

Could you introduce this change in 6/7 to avoid changing the lines you
introduced earlier?

Best Regards,
- Maíra

>   	struct syncobj_wait_entry *entries;
>   	uint32_t signaled_count, i;
>   	struct dma_fence *fence;
> @@ -1228,6 +1231,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>   static int drm_syncobj_array_find(struct drm_file *file_private,
>   				  u32 __user *handles,
>   				  uint32_t count,
> +				  struct drm_syncobj **stack_syncobjs,
> +				  u32 stack_count,
>   				  struct drm_syncobj ***syncobjs_out)
>   {
>   	struct drm_syncobj **syncobjs;
> @@ -1237,9 +1242,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>   	if (!access_ok(handles, count * sizeof(*handles)))
>   		return -EFAULT;
>   
> -	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
> -	if (!syncobjs)
> -		return -ENOMEM;
> +	if (count > stack_count) {
> +		syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
> +		if (!syncobjs)
> +			return -ENOMEM;
> +	} else {
> +		syncobjs = stack_syncobjs;
> +	}
>   
>   	for (i = 0; i < count; i++) {
>   		u32 handle;
> @@ -1261,25 +1270,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>   err_put_syncobjs:
>   	while (i-- > 0)
>   		drm_syncobj_put(syncobjs[i]);
> -	kfree(syncobjs);
> +
> +	if (syncobjs != stack_syncobjs)
> +		kfree(syncobjs);
>   
>   	return ret;
>   }
>   
>   static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
> -				   uint32_t count)
> +				   uint32_t count,
> +				   bool free_container)
>   {
>   	uint32_t i;
>   
>   	for (i = 0; i < count; i++)
>   		drm_syncobj_put(syncobjs[i]);
> -	kfree(syncobjs);
> +
> +	if (free_container)
> +		kfree(syncobjs);
>   }
>   
>   int
>   drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   		       struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_wait *args = data;
>   	ktime_t deadline, *pdeadline = NULL;
>   	u32 count = args->count_handles;
> @@ -1305,6 +1320,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1323,7 +1340,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>   						 &first,
>   						 pdeadline);
>   
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>   
>   	if (timeout < 0)
>   		return timeout;
> @@ -1337,6 +1354,7 @@ int
>   drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   				struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_timeline_wait *args = data;
>   	ktime_t deadline, *pdeadline = NULL;
>   	u32 count = args->count_handles;
> @@ -1363,6 +1381,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1381,7 +1401,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>   						 &first,
>   						 pdeadline);
>   
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>   
>   	if (timeout < 0)
>   		return timeout;
> @@ -1498,6 +1518,7 @@ int
>   drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_array *args = data;
>   	struct drm_syncobj **syncobjs;
>   	uint32_t i;
> @@ -1515,6 +1536,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1522,7 +1545,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>   	for (i = 0; i < args->count_handles; i++)
>   		drm_syncobj_replace_fence(syncobjs[i], NULL);
>   
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>   
>   	return 0;
>   }
> @@ -1531,6 +1555,7 @@ int
>   drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>   			 struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_array *args = data;
>   	struct drm_syncobj **syncobjs;
>   	uint32_t i;
> @@ -1548,6 +1573,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1558,7 +1585,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>   			break;
>   	}
>   
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>   
>   	return ret;
>   }
> @@ -1567,6 +1595,7 @@ int
>   drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>   				  struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_timeline_array *args = data;
>   	uint64_t __user *points = u64_to_user_ptr(args->points);
>   	uint32_t i, j, count = args->count_handles;
> @@ -1589,6 +1618,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1625,7 +1656,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>   err_chains:
>   	kfree(chains);
>   out:
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>   
>   	return ret;
>   }
> @@ -1633,6 +1664,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>   int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   			    struct drm_file *file_private)
>   {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>   	struct drm_syncobj_timeline_array *args = data;
>   	struct drm_syncobj **syncobjs;
>   	uint64_t __user *points = u64_to_user_ptr(args->points);
> @@ -1654,6 +1686,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   	ret = drm_syncobj_array_find(file_private,
>   				     u64_to_user_ptr(args->handles),
>   				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>   				     &syncobjs);
>   	if (ret < 0)
>   		return ret;
> @@ -1697,7 +1731,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>   			break;
>   		}
>   	}
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>   
>   	return ret;
>   }

