Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2923901A5
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26C66EA0C;
	Tue, 25 May 2021 13:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D946EA0C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:05:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id s22so47000370ejv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rzTPEUj6ZfrLK47qjLBC6xqrr00IOrQn6WMfDUDpoKM=;
 b=OIQVel25jeFXkPYSJEeG1b/nUwycoajFQNKieBz+RL9AIMsJa6zFYIEwNkfQ9MkqBQ
 gAmvdIuPw17vePYC4zS6kV33eBZxPt2iz3SPxNAIO0WRWinGXg6i40rR853XhpO+xA9y
 2m9+PNaZ22Rf+jfm7aM+wa+HJaDnPYnUEP04U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rzTPEUj6ZfrLK47qjLBC6xqrr00IOrQn6WMfDUDpoKM=;
 b=LTaW3lyiuMuaeCHNQA3a5ymvfeBeBg1ocj95SVf195xUIPc5l8+IqeN5pnvmwkv5xc
 jVS7Z0cqOQ0sx4+AkLJ9S5w6wcS7YtAGrwhN1rWFKPwliiuelWFbav+46c6WwIv4RCxR
 xH2Ns2puvdAmFYagrBedtFdA4pphCKHMP9rHG7i52kKoKzVs3SBh1JdVTGxLJVtSEHNf
 0Td+hiF4UOXuZoDJnCv/sHUkJAheR/KijaspA6avvwaH1Aicb9aQJ3radTMmqaGdRCzP
 r71hSa24iEt9bS7NHGw/bBFBFGuxSyitnPC6fmqj6wpY+VkLnkEL8pxeJ3XUrLjuieUC
 mtzw==
X-Gm-Message-State: AOAM533+0P6r6G/utMnYRs2Q5WCiFNTuIvB4yPgSUYZAt70W/mJoIU2L
 zp1XRppOSBXmZXW9fvj8avLyKw==
X-Google-Smtp-Source: ABdhPJz2h4CxfvjLZ45FospjD8C79FmS3+GdU+LtnF0NK0P9iJi8WWS6U9N4PC+u1HSVQ9X6rVf7zw==
X-Received: by 2002:a17:907:20d7:: with SMTP id
 qq23mr28659872ejb.549.1621947948268; 
 Tue, 25 May 2021 06:05:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bm24sm10780789edb.45.2021.05.25.06.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:05:47 -0700 (PDT)
Date: Tue, 25 May 2021 15:05:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit
 fencing rules
Message-ID: <YKz2KVppVoYMxB5u@phenom.ffwll.local>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
 <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
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

Hi Christian,

On Sat, May 22, 2021 at 10:30:19AM +0200, Christian König wrote:
> Am 21.05.21 um 20:31 schrieb Daniel Vetter:
> > [SNIP]
> > > We could provide an IOCTL for the BO to change the flag.
> > That's not the semantics we need.
> > 
> > > But could we first figure out the semantics we want to use here?
> > > 
> > > Cause I'm pretty sure we don't actually need those changes at all and as
> > > said before I'm certainly NAKing things which break existing use cases.
> > Please read how other drivers do this and at least _try_ to understand
> > it. I'm really loosing my patience here with you NAKing patches you're
> > not even understanding (or did you actually read and fully understand
> > the entire story I typed up here, and your NAK is on the entire
> > thing?). There's not much useful conversation to be had with that
> > approach. And with drivers I mean kernel + userspace here.
> 
> Well to be honest I did fully read that, but I was just to emotionally
> attached to answer more appropriately in that moment.
> 
> And I'm sorry that I react emotional on that, but it is really frustrating
> that I'm not able to convince you that we have a major problem which affects
> all drivers and not just amdgpu.
> 
> Regarding the reason why I'm NAKing this particular patch, you are breaking
> existing uAPI for RADV with that. And as a maintainer of the driver I have
> simply no other choice than saying halt, stop we can't do it like this.
> 
> I'm perfectly aware that I've some holes in the understanding of how ANV or
> other Vulkan/OpenGL stacks work. But you should probably also admit that you
> have some holes how amdgpu works or otherwise I can't imagine why you
> suggest a patch which simply breaks RADV.
> 
> I mean we are working together for years now and I think you know me pretty
> well, do you really think I scream bloody hell we can't do this without a
> good reason?
> 
> So let's stop throwing halve backed solutions at each other and discuss what
> we can do to solve the different problems we are both seeing here.

