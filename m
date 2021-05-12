Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63E237B7C7
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 10:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDFE6E1BB;
	Wed, 12 May 2021 08:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5336E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 08:23:07 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id di13so26033863edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iszY8vNdHljOKG+soTmYyfoPe34xQRdOI4SJHhsocVI=;
 b=D1dpNmSsuh+jNIx69XafcY9PT8pn5RG2YFSXQ4ii+MyQ47Xt1JzU3hq9RKNsgar0Db
 9SJQGtBofZflXB0BgRHKPGCT2Yv4z2fYI/mQl6OnKGvheuOkAPJGgAl0PJZDPY1TNmXg
 hJS+rKQ6u6td+Wj1Z+CNhYzJkGcTUTLBwkXKDSbK2+9LT14azweNADh33+eQ9OW4z5F9
 WXnertm+xnkm9Nl8MjhBZ8Ywt5ueYNkVpVvLBtnPrxPgkcuitKHV6kZX5M6NYOrqVM49
 evhIsSHn3aLQBY/nKowIiY+//kszqdrH5GpFYmK50j2XXZWfVxWlElVRs0szqhwm/+O5
 +3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iszY8vNdHljOKG+soTmYyfoPe34xQRdOI4SJHhsocVI=;
 b=OWpPkRMfjNAHQUk6asrnDD3thzPsq2htDCoPXazfdrBjOZDm+6IzAMtdRt7HAMib8v
 HgYiiq2giKG2GIdCKqX1Zpsq2nJHamreig79D0I2wtxL+i8f/caPLdrJIBDSC/8bTVc2
 0geLk4qbaP/trvIycLgMXEfQ9a7Hh2/Vk5ONGwRITiQI5b9xuGQIFO6TfB5iVWA1iBzW
 /A6Fi0NJ64SI+p3ec0LfIWcwauxFKF7LNvRGDS21Z5jIkiSicc5m4PhRtvqLZklHfGQd
 x3TlNiE0ZApetzCmOSyBMP5Phodvgad9WINieK6v4dd8wgj8mLYJDrEr4RII5Jk5J0fN
 w1ag==
X-Gm-Message-State: AOAM5332LiX8RyhEtvbedNZFtWGz+X+XysXvJ1l5AS3cXC15gzEwP5g3
 0nW6KsWofiSfRcO/JJJCI96BjkhIs20=
X-Google-Smtp-Source: ABdhPJxNY2uV8W8OgrDRFq5inx75+PlBlE5R3Fv7RbKWGXVecGl1Pzn8DrIuguZovphibUXM5z/zQA==
X-Received: by 2002:a05:6402:312a:: with SMTP id
 dd10mr40830285edb.384.1620807786030; 
 Wed, 12 May 2021 01:23:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bc39:4e06:ac5e:2e31?
 ([2a02:908:1252:fb60:bc39:4e06:ac5e:2e31])
 by smtp.gmail.com with ESMTPSA id i25sm11615988eje.6.2021.05.12.01.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:23:05 -0700 (PDT)
Subject: Re: [RFC] Implicit vs explicit user fence sync
To: Daniel Vetter <daniel@ffwll.ch>
References: <YJFXG/THrjXqQjyN@phenom.ffwll.local>
 <d266ccd2-3259-99ce-5fd6-b8ae81ac14e9@gmail.com>
 <YJFkN/bgN6UCXdvA@phenom.ffwll.local>
 <f1616be5-a8cb-076d-a63d-9554a76b0b0a@gmail.com>
 <YJoy6oI34tQZMt6/@phenom.ffwll.local>
 <0128750d-56bf-7697-0fda-0342c7b7df17@gmail.com>
 <YJqTeQAjsr1Tn9CZ@phenom.ffwll.local>
 <a08a4b30-5ae5-49ac-bad0-c77a5cabbecd@gmail.com>
 <YJq1T8yWXSW6TRjW@phenom.ffwll.local>
 <d91f5635-9f03-d1ea-4bc5-594b42402eaa@gmail.com>
 <YJuOOVSayHwz2ug7@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fd8dc2ec-9d05-e645-759a-0426e31bd202@gmail.com>
