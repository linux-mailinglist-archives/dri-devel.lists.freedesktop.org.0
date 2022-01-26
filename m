Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B449CC8B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 15:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A5110E5B6;
	Wed, 26 Jan 2022 14:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105910E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 14:42:24 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u15so26194791wrt.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jcLVaC3VPjo3uCEBy871vUEdLPGx+AdjTedEYJrQ4A4=;
 b=ZHhVStGI06nuOrarrKXNN4yGHUpUhBVN1XDSJkxmZ9Q/33dVFVSmidl+ikbSNvyzJG
 mWYIPwN+A8fFiHGzoTEI9o6BdaSA7NJsTGyC75ZDet+t6DfsRYI24d4a5ZEd3UgCwvl4
 NYLNhjFFy3RXvEiu2KuCQPr/obgC52v/4LLONxjtCcNAs2RFk9mj+o58YlyQehsJRCrl
 +HF4NMILkxpD1GoJzN3BuprtQDKVejO3RoZe8F3WzmPY6EeU5oUg4ZWB19VDJY8/Nhm9
 uOmfAUscLPZoJXpTBb5BubD8RcUVZbaCXpNUSs0IPIibLPlzc9+xn4bG4GZK7jlj9gfR
 LPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jcLVaC3VPjo3uCEBy871vUEdLPGx+AdjTedEYJrQ4A4=;
 b=5/3DRG/BKp4F6LICYAer71XCKF5SvJeOl1q03zqnJq1njcH+XzA8iJnGmfoIKRNWHf
 lOg+TgIr4MTIi6/u8rPl3+ZzDWhpecoOV/0Gsa8OUaRhHiFIhidIIH6yfPBnzMb22n5K
 L9hIRKBOFCQTEydWpxI1A8Rhn1rqVZwH6z4cDLUI/V4F8oe0YM26wE4KWpUboCgKs4qv
 vnY8euTh6tvnOSTDH03CE9g6alVb+qTjv9I7UQIDCsSpZifKY0lJBpN5lXBBeyV6fG4/
 fM7FqxGyljEt9sU2GpEB7YLPebJMSfOEPT5pMHAonISN5AvKKcVQAOA5LtdryybtcHOo
 JN0Q==
X-Gm-Message-State: AOAM530dw+ABFcLqk8X2fiAmMTEX8Of0YCJSAeB3tl6G5fvxWR6hRDnU
 eC7AmAM1Rf18enwbS44HabVML3WbJRM=
X-Google-Smtp-Source: ABdhPJxppRqf1X+OPd/Wz5i41bmofTgZQ1Wy+99FxGezjRNf/1icyz2B00BYbZIT1v7zL9SctoeB2Q==
X-Received: by 2002:a05:6000:188f:: with SMTP id
 a15mr6197118wri.16.1643208143103; 
 Wed, 26 Jan 2022 06:42:23 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:6cbd:23a3:7abe:f6e2?
 ([2a02:908:1252:fb60:6cbd:23a3:7abe:f6e2])
 by smtp.gmail.com with ESMTPSA id h8sm3734443wmq.26.2022.01.26.06.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 06:42:22 -0800 (PST)
