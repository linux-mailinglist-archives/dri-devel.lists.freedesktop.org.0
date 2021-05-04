Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B594372935
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 12:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55889A56;
	Tue,  4 May 2021 10:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488E2898A7;
 Tue,  4 May 2021 10:53:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id u3so12423164eja.12;
 Tue, 04 May 2021 03:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wQdYTgH29HheOw4SCGlT4xJEO5JuskR2X3UT8Oe4GF8=;
 b=eCH9n7K5eWSjs6RhXe30ITwcf87UrofIEiMjmN69qFS+j8M6PL2IiDBvftOfoMNZ01
 pVnPqPwAHbMG9htGIpXyfVgMorjNiN4VE0P8AgFERqDq/f01Ltz7j7toFiwoZsYn6y+T
 pKthyNDtu/WLEdRKkf16pliBPEY4v2KCFaRsF7J9BX147Z+mR9m2atAcQp44wWqIHalk
 64GCyNdewZ4ZqfcbOu1Q3awg53nA7PwV097CemWpZxj+17zoTYMnSEGRDoE8Hbf0ObZQ
 S6DUOt9/e/U43OUuoSQbPB3x/Fx6BW2OYFqFk5AO656dLF7Xc4nUL6P7QqGdUVYMDYUn
 eVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wQdYTgH29HheOw4SCGlT4xJEO5JuskR2X3UT8Oe4GF8=;
 b=QywBiWYP4tVCjmwe5jooNHy2PTIKwy2mWjhVWituFVJhJrcneilw5Ef4ByKjvkA5a0
 fE3O3l1SZJC7MEGA5pFO516QLBs/NuIs8wXrGL1IkjvvefZu/vrZTqMdaQSrXxaX8kKP
 axAGojzX0z3MKJlt+bgssbKT+3WoAWMszU6/4pytKrLNc/I14sdz8CZBGw7ygfRc5ZI+
 jAxktIdUSxI3CGKKJsXt3RT0wY3bxHxxrM+u7EfzLQj+IklO7oT+IfKlsMSEQpRq8jBY
 sAxLa0SH/U+FosO29Hw2eCi/lqz1bAtay95PaWG8Ee0nLVYCDrAH0ZgE2IKTvup0dpKG
 uTeA==
X-Gm-Message-State: AOAM531KVUSWoulkrFvVDRh3qi+Xhw130HbMaePWL3Evc2a8sUkD3uJz
 iMIWZ6klIaOSm5SmeOJgzWMLTYvU/mY=
X-Google-Smtp-Source: ABdhPJyL0kRZwCy+Wb5QsK8WluwFzk6vMIq8QJwmg2FtfUr3MvZeM+nAtH97fZiXL/vd0GciTOdCzA==
X-Received: by 2002:a17:906:8468:: with SMTP id
 hx8mr21443488ejc.18.1620125620950; 
 Tue, 04 May 2021 03:53:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:36d2:ff0f:67e9:929c?
 ([2a02:908:1252:fb60:36d2:ff0f:67e9:929c])
 by smtp.gmail.com with ESMTPSA id gt35sm1187509ejc.57.2021.05.04.03.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 03:53:40 -0700 (PDT)
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
To: Daniel Vetter <daniel@ffwll.ch>
References: <CAOFGe961tB38dE=gzte4OTGNMOpUsW2ikrB03+t=eh4pDYFh5g@mail.gmail.com>
 <CAP+8YyGkP2n9v2mJM5UH4NJrA6bE9+2Bgs1-6HrPPPMCrFz9dw@mail.gmail.com>
 <CAOFGe94JAO0OBiiwp8+hd=XCsrGLA1fVxqxePtPdHFg+YBB0dg@mail.gmail.com>
 <CAAxE2A50Lg+ehW3LSiTnvGRqHTR8tW77V7wES1PaCnbHVkzMug@mail.gmail.com>
 <CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com>
 <1bd8105b-4a2a-2ad9-0b3c-a81590282f2e@gmail.com>
 <YJD4pt0r+TWAYfX5@phenom.ffwll.local>
 <9ccfe4b2-91f0-b8e5-6327-bf3c8b6d1a24@gmail.com>
 <CAKMK7uErXQ2O2RH4qqUVqYzw3jqJT2JwfCiXVZfu0U7HPKwYGA@mail.gmail.com>
 <a0c38808-3651-a3de-c4c4-2f4e5bf6fde7@gmail.com>
 <YJEYQnSb6m2df6YN@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7227e6fb-1108-1096-ab2c-017d6422e90b@gmail.com>
