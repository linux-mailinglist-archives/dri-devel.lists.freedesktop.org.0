Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B74540C9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8186E1E0;
	Wed, 17 Nov 2021 06:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669A56E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:17:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so3871002wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=j0dEAQ0T3BtadYK90n5vPMwP8ks+ErLgTn0G56HZePk=;
 b=QtFlje/uW62k3hjT/SaT5p+jB0iqZ6EToHd09/2X2wCRXZoznllSYNPsPyWh/Kd6j9
 OSfMtNdJkeKjxrSdk+xOgv4KXOJUAqXMbCwMd2d4nVn5JizQEOz2a31wL2u3F5TvYEZx
 odxmtfplhU9TQJDHsQ0DoudwI8Wo759Stl6yS7sD3TXaDQQnGwP97I2l9M18dQt/2PBH
 72tHfPWrYTKg2kJwNQHwq0rhNEieOiSo05RJDzQT2sILrMvG4Cyr6GK+vcaPOuTKbZH9
 7mZyNixHjJkm+ithFodsdNeFjkc5mYMhwesg+00iBmwIIYRNrILBIHnDTiyjSCmvNFY+
 pxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=j0dEAQ0T3BtadYK90n5vPMwP8ks+ErLgTn0G56HZePk=;
 b=0APc71BDF8ucx0YfbDhKsWNJQQhw92mke0tP2cDGZgvSp59oL2whux2mRoktwXEPKT
 cuZ+mbCJtdBUXgKaqp19fJKbWhHT+4uoaLbe05Em2obvsa/CpODOHh3dQ0lZeatv0WkT
 KzMve1UzNYS8i6PV9/xwLoMAWBTCc8mHf4uiRVsf9jklixWRmbgVQ6lLaJ2n2aroQolf
 XbARe00wQLI7Mvd+Y47r7egDly+kWP6RymIIJg8tLieyFbxakmFG120isWMHOGPnKhxd
 xfVxGwzDf0Vks9Y047w3OmH7g3jmwQuRGkEgdJhas1Ck9UVwwxnWgUu2f+vlsl57TuQ7
 MvSQ==
X-Gm-Message-State: AOAM531TinzK+Emr32ZuD/yOFTjFse9PiQ5gkAX1+KdRxd3bsIpr34Sn
 S3QK1PoBkiR37O/GEJMglf8=
X-Google-Smtp-Source: ABdhPJy9RxnJPFFYyOkyHfsMzXARendpm/lbNjDOCtbuO2quzT8VAzxSZMt4TRzHH8H+CcHV01sbXA==
X-Received: by 2002:a05:600c:21c3:: with SMTP id
 x3mr14668292wmj.13.1637129828763; 
 Tue, 16 Nov 2021 22:17:08 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:a938:1f18:1671:2e0e?
 ([2a02:908:1252:fb60:a938:1f18:1671:2e0e])
 by smtp.gmail.com with ESMTPSA id n4sm22851140wri.41.2021.11.16.22.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 22:17:08 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/sched: fix dropping the last fence ref
To: Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20211116092519.99206-1-christian.koenig@amd.com>
 <20211116092519.99206-2-christian.koenig@amd.com>
 <YZPeXyCSaRRtUN21@phenom.ffwll.local>
 <CAF6AEGvmgE1N=c5YexCyxWTVUpC6V5LEtvUnxxZ3eNAA5z6MGg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1b754ce5-a293-cc92-e848-1b6cc307669f@gmail.com>
Date: Wed, 17 Nov 2021 07:17:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvmgE1N=c5YexCyxWTVUpC6V5LEtvUnxxZ3eNAA5z6MGg@mail.gmail.com>
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
Cc: frattaroli.nicolas@gmail.com, Yassine Oudjana <y.oudjana@protonmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 16.11.21 um 19:07 schrieb Rob Clark:
> On Tue, Nov 16, 2021 at 8:37 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, Nov 16, 2021 at 10:25:19AM +0100, Christian König wrote:
>>> We need to grab another ref before trying to add the fence to the sched
>>> job and not after.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>> I wondered first why this goes boom, but then I realized that in some
>> cases add_dependency() drops the reference of the passed-in fence.
>>
>> Please also add the Fixes: line like in the previous patch.
> oh, I sent https://patchwork.freedesktop.org/patch/463329/ before I
> saw this.. it already has the fixes tag, and IMO a better description,
> so I think you can just pick that one instead

Yeah, agree. You also have the missing Fixes line already.

Going to add Daniels rb to your patch as well since it is technically 
the same.

Thanks,
Christian.

>
> BR,
> -R
>
>> Cheers, Daniel
>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 10 ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 94fe51b3caa2..400d201c3c28 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -704,12 +704,14 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>>        int ret;
>>>
>>>        dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>>> -             ret = drm_sched_job_add_dependency(job, fence);
>>> -             if (ret)
>>> -                     return ret;
>>> -
>>>                /* Make sure to grab an additional ref on the added fence */
>>>                dma_fence_get(fence);
>>> +
>>> +             ret = drm_sched_job_add_dependency(job, fence);
>>> +             if (ret) {
>>> +                     dma_fence_put(fence);
>>> +                     return ret;
>>> +             }
>>>        }
>>>        return 0;
>>>   }
>>> --
>>> 2.25.1
>>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

