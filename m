Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48741D8CF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 13:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933A6EB75;
	Thu, 30 Sep 2021 11:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36956EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 11:32:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i23so9534087wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=I9m+LpPgX6sw98l/+OTr/2ET4wdvLI1sP/9/vKh1dUQ=;
 b=UemUoFAMgmT392fKH3UnzKlJpEuIBMMGrGUI7g7r4p08OtX7j1BcoYKtvVGBLQ+NLb
 4phBrP59g0VxRRxG1g0nPsqDZSFZVHYJmbISaHXRWc27hs+bg+cdzefwiYulrwcIdiYs
 Zzcc7sM70JdzuIVbRPsMoSURM/P19QPVS7GGpJ1xTocmQz4r8cetoCz2UnHkC0tqxpU0
 CXAtSrIZaaa3ARvlXarhprwhzVgUkvFIEhlQZ08GbGZ0TbN+HZd+nKUFbhrqy6keZA1W
 +npYQwoV6cyLhsg3px9sKYTiCsPYKD8D0XZyNVtUn1f+LjzwHftBL9V3sgzzbQ4tG/fA
 WFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=I9m+LpPgX6sw98l/+OTr/2ET4wdvLI1sP/9/vKh1dUQ=;
 b=b2A4c4jgFXwsioPjzfzAMdhNeJgOh7Slr2OB51XceEzFMukTCmR5hNUS6uk+IZX4El
 9ZyHhMfSqjHWII9/zZy1Rigx4PIDjUhtG8CaI8fByqZT0NpyohGEmY2lbvcvQ115O58u
 l+CpteyyH4U8u+75H88R77logG+w66NU5Vk0hsTYb1mNg+gqUoF1MEZEJ0007YOROt//
 00wUkHbJq82/5pCAUM38E7ZQjyiAj7YojpJzuLEcByOzwN7zPzWKhWxO/i4dwmpk6hZK
 qFNt5MuiUqSalaOGgEpAhRgrN6dRhAt21woIHlORpjlJ/3O6WVBILmjsb97C0fK3Ald7
 TGVA==
X-Gm-Message-State: AOAM530PYFk0C7hxHM6mm/vkqWmzlcUETKu+V04NSMjdFsVwCMGEmEt2
 xsF7oMimQUIs7i7gHjIHR0v2211QWik=
X-Google-Smtp-Source: ABdhPJxDR48XPMZD47gbHFX3MJUaoIdDBwC40zPmOpIdCqR3pDu+yjLHqQ45onHUQ+/JGMSPAladIQ==
X-Received: by 2002:a5d:4a4a:: with SMTP id v10mr5623615wrs.306.1633001550165; 
 Thu, 30 Sep 2021 04:32:30 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id s3sm2765180wrm.40.2021.09.30.04.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 04:32:29 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
To: Daniel Vetter <daniel@ffwll.ch>
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
 <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
 <YVV8sVphD5BGeNtA@phenom.ffwll.local>
 <4065f898-d31d-a5dc-8d9a-aafa0a1bed54@gmail.com>
 <YVWQ2HDhoqNBQ/2d@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7671dea5-f8f1-4988-e121-a1cd261a717f@gmail.com>
Date: Thu, 30 Sep 2021 13:32:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWQ2HDhoqNBQ/2d@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.09.21 um 12:26 schrieb Daniel Vetter:
> On Thu, Sep 30, 2021 at 11:48:42AM +0200, Christian König wrote:
>>
>> Am 30.09.21 um 11:00 schrieb Daniel Vetter:
>>> On Wed, Sep 22, 2021 at 01:08:44PM +0200, Christian König wrote:
>>>> Totally forgotten to ping once more about that.
>>>>
>>>> Michel has tested this now and I think we should push it ASAP. So can I get
>>>> an rb?
>>> 		spin_lock_irq(&dmabuf->poll.lock);
>>> 		if (dcb->active)
>>> 			events &= ~EPOLLIN;
>>> 		else
>>> 			dcb->active = EPOLLIN;
>>> 		spin_unlock_irq(&dmabuf->poll.lock);
>>>
>>>
>>> This pattern (and same for EPOLLOUT) makes no sense to me. I guess the
>>> intent is that this filters out events for which we're already listening,
>>> but:
>>>
>>> - it checks for any active event, not the specific one
>> Which is correct. We now use one dcb for EPOLLIN and another one for
>> EPOLLOUT.
>>
>> We could make that a boolean instead if that makes it cleaner.
> Ha yes I missed that. Boolean sounds much better.
>>> - if we're waiting already and new fences have been added, wont we miss
>>>     them?
>> No, when we are already waiting the callback will sooner or later fire and
>> result in a re-check.
>>
>>> Or does this all work because the poll machinery restarts everything
>>> again?
>> Yes, exactly that. Otherwise waiting for multiple fences wouldn't work
>> either.
> Ok with that clarified can you cut a v8 with booleans and I whack an r-b
> on that? Or just include it, I'm massively burried here and trying to dig
> out :-/
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (with the booleans)

My bad, boolean won't work because we also use the flags for the call to 
"wake_up_locked_poll(dcb->poll, dcb->active);".

Anyway that doesn't really change anything on the logic and I inherited 
that handling from the existing code, just moved it around a bit.

Christian.

>
> -Daniel
>> Regards,
>> Christian.
>>
>>> I'm totally confused here for sure. The other changes in the patch look
>>> good though.
>>> -Daniel
>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> Am 23.07.21 um 10:04 schrieb Michel Dänzer:
>>>>> On 2021-07-20 3:11 p.m., Christian König wrote:
>>>>>> Daniel pointed me towards this function and there are multiple obvious problems
>>>>>> in the implementation.
>>>>>>
>>>>>> First of all the retry loop is not working as intended. In general the retry
>>>>>> makes only sense if you grab the reference first and then check the sequence
>>>>>> values.
>>>>>>
>>>>>> Then we should always also wait for the exclusive fence.
>>>>>>
>>>>>> It's also good practice to keep the reference around when installing callbacks
>>>>>> to fences you don't own.
>>>>>>
>>>>>> And last the whole implementation was unnecessary complex and rather hard to
>>>>>> understand which could lead to probably unexpected behavior of the IOCTL.
>>>>>>
>>>>>> Fix all this by reworking the implementation from scratch. Dropping the
>>>>>> whole RCU approach and taking the lock instead.
>>>>>>
>>>>>> Only mildly tested and needs a thoughtful review of the code.
>>>>>>
>>>>>> v2: fix the reference counting as well
>>>>>> v3: keep the excl fence handling as is for stable
>>>>>> v4: back to testing all fences, drop RCU
>>>>>> v5: handle in and out separately
>>>>>> v6: add missing clear of events
>>>>>> v7: change coding style as suggested by Michel, drop unused variables
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> CC: stable@vger.kernel.org
>>>>> Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
>>>>>
>>>>> Tested-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>>
>>>>>

