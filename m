Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6D4137C2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 18:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E81B890C9;
	Tue, 21 Sep 2021 16:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D12890C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:45:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i23so41191996wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=psah4mHG63/C/YPiZyFBat1C3NjyW//LGn21+usYHtw=;
 b=apg4iNAPkMRjbTHDnxklU3DtM2FeQe30oU4kls0o3t1pHC85QuX0WLJ6f9KN93AKZ1
 Cu28Z5ztqWaRvI65HxOIpma8BRbpyVXoF8DvdKIIioUxmYufSLn55233hlm8XIFIy4Xt
 rKLLqxn+eDRBQNmlWK/ts5exHbF6hyd0yawkyVwlj8ygwAskxIOtFFm/1B9UVuq2eyT7
 PIxkJ13w1gMrXbVaA13TCEdrYZkxbNYb7ViHVFerheC7hkf61/kzoVUvnyNsrIKAoUhA
 D5x+vzBEbSBv6VFHKuEDCEz8c8055ceQnOOwoYuIUnuyeHtZ2ZXcBUlr/1/I7ZjdJpwQ
 wwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=psah4mHG63/C/YPiZyFBat1C3NjyW//LGn21+usYHtw=;
 b=jwThcPV/5YOVwg9EUSXGMP2nmx9nbmwApK5xbIbKcQsPHDWrV2nTUJENKtGeRi2WIE
 j17bcxcgnoQbkfK2FArw6HeEkcm4g2z/Lg9kTD+rZZaTrOG2gUMCShScd5RSMOsvGgvv
 bIGdLmeHIsieN6Qvgs+83vLm+UF+Zu/4KmHAnXTmOB8HTZIIMFkEIMLbpUNjySwz19cZ
 I1i46UcwZNsYT+L5Fhoc9hSGTiaH9T81pD98LzBbH+MhNqua8VsT13feITpdwV5jM/iA
 U2yddxlR3ri30Mu9SCGeGVZSx+mUaVs55UK7lBDt05hPrkoqXGiFUeGtUUUeSiAmRhCS
 JCzQ==
X-Gm-Message-State: AOAM532CxmT1UVQFlVazf49ezhRVwBQBWfggHCJ1AGLtxuGsGXKYpQ7A
 XPbUesIdk+W+khL7OqTABbs=
X-Google-Smtp-Source: ABdhPJwHSTny3aPg3jViUGKYIGDXq4r8qQK8G+oHUdJX8m5t1m0SttTS1F8nF+oVfcXhfDtFt/950A==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr5763965wmh.125.1632242725728; 
 Tue, 21 Sep 2021 09:45:25 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e90f:ea29:b3d5:61cf?
 ([2a02:908:1252:fb60:e90f:ea29:b3d5:61cf])
 by smtp.gmail.com with ESMTPSA id l19sm20306963wrc.16.2021.09.21.09.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 09:45:25 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] drm/scheduler: Add fence deadline support
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Pekka Paalanen <ppaalanen@gmail.com>,
 Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tian Tao <tiantao6@hisilicon.com>, Steven Price <steven.price@arm.com>,
 Melissa Wen <mwen@igalia.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-5-robdclark@gmail.com>
 <YTj2scNdCHAdF+cl@phenom.ffwll.local>
 <CAF6AEGvHQHbOP65jq53WEuJc9uxReOFMyXUN--JjjcB1FxHSCw@mail.gmail.com>
 <CAF6AEGve2LN2Us56e15rZrec7xXHrBhGT9NuPaOiQeiWrACbLw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <51311182-b06e-7fcf-ec20-b9657d866bbc@gmail.com>
