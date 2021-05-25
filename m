Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0316390493
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 17:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82E16E3D6;
	Tue, 25 May 2021 15:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A146E332;
 Tue, 25 May 2021 15:05:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n2so32717197wrm.0;
 Tue, 25 May 2021 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CKoXGyslE6M6RL+R6vgHNQupraaOZlJBn/oOrMJmfhQ=;
 b=LVwIEhlG7af57sMrQx+FWyLyOqlOl+4XeVz4yPKrMbX2jR0TKxClpt9pg9McxKh74Y
 G6f6WwDfEg/CVQ/r9+dMklSxu1BwQLKYrWu3Geum/fCXGKpCoOip7fWNop/XY98N/y7v
 LptUTUV2dn5Nt3rXHy9UUxhgAoEcEwxLSnZ0W6aerDf1m/XrrT3SM9KvX6btfDfuqixp
 YEjpFyr53GSiTfVGJejAm4qepEz2deUNdDkm8s+qhr/IwuCGUIaWIE9j402aIXjsEFD4
 XFhx8vPgbUaIK1H8rK6D2ejNv1ywr/xtdh5+5mINqCTz/yRLfFXa9ubNc9ANMb5uVF4r
 g29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CKoXGyslE6M6RL+R6vgHNQupraaOZlJBn/oOrMJmfhQ=;
 b=GDX4E3PpuQPrBxdRtf/WSPvYEmp4Mun3yaAsZ0In24MyQBh8vGoqpwe53N4dmcW7N6
 3ait5rpF2dpucEIvFyxV5WeFthISutxMddsO+9XPdKfcoIuJFMOjB1ZGf5PFDlMEuVJs
 OUwgML4P3EPbEsi7awt1PhNjw4r6bcyGvCv6hqAO5sv+4aHmY3UBotRqFIPldjIbxDlM
 1KCzmIhY2SbAQBHjf8u6BU2OQ8naPTINTFrvfZveqBYKnYRCzgVRTjfDayZ1V9d8Ehp8
 j4c4hJUCHNc5exje0N/2mDRONDYL0Po6tHjimbCtZ+5AbBm0MzLVhbCFBzZZgTfWTT2F
 Cifg==
X-Gm-Message-State: AOAM5320v2/8UhdTbqGQeaMwCHBIlV9w1BFMPrjaTe80DeTauTAuKZ5p
 xTiPntAjFW+MdWM7A/a7e14=
X-Google-Smtp-Source: ABdhPJx69Qi+fuPQhhZMUKVE4qE4kdNaLlgOBNjPH43GtFSXkySI09rvRb98zd/kUh7urlTCzHU8ag==
X-Received: by 2002:adf:e991:: with SMTP id h17mr27615093wrm.265.1621955121683; 
 Tue, 25 May 2021 08:05:21 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1?
 ([2a02:908:1252:fb60:d67f:bd9a:6dbf:33b1])
 by smtp.gmail.com with ESMTPSA id r7sm10889386wmq.18.2021.05.25.08.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 08:05:20 -0700 (PDT)
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
 <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
 <YKz2KVppVoYMxB5u@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <312b183f-8eb2-d9e2-24ad-b429b74c886c@gmail.com>
Date: Tue, 25 May 2021 17:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKz2KVppVoYMxB5u@phenom.ffwll.local>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>, Dennis Li <Dennis.Li@amd.com>,
 Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Am 25.05.21 um 15:05 schrieb Daniel Vetter:
