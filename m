Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7A1C1A0C
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 17:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ECB6ECDC;
	Fri,  1 May 2020 15:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A154E6ECD1;
 Fri,  1 May 2020 15:49:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l11so4173029lfc.5;
 Fri, 01 May 2020 08:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TEYpigawvqRYekmUHvTBKHyude1zy4qSIDermmjofq0=;
 b=B7I8d6z5k0VlDhv1Kdr65KEMHXtSyT/AHFpcRWdkyTvAFgsBD11TfkMC3yWAaGLZ9X
 i7Z0TD2Vhv8saU0IY1dGRnTTspHWp7+Kz8YfPAvC4pxTb3Q1iall4h51wdNSVPyr9GfN
 GQWYET+blUdtoF32TkRUuhrPQ7hsskkm7n7Ru36w4LFo+Xd7r2T7Ot0joKv2l/QNl8g0
 g0JV3jLNc7lMRHNMFl/e8XgUiMNNfz8hzc1Eq+zLiLXjLhpW0LyxOeqeA0ZnrwpQKunS
 NQhmDh0nh24hPl0EHrzK1Ql+ErSLMONcvWOVwxu78CmZkzawibjlJJcX+u95iCfjMGKy
 tMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TEYpigawvqRYekmUHvTBKHyude1zy4qSIDermmjofq0=;
 b=mRZvdJQNh8XUdk1DgVt9X6ml5pNZLECfJTx2pbFVWHyjw6lnWLZJveGgB6hRkoZr2o
 z8A1qN9aHA4R76HZR8zpu54WEZFOVz1V5kmDO7r8JQW8mh5lRpE5CqVq0LC7TDX38sa6
 TJ4mMqY/M0O7Q/VdAuddpLXV5JL9axOJ+gvztvUbHGt1fetVrM27hUQdhI0Abcn9/Ewk
 lqeMf7EX//r9lYZzBavWgqm8O6L5sqxvb2G/cwA2aimcT38XVJpiJF0fHf6TAigP3bSE
 G8rn0uH1yJNy0vVlzJlxnbDisSZnhoPz/DEktXxbzEXccgJZPYrY3kw+kY/Zog3vz6L0
 qngQ==
X-Gm-Message-State: AGi0Pubys9layBHvpp+s1c3Beiv9WcrmI+y+wdp7Z8LaMlvAYgE9KIqv
 laY1cUws3Y5/36/rd6u2pGswR2iyqDffeQ==
X-Google-Smtp-Source: APiQypIZ9brl9YvCAyvNpfXP3blb2AxsEk1bMk0LDNkDxAVqgKXWBmsmCcmZ/9gq0DB7VQKWOjEZZA==
X-Received: by 2002:a19:7909:: with SMTP id u9mr2927273lfc.130.1588348174592; 
 Fri, 01 May 2020 08:49:34 -0700 (PDT)
Received: from [192.168.0.103] (static-91-225-135-18.devs.futuro.pl.
 [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id w27sm2917041lfn.45.2020.05.01.08.49.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 May 2020 08:49:34 -0700 (PDT)
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
To: Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
 <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
 <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Message-ID: <520d517e-5e8f-a6c7-1c8a-38d1a368a79f@gmail.com>
Date: Fri, 1 May 2020 17:49:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.04.2020 20:30, Daniel Vetter wrote:
> On Thu, Apr 30, 2020 at 5:38 PM Sean Paul <seanpaul@chromium.org> wrote:
>>
>> On Wed, Apr 29, 2020 at 4:57 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>
>>> On Tue, 28 Apr 2020, Michal Orzel <michalorzel.eng@gmail.com> wrote:
>>>> As suggested by the TODO list for the kernel DRM subsystem, replace
>>>> the deprecated functions that take/drop modeset locks with new helpers.
>>>>
>>>> Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
>>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
>>>> index 35c2719..901b078 100644
>>>> --- a/drivers/gpu/drm/drm_mode_object.c
>>>> +++ b/drivers/gpu/drm/drm_mode_object.c
>>>> @@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>>>>  {
>>>>       struct drm_mode_obj_get_properties *arg = data;
>>>>       struct drm_mode_object *obj;
>>>> +     struct drm_modeset_acquire_ctx ctx;
>>>>       int ret = 0;
>>>>
>>>>       if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>>               return -EOPNOTSUPP;
>>>>
>>>> -     drm_modeset_lock_all(dev);
>>>> +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>>>
>>> I cry a little every time I look at the DRM_MODESET_LOCK_ALL_BEGIN and
>>> DRM_MODESET_LOCK_ALL_END macros. :(
>>>
>>> Currently only six users... but there are ~60 calls to
>>> drm_modeset_lock_all{,_ctx} that I presume are to be replaced. I wonder
>>> if this will come back and haunt us.
>>>
>>
>> What's the alternative? Seems like the options without the macros is
>> to use incorrect scope or have a bunch of retry/backoff cargo-cult
>> everywhere (and hope the copy source is done correctly).
> 
> Yeah Sean & me had a bunch of bikesheds and this is the least worst
> option we could come up with. You can't make it a function because of
> the control flow. You don't want to open code this because it's tricky
> to get right, if all you want is to just grab all locks. But it is
> magic hidden behind a macro, which occasionally ends up hurting.
> -Daniel
So what are we doing with this problem? Should we replace at once approx. 60 calls?

Michal
> 
>> Sean
>>
>>> BR,
>>> Jani.
>>>
>>>
>>>>
>>>>       obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
>>>>       if (!obj) {
>>>> @@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>>>>  out_unref:
>>>>       drm_mode_object_put(obj);
>>>>  out:
>>>> -     drm_modeset_unlock_all(dev);
>>>> +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
>>>>       return ret;
>>>>  }
>>>>
>>>> @@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
>>>>  {
>>>>       struct drm_device *dev = prop->dev;
>>>>       struct drm_mode_object *ref;
>>>> +     struct drm_modeset_acquire_ctx ctx;
>>>>       int ret = -EINVAL;
>>>>
>>>>       if (!drm_property_change_valid_get(prop, prop_value, &ref))
>>>>               return -EINVAL;
>>>>
>>>> -     drm_modeset_lock_all(dev);
>>>> +     DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>>>>       switch (obj->type) {
>>>>       case DRM_MODE_OBJECT_CONNECTOR:
>>>>               ret = drm_connector_set_obj_prop(obj, prop, prop_value);
>>>> @@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
>>>>               break;
>>>>       }
>>>>       drm_property_change_valid_put(prop, ref);
>>>> -     drm_modeset_unlock_all(dev);
>>>> +     DRM_MODESET_LOCK_ALL_END(ctx, ret);
>>>>
>>>>       return ret;
>>>>  }
>>>
>>> --
>>> Jani Nikula, Intel Open Source Graphics Center
> 
> 
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