Date: Tue, 4 May 2021 12:53:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJEYQnSb6m2df6YN@phenom.ffwll.local>
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
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.05.21 um 11:47 schrieb Daniel Vetter:
> [SNIP]
>> Yeah, it just takes to long for the preemption to complete to be really
>> useful for the feature we are discussing here.
>>
>> As I said when the kernel requests to preempt a queue we can easily expect a
>> timeout of ~100ms until that comes back. For compute that is even in the
>> multiple seconds range.
> 100ms for preempting an idle request sounds like broken hw to me. Of
> course preemting something that actually runs takes a while, that's
> nothing new. But it's also not the thing we're talking about here. Is this
> 100ms actual numbers from hw for an actual idle ringbuffer?

Well 100ms is just an example of the scheduler granularity. Let me 
explain in a wider context.

The hardware can have X queues mapped at the same time and every Y time 
interval the hardware scheduler checks if those queues have changed and 
only if they have changed the necessary steps to reload them are started.

Multiple queues can be rendering at the same time, so you can have X as 
a high priority queue active and just waiting for a signal to start and 
the client rendering one frame after another and a third background 
compute task mining bitcoins for you.

As long as everything is static this is perfectly performant. Adding a 
queue to the list of active queues is also relatively simple, but taking 
one down requires you to wait until we are sure the hardware has seen 
the change and reloaded the queues.

Think of it as an RCU grace period. This is simply not something which 
is made to be used constantly, but rather just at process termination.

>> The "preemption" feature is really called suspend and made just for the case
>> when we want to put a process to sleep or need to forcefully kill it for
>> misbehavior or stuff like that. It is not meant to be used in normal
>> operation.
>>
>> If we only attach it on ->move then yeah maybe a last resort possibility to
>> do it this way, but I think in that case we could rather stick with kernel
>> submissions.
> Well this is a hybrid userspace ring + kernel augmeted submit mode, so you
> can keep dma-fences working. Because the dma-fence stuff wont work with
> pure userspace submit, I think that conclusion is rather solid. Once more
> even after this long thread here.

When assisted with unload fences, then yes. Problem is that I can't see 
how we could implement those performant currently.

>>> Also, if userspace lies to us and keeps pushing crap into the ring
>>> after it's supposed to be idle: Userspace is already allowed to waste
>>> gpu time. If you're too worried about this set a fairly aggressive
>>> preempt timeout on the unload fence, and kill the context if it takes
>>> longer than what preempting an idle ring should take (because that
>>> would indicate broken/evil userspace).
>> I think you have the wrong expectation here. It is perfectly valid and
>> expected for userspace to keep writing commands into the ring buffer.
>>
>> After all when one frame is completed they want to immediately start
>> rendering the next one.
> Sure, for the true userspace direct submit model. But with that you don't
> get dma-fence, which means this gpu will not work for 3d accel on any
> current linux desktop.

I'm not sure of that. I've looked a bit into how we could add user 
fences to dma_resv objects and that isn't that hard after all.

> Which sucks, hence some hybrid model of using the userspace ring and
> kernel augmented submit is needed. Which was my idea.

Yeah, I think when our firmware folks would really remove the kernel 
queue and we still don't have

>
>> [SNIP]
>> Can't find that of hand either, but see the amdgpu_noretry module option.
>>
>> It basically tells the hardware if retry page faults should be supported or
>> not because this whole TLB shutdown thing when they are supported is
>> extremely costly.
> Hm so synchronous tlb shootdown is a lot more costly when you allow
> retrying of page faults?

Partially correct, yes.

See when you have retry page faults enabled and unmap something you need 
to make sure that everybody which could have potentially translated that 
page and has a TLB is either invalidated or waited until the access is 
completed.

Since every CU could be using a memory location that takes ages to 
completed compared to the normal invalidation where you just invalidate 
the L1/L2 and are done.

Additional to that the recovery adds some extra overhead to every memory 
access, so even without a fault you are quite a bit slower if this is 
enabled.

> That sounds bad, because for full hmm mode you need to be able to retry
> pagefaults. Well at least the PASID/ATS/IOMMU side will do that, and might just
> hang your gpu for a long time while it's waiting for the va->pa lookup
> response to return. So retrying lookups shouldn't be any different really.
>
> And you also need fairly fast synchronous tlb shootdown for hmm. So if
> your hw has a problem with both together that sounds bad.

Completely agree. And since it was my job to validate the implementation 
on Vega10 I was also the first one to realize that.

Felix, a couple of others and me are trying to work around those 
restrictions ever since.

> I was more thinking about handling it all in the kernel.
> Yeah can do, just means that you also have to copy the ringbuffer stuff
> over from userspace to the kernel.

That is my least worry. The IBs are just addr+length., so no more than 
16 bytes for each IB.

> It also means that there's more differences in how your userspace works
> between full userspace mode (necessary for compute) and legacy dma-fence
> mode (necessary for desktop 3d). Which is especially big fun for vulkan,
> since that will have to do both.

That is the bigger problem.

Christian.

>
> But then amd is still hanging onto the amdgpu vs amdkfd split, so you're
> going for max pain in this area anyway :-P
> -Daniel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
