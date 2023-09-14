Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13C7A04BE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4610E27A;
	Thu, 14 Sep 2023 13:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805210E273
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:01:43 +0000 (UTC)
Received: from [192.168.2.134] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA1766607343;
 Thu, 14 Sep 2023 14:01:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694696502;
 bh=v7DarGRquMfyLEjGWgeGuwbNfFGcYNditgZ8c3FOQkc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MuOydnq9IblIDeVrXJoWXbCc90YL4c+0X+qvYlSpCQSNtCHdfkykV9fyMKZ1v7osv
 9r0arWbahiqks3T9c/BmCN9p22Q7YYbf/dzdTApio/+o3PMEBora1NYlTMA40yUVRx
 1ipiGfyY9Evi7G7X2sXiahvygnSAug+BskUIgUv85lIk9F1erwyL0NYKrkk1T3TUGu
 ll8RQ9toWpzZ4WmNy2tHwLiJZqlUGbJiF3svdASEI4JeiftdBMwLeZNfcE3evFplEx
 0MCNIrbj5vIC/R+UjT0403wA2dCudHcG4ZK+W837YV5ImNkP2R3HW6qlbipmqpVXRe
 B/Lz+QTRBjkew==
Message-ID: <ca7e905b-2809-fce4-1b56-7909efb1a229@collabora.com>
Date: Thu, 14 Sep 2023 16:01:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v16 15/20] drm/shmem-helper: Add memory shrinker
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-16-dmitry.osipenko@collabora.com>
 <20230905100306.3564e729@collabora.com>
 <26f7ba6d-3520-0311-35e2-ef5706a98232@collabora.com>
 <20230913094832.3317c2df@collabora.com>
 <aa270715-89ae-2aac-e2e3-018c21e1ff0e@collabora.com>
 <20230914093626.19692c24@collabora.com>
 <21dda0bd-4264-b480-dbbc-29a7744bc96c@collabora.com>
 <20230914102737.08e61498@collabora.com>
 <a89cc9c1-5054-e45f-edec-819fdbfef2b5@collabora.com>
 <20230914135840.5e0e11fe@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230914135840.5e0e11fe@collabora.com>
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/14/23 14:58, Boris Brezillon wrote:
> On Thu, 14 Sep 2023 14:36:23 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> On 9/14/23 11:27, Boris Brezillon wrote:
>>> On Thu, 14 Sep 2023 10:50:32 +0300
>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>   
>>>> On 9/14/23 10:36, Boris Brezillon wrote:  
>>>>> On Thu, 14 Sep 2023 07:02:52 +0300
>>>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>>>     
>>>>>> On 9/13/23 10:48, Boris Brezillon wrote:    
>>>>>>> On Wed, 13 Sep 2023 03:56:14 +0300
>>>>>>> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
>>>>>>>       
>>>>>>>> On 9/5/23 11:03, Boris Brezillon wrote:      
>>>>>>>>>>                * But
>>>>>>>>>> +		 * acquiring the obj lock in drm_gem_shmem_release_pages_locked() can
>>>>>>>>>> +		 * cause a locking order inversion between reservation_ww_class_mutex
>>>>>>>>>> +		 * and fs_reclaim.
>>>>>>>>>> +		 *
>>>>>>>>>> +		 * This deadlock is not actually possible, because no one should
>>>>>>>>>> +		 * be already holding the lock when drm_gem_shmem_free() is called.
>>>>>>>>>> +		 * Unfortunately lockdep is not aware of this detail.  So when the
>>>>>>>>>> +		 * refcount drops to zero, don't touch the reservation lock.
>>>>>>>>>> +		 */
>>>>>>>>>> +		if (shmem->got_pages_sgt &&
>>>>>>>>>> +		    refcount_dec_and_test(&shmem->pages_use_count)) {
>>>>>>>>>> +			drm_gem_shmem_do_release_pages_locked(shmem);
>>>>>>>>>> +			shmem->got_pages_sgt = false;
>>>>>>>>>>  		}        
>>>>>>>>> Leaking memory is the right thing to do if pages_use_count > 1 (it's
>>>>>>>>> better to leak than having someone access memory it no longer owns), but
>>>>>>>>> I think it's worth mentioning in the above comment.        
>>>>>>>>
>>>>>>>> It's unlikely that it will be only a leak without a following up
>>>>>>>> use-after-free. Neither is acceptable.      
>>>>>>>
>>>>>>> Not necessarily, if you have a page leak, it could be that the GPU has
>>>>>>> access to those pages, but doesn't need the GEM object anymore
>>>>>>> (pages are mapped by the iommu, which doesn't need shmem->sgt or
>>>>>>> shmem->pages after the mapping is created). Without a WARN_ON(), this
>>>>>>> can go unnoticed and lead to memory corruptions/information leaks.
>>>>>>>       
>>>>>>>>
>>>>>>>> The drm_gem_shmem_free() could be changed such that kernel won't blow up
>>>>>>>> on a refcnt bug, but that's not worthwhile doing because drivers
>>>>>>>> shouldn't have silly bugs.      
>>>>>>>
>>>>>>> We definitely don't want to fix that, but we want to complain loudly
>>>>>>> (WARN_ON()), and make sure the risk is limited (preventing memory from
>>>>>>> being re-assigned to someone else by not freeing it).      
>>>>>>
>>>>>> That's what the code did and continues to do here. Not exactly sure what
>>>>>> you're trying to say. I'm going to relocate the comment in v17 to
>>>>>> put_pages(), we can continue discussing it there if I'm missing yours point.
>>>>>>    
>>>>>
>>>>> I'm just saying it would be worth mentioning that we're intentionally
>>>>> leaking memory if shmem->pages_use_count > 1. Something like:
>>>>>
>>>>> 	/**
>>>>> 	 * shmem->pages_use_count should be 1 when ->sgt != NULL and
>>>>> 	 * zero otherwise. If some users still hold a pages reference
>>>>> 	 * that's a bug, and we intentionally leak the pages so they
>>>>> 	 * can't be re-allocated to someone else while the GPU/CPU
>>>>> 	 * still have access to it.
>>>>> 	 */
>>>>> 	drm_WARN_ON(drm,
>>>>> 		    refcount_read(&shmem->pages_use_count) == (shmem->sgt ? 1 : 0));
>>>>> 	if (shmem->sgt && refcount_dec_and_test(&shmem->pages_use_count))
>>>>> 		drm_gem_shmem_free_pages(shmem);    
>>>>
>>>> That may be acceptable, but only once there will a driver using this
>>>> feature.  
>>>
>>> Which feature? That's not related to a specific feature, that's just
>>> how drm_gem_shmem_get_pages_sgt() works, it takes a pages ref that can
>>> only be released in drm_gem_shmem_free(), because sgt users are not
>>> refcounted and the sgt stays around until the GEM object is freed or
>>> its pages are evicted. The only valid cases we have at the moment are:
>>>
>>> - pages_use_count == 1 && sgt != NULL
>>> - pages_use_count == 0
>>>
>>> any other situations are buggy.  
>>
>> sgt may belong to dma-buf for which pages_use_count=0, this can't be
>> done until sgt mess is sorted out
> 
> No it can't, not in that path, because the code you're adding is in the
> if (!obj->import_branch) branch:
> 
> 
>  	if (obj->import_attach) {
>  		drm_prime_gem_destroy(obj, shmem->sgt);
>  	} else {
> 		...
> 		// Your changes are here.
> 		...

This branch is taken for the dma-buf in the prime import error code path. But yes, the pages_use_count=0 for the dma-buf and then it can be written as:

	if (obj->import_attach) {
		drm_prime_gem_destroy(obj, shmem->sgt);
	} else {
		drm_WARN_ON(obj->dev, refcount_read(&shmem->vmap_use_count));

		if (shmem->sgt && refcount_read(&shmem->pages_use_count)) {
			dma_unmap_sgtable(obj->dev->dev, shmem->sgt,
					  DMA_BIDIRECTIONAL, 0);
			sg_free_table(shmem->sgt);
			kfree(shmem->sgt);

			__drm_gem_shmem_put_pages(shmem);
		}

		drm_WARN_ON(obj->dev, refcount_read(&shmem->pages_use_count));

Alright, I'll check if it works as expected for fixing the error code path bug for v17

-- 
Best regards,
Dmitry