Well this was meant to be a goal post/semantics discussion starter. Yes
the patch breaks performance (but not correctness) for amdgpu, but it also
contains my suggestion for how to fix that issue (in text form at least).

Plus a plan how to roll it out so that anyone who cares doesn't hit the
perf issues this patch can cause.

Also the overall series is really meant as a subsystem wide assessment of
the status quo. Aside from a correctness issue Lucas spotted in my panfrost
patches no substantial input from others on this yet unfortunately. I need
to poke more people I think.

Anyway since the plan as a text didn't stick I'm typing up now something
more detailed in form of amdgpu patches. Maybe Bas can do the radv
conversion too.

It won't be complete by far either (I'm not working for amd after all
...), I'll leave out the opengl/media side entirely. But if this works for
radv is should be a useful blueprint for gl/media too (with some changes
in the interfaces, but not really the exposed semantics).

> > That's the other frustration part: You're trying to fix this purely in
> > the kernel. This is exactly one of these issues why we require open
> > source userspace, so that we can fix the issues correctly across the
> > entire stack. And meanwhile you're steadfastily refusing to even look
> > at that the userspace side of the picture.
> 
> Well I do fully understand the userspace side of the picture for the AMD
> stack. I just don't think we should give userspace that much control over
> the fences in the dma_resv object without untangling them from resource
> management.
> 
> And RADV is exercising exclusive sync for amdgpu already. You can do
> submission to both the GFX, Compute and SDMA queues in Vulkan and those
> currently won't over-synchronize.
> 
> When you then send a texture generated by multiple engines to the Compositor
> the kernel will correctly inserts waits for all submissions of the other
> process.
> 
> So this already works for RADV and completely without the IOCTL Jason
> proposed. IIRC we also have unit tests which exercised that feature for the
> video decoding use case long before RADV even existed.

Yeah multiple engines on the producer side works fine with the current
scheme you have (if we ignore for now that the way amdgpu uses dma_resv is
different from other drivers by not setting the exclusive slots for
producers).

Where it breaks down is you have overlapping reads once a frame is
generated, on either side. E.g.

- compositors read the buffer as consumer
- but also producer reads the buffer again (maybe reference frame for
  media, or maybe for some post-processing like motion blurr or whatever).

Then your current scheme really badly oversyncs, while other drivers
don't have this issue. Fixing this for amdgpu will have quite a big impact
on how dma_resv will be used by amdgpu, and that's why I think before
we've looked at this it doesn't make sense to look at changing dma_resv in
big ways.

I do think the AMDGPU_SYNC_NE_OWNER trick is pretty neat, and should help
with some very non-explicit userspace (gl, maybe also media but at least
ours is internally moving to a more explicit model I think) when you split
the workload over multiple engines. For vulkan I think the right model is
AMDGPU_SYNC_EXPLICIT, plus something like what Jason has.

Except there's going to be quite some twist, but I think that's best
explained in patches since text clearly doesn't work well.

> And yes I have to admit that I haven't thought about interaction with other
> drivers when I came up with this because the rules of that interaction
> wasn't clear to me at that time.

Ok I think we're at least distilling the core of our disagreement here,
that's some progress:

- my take: to make implicit sync work well and avoid oversync issues,
  userspace, and currently amgpu lacks these uapis so needs to get those
  added.

- your take: please lets not give so much control to userspace

