Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 467A13B003B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7E6E456;
	Tue, 22 Jun 2021 09:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7AB6E456;
 Tue, 22 Jun 2021 09:29:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id q14so1402645eds.5;
 Tue, 22 Jun 2021 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NdjMudB00SK16mm0slQHpVJFVcY9ZMyqCPAzIyYdoJM=;
 b=PZUiT3w/En6Y+vR/Ddzhajf9kBo/fxoyD7T/pE9cd9BRHOEWLXhlYWABIXosLkxYse
 hCjMHGy9CPj08IQmb0hTzEBNHncqOJVOgxxxap2c0VMz+AVNrWpJDdUcxKnclmsb1I++
 OgRRR5neV4lTMHLRX23ZO8ZCsyva8o2vuhGRuaX0mvJK2f0Vdf8SJnyNta0/573T/5dP
 er3ayXzZJBZpOApvz0j0fMv/Jbiva2Fns69o2CMlhB9jgF5zM16DtBZmNGR5sOsdDPhC
 nsry6UZw7LkrWjuJ9Ej3+nIoHg3M2mo5iCNswAhnDSoJ+A0xet55sgQuAn9utyHJXWMB
 JYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NdjMudB00SK16mm0slQHpVJFVcY9ZMyqCPAzIyYdoJM=;
 b=pnbQcciGkfqI1iAtft3hSFOm1XQke3azizGJ4viyKk1/L2QzNnRd1xhgK/0qOe93DF
 01kw+gbF5lWayr4VjuAnikcFlBisZW8Xxed3/74hi1uZnMBdUEGxs9ZriGzrqHbR2y5x
 /zymnkqMHhqbMv5NbWn6HJ+EvQ098bWph4zLNbDmQqi2FG0gXCSh/GBLZxP76VANfRSM
 sXKezTNRD69ht3Q6HoG89mMh2UdeDnfiaxPq/G2Aw2U887ptKP07uPwniThshiOGRvMh
 CCi/e3l4pREkA8Vy5aVIREKcykhU4/Z7NaLYlW8Yv8+/xr+LYnSCj8lPj/VcGxdpEuzp
 ASCQ==
X-Gm-Message-State: AOAM530Yzc6fHx1tHsKK17mOScJPtqvSUHIgkwrRdwzoi65EPXEGDFJy
 yFilnn6gxiEfr6NlO0pWeNbRCjw/ZZM=
X-Google-Smtp-Source: ABdhPJwjtiXEL/ty27bWRrZ4Tfuk29kWF5gNxmpQ3KlzAt/Bafax81pQe4w3XwRk/WC/rAwc7JqOJA==
X-Received: by 2002:a50:ef12:: with SMTP id m18mr3649099eds.285.1624354183026; 
 Tue, 22 Jun 2021 02:29:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id r4sm5805002ejd.105.2021.06.22.02.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:29:42 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210621130328.11070-1-christian.koenig@amd.com>
 <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
 <2033755d-c49f-8b90-f726-d640146a3df7@gmail.com>
 <CAKMK7uEET_E7eJa1No3KLMBudgE16ymXzXZp0CRYt_ZjS-_YsA@mail.gmail.com>
 <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0785485d-60e2-5c5b-557e-42253d545a53@gmail.com>
Date: Tue, 22 Jun 2021 11:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uECbQ+Fk6y9rsGdGdh4fEErhjUjSGicJLifnENAhjnZZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.21 um 11:20 schrieb Daniel Vetter:
> On Mon, Jun 21, 2021 at 5:53 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Mon, Jun 21, 2021 at 5:49 PM Christian König
>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>> Am 21.06.21 um 16:54 schrieb Daniel Vetter:
>>>> On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian König wrote:
>>>>> We actually need to wait for the moving fence after pinning
>>>>> the BO to make sure that the pin is completed.
>>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> CC: stable@kernel.org
>>>>> ---
>>>>>    drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
>>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
>>>>> index 347488685f74..591738545eba 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
>>>>> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>>>>>       if (ret)
>>>>>               return -EINVAL;
>>>>>
>>>>> -    return 0;
>>>>> +    if (nvbo->bo.moving) {
>>>> Don't we need to hold the dma_resv to read this? We can grab a reference
>>>> and then unlock, but I think just unlocked wait can go boom pretty easily
>>>> (since we don't hold a reference or lock so someone else can jump in and
>>>> free the moving fence).
>>> The moving fence is only modified while the BO is moved and since we
>>> have just successfully pinned it....
>> Yeah  ... so probably correct, but really tricky. Just wrapping a
>> ttm_bo_reserve/unreserve around the code you add should be enough and
>> get the job done?
> I think you distracted me a bit with the "it can't move", so yes
> there's a guarantee that no other fence can show up in ttm_bo->moving
> and confuse us. But it could get set to NULL because someone realized
> it signalled. We're not doing that systematically, but relying on
> fences never getting garbage-collected for correctness isn't great.

Yeah, that's what I essentially meant with it would be better in general 
to take the lock.

>
> Sot the ttm_bo_reserve/unreserve is definitely needed here around this
> bit of code. You don't need to merge it with the reserve/unreserve in
> the pin function though, it's just to protect against the
> use-after-free.

Ah, yes good point. That means I don't need to change the pin/unpin 
functions in nouveau at all.


BTW: What do you think of making dma_fence_is_signaled() and 
dma_fence_wait_timeout() save to passing in NULL as fence?

I think we have a lot of cases where we check "!fence || 
dma_fence_is_signaled(fence)" or similar.

Christian.

> -Daniel
>
>>> But in general I agree that it would be better to avoid this. I just
>>> didn't wanted to open a bigger can of worms by changing nouveau so much.
>> Yeah, but I'm kinda thinking of some helpers to wait for the move
>> fence (so that later on we can switch from having the exclusive fence
>> to the move fence do that, maybe). And then locking checks in there
>> would be nice.
>>
>> Also avoids the case of explaining why lockless here is fine, but
>> lockless wait for the exclusive fence in e.g. a dynami dma-buf
>> importer is very much not fine at all. Just all around less trouble.
>> -Daniel
>>
>>> Christian.
>>>
>>>> -Daniel
>>>>
>>>>> +            ret = dma_fence_wait(nvbo->bo.moving, true);
>>>>> +            if (ret)
>>>>> +                    nouveau_bo_unpin(nvbo);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>>    }
>>>>>
>>>>>    void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
>>>>> --
>>>>> 2.25.1
>>>>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>
>

