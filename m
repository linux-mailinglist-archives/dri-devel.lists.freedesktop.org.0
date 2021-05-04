Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637C37283F
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 11:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C776EAC1;
	Tue,  4 May 2021 09:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1B56EAC0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 09:47:50 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id b25so12194757eju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oq8zbq06ydrlr8O9wI3dgxQyEA3PtErX9ab1YEVm664=;
 b=cjCkENEhyXBLiN/SYORv5+6paq428+hZuz0LMlXuquWbsIwCN5OX1xE+Z1aZPw2X8/
 QV5gkj5wDUW4XO55m3+eXYR27+iqEsdz/afo/LntxOYwW/Jh49Aqstiz5+SVNchUUEBI
 r7dkvRD23AWq6ul4ftNnlcH9OH1ZUreKcdJ38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oq8zbq06ydrlr8O9wI3dgxQyEA3PtErX9ab1YEVm664=;
 b=UgJr/hkOnDN0QZsw3mFATUzrczI7CMxcJHJeDbxDKaBVi8X5aE5TTu29q257MqT6u6
 7nzXvFVZb0rprITV8sIEL4JFU2ykFEw7DY61LDC/eraOFCIK9yCz+AECf0H1wzOqx+L6
 +ZL7PawyJ6x5/w38jy+BvKzjhox2uypoIWS/F6ed4Js378UDjnp8dUe7Yhv7JYpS0dvi
 RP/QOClu58/jE6iY6gN950mmvPvd1n0A7JHXE+cpFDbSpvPogy78teJ6RFKHvfaO+RDK
 SfIhBUP6V2FnNex4d4WaaENiMz4RS9RSHNI3M3k3pyXRUQTAxWovJwxyCsdaYwsfPAG1
 S2gA==
X-Gm-Message-State: AOAM532zxWIVI4ClTQMAfoXWojU7G2wYLvmzY14UP+XTY92JtAgD+gV1
 ITRsVaw5nZ8HUiu+o8NPSbscZg==
X-Google-Smtp-Source: ABdhPJyBdQsIrmwlQ42dw23MTzOcjhluJVHpZeTfUa8QurYAkEtDxHb5TVGIzhZRwgBWSDvCD5qMbw==
X-Received: by 2002:a17:906:11d4:: with SMTP id
 o20mr21121596eja.247.1620121669048; 
 Tue, 04 May 2021 02:47:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm1126247ejy.91.2021.05.04.02.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 02:47:48 -0700 (PDT)
Date: Tue, 4 May 2021 11:47:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Mesa-dev] [RFC] Linux Graphics Next: Explicit fences everywhere
 and no BO fences - initial proposal
Message-ID: <YJEYQnSb6m2df6YN@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0c38808-3651-a3de-c4c4-2f4e5bf6fde7@gmail.com>
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

On Tue, May 04, 2021 at 11:14:06AM +0200, Christian K=F6nig wrote:
> Am 04.05.21 um 10:27 schrieb Daniel Vetter:
> > On Tue, May 4, 2021 at 10:09 AM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > Am 04.05.21 um 09:32 schrieb Daniel Vetter:
> > > > On Tue, May 04, 2021 at 09:01:23AM +0200, Christian K=F6nig wrote:
> > > > > Unfortunately as I pointed out to Daniel as well this won't work =
100%
> > > > > reliable either.
> > > > You're claiming this, but there's no clear reason why really, and y=
ou
> > > > did't reply to my last mail on that sub-thread, so I really don't g=
et
> > > > where exactly you're seeing a problem.
> > > Yeah, it's rather hard to explain without pointing out how the hardwa=
re
> > > works in detail.
> > > =

> > > > > See the signal on the ring buffer needs to be protected by manipu=
lation from
> > > > > userspace so that we can guarantee that the hardware really has f=
inished
> > > > > executing when it fires.
> > > > Nope you don't. Userspace is already allowed to submit all kinds of=
 random
> > > > garbage, the only thing the kernel has to guarnatee is:
> > > > - the dma-fence DAG stays a DAG
> > > > - dma-fence completes in finite time
> > > > =

> > > > Everything else is not the kernel's problem, and if userspace mixes=
 stuff
> > > > up like manipulates the seqno, that's ok. It can do that kind of ga=
rbage
> > > > already.
> > > > =

> > > > > Protecting memory by immediate page table updates is a good first=
 step, but
> > > > > unfortunately not sufficient (and we would need to restructure la=
rge parts
> > > > > of the driver to make this happen).
> > > > This is why you need the unload-fence on top, because indeed you ca=
n't
> > > > just rely on the fences created from the userspace ring, those are
> > > > unreliable for memory management.
> > > And exactly that's the problem! We can't provide a reliable unload-fe=
nce
> > > and the user fences are unreliable for that.
> > > =