Tbh I'm not yet fully understanding your concern here, but I do agree that
there's a lot of things that need to be carefully audited here, at least
in amdgpu. From my driver wide audit I do think in general playing clever
tricks is ok, since drivers treat the exclusive fence as just a special
type of shared fence and don't e.g. ignore the shard fences if an
exclusive one is present. For the generic helper version of this see
drm_gem_fence_array_add_implicit(), but afaiui amdgpu works the same (or
at least similar enough), as do other drivers playing funny games.

> > Also I thought through your tlb issue, why are you even putting these
> > tlb flush fences into the shard dma_resv slots? If you store them
> > somewhere else in the amdgpu private part, the oversync issues goes
> > away
> > - in your ttm bo move callback, you can just make your bo copy job
> > depend on them too (you have to anyway)
> > - even for p2p there's not an issue here, because you have the
> > ->move_notify callback, and can then lift the tlb flush fences from
> > your private place to the shared slots so the exporter can see them.
> 
> Because adding a shared fence requires that this shared fence signals after
> the exclusive fence. And this is a perfect example to explain why this is so
> problematic and also why why we currently stumble over that only in amdgpu.

So I also have vague collections that we agreed this is required, but I
don't think it's the case. I'm at least pretty sure we already have
multiple drivers which violate this (non of them using TTM yet).

> In TTM we have a feature which allows evictions to be pipelined and don't
> wait for the evicting DMA operation. Without that driver will stall waiting
> for their allocations to finish when we need to allocate memory.
> 
> For certain use cases this gives you a ~20% fps increase under memory
> pressure, so it is a really important feature.

Yeah that's something I'm banging my head against right now a bit for my
amdgpu demo patch series.

> This works by adding the fence of the last eviction DMA operation to BOs
> when their backing store is newly allocated. That's what the
> ttm_bo_add_move_fence() function you stumbled over is good for: https://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#L692
> 
> Now the problem is it is possible that the application is terminated before
> it can complete it's command submission. But since resource management only
> waits for the shared fences when there are some there is a chance that we
> free up memory while it is still in use.

Hm where is this code? Would help in my audit that I wanted to do this
week? If you look at most other places like
drm_gem_fence_array_add_implicit() I mentioned earlier, then we don't
treat the shared fences special and always also include the exclusive one.

> Because of this we have some rather crude workarounds in amdgpu. For example
> IIRC we manual wait for any potential exclusive fence before freeing memory.
> 
> We could enable this feature for radeon and nouveau as well with an one line
> change. But that would mean we need to maintain the workarounds for
> shortcomings of the dma_resv object design in those drivers as well.
> 
> To summarize I think that adding an unbound fence to protect an object is a
> perfectly valid operation for resource management, but this is restricted by
> the needs of implicit sync at the moment.

Hm how are unbound fences (what do you mean with this exactly) come into
play here now? I think you lost me here on the last 1-2 paragraphs, before
that I think I followed.

> > The kernel move fences otoh are a bit more nasty to wring through the
> > p2p dma-buf interface. That one probably needs something new.
> 
> Well the p2p interface are my least concern.
> 
> Adding the move fence means that you need to touch every place we do CS or
> page flip since you now have something which is parallel to the explicit
> sync fence.
> 
> Otherwise having the move fence separately wouldn't make much sense in the
> first place if we always set it together with the exclusive fence.

Yeah it's a bunch of work. But for i915 this is the model we have, so we
have to do it anyway, so I have really good excuse here to do that ttm
audit.

> Best regards and sorry for getting on your nerves so much,

tbh I've also been rather thinly nerved on this. One side was that I spent
the last 1+ years having an eerily similar with i915-gem team about how a
single driver can't just have totally different rules for core stuff like
dma_resv/fence/locks, and unfortunately that entire story went really,
horribly wrong :-/ So I'm very much "oh noes pls not again".

But also the long w/e here helped, yay :-)

I think there's a few questions here that we can ping/pong a bit more, but
I think for the next meaningful round I need to get this draft set of
patches a bit into shape here, and audit more code. I think hopefully
early next week I'll have something which isn't too much full of holes
which should help in moving forward on this discussion.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