> Hi Christian,
>
> On Sat, May 22, 2021 at 10:30:19AM +0200, Christian König wrote:
>> Am 21.05.21 um 20:31 schrieb Daniel Vetter:
>>> [SNIP]
>>>> We could provide an IOCTL for the BO to change the flag.
>>> That's not the semantics we need.
>>>
>>>> But could we first figure out the semantics we want to use here?
>>>>
>>>> Cause I'm pretty sure we don't actually need those changes at all and as
>>>> said before I'm certainly NAKing things which break existing use cases.
>>> Please read how other drivers do this and at least _try_ to understand
>>> it. I'm really loosing my patience here with you NAKing patches you're
>>> not even understanding (or did you actually read and fully understand
>>> the entire story I typed up here, and your NAK is on the entire
>>> thing?). There's not much useful conversation to be had with that
>>> approach. And with drivers I mean kernel + userspace here.
>> Well to be honest I did fully read that, but I was just to emotionally
>> attached to answer more appropriately in that moment.
>>
>> And I'm sorry that I react emotional on that, but it is really frustrating
>> that I'm not able to convince you that we have a major problem which affects
>> all drivers and not just amdgpu.
>>
>> Regarding the reason why I'm NAKing this particular patch, you are breaking
>> existing uAPI for RADV with that. And as a maintainer of the driver I have
>> simply no other choice than saying halt, stop we can't do it like this.
>>
>> I'm perfectly aware that I've some holes in the understanding of how ANV or
>> other Vulkan/OpenGL stacks work. But you should probably also admit that you
>> have some holes how amdgpu works or otherwise I can't imagine why you
>> suggest a patch which simply breaks RADV.
>>
>> I mean we are working together for years now and I think you know me pretty
>> well, do you really think I scream bloody hell we can't do this without a
>> good reason?
>>
>> So let's stop throwing halve backed solutions at each other and discuss what
>> we can do to solve the different problems we are both seeing here.
> Well this was meant to be a goal post/semantics discussion starter. Yes
> the patch breaks performance (but not correctness) for amdgpu, but it also
> contains my suggestion for how to fix that issue (in text form at least).

Well as far as I can see this really breaks uAPI, we have unit tests 
exercising this.

But see more on this below.

> Plus a plan how to roll it out so that anyone who cares doesn't hit the
> perf issues this patch can cause.
>
> Also the overall series is really meant as a subsystem wide assessment of
> the status quo. Aside from a correctness issue Lucas spotted in my panfrost
> patches no substantial input from others on this yet unfortunately. I need
> to poke more people I think.
>
> Anyway since the plan as a text didn't stick I'm typing up now something
> more detailed in form of amdgpu patches. Maybe Bas can do the radv
> conversion too.
>
> It won't be complete by far either (I'm not working for amd after all
> ...), I'll leave out the opengl/media side entirely. But if this works for
> radv is should be a useful blueprint for gl/media too (with some changes
> in the interfaces, but not really the exposed semantics).

Yeah, but to make my point clear once more: I can't allow any patch in 
which would change amdgpus existing uAPI behavior.

What we can talk about is changing the behavior by adding flags to the 
fpriv to change the behavior and/or stuff the CS fence by default into 
the exclusive slot.

For the later I think we could do something like using a dma_fence_chain 
for the exclusive fence in amdgpu. This way we would have the same 
semantics in the CS and still support the epoll and Jasons new import IOCTL.

But the semantics of the amdgpu CS interface to not serialize from the 
same process and always serialize if you see some different process must 
stay the same or otherwise I have quite a bunch of angry end users.

>>> That's the other frustration part: You're trying to fix this purely in
>>> the kernel. This is exactly one of these issues why we require open
>>> source userspace, so that we can fix the issues correctly across the
>>> entire stack. And meanwhile you're steadfastily refusing to even look
>>> at that the userspace side of the picture.
>> Well I do fully understand the userspace side of the picture for the AMD
>> stack. I just don't think we should give userspace that much control over
>> the fences in the dma_resv object without untangling them from resource
>> management.
>>
>> And RADV is exercising exclusive sync for amdgpu already. You can do
>> submission to both the GFX, Compute and SDMA queues in Vulkan and those
>> currently won't over-synchronize.
>>
>> When you then send a texture generated by multiple engines to the Compositor
>> the kernel will correctly inserts waits for all submissions of the other
>> process.
>>
>> So this already works for RADV and completely without the IOCTL Jason
>> proposed. IIRC we also have unit tests which exercised that feature for the
>> video decoding use case long before RADV even existed.
> Yeah multiple engines on the producer side works fine with the current
> scheme you have (if we ignore for now that the way amdgpu uses dma_resv is
> different from other drivers by not setting the exclusive slots for
> producers).
>
> Where it breaks down is you have overlapping reads once a frame is
> generated, on either side. E.g.
>
> - compositors read the buffer as consumer
> - but also producer reads the buffer again (maybe reference frame for
>    media, or maybe for some post-processing like motion blurr or whatever).
>
> Then your current scheme really badly oversyncs, while other drivers
> don't have this issue.