Message-ID: <dceed78e-8693-4480-c732-1498c7eed24f@gmail.com>
Date: Wed, 26 Jan 2022 15:42:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/12] drm/ttm: add common accounting to the resource mgr
 v2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220124122514.1832-1-christian.koenig@amd.com>
 <20220124122514.1832-5-christian.koenig@amd.com>
 <YfAnUIRhBwj7WOJE@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YfAnUIRhBwj7WOJE@phenom.ffwll.local>
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
Cc: thomas.hellstrom@linux.intel.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.22 um 17:37 schrieb Daniel Vetter:
> On Mon, Jan 24, 2022 at 01:25:06PM +0100, Christian König wrote:
>> It makes sense to have this in the common manager for debugging and
>> accounting of how much resources are used.
>>
>> v2: cleanup kerneldoc a bit
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Huang Rui <ray.huang@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_resource.c |  8 ++++++++
>>   include/drm/ttm/ttm_resource.h     | 20 +++++++++++++++++++-
>>   2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
>> index 7fdd58b53c61..b8362492980d 100644
>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>> @@ -33,6 +33,8 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res)
>>   {
>> +	struct ttm_resource_manager *man;
>> +
>>   	res->start = 0;
>>   	res->num_pages = PFN_UP(bo->base.size);
>>   	res->mem_type = place->mem_type;
>> @@ -42,12 +44,16 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>>   	res->bus.is_iomem = false;
>>   	res->bus.caching = ttm_cached;
>>   	res->bo = bo;
>> +
>> +	man = ttm_manager_type(bo->bdev, place->mem_type);
>> +	atomic64_add(bo->base.size, &man->usage);
> Doing this with atomics doesn't make a lot of sense to me. Yes with the
> current organization it's the only thing to do in drivers, but if we move
> this into ttm there's no reason we can track this together with the lru,
> consistently with the lru, and under the same spinlock like the lru.
>
> And at least spot-checking a few places the very next thing we generally
> do is take the lru lock since there's really no other way to get the
> resource into or out of the resource manager.
>
> I think doing atomics for statistics when there's no need is not great,
> because then people start using atomics for all kinds of other things, and
> then get the barriers wrong. In i915 (simply due to the grotesque amount
> of buggy overuse of atomics, both atomic_t and atomic bitfields) we've put
> a hard block in place for any atomic addition. So that's why I'm a bit on
> a crusade, but I also genuinely don't see why we need them here. All they
> do is cost more since we have to take the spinlock anyway, the accounting
> is just going to be a slight different (and imo more accurate) place.
>
> Thoughts?

Well it depends. We have two use cases for those statistics:
1. Early abort when there isn't enough free resources.
2. Debugging

For the debugging it's completely irrelevant if we grab the lock or not, 
but for the early abort I'm not that sure.

Anyway I will just put that under the lock instead for now, if we really 
find that it is contended we could still switch back to an atomic.

Regards,
Christian.

>
> Cheers, Daniel
>
>>   }
>>   EXPORT_SYMBOL(ttm_resource_init);
>>   
>>   void ttm_resource_fini(struct ttm_resource_manager *man,
>>   		       struct ttm_resource *res)
>>   {
>> +	atomic64_sub(res->bo->base.size, &man->usage);
>>   }
>>   EXPORT_SYMBOL(ttm_resource_fini);
>>   
>> @@ -149,6 +155,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>>   	spin_lock_init(&man->move_lock);
>>   	man->bdev = bdev;
>>   	man->size = p_size;
>> +	atomic64_set(&man->usage, 0);
>>   
>>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>>   		INIT_LIST_HEAD(&man->lru[i]);
>> @@ -221,6 +228,7 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>>   	drm_printf(p, "  use_type: %d\n", man->use_type);
>>   	drm_printf(p, "  use_tt: %d\n", man->use_tt);
>>   	drm_printf(p, "  size: %llu\n", man->size);
>> +	drm_printf(p, "  usage: %llu\n", atomic64_read(&man->usage));
>>   	if (man->func->debug)
>>   		man->func->debug(man, p);
>>   }
>> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
>> index 69eea9d6399b..3d391279b33f 100644
>> --- a/include/drm/ttm/ttm_resource.h
>> +++ b/include/drm/ttm/ttm_resource.h
>> @@ -27,6 +27,7 @@
>>   
>>   #include <linux/types.h>
>>   #include <linux/mutex.h>
>> +#include <linux/atomic.h>
>>   #include <linux/dma-buf-map.h>
>>   #include <linux/dma-fence.h>
>>   #include <drm/drm_print.h>
>> @@ -132,8 +133,12 @@ struct ttm_resource_manager {
>>   	/*
>>   	 * Protected by the global->lru_lock.
>>   	 */
>> -
>>   	struct list_head lru[TTM_MAX_BO_PRIORITY];
>> +
>> +	/**
>> +	 * @usage: How much of the region is used, has its own protection.
>> +	 */
>> +	atomic64_t usage;
>>   };
>>   
>>   /**
>> @@ -261,6 +266,19 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>>   	man->move = NULL;
>>   }
>>   
>> +/**
>> + * ttm_resource_manager_usage
>> + *
>> + * @man: A memory manager object.
>> + *
>> + * Return how many resources are currently used.
>> + */
>> +static inline uint64_t
>> +ttm_resource_manager_usage(struct ttm_resource_manager *man)
>> +{
>> +	return atomic64_read(&man->usage);
>> +}
>> +
>>   void ttm_resource_init(struct ttm_buffer_object *bo,
>>                          const struct ttm_place *place,
>>                          struct ttm_resource *res);
>> -- 
>> 2.25.1
>>

