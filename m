Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7371452D609
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 16:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EAB10E532;
	Thu, 19 May 2022 14:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FCD10E532
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 14:29:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id BD8AA1F45D3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652970556;
 bh=yqUHuJSm3hxEm5BsPsu8PQGjCExJQM6k/iiWvyholA4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Qt4Ino3HpdMC+LVDb/lIW44suChRQOeWi9Lw8fRbh+IutM4OalHmgcCS1dK/GIk15
 aaYzSyKRdXLrESIpzuVHTcbCPZ2PT0wjxEymAzPc7IgEdEv/yRrLFmIDoIXapAh7Oe
 PcjilaYGLFsnTNJqXxAd68Rg5tUm+WW7poQ91qKuoFMHBhC9AHSPgFlrhvUX2mB5Vf
 2x3ygfMEEBomWtHWkPhDyoVeJNZ1kFcMoOwWaRorL0Nw+v91Upw00Dl55SuRkVLUwS
 06K7FqGo2PBVJ98Fq3lOUPf5xD5kM9EFO+wY9C8KqkRPyNMR0AtOlGl3WTVFgnYP1y
 tA1czUo5M9H1A==
Message-ID: <611816f0-4453-901a-aaaf-0e58cf79e59d@collabora.com>
Date: Thu, 19 May 2022 17:29:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
 <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
 <Ynkb1U2nNWYPML88@phenom.ffwll.local>
 <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
 <Ynu1k5lH+xvqtObG@phenom.ffwll.local>
 <3429a12f-9fbe-b66b-dbbd-94a1df54714e@collabora.com>
 <YnwJ0kLwLS7RxuwS@phenom.ffwll.local>
 <0ae6fed7-b166-d2b8-0e42-84b94b777c20@collabora.com>
 <CAKMK7uGS3PSwbkW7gj1hd2pz591HwY6Gbb=P_X4N5KOM5+X85w@mail.gmail.com>
 <31bc7a14-ff30-6961-b4fc-0aad83551df9@collabora.com>
 <YoZQc4fsPAiboTtC@phenom.ffwll.local>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <YoZQc4fsPAiboTtC@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/19/22 17:13, Daniel Vetter wrote:
