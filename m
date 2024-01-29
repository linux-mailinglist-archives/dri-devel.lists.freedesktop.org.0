Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A683FE17
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 07:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE6010E0E9;
	Mon, 29 Jan 2024 06:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B1910E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 06:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706508968;
 bh=ZTRAQPizsuDaDB704cMaGR0jC3v4EKlb2fc5KqoZnRA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NQuUlufi/TX/RTmiEw01CDKnpDJyYG5dIuFQiZj15FSKDSagRdaYSz3Y29v/O5JEZ
 9RA7GcoJVZtZ7fZCIhqIIDglF1I5sdcymHh9swnoX6hSpndO836Z1JtPsf6ljuFOuj
 zwmJ/mahSt+Hrl9+1jVG26QQ2Q78jkgsPFSXwL4Xp0cG4rEYWjmyjiaZAT30JbD5Bt
 kQi8k8afJm/cQGdSxmoV07/j9Ze89CwKYDUr+zoBd/+4BlMMV90QLk7/FcyR7bHqJv
 tA/GgX6iCBwd1WU6oR0zHJvoaQqUZYVh8yiUw2MfyisySSozoiee0CF/oqkri5rMsy
 RdIV/Oq1M+m8A==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 77F71378107D;
 Mon, 29 Jan 2024 06:16:07 +0000 (UTC)
Message-ID: <ea74a26d-d97f-4d09-bc24-67484ee45b76@collabora.com>
Date: Mon, 29 Jan 2024 09:16:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 22/30] drm/shmem-helper: Add common memory shrinker
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-23-dmitry.osipenko@collabora.com>
 <20240125111946.797a1e1e@collabora.com>
 <f4870543-e7f8-4ee6-924a-68ec7c25b293@collabora.com>
 <20240126105537.67b1613e@collabora.com>
 <fab38fed-635c-4dbe-aa13-dcdf8f267988@collabora.com>
 <20240126191230.0ee6f99f@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240126191230.0ee6f99f@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/24 21:12, Boris Brezillon wrote:
> On Fri, 26 Jan 2024 19:27:49 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 1/26/24 12:55, Boris Brezillon wrote:
>>> On Fri, 26 Jan 2024 00:56:47 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>   
>>>> On 1/25/24 13:19, Boris Brezillon wrote:  
>>>>> On Fri,  5 Jan 2024 21:46:16 +0300
>>>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>>>     
>>>>>> +static bool drm_gem_shmem_is_evictable(struct drm_gem_shmem_object *shmem)
>>>>>> +{
>>>>>> +	return (shmem->madv >= 0) && shmem->base.funcs->evict &&
>>>>>> +		refcount_read(&shmem->pages_use_count) &&
>>>>>> +		!refcount_read(&shmem->pages_pin_count) &&
>>>>>> +		!shmem->base.dma_buf && !shmem->base.import_attach &&
>>>>>> +		!shmem->evicted;    
>>>>>
>>>>> Are we missing
>>>>>
>>>>>                 && dma_resv_test_signaled(shmem->base.resv,
>>>>> 					  DMA_RESV_USAGE_BOOKKEEP)
>>>>>
>>>>> to make sure the GPU is done using the BO?
>>>>> The same applies to drm_gem_shmem_is_purgeable() BTW.
>>>>>
>>>>> If you don't want to do this test here, we need a way to let drivers
>>>>> provide a custom is_{evictable,purgeable}() test.
>>>>>
>>>>> I guess we should also expose drm_gem_shmem_shrinker_update_lru_locked()
>>>>> to let drivers move the GEMs that were used most recently (those
>>>>> referenced by a GPU job) at the end of the evictable LRU.    
>>>>
>>>> We have the signaled-check in the common drm_gem_evict() helper:
>>>>
>>>> https://elixir.bootlin.com/linux/v6.8-rc1/source/drivers/gpu/drm/drm_gem.c#L1496  
>>>
>>> Ah, indeed. I'll need DMA_RESV_USAGE_BOOKKEEP instead of
>>> DMA_RESV_USAGE_READ in panthor, but I can add it in the driver specific  
>>> ->evict() hook (though that means calling dma_resv_test_signaled()  
>>> twice, which is not great, oh well).  
>>
>> Maybe we should change drm_gem_evict() to use BOOKKEEP. The
>> test_signaled(BOOKKEEP) should be a "stronger" check than
>> test_signaled(READ)?
> 
> It is, just wondering if some users have a good reason to want
> READ here.
> 
>>
>>> The problem about the evictable LRU remains though: we need a way to let
>>> drivers put their BOs at the end of the list when the BO has been used
>>> by the GPU, don't we?  
>>
>> If BO is use, then it won't be evicted, while idling BOs will be
>> evicted. Hence, the used BOs will be naturally moved down the LRU list
>> each time shrinker is invoked.
>>
> 
> That only do the trick if the BOs being used most often are busy when
> the shrinker kicks in though. Let's take this scenario:
> 
> 
> BO 1					BO 2					shinker
> 
> 					busy
> 					idle (first-pos-in-evictable-LRU)
> 
> busy
> idle (second-pos-in-evictable-LRU)
> 
> 					busy
> 					idle
> 
> 					busy
> 					idle
> 
> 					busy
> 					idle
> 
> 										find a BO to evict
> 										pick BO 2
> 
> 					busy (swapin)
> 					idle
> 
> If the LRU had been updated at each busy event, BO 1 should have
> been picked for eviction. But we evicted the BO that was first
> recorded idle instead of the one that was least recently
> recorded busy.

You have to swapin(BO) every time BO goes to busy state, and swapin does drm_gem_lru_move_tail(BO). Hence, each time BO goes idle->busy, it's moved down the LRU list.

For example, please see patch #29 where virtio-gpu invokes swapin for each job's BO in the submit()->virtio_gpu_array_prepare() code path.

-- 
Best regards,
Dmitry

