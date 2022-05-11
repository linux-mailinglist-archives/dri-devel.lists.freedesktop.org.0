Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3852378E
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A7610FB99;
	Wed, 11 May 2022 15:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EACE10FB99
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:40:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 2FC621F44F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652283637;
 bh=hw+IbRtV4FDEikHLzTfTUBZrISD/nOB98xNZrs4QRyU=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=bOXGXH5Mof/WN809Do+90df/7EsRUz5UB5E35+9u83eFqG0MQeydSNOnI7H+r03KZ
 4oVD332NsucFenhT1sS6y5JMjYELDs9UgVxKnVmZK48ruUgMF7DdZW5C394j0xPJWs
 H3lSh6y4irWJrPQCqxe/O+OUDmKhgc7hACpJR5OTu45f5T4U+RXKVSDRkEiLIcp6+z
 U296UcsrcLjO82fctzxbTy6+KtIbdo2D5yMpOS6sbAu3Ml0B9pt/6iic6YINhbZUTe
 EhLDNn85LhpwlO62kNVb5dLRDOUX37sFuy4SAgBB5BL2cVEYYu7qHp+7WOBC9Q5nT3
 xObows7KOfk5Q==
Message-ID: <ba2836d0-9a3a-b879-cb1e-a48aed31637d@collabora.com>
Date: Wed, 11 May 2022 18:40:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <8f932ab0-bb72-8fea-4078-dc59e9164bd4@collabora.com>
 <YnI3lE0TxLfZaQjE@phenom.ffwll.local>
 <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
 <YnuziJDmXVR09UzP@phenom.ffwll.local>
 <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
 <3a362c32-870c-1d73-bba6-bbdcd62dc326@collabora.com>
 <YnvWUbh5QDDs6u2B@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YnvWUbh5QDDs6u2B@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 virtualization@lists.linux-foundation.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/22 18:29, Daniel Vetter wrote:
> On Wed, May 11, 2022 at 06:14:00PM +0300, Dmitry Osipenko wrote:
>> On 5/11/22 17:24, Christian König wrote:
>>> Am 11.05.22 um 15:00 schrieb Daniel Vetter:
>>>> On Tue, May 10, 2022 at 04:39:53PM +0300, Dmitry Osipenko wrote:
>>>>> [SNIP]
>>>>> Since vmapping implies implicit pinning, we can't use a separate lock in
>>>>> drm_gem_shmem_vmap() because we need to protect the
>>>>> drm_gem_shmem_get_pages(), which is invoked by drm_gem_shmem_vmap() to
>>>>> pin the pages and requires the dma_resv_lock to be locked.
>>>>>
>>>>> Hence the problem is:
>>>>>
>>>>> 1. If dma-buf importer holds the dma_resv_lock and invokes
>>>>> dma_buf_vmap() -> drm_gem_shmem_vmap(), then drm_gem_shmem_vmap() shall
>>>>> not take the dma_resv_lock.
>>>>>
>>>>> 2. Since dma-buf locking convention isn't specified, we can't assume
>>>>> that dma-buf importer holds the dma_resv_lock around dma_buf_vmap().
>>>>>
>>>>> The possible solutions are:
>>>>>
>>>>> 1. Specify the dma_resv_lock convention for dma-bufs and make all
>>>>> drivers to follow it.
>>>>>
>>>>> 2. Make only DRM drivers to hold dma_resv_lock around dma_buf_vmap().
>>>>> Other non-DRM drivers will get the lockdep warning.
>>>>>
>>>>> 3. Make drm_gem_shmem_vmap() to take the dma_resv_lock and get deadlock
>>>>> if dma-buf importer holds the lock.
>>>>>
>>>>> ...
>>>> Yeah this is all very annoying.
>>> Ah, yes that topic again :)
>>>
>>> I think we could relatively easily fix that by just defining and
>>> enforcing that the dma_resv_lock must have be taken by the caller when
>>> dma_buf_vmap() is called.
>>>
>>> A two step approach should work:
>>> 1. Move the call to dma_resv_lock() into the dma_buf_vmap() function and
>>> remove all lock taking from the vmap callback implementations.
>>> 2. Move the call to dma_resv_lock() into the callers of dma_buf_vmap()
>>> and enforce that the function is called with the lock held.
>> I've doubts about the need to move out the dma_resv_lock() into the
>> callers of dma_buf_vmap()..
>>
>> I looked through all the dma_buf_vmap() users and neither of them
>> interacts with dma_resv_lock() at all, i.e. nobody takes the lock
>> in/outside of dma_buf_vmap(). Hence it's easy and more practical to make
>> dma_buf_mmap/vmap() to take the dma_resv_lock by themselves.
> i915_gem_dmabuf_vmap -> i915_gem_object_pin_map_unlocked ->
>   i915_gem_object_lock -> dma_resv_lock
> 
> And all the ttm drivers should work similarly. So there's definitely
> drivers which grab dma_resv_lock from their vmap callback.

Grr.. I'll take another look.

>> It's unclear to me which driver may ever want to do the mapping under
>> the dma_resv_lock. But if we will ever have such a driver that will need
>> to map imported buffer under dma_resv_lock, then we could always add the
>> dma_buf_vmap_locked() variant of the function. In this case the locking
>> rule will sound like this:
>>
>> "All dma-buf importers are responsible for holding the dma-reservation
>> lock around the dmabuf->ops->mmap/vmap() calls."

Are you okay with this rule?

>>> It shouldn't be that hard to clean up. The last time I looked into it my
>>> main problem was that we didn't had any easy unit test for it.
>> Do we have any tests for dma-bufs at all? It's unclear to me what you
>> are going to test in regards to the reservation locks, could you please
>> clarify?
> Unfortunately not really :-/ Only way really is to grab a driver which
> needs vmap (those are mostly display drivers) on an imported buffer, and
> see what happens.
> 
> 2nd best is liberally sprinkling lockdep annotations all over the place
> and throwing it at intel ci (not sure amd ci is accessible to the public)
> and then hoping that's good enough. Stuff like might_lock and
> dma_resv_assert_held.

Alright

-- 
Best regards,
Dmitry