> > > I've talked this through lengthy with our hardware/firmware guy last
> > > Thursday but couldn't find a solution either.
> > > =

> > > We can have a preemption fence for the kernel which says: Hey this qu=
eue
> > > was scheduled away you can touch it's hardware descriptor, control
> > > registers, page tables, TLB, memory, GWS, GDS, OA etc etc etc... agai=
n.
> > > But that one is only triggered on preemption and then we have the same
> > > ordering problems once more.
> > > =

> > > Or we can have a end of operation fence for userspace which says: Hey
> > > this queue has finished it's batch of execution, but this one is
> > > manipulable from userspace in both finish to early (very very bad for
> > > invalidations and memory management) or finish to late/never (deadlock
> > > prone but fixable by timeout).
> > > =

> > > What we could do is to use the preemption fence to emulate the unload
> > > fence, e.g. something like:
> > > 1. Preempt the queue in fixed intervals (let's say 100ms).
> > > 2. While preempted check if we have reached the checkpoint in question
> > > by looking at the hardware descriptor.
> > > 3. If we have reached the checkpoint signal the unload fence.
> > > 4. If we haven't reached the checkpoint resume the queue again.
> > > =

> > > The problem is that this might introduce a maximum of 100ms delay bef=
ore
> > > signaling the unload fence and preempt/resume has such a hefty overhe=
ad
> > > that we waste a horrible amount of time on it.
> > So your hw can preempt? That's good enough.
> > =

> > The unload fence is just
> > 1. wait for all dma_fence that are based on the userspace ring. This
> > is unreliable, but we don't care because tdr will make it reliable.
> > And once tdr shot down a context we'll force-unload and thrash it
> > completely, which solves the problem.
> > 2. preempt the context, which /should/ now be stuck waiting for more
> > commands to be stuffed into the ringbuffer. Which means your
> > preemption is hopefully fast enough to not matter. If your hw takes
> > forever to preempt an idle ring, I can't help you :-)
> =

> Yeah, it just takes to long for the preemption to complete to be really
> useful for the feature we are discussing here.
> =

> As I said when the kernel requests to preempt a queue we can easily expec=
t a
> timeout of ~100ms until that comes back. For compute that is even in the
> multiple seconds range.

100ms for preempting an idle request sounds like broken hw to me. Of
course preemting something that actually runs takes a while, that's
nothing new. But it's also not the thing we're talking about here. Is this
100ms actual numbers from hw for an actual idle ringbuffer?

> The "preemption" feature is really called suspend and made just for the c=
ase
> when we want to put a process to sleep or need to forcefully kill it for
> misbehavior or stuff like that. It is not meant to be used in normal
> operation.
> =

> If we only attach it on ->move then yeah maybe a last resort possibility =
to
> do it this way, but I think in that case we could rather stick with kernel
> submissions.

Well this is a hybrid userspace ring + kernel augmeted submit mode, so you
can keep dma-fences working. Because the dma-fence stuff wont work with
pure userspace submit, I think that conclusion is rather solid. Once more
even after this long thread here.

> > Also, if userspace lies to us and keeps pushing crap into the ring
> > after it's supposed to be idle: Userspace is already allowed to waste
> > gpu time. If you're too worried about this set a fairly aggressive
> > preempt timeout on the unload fence, and kill the context if it takes
> > longer than what preempting an idle ring should take (because that
> > would indicate broken/evil userspace).
> =

> I think you have the wrong expectation here. It is perfectly valid and
> expected for userspace to keep writing commands into the ring buffer.
> =

> After all when one frame is completed they want to immediately start
> rendering the next one.

Sure, for the true userspace direct submit model. But with that you don't
get dma-fence, which means this gpu will not work for 3d accel on any
current linux desktop.

Which sucks, hence some hybrid model of using the userspace ring and
kernel augmented submit is needed. Which was my idea.

> > Again, I'm not seeing the problem. Except if your hw is really
> > completely busted to the point where it can't even support userspace
> > ringbuffers properly and with sufficient performance :-P
> > =

> > Of course if you issue the preempt context request before the
> > userspace fences have finished (or tdr cleaned up the mess) like you
> > do in your proposal, then it will be ridiculously expensive and/or
> > wont work. So just don't do that.
> > =

> > > > btw I thought some more, and I think it's probably best if we only =
attach
> > > > the unload-fence in the ->move(_notify) callbacks. Kinda like we al=
ready
> > > > do for async copy jobs. So the overall buffer move sequence would b=
e:
> > > > =

> > > > 1. wait for (untrusted for kernel, but necessary for userspace
> > > > correctness) fake dma-fence that rely on the userspace ring
> > > > =

> > > > 2. unload ctx
> > > > =

> > > > 3. copy buffer
> > > > =

> > > > Ofc 2&3 would be done async behind a dma_fence.
> > > > =

> > > > > On older hardware we often had the situation that for reliable in=
validation
> > > > > we need the guarantee that every previous operation has finished =
executing.
> > > > > It's not so much of a problem when the next operation has already=
 started,
> > > > > since then we had the opportunity to do things in between the las=
t and the
> > > > > next operation. Just see cache invalidation and VM switching for =
example.
> > > > If you have gpu page faults you generally have synchronous tlb
> > > > invalidation,
> > > Please tell that our hardware engineers :)
> > > =

