Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4D587251
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5E02B32E;
	Mon,  1 Aug 2022 20:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D618590AFA;
 Mon,  1 Aug 2022 20:26:58 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BA93A6601B2B;
 Mon,  1 Aug 2022 21:26:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659385617;
 bh=qlDRiXQtVbqNkSmU8Cnqt3nNqlrAXRi8L9E+dfgRTgw=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=T6C413GV9u9auBKBUGPwrUqFub8g8kd4CuR1LPJpWJvYr19sZmMv4B5vMoWJ4FHQF
 4qa3OBtA4YizFC4Kcfzdty7oaMMi4EtASju5M0z9qI0qyYrXkavVRc1pzU4508/z4N
 Cfph7BTAnZoJfh99KQQESKatS1P5Ieosqe5udCGdFpOjf5oFcXUp2gkLz/TwE6DgWT
 a58nEzUsPhD4Jj5dPciHvife+/zM7oBRfSTazPXG1XC/zXNGNGtq4vFMh0K17HOh87
 XtShsIO4NZrHw/TycCFI4aOql8Eq5EG2A1H/F8lQ2bZbVQHQiMJWIAb4zazEudLtpo
 Oj8HWXnrCGy/Q==
Message-ID: <88576d7a-da5f-753d-51cf-08ed22f7c81e@collabora.com>
Date: Mon, 1 Aug 2022 23:26:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 09/15] drm/gem: Add LRU/shrinker helper
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Clark <robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
 <20220726175043.1027731-10-robdclark@gmail.com>
 <def8e47c-067e-0841-4ae4-1eb90244cd50@collabora.com>
 <CAF6AEGtV4GY6=PmQh0wrKxjxk_baRCzOo=s=Uz-uKBNEn7SBBg@mail.gmail.com>
 <6b35b912-68e5-e722-0b5a-0f7bd06c22c2@collabora.com>
 <733f5d3f-293e-f951-a00b-fcd3052f68e7@collabora.com>
In-Reply-To: <733f5d3f-293e-f951-a00b-fcd3052f68e7@collabora.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/22 23:13, Dmitry Osipenko wrote:
> On 8/1/22 23:11, Dmitry Osipenko wrote:
>> On 8/1/22 23:00, Rob Clark wrote:
>>> On Mon, Aug 1, 2022 at 12:41 PM Dmitry Osipenko
>>> <dmitry.osipenko@collabora.com> wrote:
>>>>
>>>> On 7/26/22 20:50, Rob Clark wrote:
>>>>> +/**
>>>>> + * drm_gem_lru_remove - remove object from whatever LRU it is in
>>>>> + *
>>>>> + * If the object is currently in any LRU, remove it.
>>>>> + *
>>>>> + * @obj: The GEM object to remove from current LRU
>>>>> + */
>>>>> +void
>>>>> +drm_gem_lru_remove(struct drm_gem_object *obj)
>>>>> +{
>>>>> +     struct drm_gem_lru *lru = obj->lru;
>>>>> +
>>>>> +     if (!lru)
>>>>> +             return;
>>>>> +
>>>>> +     mutex_lock(lru->lock);
>>>>> +     lru_remove(obj);
>>>>> +     mutex_unlock(lru->lock);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_gem_lru_remove);
>>>>
>>>> I made a preliminary port of the DRM-SHMEM shrinker on top of the the
>>>> latest version of dma-buf locking convention and yours LRU patches. It
>>>> all works good, the only thing that is missing for the DRM-SHMEM
>>>> shrinker is the drm_gem_lru_remove_locked().
>>>>
>>>> What about to add a locked variant of drm_gem_lru_remove()?
>>>
>>> Sounds fine to me.. the only reason it didn't exist yet was because it
>>> wasn't needed yet..
>>
>> There is no use for the drm_gem_lru_move_tail_locked() as well, you're
>> not using it in the MSM driver. Hence I thought it might be good to add
>> the drm_gem_lru_remove_locked(), or maybe the
>> drm_gem_lru_move_tail_locked() should be dropped then?
>>
>>> I can respin w/ an addition of a _locked() version, or you can add it
>>> on top in your patchset.  Either is fine by me
>>
>> The either option is fine by me too. If you'll keep the unused
>> drm_gem_lru_move_tail_locked(), then will be nice to add
>> drm_gem_lru_remove_locked().
>>
> 
> The drm_gem_lru_move_tail_locked() will be needed by DRM-SHMEM shrinker,
> BTW.

On the other hand, I see now that DRM-SHMEM shrinker can use the
unlocked versions only. Hence both drm_gem_lru_move_tail_locked() and
drm_gem_lru_remove_locked() aren't needed.

-- 
Best regards,
Dmitry
