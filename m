Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A236D5D6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 12:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E326EB0C;
	Wed, 28 Apr 2021 10:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413436E08A;
 Wed, 28 Apr 2021 10:31:12 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id u3so15178457eja.12;
 Wed, 28 Apr 2021 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=joTCEohNslveZzr+oPjM5Jv8Vwdj9WSb/UsT64SABK4=;
 b=a5RPbm3kcfUxQxVEncfzLqN1V00neO4b1R2XQRDuvj0SrcxWnp5m7sMkPUfaI13W67
 dQ+xllw9gLdQCHeiFtEQdW6/5QciColUhOLOCui0z3nD/EUaNxPnE98bjtCCXLwPPtFz
 ac1u348zNbcwKq4Xkj6l/EfyiVorb3PBFbdwTq9DG7Yb8jG7+0SY+Lwwmq1d6hipXkLL
 0C+g+Qi6KaJRWmAJUVw+tNUAv5/t9ZALO0DsJcdbV+IMrMEEozWsc0ddCMQ0z52RCVak
 m4QOEstO/P8dmDWFv5mL/ZnnTBKAvf2YPWWtZJcpAPWVBjmmro5VXjUy+rTT38fbZ4lN
 jeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=joTCEohNslveZzr+oPjM5Jv8Vwdj9WSb/UsT64SABK4=;
 b=PI6xs3d5srRPRX6OrssEagIuO8AnBNmWPNspFBQ7GhesLRRBDeVm/woEzcIeMp56J4
 FYmvG6Yxdw4PM7Y9TUN/EdkfJvK9kBXGFmYwApXSOoPq60EpRxy0We/NSRj467DfZPJy
 R1/ER6PUQ1QvjiFXRHmVhP5Sw5coJ8TF+AbBLdcimXSTIbGxCLREbTvDUHeAmLOUv6tO
 H3PH6OMy8dQuajjsDya0gonzB9kObHg5Rg+pSb2mRaWn4lYm32Uq5FNKWb3yWNOEIMFn
 k8Nny7mwpOdTOOa07gYyLLQkkMbH1mNkOdq85Z9uePO97LB15fcQ3RtbjdErmMt7pLOD
 p5gA==
X-Gm-Message-State: AOAM5337z1mi9zEI3kdCskXVpfZgrAjrMSSKQ5F1EeitL3USMzKou/Wi
 2vTL7ucnuTQRBb2/I23n33ugH+mRgNo=
X-Google-Smtp-Source: ABdhPJw/YL0nyxRCsy7LW5N0aQhzJLqOJhMvGVH7g/wWKlL2HXw+6qLqcB+3V8PRCszq5iCEi5K0Gg==
X-Received: by 2002:a17:906:c453:: with SMTP id
 ck19mr1994768ejb.439.1619605870926; 
 Wed, 28 Apr 2021 03:31:10 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c?
 ([2a02:908:1252:fb60:3f0d:4946:a7a8:ad7c])
 by smtp.gmail.com with ESMTPSA id s20sm4434906edu.93.2021.04.28.03.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:31:10 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <CAAxE2A6APcJBwnbq58HOqc5bkHMsrzpiNnrso85kfBkRowwz+g@mail.gmail.com>
 <fada1543-612d-369e-765c-f90b718c2cfa@gmail.com>
 <CAAxE2A7a5+q2j1txN-FxWBvKOoPSRKAZ9iPPeTSjMZDbgJCU-A@mail.gmail.com>
 <CAKMK7uHXSnDetsK1VG-X4ZwUZdA819wUKd=YMgqF=yvAQ6Y2vw@mail.gmail.com>
 <CAAxE2A4BhDZL2rrV1KEXPzmKnOq4DXmkFm=4K5XZoY-Cj0uT=Q@mail.gmail.com>
 <735e0d2e-f2c9-c546-ea6c-b5bbb0fe03a6@gmail.com>
 <CAAxE2A4FwZ11_opL++TPUViTOD6ZpV5b3MR+rTDUPvzqYz-oeQ@mail.gmail.com>
 <23ea06c825279c7a9f7678b335c7f89437d387ed.camel@pengutronix.de>
 <s8QVKcJeMhEBcoOS9h7UzE_fUG-VKfgso3HbaM37xGhbBu6i966cTiD_UY1lBbiOMl-VbGyu7r0eBS3vTY8DWSUItsLrf_ISzDuT9vbRs8I=@emersion.fr>
 <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
Date: Wed, 28 Apr 2021 12:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIkzewghZOdMXwfi@phenom.ffwll.local>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.04.21 um 12:05 schrieb Daniel Vetter:
> On Tue, Apr 27, 2021 at 02:01:20PM -0400, Alex Deucher wrote:
>> On Tue, Apr 27, 2021 at 1:35 PM Simon Ser <contact@emersion.fr> wrote:
>>> On Tuesday, April 27th, 2021 at 7:31 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
>>>
>>>>> Ok. So that would only make the following use cases broken for now:
>>>>>
>>>>> - amd render -> external gpu
>>>>> - amd video encode -> network device
>>>> FWIW, "only" breaking amd render -> external gpu will make us pretty
>>>> unhappy
>>> I concur. I have quite a few users with a multi-GPU setup involving
>>> AMD hardware.
>>>
>>> Note, if this brokenness can't be avoided, I'd prefer a to get a clear
>>> error, and not bad results on screen because nothing is synchronized
>>> anymore.
>> It's an upcoming requirement for windows[1], so you are likely to
>> start seeing this across all GPU vendors that support windows.  I
>> think the timing depends on how quickly the legacy hardware support
>> sticks around for each vendor.
> Yeah but hw scheduling doesn't mean the hw has to be constructed to not
> support isolating the ringbuffer at all.
>
> E.g. even if the hw loses the bit to put the ringbuffer outside of the
> userspace gpu vm, if you have pagetables I'm seriously hoping you have r/o
> pte flags. Otherwise the entire "share address space with cpu side,
> seamlessly" thing is out of the window.
>
> And with that r/o bit on the ringbuffer you can once more force submit
> through kernel space, and all the legacy dma_fence based stuff keeps
> working. And we don't have to invent some horrendous userspace fence based
> implicit sync mechanism in the kernel, but can instead do this transition
> properly with drm_syncobj timeline explicit sync and protocol reving.
>
> At least I think you'd have to work extra hard to create a gpu which
> cannot possibly be intercepted by the kernel, even when it's designed to
> support userspace direct submit only.
>
> Or are your hw engineers more creative here and we're screwed?

The upcomming hardware generation will have this hardware scheduler as a 
must have, but there are certain ways we can still stick to the old 
approach:

1. The new hardware scheduler currently still supports kernel queues 
which essentially is the same as the old hardware ring buffer.

2. Mapping the top level ring buffer into the VM at least partially 
solves the problem. This way you can't manipulate the ring buffer 
content, but the location for the fence must still be writeable.

For now and the next hardware we are save to support the old submission 
model, but the functionality of kernel queues will sooner or later go 
away if it is only for Linux.

So we need to work on something which works in the long term and get us 
away from this implicit sync.

Christian.

> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
