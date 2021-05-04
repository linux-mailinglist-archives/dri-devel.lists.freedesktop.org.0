Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3595372E34
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 18:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F23B6E2B6;
	Tue,  4 May 2021 16:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF0E6EB37
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 16:44:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e7so11194935edu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=S5ixoMryeJnHVAOTksTPqK7IAoucwEzX98UTEH9wuyM=;
 b=ceEklP6oJNXs/NrpbeFqIZjohZOhXi+4gjsvZuRigfB+DHGRLorkuyvHPXI8T918Hj
 YeDZTGY+N37EQh+Wh5Rm4UrPV7t950L+dTe25DV2abODO9uGXKjKg7/7j8WXQZ1+gmiH
 tjag7YABECxiKCjVVAAQoFKFutuh5OeH/Imrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S5ixoMryeJnHVAOTksTPqK7IAoucwEzX98UTEH9wuyM=;
 b=FM2IJ7AWSoRIOVi+/fLbml3kfr0AKXN5xHS4BW0xMCxJ1qcl/rNq7hUWt7eJCJt0Rv
 G0ECdxXMXImCNsg9H+1H+1Uq4j2mYjXH4PR4iwc+T4EMjOXqofNfPtIl59+76DwSg0or
 EUv4BDHIq012EIhuUupZDKlgl1NVbnYUrhcVkpJHg+ZqtS20qsTBw1QmBr/09abutXs+
 FHV3Ar9SfwlMQRL90i1yqSKKyHBOc3oDDWmVIxjqeKioBp5Mhg8lPNu07yobodlFfPra
 Yg2T0hDa8JkeNMtVxIUKYh20/PukcIupHjuMRuuuQYvwvm7q9LGis2gPHOO/11b9yEHq
 bKRw==
X-Gm-Message-State: AOAM533vE3qPgaYo1/r66gU3bFeOsUv/NGng0WFl53rNLb2CHNpJm46D
 FtWvpXYNzgiyQNBoJrVXu1C6gHnnKFd2Lw==
X-Google-Smtp-Source: ABdhPJxsV6jm3UQs4nrE4Vq+BP2lXGrJ4FvwMjKU/FyBmpYqWPJ8DbZ+/Fni3hWlZ2oEXrK0d+tiEw==
X-Received: by 2002:a05:6402:1214:: with SMTP id
 c20mr5976188edw.191.1620146648577; 
 Tue, 04 May 2021 09:44:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm2622024ede.93.2021.05.04.09.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 09:44:07 -0700 (PDT)
Date: Tue, 4 May 2021 18:44:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YJF51hE8die/tznf@phenom.ffwll.local>
References: <CAAxE2A6NCTFsV6oH=AL=S=P1p0xYF0To8T_THpUO2ypdo0dyBw@mail.gmail.com>
 <1bd8105b-4a2a-2ad9-0b3c-a81590282f2e@gmail.com>
 <YJD4pt0r+TWAYfX5@phenom.ffwll.local>
 <9ccfe4b2-91f0-b8e5-6327-bf3c8b6d1a24@gmail.com>
 <CAKMK7uErXQ2O2RH4qqUVqYzw3jqJT2JwfCiXVZfu0U7HPKwYGA@mail.gmail.com>
 <a0c38808-3651-a3de-c4c4-2f4e5bf6fde7@gmail.com>
 <YJEYQnSb6m2df6YN@phenom.ffwll.local>
 <7227e6fb-1108-1096-ab2c-017d6422e90b@gmail.com>
 <CAKMK7uGQaysQM6NL3G3fgvoAk_0bOnz=62PaJmXw32sSh2n0RA@mail.gmail.com>
 <a9234655-ecd7-5ac0-579e-306d3bc91a59@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9234655-ecd7-5ac0-579e-306d3bc91a59@gmail.com>
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
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 04, 2021 at 02:48:35PM +0200, Christian K=F6nig wrote:
> Am 04.05.21 um 13:13 schrieb Daniel Vetter:
> > On Tue, May 4, 2021 at 12:53 PM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 04.05.21 um 11:47 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > Yeah, it just takes to long for the preemption to complete to be =
really
> > > > > useful for the feature we are discussing here.
> > > > > =

> > > > > As I said when the kernel requests to preempt a queue we can easi=
ly expect a
> > > > > timeout of ~100ms until that comes back. For compute that is even=
 in the
> > > > > multiple seconds range.
> > > > 100ms for preempting an idle request sounds like broken hw to me. Of
> > > > course preemting something that actually runs takes a while, that's
> > > > nothing new. But it's also not the thing we're talking about here. =
Is this
> > > > 100ms actual numbers from hw for an actual idle ringbuffer?
> > > Well 100ms is just an example of the scheduler granularity. Let me
> > > explain in a wider context.
> > > =

> > > The hardware can have X queues mapped at the same time and every Y ti=
me
> > > interval the hardware scheduler checks if those queues have changed a=
nd
> > > only if they have changed the necessary steps to reload them are star=
ted.
> > > =