> On Thu, May 12, 2022 at 10:04:53PM +0300, Dmitry Osipenko wrote:
>> On 5/12/22 20:04, Daniel Vetter wrote:
>>> On Thu, 12 May 2022 at 13:36, Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>>
>>>> On 5/11/22 22:09, Daniel Vetter wrote:
>>>>> On Wed, May 11, 2022 at 07:06:18PM +0300, Dmitry Osipenko wrote:
>>>>>> On 5/11/22 16:09, Daniel Vetter wrote:
>>>>>>>>>>> I'd like to ask you to reduce the scope of the patchset and build the
>>>>>>>>>>> shrinker only for virtio-gpu. I know that I first suggested to build
>>>>>>>>>>> upon shmem helpers, but it seems that it's easier to do that in a later
>>>>>>>>>>> patchset.
>>>>>>>>>> The first version of the VirtIO shrinker didn't support memory eviction.
>>>>>>>>>> Memory eviction support requires page fault handler to be aware of the
>>>>>>>>>> evicted pages, what should we do about it? The page fault handling is a
>>>>>>>>>> part of memory management, hence to me drm-shmem is already kinda a MM.
>>>>>>>>> Hm I still don't get that part, why does that also not go through the
>>>>>>>>> shmem helpers?
>>>>>>>> The drm_gem_shmem_vm_ops includes the page faults handling, it's a
>>>>>>>> helper by itself that is used by DRM drivers.
>>>>>>>>
>>>>>>>> I could try to move all the shrinker logic to the VirtIO and re-invent
>>>>>>>> virtio_gem_shmem_vm_ops, but what is the point of doing this for each
>>>>>>>> driver if we could have it once and for all in the common drm-shmem code?
>>>>>>>>
>>>>>>>> Maybe I should try to factor out all the shrinker logic from drm-shmem
>>>>>>>> into a new drm-shmem-shrinker that could be shared by drivers? Will you
>>>>>>>> be okay with this option?
>>>>>>> I think we're talking past each another a bit. I'm only bringing up the
>>>>>>> purge vs eviction topic we discussed in the other subthread again.
>>>>>>
>>>>>> Thomas asked to move the whole shrinker code to the VirtIO driver and
>>>>>> I's saying that this is not a great idea to me, or am I misunderstanding
>>>>>> the Thomas' suggestion? Thomas?
>>>>>
>>>>> I think it was just me creating a confusion here.
>>>>>
>>>>> fwiw I do also think that shrinker in shmem helpers makes sense, just in
>>>>> case that was also lost in confusion.
>>>>
>>>> Okay, good that we're on the same page now.
>>>>
>>>>>>>>> I'm still confused why drivers need to know the difference
>>>>>>>>> between evition and purging. Or maybe I'm confused again.
>>>>>>>> Example:
>>>>>>>>
>>>>>>>> If userspace uses IOV addresses, then these addresses must be kept
>>>>>>>> reserved while buffer is evicted.
>>>>>>>>
>>>>>>>> If BO is purged, then we don't need to retain the IOV space allocated
>>>>>>>> for the purged BO.
>>>>>>> Yeah but is that actually needed by anyone? If userspace fails to allocate
>>>>>>> another bo because of lack of gpu address space then it's very easy to
>>>>>>> handle that:
>>>>>>>
>>>>>>> 1. Make a rule that "out of gpu address space" gives you a special errno
>>>>>>> code like ENOSPC
>>>>>>>
>>>>>>> 2. If userspace gets that it walks the list of all buffers it marked as
>>>>>>> purgeable and nukes them (whether they have been evicted or not). Then it
>>>>>>> retries the bo allocation.
>>>>>>>
>>>>>>> Alternatively you can do step 2 also directly from the bo alloc ioctl in
>>>>>>> step 1. Either way you clean up va space, and actually a lot more (you
>>>>>>> potentially nuke all buffers marked as purgeable, not just the ones that
>>>>>>> have been purged already) and only when va cleanup is actually needed
>>>>>>>
>>>>>>> Trying to solve this problem at eviction time otoh means:
>>>>>>> - we have this difference between eviction and purging
>>>>>>> - it's still not complete, you still need to glue step 2 above into your
>>>>>>>   driver somehow, and once step 2 above is glued in doing additional
>>>>>>>   cleanup in the purge function is just duplicated logic
>>>>>>>
>>>>>>> So at least in my opinion this isn't the justification we need. And we
>>>>>>> should definitely not just add that complication "in case, for the
>>>>>>> future", if we don't have a real need right now. Adding it later on is
>>>>>>> easy, removing it later on because it just gets in the way and confuses is
>>>>>>> much harder.
>>>>>>
>>>>>> The IOVA space is only one example.
>>>>>>
>>>>>> In case of the VirtIO driver, we may have two memory allocation for a
>>>>>> BO. One is the shmem allcation in guest and the other is in host's vram.
>>>>>> If we will only release the guest's memory on purge, then the vram will
>>>>>> remain allocated until BO is destroyed, which unnecessarily sub-optimal.
>>>>>
>>>>> Hm but why don't you just nuke the memory on the host side too when you
>>>>> evict? Allowing the guest memory to be swapped out while keeping the host
>>>>> memory allocation alive also doesn't make a lot of sense for me. Both can
>>>>> be recreated (I guess at least?) on swap-in.
>>>>
>>>> Shouldn't be very doable or at least worth the efforts. It's userspace
>>>> that manages data uploading, kernel only provides transport for the
>>>> virtio-gpu commands.
>>>>
>>>> Drivers are free to use the same function for both purge() and evict()
>>>> callbacks if they want. Getting rid of the purge() callback creates more
>>>> problems than solves, IMO.
>>>
>>> Hm this still sounds pretty funny and defeats the point of
>>> purgeable/evictable buffers a bit I think. But also I guess we'd
>>> pushed this bikeshed to the max, so I think if you make ->purge
>>> optional and just call ->evict if that's not present, and document it
>>> all in the kerneldoc, then I think that's good.
>>
>> This is a good enough compromise to me.
>>
>>> I just don't think that encouraging drivers to distinguish between
>>> evict/purge is a good idea for almost all of them.
>>
>> Intel's shrinker checks the "madvise" status of BOs and then decides
>> what to do based on it. Perhaps we could move the decision-making about
>> purging to drivers and then it will be single evict() callback, but will
>> drivers really ever need to be responsible for this decision-making or
>> this will be an unnecessary boilerplate code in the drivers? I'll think
>> more about this.
> 
> tbh I wouldn't worry about details, you've convinced me that some
> differentiation between evict and purged makes sense. And yeah maybe
> drivers should have a helper to check that instead of explicit argument,
> but that's a bikeshed color choice which should be fairly easy to adjust
> later on still.

I already reworked patches like you suggested to use single evict() cb
and etc. But those are minor things, the lockings are more important.
I'm now having more h/w on my hands and yesterday found that Lima driver
was getting deadlock using the new dma-buf locking convention that I'm
working on, so I'm now re-testing all thoroughly and will send out v6
once will be confident in it.

-- 
Best regards,
Dmitry