No, that is correct behavior. This was added intentionally and we have 
an use cases which rely on this.

The concept is that when two processes access the same buffer object 
they should serialize, no matter what.

You can opt-out of that by setting the EXPLICIT_SYNC flag on the BO.

> Fixing this for amdgpu will have quite a big impact
> on how dma_resv will be used by amdgpu, and that's why I think before
> we've looked at this it doesn't make sense to look at changing dma_resv in
> big ways.
>
> I do think the AMDGPU_SYNC_NE_OWNER trick is pretty neat, and should help
> with some very non-explicit userspace (gl, maybe also media but at least
> ours is internally moving to a more explicit model I think) when you split
> the workload over multiple engines. For vulkan I think the right model is
> AMDGPU_SYNC_EXPLICIT, plus something like what Jason has.
>
> Except there's going to be quite some twist, but I think that's best
> explained in patches since text clearly doesn't work well.

Yeah, I'm also wondering how we can ever merge the two approaches back 
together. I'm not sure that this is possible.

>> And yes I have to admit that I haven't thought about interaction with other
>> drivers when I came up with this because the rules of that interaction
>> wasn't clear to me at that time.
> Ok I think we're at least distilling the core of our disagreement here,
> that's some progress:
>
> - my take: to make implicit sync work well and avoid oversync issues,
>    userspace, and currently amgpu lacks these uapis so needs to get those
>    added.
>
> - your take: please lets not give so much control to userspace
>
> Tbh I'm not yet fully understanding your concern here, but I do agree that
> there's a lot of things that need to be carefully audited here, at least
> in amdgpu. From my driver wide audit I do think in general playing clever
> tricks is ok, since drivers treat the exclusive fence as just a special
> type of shared fence and don't e.g. ignore the shard fences if an
> exclusive one is present. For the generic helper version of this see
> drm_gem_fence_array_add_implicit(), but afaiui amdgpu works the same (or
> at least similar enough), as do other drivers playing funny games.

Well do you mean the other way around? E.g. that you can *not* ignore 
the exclusive fence when shared once are present?

As far as I know nouveau is the only driver left using that (maybe i915 
somewhere, but not sure) and it would really help if we could remove that.

>>> Also I thought through your tlb issue, why are you even putting these
>>> tlb flush fences into the shard dma_resv slots? If you store them
>>> somewhere else in the amdgpu private part, the oversync issues goes
>>> away
>>> - in your ttm bo move callback, you can just make your bo copy job
>>> depend on them too (you have to anyway)
>>> - even for p2p there's not an issue here, because you have the
>>> ->move_notify callback, and can then lift the tlb flush fences from
>>> your private place to the shared slots so the exporter can see them.
>> Because adding a shared fence requires that this shared fence signals after
>> the exclusive fence. And this is a perfect example to explain why this is so
>> problematic and also why why we currently stumble over that only in amdgpu.
> So I also have vague collections that we agreed this is required, but I
> don't think it's the case. I'm at least pretty sure we already have
> multiple drivers which violate this (non of them using TTM yet).

Yeah, I know. Basically everybody which adds more than a CS fence to the 
shared slots will ignore this.