> > > We have two modes of operation, see the whole XNACK on/off discussion=
 on
> > > the amdgfx mailing list.
> > I didn't find this anywhere with a quick search. Pointers to archive
> > (lore.kernel.org/amd-gfx is the best imo).
> =

> Can't find that of hand either, but see the amdgpu_noretry module option.
> =

> It basically tells the hardware if retry page faults should be supported =
or
> not because this whole TLB shutdown thing when they are supported is
> extremely costly.

Hm so synchronous tlb shootdown is a lot more costly when you allow
retrying of page faults?

That sounds bad, because for full hmm mode you need to be able to retry
pagefaults. Well at least the PASID/ATS/IOMMU side will do that, and might =
just
hang your gpu for a long time while it's waiting for the va->pa lookup
response to return. So retrying lookups shouldn't be any different really.

And you also need fairly fast synchronous tlb shootdown for hmm. So if
your hw has a problem with both together that sounds bad.

> > > > so this also shouldn't be a big problem. Combined with the
> > > > unload fence at least. If you don't have synchronous tlb invalidate=
 it
> > > > gets a bit more nasty and you need to force a preemption to a kernel
> > > > context which has the required flushes across all the caches. Sligh=
tly
> > > > nasty, but the exact same thing would be required for handling page=
 faults
> > > > anyway with the direct userspace submit model.
> > > > =

> > > > Again I'm not seeing a problem.
> > > > =

> > > > > Additional to that it doesn't really buy us anything, e.g. there =
is not much
> > > > > advantage to this. Writing the ring buffer in userspace and then =
ringing in
> > > > > the kernel has the same overhead as doing everything in the kerne=
l in the
> > > > > first place.
> > > > It gets you dma-fence backwards compat without having to rewrite the
> > > > entire userspace ecosystem. Also since you have the hw already desi=
gned
> > > > for ringbuffer in userspace it would be silly to copy that through =
the cs
> > > > ioctl, that's just overhead.
> > > > =

> > > > Also I thought the problem you're having is that all the kernel rin=
gbuf
> > > > stuff is going away, so the old cs ioctl wont work anymore for sure?
> > > We still have a bit more time for this. As I learned from our firmware
> > > engineer last Thursday the Windows side is running into similar probl=
ems
> > > as we do.
> > This story sounds familiar, I've heard it a few times here at intel
> > too on various things where we complained and then windows hit the
> > same issues too :-)
> > =

> > E.g. I've just learned that all the things we've discussed around gpu
> > page faults vs 3d workloads and how you need to reserve some CU for 3d
> > guaranteed forward progress or even worse measures is also something
> > they're hitting on Windows. Apparently they fixed it by only running
> > 3d or compute workloads at the same time, but not both.
> =

> I'm not even sure if we are going to see user fences on Windows with the
> next hw generation.
> =

> Before we can continue with this discussion we need to figure out how to =
get
> the hardware reliable first.
> =

> In other words if we would have explicit user fences everywhere, how would
> we handle timeouts and misbehaving processes? As it turned out they haven=
't
> figured this out on Windows yet either.

Lol.

> > > > Maybe also pick up that other subthread which ended with my last re=
ply.
> > > I will send out another proposal for how to handle user fences shortl=
y.
> > Maybe let's discuss this here first before we commit to requiring all
> > userspace to upgrade to user fences ... I do agree that we want to go
> > there too, but breaking all the compositors is probably not the best
> > option.
> =

> I was more thinking about handling it all in the kernel.

Yeah can do, just means that you also have to copy the ringbuffer stuff
over from userspace to the kernel.

It also means that there's more differences in how your userspace works
between full userspace mode (necessary for compute) and legacy dma-fence
mode (necessary for desktop 3d). Which is especially big fun for vulkan,
since that will have to do both.

But then amd is still hanging onto the amdgpu vs amdkfd split, so you're
going for max pain in this area anyway :-P
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