> > > Multiple queues can be rendering at the same time, so you can have X =
as
> > > a high priority queue active and just waiting for a signal to start a=
nd
> > > the client rendering one frame after another and a third background
> > > compute task mining bitcoins for you.
> > > =

> > > As long as everything is static this is perfectly performant. Adding a
> > > queue to the list of active queues is also relatively simple, but tak=
ing
> > > one down requires you to wait until we are sure the hardware has seen
> > > the change and reloaded the queues.
> > > =

> > > Think of it as an RCU grace period. This is simply not something which
> > > is made to be used constantly, but rather just at process termination.
> > Uh ... that indeed sounds rather broken.
> =

> Well I wouldn't call it broken. It's just not made for the use case we are
> trying to abuse it for.
> =

> > Otoh it's just a dma_fence that'd we'd inject as this unload-fence.
> =

> Yeah, exactly that's why it isn't much of a problem for process terminati=
on
> or freeing memory.

Ok so your hw really hates the unload fence. On ours the various queues
are a bit more explicit, so largely unload/preempt is the same as context
switch and pretty quick. Afaik at least.

Still baffled that you can't fix this in fw, but oh well. Judging from how
fast our fw team moves I'm not surprised :-/

Anyway so next plan: Make this work exactly like hmm:
1. wait for the user fence as a dma-fence fake thing, tdr makes this safe
2. remove pte
3. do synchronous tlb flush

Tada, no more 100ms stall in your buffer move callbacks. And feel free to
pack up 2&3 into an async worker or something if it takes too long and
treating it as a bo move dma_fence is better. Also that way you might be
able to batch up the tlb flushing if it's too damn expensive, by
collecting them all under a single dma_fence (and starting a new tlb flush
cycle every time ->enable_signalling gets called).

As long as you nack any gpu faults and don't try to fill them for these
legacy contexts that support dma-fence there's no harm in using the hw
facilities.

Ofc if you're now telling me your synchronous tlb flush is also 100ms,
then maybe just throw the hw out the window, and accept that the
millisecond anything evicts anything (good look with userptr) the screen
freezes for a bit.

> > So by and large everyone should already be able to cope with it taking a
> > bit longer. So from a design pov I don't see a huge problem, but I
> > guess you guys wont be happy since it means on amd hw there will be
> > random unsightly stalls in desktop linux usage.
> > =

> > > > > The "preemption" feature is really called suspend and made just f=
or the case
> > > > > when we want to put a process to sleep or need to forcefully kill=
 it for
> > > > > misbehavior or stuff like that. It is not meant to be used in nor=
mal
> > > > > operation.
> > > > > =

> > > > > If we only attach it on ->move then yeah maybe a last resort poss=
ibility to
> > > > > do it this way, but I think in that case we could rather stick wi=
th kernel
> > > > > submissions.
> > > > Well this is a hybrid userspace ring + kernel augmeted submit mode,=
 so you
> > > > can keep dma-fences working. Because the dma-fence stuff wont work =
with
> > > > pure userspace submit, I think that conclusion is rather solid. Onc=
e more
> > > > even after this long thread here.
> > > When assisted with unload fences, then yes. Problem is that I can't s=
ee
> > > how we could implement those performant currently.
> > Is there really no way to fix fw here? Like if process start/teardown
> > takes 100ms, that's going to suck no matter what.
> =

> As I said adding the queue is unproblematic and teardown just results in a
> bit more waiting to free things up.
> =

> Problematic is more overcommit swapping and OOM situations which need to
> wait for the hw scheduler to come back and tell us that the queue is now
> unmapped.
> =

> > > > > > Also, if userspace lies to us and keeps pushing crap into the r=
ing
> > > > > > after it's supposed to be idle: Userspace is already allowed to=
 waste
> > > > > > gpu time. If you're too worried about this set a fairly aggress=
ive
> > > > > > preempt timeout on the unload fence, and kill the context if it=
 takes
> > > > > > longer than what preempting an idle ring should take (because t=
hat
> > > > > > would indicate broken/evil userspace).
> > > > > I think you have the wrong expectation here. It is perfectly vali=
d and
> > > > > expected for userspace to keep writing commands into the ring buf=
fer.
> > > > > =

> > > > > After all when one frame is completed they want to immediately st=
art
> > > > > rendering the next one.
> > > > Sure, for the true userspace direct submit model. But with that you=
 don't
> > > > get dma-fence, which means this gpu will not work for 3d accel on a=
ny
> > > > current linux desktop.
> > > I'm not sure of that. I've looked a bit into how we could add user
> > > fences to dma_resv objects and that isn't that hard after all.
> > I think as a proof of concept it's fine, but as an actual solution ...
> > pls no. Two reasons:
> > - implicit sync is bad
> =

> Well can't disagree with that :) But I think we can't avoid supporting it.
> =

