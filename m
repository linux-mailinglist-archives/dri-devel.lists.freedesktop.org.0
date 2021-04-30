Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0636F790
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FE16E059;
	Fri, 30 Apr 2021 09:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D126E059;
 Fri, 30 Apr 2021 09:08:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g10so13823570edb.0;
 Fri, 30 Apr 2021 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8FUZDadxEuxBXb6t3fDC3QeRuDjVqZqXKJA4O1+YJp4=;
 b=mQbSh/QIrovtDDRT0+YYG5N20+y2zcoN9+7PyTGdCZXxvdUNRzCXhzh7q7XFGtBUL3
 QekleW/QX4eIxIxnEylMRNMt2rgb9byKG0Kdz1/oO7GNwSs6+j9J9Vq9ZXJmQz8dbZbt
 CxUp5SO4CHiuJ4q3plqN52iWEfSxdVupH7Zj9HjxvlPwERkcC99d4JIHTaFUJXfOEaUJ
 P7dhH1/a0XhHfT1iSXyzqgkZKfJH/xUASqMmKZa2E6BI+HTeQ18x1os7SmG8/ERxNdbE
 F1Jn7Guwg+SUpnsXVua8kLAsu+/zQRidQpPRUcDRTxfMsF7HyapYoE2Jzr/WBVGjRM5/
 QBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8FUZDadxEuxBXb6t3fDC3QeRuDjVqZqXKJA4O1+YJp4=;
 b=Jzfqdd/WzoS/V5JawZ7fMd99/3Z+1cmjJWtdszomAXNqbLF9xwoApni4m7AT11l4dX
 OYZGAYFB1LJidr88CZcsFuQ4NdGiqa+De/dx3/OQz6/St1NBfqsFF1zhPasRdPc39+F2
 2v3IrZA7A7S7UyF80ymEqYc4cCxS6yWzQcfOxgwW0QqhR3BTv/AzfWE5ZC7GVWu7l+8y
 Ps25C/3pKrHk9tpMY0T9+b7u14bO3W2ojPvKvs08Mh8OvIvd8qsn2phPzQ2dSk1yQu5P
 2KdNLoE5bRuqwd3RXN5gIPECtj3f+k/8jX+nHhauWqJFZDOcW/G4y7RrgRHZE4+vZVPI
 Lutg==
X-Gm-Message-State: AOAM533gHyG0yOjeYvzDjfSH9QQCEp7nkIA75w/1iie0boglFGahKHM7
 Pt3MncD2SoadCyg1ar0+zeEHcsNScpQ=
X-Google-Smtp-Source: ABdhPJyQNbf9GPdlixNfjXnwZ0WMwiOyvS9+SruBGn3D3LgGVJZo8d0oz3w2bfuEptxfutItz8QyFw==
X-Received: by 2002:a05:6402:1a38:: with SMTP id
 be24mr4615279edb.293.1619773680137; 
 Fri, 30 Apr 2021 02:08:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:aa4a:1229:bd1a:d432?
 ([2a02:908:1252:fb60:aa4a:1229:bd1a:d432])
 by smtp.gmail.com with ESMTPSA id y20sm816897edw.45.2021.04.30.02.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 02:07:59 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
References: <CADnq5_PEMvF7Gd4qug=FjfTtxOtygw7SO73HjhSh5AyEramtkA@mail.gmail.com>
 <YIkzewghZOdMXwfi@phenom.ffwll.local>
 <19ca36c3-306e-5021-0243-3289c38ef067@gmail.com>
 <YIlTYjNv5RI5GuiN@phenom.ffwll.local> <YIlUWdxyXGQgHFj+@phenom.ffwll.local>
 <72f21ab9-9376-b366-2b69-94ea65e332c1@gmail.com>
 <YIlkgRDQDe+E558E@phenom.ffwll.local>
 <f6ec3ce6-2efe-cd76-4a54-aba6c8d0cc4c@gmail.com>
 <YIlykcjDV9ckeyyG@phenom.ffwll.local>
 <CADnq5_MJgq40-YscW8bDmUkb_WyuZOXPtdm2ErEyvmnv=2pBHQ@mail.gmail.com>
 <YIqUp6WpkbHJltZm@phenom.ffwll.local>
 <CAKMK7uHQ44O_yyuveqYAwTejezJ3HC84fcosnq-bSgBWy_ShOw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <06fab310-afb6-c720-a2e7-d8e3d70f81b8@gmail.com>
Date: Fri, 30 Apr 2021 11:07:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHQ44O_yyuveqYAwTejezJ3HC84fcosnq-bSgBWy_ShOw@mail.gmail.com>
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