Date: Tue, 21 Sep 2021 18:45:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGve2LN2Us56e15rZrec7xXHrBhGT9NuPaOiQeiWrACbLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.09.21 um 18:35 schrieb Rob Clark:
> On Tue, Sep 21, 2021 at 8:57 AM Rob Clark <robdclark@gmail.com> wrote:
>> On Wed, Sep 8, 2021 at 10:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>> On Fri, Sep 03, 2021 at 11:47:55AM -0700, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> As the finished fence is the one that is exposed to userspace, and
>>>> therefore the one that other operations, like atomic update, would
>>>> block on, we need to propagate the deadline from from the finished
>>>> fence to the actual hw fence.
>>>>
>>>> v2: Split into drm_sched_fence_set_parent() (ckoenig)
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_fence.c | 34 +++++++++++++++++++++++++
>>>>   drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
>>>>   include/drm/gpu_scheduler.h             |  8 ++++++
>>>>   3 files changed, 43 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> index bcea035cf4c6..4fc41a71d1c7 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> @@ -128,6 +128,30 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
>>>>        dma_fence_put(&fence->scheduled);
>>>>   }
>>>>
>>>> +static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>> +                                               ktime_t deadline)
>>>> +{
>>>> +     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>> +     unsigned long flags;
>>>> +
>>>> +     spin_lock_irqsave(&fence->lock, flags);
>>>> +
>>>> +     /* If we already have an earlier deadline, keep it: */
>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>> +         ktime_before(fence->deadline, deadline)) {
>>>> +             spin_unlock_irqrestore(&fence->lock, flags);
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     fence->deadline = deadline;
>>>> +     set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>>> +
>>>> +     spin_unlock_irqrestore(&fence->lock, flags);
>>>> +
>>>> +     if (fence->parent)
>>>> +             dma_fence_set_deadline(fence->parent, deadline);
>>>> +}
>>>> +
>>>>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
>>>>        .get_driver_name = drm_sched_fence_get_driver_name,
>>>>        .get_timeline_name = drm_sched_fence_get_timeline_name,
>>>> @@ -138,6 +162,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
>>>>        .get_driver_name = drm_sched_fence_get_driver_name,
>>>>        .get_timeline_name = drm_sched_fence_get_timeline_name,
>>>>        .release = drm_sched_fence_release_finished,
>>>> +     .set_deadline = drm_sched_fence_set_deadline_finished,
>>>>   };
>>>>
>>>>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>> @@ -152,6 +177,15 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>   }
>>>>   EXPORT_SYMBOL(to_drm_sched_fence);
>>>>
>>>> +void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>>>> +                             struct dma_fence *fence)
>>>> +{
>>>> +     s_fence->parent = dma_fence_get(fence);
>>>> +     if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>>>> +                  &s_fence->finished.flags))
>>> Don't you need the spinlock here too to avoid races? test_bit is very
>>> unordered, so guarantees nothing. Spinlock would need to be both around
>>> ->parent = and the test_bit.
>>>
>>> Entirely aside, but there's discussions going on to preallocate the hw
>>> fence somehow. If we do that we could make the deadline forwarding
>>> lockless here. Having a spinlock just to set the parent is a bit annoying
>>> ...
>>>
>>> Alternative is that you do this locklessly with barriers and a _lot_ of
>>> comments. Would be good to benchmark whether the overhead matters though
>>> first.
>> So, my thinking is that very few (well no) guarantees are made to the
>> fence implementor that their ->set_deadline() is not called multiple
>> times, from multiple threads, etc.  And no guarantee that a later
>> deadline is set after an earlier deadline has been set.  It is all up
>> to the set_deadline() implementation to deal with these cases.
>>
>> So that means we just need the appropriate barrier-fu to ensure
>> another thread calling drm_sched_fence_set_deadline_finished() sees
>> fence->parent set before the test_bit.  It could mean that the backend
>> implementation sees the same deadline set twice, but that is fine.
>>
> something like:

Of hand I think that this should work.

Or rather say I can't see anything wrong with that.

Christian.

>
> -----
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> b/drivers/gpu/drm/scheduler/sched_fence.c
> index 4fc41a71d1c7..7f2af6d1777c 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -132,6 +132,7 @@ static void
> drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>      ktime_t deadline)
>   {
>    struct drm_sched_fence *fence = to_drm_sched_fence(f);
> + struct dma_fence *parent;
>    unsigned long flags;
>
>    spin_lock_irqsave(&fence->lock, flags);
> @@ -148,8 +149,9 @@ static void
> drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>
>    spin_unlock_irqrestore(&fence->lock, flags);
>
> - if (fence->parent)
> - dma_fence_set_deadline(fence->parent, deadline);
> + parent = smp_load_acquire(&fence->parent);
> + if (parent)
> + dma_fence_set_deadline(parent, deadline);
>   }
>
>   static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
> @@ -180,7 +182,7 @@ EXPORT_SYMBOL(to_drm_sched_fence);
>   void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>    struct dma_fence *fence)
>   {
> - s_fence->parent = dma_fence_get(fence);
> + smp_store_release(&s_fence->parent, dma_fence_get(fence));
>    if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
>         &s_fence->finished.flags))
>    dma_fence_set_deadline(fence, s_fence->deadline);
> -----
>
> BR,
> -R

