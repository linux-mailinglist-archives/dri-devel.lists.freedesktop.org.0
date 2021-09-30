Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D041D6C1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 11:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069DB6EB74;
	Thu, 30 Sep 2021 09:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D8A6EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 09:48:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so7841390wmi.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 02:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jR5Y+82BsQXFsZnRKnBleC4GUmMTUbrpi/2oFJafuT0=;
 b=Qw184JB0zfT5qA6BMFsmYwIVETzwRW8RcI40nObzIbHbKHznxlgH7uj4bIT5NgFDg3
 a+gp1fkngf0+MqLm/Uss4WJojXBPedM2gWPmh7FHOkx5LdBcyfWmUaG7MZd8by8B5Znp
 3a3BcS66PltR8MU39fvpitgnNs4OXBZtAsQV7yWomvYVW1xaoZi4Jw2pekAbIJQsfzY3
 ErdAtZqR0h31pnZB4CBvKSkVFRqVN8BMliLXjILHHrT+PE+OIjTYGjYMJM+UhapEVTzJ
 QHJNae9zABjtPFLJrYNkjGjfoOS29ZUg6FwYGfYsuzIrOhhsY11oqgXDsXQX/ki0La18
 Lm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jR5Y+82BsQXFsZnRKnBleC4GUmMTUbrpi/2oFJafuT0=;
 b=jFwj7euu7n/CTrLbRKfjt7TV8c+ITYN9M6WkC5SkxjbGJYRTQKfPOyeVTODjro+YVJ
 hvHecwAWShRf0OB21XKKKUj57RYDWGAZsN1zOv1AuYytEKb5ads7NszmIpE5MmHnhZhp
 BsJXFoTrRQkyiWwqvQGHcJvg1mngoKAI1WDpOc/Cp58exSumYwQ3M8Zxk/CjjpZ3Lije
 i+VANBwTMelWN+15UO0l90Iva7ev3Ddzg4NhJlV0twoo2ICEwjDXOBm/2wYqQHjxsM9h
 QiJt94JQdpyC7mcWQO6Msm5n3XaxFckNYqonrki1iz5QWv2PRj12KuFfwm3KGeRsQ1uF
 cwMw==
X-Gm-Message-State: AOAM530gMoYavPKU11vumw2sAWGz44YKdNP6kQpLAeTA/p5jn9lZK8jv
 irTxZpUr3OPjjCJKeoEoo+h15WnzaEE=
X-Google-Smtp-Source: ABdhPJwkEIi6S1dfoppoiAkgPizrALno5aNVLEVse/8OYswD3Z4Z64S5xFDmxxvJmmrvHpF7keu3pg==
X-Received: by 2002:a05:600c:40c4:: with SMTP id
 m4mr15027686wmh.64.1632995325159; 
 Thu, 30 Sep 2021 02:48:45 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id i7sm2557134wrp.5.2021.09.30.02.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 02:48:44 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix and rework dma_buf_poll v7
To: Daniel Vetter <daniel@ffwll.ch>
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20210720131110.88512-1-christian.koenig@amd.com>
 <97ea61fb-aa20-5220-8304-e71145cc7587@daenzer.net>
 <9eca7ec8-4a33-4ddb-e4cb-295c1033aa60@gmail.com>
 <YVV8sVphD5BGeNtA@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4065f898-d31d-a5dc-8d9a-aafa0a1bed54@gmail.com>
Date: Thu, 30 Sep 2021 11:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVV8sVphD5BGeNtA@phenom.ffwll.local>
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



Am 30.09.21 um 11:00 schrieb Daniel Vetter:
> On Wed, Sep 22, 2021 at 01:08:44PM +0200, Christian König wrote:
>> Totally forgotten to ping once more about that.
>>
>> Michel has tested this now and I think we should push it ASAP. So can I get
>> an rb?
> 		spin_lock_irq(&dmabuf->poll.lock);
> 		if (dcb->active)
> 			events &= ~EPOLLIN;
> 		else
> 			dcb->active = EPOLLIN;
> 		spin_unlock_irq(&dmabuf->poll.lock);
>
>
> This pattern (and same for EPOLLOUT) makes no sense to me. I guess the
> intent is that this filters out events for which we're already listening,
> but:
>
> - it checks for any active event, not the specific one

Which is correct. We now use one dcb for EPOLLIN and another one for 
EPOLLOUT.

We could make that a boolean instead if that makes it cleaner.

> - if we're waiting already and new fences have been added, wont we miss
>    them?

No, when we are already waiting the callback will sooner or later fire 
and result in a re-check.

> Or does this all work because the poll machinery restarts everything
> again?

Yes, exactly that. Otherwise waiting for multiple fences wouldn't work 
either.

Regards,
Christian.

>
> I'm totally confused here for sure. The other changes in the patch look
> good though.
> -Daniel
>
>> Thanks,
>> Christian.
>>
>> Am 23.07.21 um 10:04 schrieb Michel Dänzer:
>>> On 2021-07-20 3:11 p.m., Christian König wrote:
>>>> Daniel pointed me towards this function and there are multiple obvious problems
>>>> in the implementation.
>>>>
>>>> First of all the retry loop is not working as intended. In general the retry
>>>> makes only sense if you grab the reference first and then check the sequence
>>>> values.
>>>>
>>>> Then we should always also wait for the exclusive fence.
>>>>
>>>> It's also good practice to keep the reference around when installing callbacks
>>>> to fences you don't own.
>>>>
>>>> And last the whole implementation was unnecessary complex and rather hard to
>>>> understand which could lead to probably unexpected behavior of the IOCTL.
>>>>
>>>> Fix all this by reworking the implementation from scratch. Dropping the
>>>> whole RCU approach and taking the lock instead.
>>>>
>>>> Only mildly tested and needs a thoughtful review of the code.
>>>>
>>>> v2: fix the reference counting as well
>>>> v3: keep the excl fence handling as is for stable
>>>> v4: back to testing all fences, drop RCU
>>>> v5: handle in and out separately
>>>> v6: add missing clear of events
>>>> v7: change coding style as suggested by Michel, drop unused variables
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> CC: stable@vger.kernel.org
>>> Working fine with https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1880
>>>
>>> Tested-by: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>>