> > - this doesn't fix anything for explicit sync using dma_fence in terms
> > of sync_file or drm_syncobj.
> =

> Exactly.
> =

> If we do implicit sync or explicit sync is orthogonal to the problems that
> sync must be made reliable somehow.
> =

> So when we sync and timeout the waiter should just continue, but whoever
> failed to signal will be punished.
> =

> But since this isn't solved on Windows I don't see how we can solve it on
> Linux either.
> =

> > So if we go with the route of papering over this in the kernel, then
> > it'll be a ton more work than just hacking something into dma_resv.
> =

> I'm just now prototyping that and at least for the driver parts it doesn't
> look that hard after all.
> =

> > > > Which sucks, hence some hybrid model of using the userspace ring and
> > > > kernel augmented submit is needed. Which was my idea.
> > > Yeah, I think when our firmware folks would really remove the kernel
> > > queue and we still don't have
> > Yeah I think kernel queue can be removed. But the price is that you
> > need reasonable fast preempt of idle contexts.
> > =

> > I really can't understand how this can take multiple ms, something
> > feels very broken in the design of the fw (since obviously the hw can
> > preempt an idle context to another one pretty fast, or you'd render
> > any multi-client desktop as a slideshow at best).
> =

> Well the hardware doesn't preempt and idle context. See you can have a
> number of active ("mapped" in the fw terminology) contexts and idle conte=
xts
> are usually kept active even when they are idle.
> =

> So when multi-client desktop switches between context then that is rather
> fast, but when the kernel asks for a context to be unmapped that can take
> rather long.
> =

> =

> > =

> > > > > [SNIP]
> > > > > Can't find that of hand either, but see the amdgpu_noretry module=
 option.
> > > > > =

> > > > > It basically tells the hardware if retry page faults should be su=
pported or
> > > > > not because this whole TLB shutdown thing when they are supported=
 is
> > > > > extremely costly.
> > > > Hm so synchronous tlb shootdown is a lot more costly when you allow
> > > > retrying of page faults?
> > > Partially correct, yes.
> > > =

> > > See when you have retry page faults enabled and unmap something you n=
eed
> > > to make sure that everybody which could have potentially translated t=
hat
> > > page and has a TLB is either invalidated or waited until the access is
> > > completed.
> > > =

> > > Since every CU could be using a memory location that takes ages to
> > > completed compared to the normal invalidation where you just invalida=
te
> > > the L1/L2 and are done.
> > > =

> > > Additional to that the recovery adds some extra overhead to every mem=
ory
> > > access, so even without a fault you are quite a bit slower if this is
> > > enabled.
> > Well yes it's complicated, and it's even more fun when the tlb
> > invalidate comes in through the IOMMU through ATS.
> > =

> > But also if you don't your hw is just broken from a security pov, no
> > page fault handling for you. So it's really not optional.
> =

> Yeah, but that is also a known issue. You either have retry faults and li=
ve
> with the extra overhead or you disable them and go with the kernel based
> submission approach.

Well kernel based submit is out with your new hw it sounds, so retry
faults and sync tlb invalidate is the price you have to pay. There's no
"both ways pls" here :-)

> > > > That sounds bad, because for full hmm mode you need to be able to r=
etry
> > > > pagefaults. Well at least the PASID/ATS/IOMMU side will do that, an=
d might just
> > > > hang your gpu for a long time while it's waiting for the va->pa loo=
kup
> > > > response to return. So retrying lookups shouldn't be any different =
really.
> > > > =

> > > > And you also need fairly fast synchronous tlb shootdown for hmm. So=
 if
> > > > your hw has a problem with both together that sounds bad.
> > > Completely agree. And since it was my job to validate the implementat=
ion
> > > on Vega10 I was also the first one to realize that.
> > > =

> > > Felix, a couple of others and me are trying to work around those
> > > restrictions ever since.
> > > =

> > > > I was more thinking about handling it all in the kernel.
> > > > Yeah can do, just means that you also have to copy the ringbuffer s=
tuff
> > > > over from userspace to the kernel.
> > > That is my least worry. The IBs are just addr+length., so no more than
> > > 16 bytes for each IB.
> > Ah ok, maybe I'm biased from drm/i915 where an ib launch + seqno is
> > rather long, because the hw folks keep piling more workarounds and
> > additional flushes on top. Like on some hw the recommended w/a was to
> > just issue 32 gpu cache flushes or something like that (otherwise the
> > seqno write could arrive before the gpu actually finished flushing)
> > :-/
> =

> Well I once had a conversation with a hw engineer which wanted to split up
> the TLB in validations into 1Gib chunks :)
> =

> That would have mean we would need to emit 2^17 different invalidation
> requests on the kernel ring buffer....

Well on the cpu side you invalidate tlbs as ranges, but there's a fallback
to just flush the entire thing if the range flush is too much. So it's not
entirely bonkers, just that the global flush needs to be there still.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