Date: Wed, 12 May 2021 10:23:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJuOOVSayHwz2ug7@phenom.ffwll.local>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 12.05.21 um 10:13 schrieb Daniel Vetter:
> On Tue, May 11, 2021 at 09:34:11PM +0200, Christian König wrote:
>> Am 11.05.21 um 18:48 schrieb Daniel Vetter:
>>> [SNIP]
>>>> Why?
>>> If you allow implicit fencing then you can end up with
>>> - an implicit userspace fence as the in-fence
>>> - but an explicit dma_fence as the out fence
>>>
>>> Which is not allowed. So there's really no way to make this work, except
>>> if you stall in the ioctl, which also doesn't work.
>> Ok, wait a second. I really don't understand what's going on here.
>>
>> The out fence is just to let the userspace know when the frame is displayed.
>> Or rather when the old frame is no longer displayed so that it can be
>> reused, right?
>>
>> Then why does that need to be a dma_fence? We don't use that for memory
>> management anywhere, don't we?
> It can be a sync_file, so you can queue up the next rendering targeting
> the old backbuffer right away. On memory constraint devices where
> triple-buffering is prohibitive this is apparently a pretty cool trick or
> something like that.

Yeah, I'm aware of that.

But we don't really need that for device we want to interop with 
userspace queues, don't we?

>>> So you have to do an uapi change here. At that point we might as well do
>>> it right.
>> I mean in the worst case we might need to allow user fences with sync_files
>> as well when that is really used outside of Android.
>>
>> But I still don't see the fundamental problem here.
> Making sync_file use implicit is more pain, it becomes sprawling pretty
> quickly.

Agreed, but I don't see supporting sync_file and out fences as something 
necessarily.

As far as I can see we don't need to support that burden for the use 
cases we have for implicit sync.

And even if we have to it is possible to implement.

> Anyway I think we're just turning in circles. My take is that your patch
> series here demonstrates nothing beyond "adding function calls that do
> nothing is easy", the real deal is in making it work. And I think it's
> easier to make this all work with explicit userspace fencing first and
> then worry about how we maybe make this work implicitly. Instead of what
> you propose, which is rig up a lot of scaffolding without having any idea
> whether it's even in the right place. That seems very backwards to me.

And that's what I disagree on.

Supporting implicit sync in the kernel for the functionality we need to 
amdgpu is relatively easily.

Change all of userspace to not rely on implicit sync any more is really 
hard compared to that.

Dropping implicit sync in userspace has a lot of advantage and should be 
pushed for, but not because it is a prerequisite of user fences.

Regards,
Christian.

>
> Plus I really don't like retro-fitting userspace fences into implicit sync
> and sync_file and everything. But that's not the main issue I have here.
> -Daniel
>
>> Regards,
>> Christian.
>>
>>> Of course if you only care about some specific compositors (or maybe only
>>> the -amdgpu Xorg driver even) then this isn't a concern, but atomic is
>>> cross-driver so we can't do that. Or at least I don't see a way how to do
>>> this without causing endless amounts of fun down the road.
>>>
>>>>> So I have a plan here, what was yours?
>>>> As far as I see that should still work perfectly fine and I have the strong
>>>> feeling I'm missing something here.
>>>>
>>>>>> Transporting fences between processes is not the fundamental problem here,
>>>>>> but rather the question how we represent all this in the kernel?
>>>>>>
>>>>>> In other words I think what you outlined above is just approaching it from
>>>>>> the wrong side again. Instead of looking what the kernel needs to support
>>>>>> this you take a look at userspace and the requirements there.
>>>>> Uh ... that was my idea here? That's why I put "build userspace fences in
>>>>> userspace only" as the very first thing. Then extend to winsys and
>>>>> atomic/display and all these cases where things get more tricky.
>>>>>
>>>>> I agree that transporting the fences is easy, which is why it's not
>>>>> interesting trying to solve that problem first. Which is kinda what you're
>>>>> trying to do here by adding implicit userspace fences (well not even that,
>>>>> just a bunch of function calls without any semantics attached to them).
>>>>>
>>>>> So if there's more here, you need to flesh it out more or I just dont get
>>>>> what you're actually trying to demonstrate.
>>>> Well I'm trying to figure out why you see it as such a problem to keep
>>>> implicit sync around.
>>>>
>>>> As far as I can tell it is completely octagonal if we use implicit/explicit
>>>> and dma_fence/user_fence.
>>>>
>>>> It's just a different implementation inside the kernel.
>>> See above. It falls apart with the atomic ioctl.
>>> -Daniel