As said above if we drop this (which would be great) at least nouveau 
would need to be fixed.

>> In TTM we have a feature which allows evictions to be pipelined and don't
>> wait for the evicting DMA operation. Without that driver will stall waiting
>> for their allocations to finish when we need to allocate memory.
>>
>> For certain use cases this gives you a ~20% fps increase under memory
>> pressure, so it is a really important feature.
> Yeah that's something I'm banging my head against right now a bit for my
> amdgpu demo patch series.
>
>> This works by adding the fence of the last eviction DMA operation to BOs
>> when their backing store is newly allocated. That's what the
>> ttm_bo_add_move_fence() function you stumbled over is good for: https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#L692
>>
>> Now the problem is it is possible that the application is terminated before
>> it can complete it's command submission. But since resource management only
>> waits for the shared fences when there are some there is a chance that we
>> free up memory while it is still in use.
> Hm where is this code? Would help in my audit that I wanted to do this
> week? If you look at most other places like
> drm_gem_fence_array_add_implicit() I mentioned earlier, then we don't
> treat the shared fences special and always also include the exclusive one.

See amdgpu_gem_object_close():

...
         fence = dma_resv_get_excl(bo->tbo.base.resv);
         if (fence) {
                 amdgpu_bo_fence(bo, fence, true);
                 fence = NULL;
         }
...

We explicitly added that because resource management of some other 
driver was going totally bananas without that.

But I'm not sure which one that was. Maybe dig a bit in the git and 
mailing history of that.

>> Because of this we have some rather crude workarounds in amdgpu. For example
>> IIRC we manual wait for any potential exclusive fence before freeing memory.
>>
>> We could enable this feature for radeon and nouveau as well with an one line
>> change. But that would mean we need to maintain the workarounds for
>> shortcomings of the dma_resv object design in those drivers as well.
>>
>> To summarize I think that adding an unbound fence to protect an object is a
>> perfectly valid operation for resource management, but this is restricted by
>> the needs of implicit sync at the moment.
> Hm how are unbound fences (what do you mean with this exactly) come into
> play here now? I think you lost me here on the last 1-2 paragraphs, before
> that I think I followed.

Unbound like in not waiting for the exclusive fence.

>>> The kernel move fences otoh are a bit more nasty to wring through the
>>> p2p dma-buf interface. That one probably needs something new.
>> Well the p2p interface are my least concern.
>>
>> Adding the move fence means that you need to touch every place we do CS or
>> page flip since you now have something which is parallel to the explicit
>> sync fence.
>>
>> Otherwise having the move fence separately wouldn't make much sense in the
>> first place if we always set it together with the exclusive fence.
> Yeah it's a bunch of work. But for i915 this is the model we have, so we
> have to do it anyway, so I have really good excuse here to do that ttm
> audit.
>
>> Best regards and sorry for getting on your nerves so much,
> tbh I've also been rather thinly nerved on this. One side was that I spent
> the last 1+ years having an eerily similar with i915-gem team about how a
> single driver can't just have totally different rules for core stuff like
> dma_resv/fence/locks, and unfortunately that entire story went really,
> horribly wrong :-/ So I'm very much "oh noes pls not again".

Dito. I mean I didn't came up with the approach for amdgpu out of 
nowhere, but rather because we had some specific use cases for that.

Back in the R6xx days some guys where putting a semaphore at the end of 
each BO and serialized engine access to the BO using that. E.g. see how 
radeon works internally with the semaphore block.

This is basically the same concept implemented with the dma_resv object 
instead.

> But also the long w/e here helped, yay :-)

Yeah, indeed.

Cheers,
Christian.

>
> I think there's a few questions here that we can ping/pong a bit more, but
> I think for the next meaningful round I need to get this draft set of
> patches a bit into shape here, and audit more code. I think hopefully
> early next week I'll have something which isn't too much full of holes
> which should help in moving forward on this discussion.
>
> Cheers, Daniel

