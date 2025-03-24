Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0F4A6E5EF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 22:56:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B1710E052;
	Mon, 24 Mar 2025 21:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qZGD2i10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D4F10E052
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2JGWvL0vXH+SaWW7fiVS4f/eI8WnmgB9TPgdmmNfoEU=; b=qZGD2i10vlz8euvIvm5KZgq09A
 oRUAFQPYKsVTIBYFXSkw4Q++j1qjXvsvhiW18KOYIwZV1B8YM9SovUSq5Ee2xxuh1IpaJY3qTTpte
 OGP4Agt1KRTsCjUideRmXh+aPMR0kPGKLiubryTecJ+a06s8UZWZqdBHbAF9TZidbsuuiZXJVdUb7
 t7sTpMnT5ZrAvV+hGL6fgO9QmFslpm82qthBE9ICNcOaNeroBqJ2RSr5WMuuXWEejCkCM12SlJ8yO
 8OBf+IPIJSSJoCZGuuJ5N6fAZWUMDakRI5Cebgn8e6dEpF9NZHsuRF6NW1V9za7RoLJZdPq8NxQLI
 MSvxGnGA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1twplw-005tqr-O0; Mon, 24 Mar 2025 22:55:53 +0100
Message-ID: <b808e489-805e-47d3-90b5-758f8583d2d0@igalia.com>
Date: Mon, 24 Mar 2025 18:55:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] drm/syncobj: Do not allocate an array to store zeros
 when waiting
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-3-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250318155424.78552-3-tvrtko.ursulin@igalia.com>
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

On 18/03/25 12:54, Tvrtko Ursulin wrote:
> When waiting on syncobjs the current code allocates a temporary array only
> to fill it up with all zeros.
> 
> We can avoid that by relying on the allocated entry array already being
> zero allocated.
> 
> For the timeline mode we can fetch the timeline point values as we
> populate the entries array so also do not need this additional temporary
> allocation.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/drm_syncobj.c | 39 ++++++++++++++---------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index d0d60c331df8..fd5ba6c89666 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1028,7 +1028,7 @@ static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
>   }
>   
>   static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
> -						  void __user *user_points,
> +						  u64 __user *user_points,
>   						  uint32_t count,
>   						  uint32_t flags,
>   						  signed long timeout,
> @@ -1036,9 +1036,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   						  ktime_t *deadline)
>   {
>   	struct syncobj_wait_entry *entries;
> -	struct dma_fence *fence;
> -	uint64_t *points;
>   	uint32_t signaled_count, i;
> +	struct dma_fence *fence;
>   
>   	if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>   		     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
> @@ -1046,24 +1045,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   		lockdep_assert_none_held_once();
>   	}
>   
> -	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
> -	if (points == NULL)
> -		return -ENOMEM;
> -
> -	if (!user_points) {
> -		memset(points, 0, count * sizeof(uint64_t));
> -
> -	} else if (copy_from_user(points, user_points,
> -				  sizeof(uint64_t) * count)) {
> -		timeout = -EFAULT;
> -		goto err_free_points;
> -	}
> +	if (user_points &&
> +	    !access_ok(user_points, count * sizeof(*user_points)))
> +		return -EFAULT;
>   
>   	entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
> -	if (!entries) {
> -		timeout = -ENOMEM;
> -		goto err_free_points;
> -	}
> +	if (!entries)
> +		return -ENOMEM;
> +
>   	/* Walk the list of sync objects and initialize entries.  We do
>   	 * this up-front so that we can properly return -EINVAL if there is
>   	 * a syncobj with a missing fence and then never have the chance of
> @@ -1074,9 +1063,14 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   		struct dma_fence *fence;
>   
>   		entries[i].task = current;
> -		entries[i].point = points[i];
> +		if (user_points &&
> +		    __get_user(entries[i].point, user_points++)) {
> +			timeout = -EFAULT;
> +			goto cleanup_entries;
> +		}
>   		fence = drm_syncobj_fence_get(syncobjs[i]);
> -		if (!fence || dma_fence_chain_find_seqno(&fence, points[i])) {
> +		if (!fence ||
> +		    dma_fence_chain_find_seqno(&fence, entries[i].point)) {
>   			dma_fence_put(fence);
>   			if (flags & (DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
>   				     DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE)) {
> @@ -1182,9 +1176,6 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>   	}
>   	kfree(entries);
>   
> -err_free_points:
> -	kfree(points);
> -
>   	return timeout;
>   }
>   

