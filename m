Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC84DCCAF
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 18:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B411A10E7A1;
	Thu, 17 Mar 2022 17:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A657D10E7A1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:44:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id DEB1A1F4552B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647539042;
 bh=mUMMTYKYpCpUpTWTvn3hhHrvuNHT/8z3r7qyrT17pvA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lJBtpINq0ld1ylJn0JIcyD6BtNED3KoWz7lRZJ7U60pn0clW6BHz5T84ZrDP2ITIO
 3Uv19QN0g4XSrEKLLM1vgdGA3cHcR/wBh41nUgXhNbEPAkm3ndYCf0g6mKqG4eBcDR
 LgOxRmhCfbKISLiqP6E4PEhiFHW5m4iCGOr5XYcZOFTI+OWtPATMhQPiLhLuxtvvoq
 8hU7dLwD5MTqtnJaeqDoktCv9+7KXZ3xzfFWZEhDgQ6SKEEe4ZXHQ/TgaRuqh8Ck8T
 Ogjin72ZPyE+optlFHhoyqLteqiCZIRYxzj0uhk1cRVWuEno4XCGqeBuxFZlysnPD5
 yeWmIV9EijnKg==
Message-ID: <37364303-acdc-ec95-9e99-2edbc84c5040@collabora.com>
Date: Thu, 17 Mar 2022 20:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 6/8] drm/shmem-helper: Add generic memory shrinker
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220314224253.236359-1-dmitry.osipenko@collabora.com>
 <20220314224253.236359-7-dmitry.osipenko@collabora.com>
 <CAF6AEGsmtM6rTJtOJwTA49cwW7wCjF53Devzodd_PzLO0EOkVw@mail.gmail.com>
 <be3b09ff-08ea-3e13-7d8c-06af6fffbd8f@collabora.com>
 <CAF6AEGv2Ob7_Zp3+m-16QExDTM9vYfAkeSuBtjWG7ukHnY73UA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGv2Ob7_Zp3+m-16QExDTM9vYfAkeSuBtjWG7ukHnY73UA@mail.gmail.com>
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
Cc: Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <digetx@gmail.com>,
 Steven Price <steven.price@arm.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/17/22 19:13, Rob Clark wrote:
...
>>>> +               /* prevent racing with job submission code paths */
>>>> +               if (!dma_resv_trylock(obj->resv))
>>>> +                       goto shrinker_lock;
>>>
>>> jfwiw, the trylock here is in the msm code isn't so much for madvise
>>> (it is an error to submit jobs that reference DONTNEED objects), but
>>> instead for the case of evicting WILLNEED but inactive objects to
>>> swap.  Ie. in the case that we need to move bo's back in to memory, we
>>> don't want to unpin/evict a buffer that is later on the list for the
>>> same job.. msm shrinker re-uses the same scan loop for both
>>> inactive_dontneed (purge) and inactive_willneed (evict)
>>
>> I don't see connection between the objects on the shrinker's list and
>> the job's BOs. Jobs indeed must not have any objects marked as DONTNEED,
>> this case should never happen in practice, but we still need to protect
>> from it.
> 
> Hmm, let me try to explain with a simple example.. hopefully this makes sense.
> 
> Say you have a job with two bo's, A and B..  bo A is not backed with
> memory (either hasn't been used before or was evicted.  Allocating
> pages for A triggers shrinker.  But B is still on the
> inactive_willneed list, however it is already locked (because we don't
> want to evict B to obtain backing pages for A).

I see now what you're talking about, thanks. My intention of locking the
reservations is different since eviction isn't supported by this v2. But
we probably will be able to re-use this try_lock for protecting from
swapping out job's BOs as well.

>>> I suppose using trylock is not technically wrong, and it would be a
>>> good idea if the shmem helpers supported eviction as well.  But I
>>> think in the madvise/purge case if you lose the trylock then there is
>>> something else bad going on.
>>
>> This trylock is intended for protecting job's submission path from
>> racing with madvise ioctl invocation followed by immediate purging of
>> BOs while job is in a process of submission, i.e. it protects from a
>> use-after-free.
> 
> ahh, ok
> 
>> If you'll lose this trylock, then shrinker can't use
>> dma_resv_test_signaled() reliably anymore and shrinker may purge BO
>> before job had a chance to add fence to the BO's reservation.
>>
>>> Anyways, from the PoV of minimizing lock contention when under memory
>>> pressure, this all looks good to me.
>>
>> Thank you. I may try to add generic eviction support to the v3.
> 
> eviction is a trickier thing to get right, I wouldn't blame you for
> splitting that out into it's own patchset ;-)
> 
> You probably also would want to make it a thing that is opt-in for
> drivers using the shmem helpers

I had the same thoughts, will see.