Am 30.04.21 um 10:58 schrieb Daniel Vetter:
> [SNIP]
>>> When the user allocates usermode queues, the kernel driver sets up a
>>> queue descriptor in the kernel which defines the location of the queue
>>> in memory, what priority it has, what page tables it should use, etc.
>>> User mode can then start writing commands to its queues.  When they
>>> are ready for the hardware to start executing them, they ring a
>>> doorbell which signals the scheduler and it maps the queue descriptors
>>> to HW queue slots and they start executing.  The user only has access
>>> to it's queues and any buffers it has mapped in it's GPU virtual
>>> address space.  While the queues are scheduled, the user can keep
>>> submitting work to them and they will keep executing unless they get
>>> preempted by the scheduler due to oversubscription or a priority call
>>> or a request from the kernel driver to preempt, etc.
>> Yeah, works like with our stuff.
>>
>> I don't see a problem tbh. It's slightly silly going the detour with the
>> kernel ioctl, and it's annoying that you still have to use drm/scheduler
>> to resolve dependencies instead of gpu semaphores and all that. But this
>> only applies to legacy winsys mode, compute (e.g. vk without winsys) can
>> use the full power. Just needs a flag or something when setting up the
>> context.
>>
>> And best part is that from hw pov this really is indistinguishable from
>> the full on userspace submit model.
>>
>> The thing where it gets annoying is when you use one of these new cpu
>> instructions which do direct submit to hw and pass along the pasid id
>> behind the scenes. That's truly something you can't intercept anymore in
>> the kernel and fake the legacy dma_fence world.
>>
>> But what you're describing here sounds like bog standard stuff, and also
>> pretty easy to keep working with exactly the current model.
>>
>> Ofc we'll want to push forward a more modern model that better suits
>> modern gpus, but I don't see any hard requirement here from the hw side.
> Adding a bit more detail on what I have in mind:
>
> - memory management works like amdgpu does today, so all buffers are
> pre-bound to the gpu vm, we keep the entire bo set marked as busy with
> the bulk lru trick for every command submission.
>
> - for the ringbuffer, userspace allcoates a suitably sized bo for
> ringbuffer, ring/tail/seqno and whatever else it needs
>
> - userspace then asks the kernel to make that into a hw context, with
> all the priviledges setup. Doorbell will only be mapped into kernel
> (hw can't tell the difference anyway), but if it happens to also be
> visible to userspace that's no problem. We assume userspace can ring
> the doorbell anytime it wants to.

This doesn't work in hardware. We at least need to setup a few registers 
and memory locations from inside the VM which userspace shouldn't have 
access to when we want the end of batch fence and ring buffer start to 
be reliable.

> - we do double memory management: One dma_fence works similar to the
> amdkfd preempt fence, except it doesn't preempt but does anything
> required to make the hw context unrunnable and take it out of the hw
> scheduler entirely. This might involve unmapping the doorbell if
> userspace has access to it.
>
> - but we also do classic end-of-batch fences, so that implicit fencing
> and all that keeps working. The "make hw ctx unrunnable" fence must
> also wait for all of these pending submissions to complete.

This together doesn't work from the software side, e.g. you can either 
have preemption fences or end of batch fences but never both or your end 
of batch fences would have another dependency on the preemption fences 
which we currently can't express in the dma_fence framework.

Additional to that it can't work from the hardware side because we have 
a separation between engine and scheduler on the hardware side. So we 
can't reliable get a signal inside the kernel that a batch has completed.

What we could do is to get this signal in userspace, e.g. userspace 
inserts the packets into the ring buffer and then the kernel can read 
the fence value and get the IV.

But this has the same problem as user fences because it requires the 
cooperation of userspace.

We just yesterday had a meeting with the firmware developers to discuss 
the possible options and I now have even stronger doubts that this is 
doable.

We either have user queues where userspace writes the necessary commands 
directly to the ring buffer or we have kernel queues. A mixture of both 
isn't supported in neither the hardware nor the firmware.

Regards,
Christian.

>
> - for the actual end-of-batchbuffer dma_fence it's almost all faked,
> but with some checks in the kernel to keep up the guarantees. cs flow
> is roughly
>
> 1. userspace directly writes into the userspace ringbuffer. It needs
> to follow the kernel's rule for this if it wants things to work
> correctly, but we assume evil userspace is allowed to write whatever
> it wants to the ring, and change that whenever it wants. Userspace
> does not update ring head/tail pointers.
>
> 2. cs ioctl just contains: a) head (the thing userspace advances, tail
> is where the gpu consumes) pointer value to write to kick of this new
> batch b) in-fences b) out-fence.
>
> 3. kernel drm/scheduler handles this like any other request and first
> waits for the in-fences to all signal, then it executes the CS. For
> execution it simply writes the provided head value into the ring's
> metadata, and rings the doorbells. No checks. We assume userspace can
> update the tail whenever it feels like, so checking the head value is
> pointless anyway.
>
> 4. the entire correctness is only depending upon the dma_fences
> working as they should. For that we need some very strict rules on
> when the end-of-batchbuffer dma_fence signals:
> - the drm/scheduler must have marked the request as runnable already,
> i.e. all dependencies are fullfilled. This is to prevent the fences
> from signalling in the wrong order.
> - the fence from the previous batch must have signalled already, again
> to guarantee in-order signalling (even if userspace does something
> stupid and reorders how things complete)
> - the fence must never jump back to unsignalled, so the lockless
> fastpath that just checks the seqno is a no-go
>
> 5. if drm/scheduler tdr decides it's taking too long we throw the
> entire context away, forbit further command submission on it (through
> the ioctl, userspace can keep writing to the ring whatever it wants)
> and fail all in-flight buffers with an error. Non-evil userspace can
> then recover by re-creating a new ringbuffer with everything.
>
> I've pondered this now for a bit and I really can't spot the holes.
> And I think it should all work, both for hw and kernel/legacy
> dma_fence use-case.
> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
