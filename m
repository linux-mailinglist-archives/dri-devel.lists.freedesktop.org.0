Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5219C4015
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 15:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681F310E4C3;
	Mon, 11 Nov 2024 14:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOUn9EOr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9C10E4C1;
 Mon, 11 Nov 2024 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731333629; x=1762869629;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=k5KMfnwXvqjSfpTCU0zPPwJ3Tw8lXegePuO8A03Bt90=;
 b=JOUn9EOrMC5tHRNSZLZIywvUi0K9nNNJKL4LBw0xnzsLdqbw/tk5f3r/
 rdmucAhA1fJp7/zTviCB3bhEo3uaQ859mPofALBOT4+zyQB0Kx1drh1Bw
 BrfYIOzm7+81i/y5zplH4Mu1H4f4zcCsJu1Ai6RvrjY4Jz9iedgxzkOB+
 SdspbRHhyi2WAYgl/CX0wSwVsGPusKDtH2S4pxlnuKq3Z+C8kSaDzsISI
 ndGA/LfTQhC+krQ6o1pSJhAn1vK9oaKZPiohMgHXc4YRVVQZjeOR282Vt
 QWl6WBdOy/RlZMKhM/AY/4Jh838j8xJDzXmZeLKGkkVEsNQcmyfelHN/I Q==;
X-CSE-ConnectionGUID: +GGbTvBsSPCBeIPgAe11BA==
X-CSE-MsgGUID: zdiaxXZkSPycpDIH7v59mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="31244320"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="31244320"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:00:24 -0800
X-CSE-ConnectionGUID: TONxTrx1T3WATYMD3u6HbA==
X-CSE-MsgGUID: 6huUQ6hHQAORkg9rPsT9BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="86864868"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:00:09 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
References: <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 11 Nov 2024 16:00:02 +0200
Message-ID: <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.10
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

Quoting Christian K=C3=B6nig (2024-11-11 13:34:12)
> Am 11.11.24 um 11:10 schrieb Simona Vetter:
> > On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
> >> Back from some time off and will try to answer below.
> >>
> >> Adding Dave and Sima as this topic has been previously discussed to so=
me
> >> extent and will be good to reach common understanding about what the
> >> series is trying to do and what is the difference to the AMD debugging
> >> model.
> > I chatted about this thread a bit on irc with folks, and I think an
> > orthogonal issue is the question, what should be in ttm-utils? I've ask=
ed
> > Matt to type up a DOC patch once we have some consensus, since imo the
> > somewhat lackluster documentation situation for ttm is also somewhat a
> > cause for these big threads on various different topics. Aside from the
> > fact that gpu memory management is just hard.
> >
> > On the uapi/design aspect, I think this would serve well with a patch to
> > drm-uapi.rst that adds a debugging section? At least once we have some
> > rough consensus across drivers, and more importantly userspace in the f=
orm
> > of gdb upstream (at least I'm not aware of any other upstream debugger
> > patches, I think amd's rocm stuff is also gdb-only).
>=20
> Yeah that seems to be a really good idea. Similar design ideas came up=20
> AMD internally as well but where dropped after pointing people to=20
> pidfd_getfd().
>=20
> But the bigger problem seems to be that the design doesn't seems to take =

> the dma_fence requirements into account.

Where would you deduce that?

We specifically limit the debugging to Long Running contexts which don't
depend on dma_fences.

> In other words attaching gdb to a pid seems to stop the GPU thread of=20
> this pid without waiting for the XE preemption nor end of operation fence.
>=20
> I mean if the GPU threads are preempted that could work, but yeah not=20
> like this :)

For us, hitting a breakpoint inside the workload would always violate
any dma_fence timeout for the submitted workload, as the HW context can't
be switched out while in the breakpoint.

For any dma_fence workload the guarantee is that that it completes
within reasonable time after submission (guaranteed by the submitter). I
don't see how you could really allow interactive debugging of a
breakpoint under those restrictions anyway even if pre-emption was
supported as the workload would not finish in <10 seconds?

For i915 we did have the "pre-emptable but indefinitely long dma_fence work=
loads"
concept at one point and that was rejected after the lengthy discussion.

So I think only way to allow interactive debugging is to avoid the
dma_fences. Curious to hear if there are ideas for otherwise.

Regards, Joonas

>=20
> Regards,
> Christian.
>=20
> >
> > Some wash-up thoughts from me below, but consider them fairly irrelevant
> > since I think the main driver for these big questions here should be
> > gdb/userspace.
> >
> >> Quoting Christian K=C3=B6nig (2024-11-07 11:44:33)
> >>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
> >>>
> >>>      [SNIP]
> >>>
> >>>      This is not a generic interface that anyone can freely access. T=
he same
> >>>      permissions used by ptrace are checked when opening such an inte=
rface.
> >>>      See [1] [2].
> >>>
> >>>      [1] https://patchwork.freedesktop.org/patch/617470/?series=3D136=
572&rev=3D2
> >>>      [2] https://patchwork.freedesktop.org/patch/617471/?series=3D136=
572&rev=3D2
> >>>
> >>>
> >>> Thanks a lot for those pointers, that is exactly what I was looking f=
or.
> >>>
> >>> And yeah, it is what I feared. You are re-implementing existing funct=
ionality,
> >>> but see below.
> >> Could you elaborate on what this "existing functionality" exactly is?
> >> I do not think this functionality exists at this time.
> >>
> >> The EU debugging architecture for Xe specifically avoids the need for =
GDB
> >> to attach with ptrace to the CPU process or interfere with the CPU pro=
cess for
> >> the debugging via parasitic threads or so.
> >>
> >> Debugger connection is opened to the DRM driver for given PID (which u=
ses the
> >> ptrace may access check for now) after which the all DRM client of that
> >> PID are exposed to the debugger process.
> >>
> >> What we want to expose via that debugger connection is the ability for=
 GDB to
> >> read/write the different GPU VM address spaces (ppGTT for Intel GPUs) =
just like
> >> the EU threads would see them. Note that the layout of the ppGTT is
> >> completely up to the userspace driver to setup and is mostly only part=
ially
> >> equal to the CPU address space.
> >>
> >> Specifically as part of reading/writing the ppGTT for debugging purpos=
es,
> >> there are deep flushes needed: for example flushing instruction cache
> >> when adding/removing breakpoints.
> >>
> >> Maybe that will explain the background. I elaborate on this at the end=
 some more.
> >>
> >>>              kmap/vmap are used everywhere in the DRM subsystem to ac=
cess BOs, so I=E2=80=99m
> >>>              failing to see the problem with adding a simple helper b=
ased on existing
> >>>              code.
> >>>
> >>>          What#s possible and often done is to do kmap/vmap if you nee=
d to implement a
> >>>          CPU copy for scanout for example or for copying/validating c=
ommand buffers.
> >>>          But that usually requires accessing the whole BO and has sep=
arate security
> >>>          checks.
> >>>
> >>>          When you want to access only a few bytes of a BO that sounds=
 massively like
> >>>          a peek/poke like interface and we have already rejected that=
 more than once.
> >>>          There even used to be standardized GEM IOCTLs for that which=
 have been
> >>>          removed by now.
> >> Referring to the explanation at top: These IOCTL are not for the debug=
ging target
> >> process to issue. The peek/poke interface is specifically for GDB only
> >> to facilitate the emulation of memory reads/writes on the GPU address
> >> space as they were done by EUs themselves. And to recap: for modifying
> >> instructions for example (add/remove breakpoint), extra level of cache=
 flushing is
> >> needed which is not available to regular userspace.
> >>
> >> I specifically discussed with Sima on the difference before moving for=
ward with this
> >> design originally. If something has changed since then, I'm of course =
happy to rediscuss.
> >>
> >> However, if this code can't be added, not sure how we would ever be ab=
le
> >> to implement core dumps for GPU threads/memory?
> >>
> >>>          If you need to access BOs which are placed in not CPU access=
ible memory then
> >>>          implement the access callback for ptrace, see amdgpu_ttm_acc=
ess_memory for
> >>>          an example how to do this.
> >> As also mentioned above, we don't work via ptrace at all when it comes
> >> to debugging the EUs. The only thing used for now is the ptrace_may_ac=
cess to
> >> implement similar access restrictions as ptrace has. This can be chang=
ed
> >> to something else if needed.
> >>
> >>>      Ptrace access via vm_operations_struct.access =E2=86=92 ttm_bo_v=
m_access.
> >>>
> >>>      This series renames ttm_bo_vm_access to ttm_bo_access, with no c=
ode changes.
> >>>
> >>>      The above function accesses a BO via kmap if it is in SYSTEM / T=
T,
> >>>      which is existing code.
> >>>
> >>>      This function is only exposed to user space via ptrace permissio=
ns.
> >> Maybe this sentence is what caused the confusion.
> >>
> >> Userspace is never exposed with peek/poke interface, only the debugger
> >> connection which is its own FD.
> >>
> >>>      In this series, we implement a function [3] similar to
> >>>      amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
> >>>      missing is non-visible CPU memory access, similar to
> >>>      amdgpu_ttm_access_memory_sdma. This will be addressed in a follo=
w-up and
> >>>      was omitted in this series given its complexity.
> >>>
> >>>      So, this looks more or less identical to AMD's ptrace implementa=
tion,
> >>>      but in GPU address space. Again, I fail to see what the problem =
is here.
> >>>      What am I missing?
> >>>
> >>>
> >>> The main question is why can't you use the existing interfaces direct=
ly?
> >> We're not working on the CPU address space or BOs. We're working
> >> strictly on the GPU address space as would be seen by an EU thread if =
it
> >> accessed address X.
> >>
> >>> Additional to the peek/poke interface of ptrace Linux has the pidfd_g=
etfd
> >>> system call, see here https://man7.org/linux/man-pages/man2/pidfd_get=
fd.2.html.
> >>>
> >>> The pidfd_getfd() allows to dup() the render node file descriptor int=
o your gdb
> >>> process. That in turn gives you all the access you need from gdb, inc=
luding
> >>> mapping BOs and command submission on behalf of the application.
> >> We're not operating on the CPU address space nor are we operating on B=
Os
> >> (there is no concept of BO in the EU debug interface). Each VMA in the=
 VM
> >> could come from anywhere, only the start address and size matter. And
> >> neither do we need to interfere with the command submission of the
> >> process under debug.
> >>
> >>> As far as I can see that allows for the same functionality as the eud=
ebug
> >>> interface, just without any driver specific code messing with ptrace
> >>> permissions and peek/poke interfaces.
> >>>
> >>> So the question is still why do you need the whole eudebug interface =
in the
> >>> first place? I might be missing something, but that seems to be super=
fluous
> >>> from a high level view.
> >> Recapping from above. It is to allow the debugging of EU threads per D=
RM
> >> client, completely independent of the CPU process. If ptrace_may_acces
> >> is the sore point, we could consider other permission checks, too. The=
re
> >> is no other connection to ptrace in this architecture as single
> >> permission check to know if PID is fair game to access by debugger
> >> process.
> >>
> >> Why no parasitic thread or ptrace: Going forward, binding the EU debug=
ging to
> >> the DRM client would also pave way for being able to extend core kerne=
l generated
> >> core dump with each DRM client's EU thread/memory dump. We have similar
> >> feature called "Offline core dump" enabled in the downstream public
> >> trees for i915, where we currently attach the EU thread dump to i915 e=
rror state
> >> and then later combine i915 error state with CPU core dump file with a
> >> tool.
> >>
> >> This is relatively little amount of extra code, as this baseline series
> >> already introduces GDB the ability to perform the necessary actions.
> >> It's just the matter of kernel driver calling: "stop all threads", then
> >> copying the memory map and memory contents for GPU threads, just like =
is
> >> done for CPU threads.
> >>
> >> With parasitic thread injection, not sure if there is such way forward,
> >> as it would seem to require to inject quite abit more logic to core ke=
rnel?
> >>
> >>> It's true that the AMD KFD part has still similar functionality, but =
that is
> >>> because of the broken KFD design of tying driver state to the CPU pro=
cess
> >>> (which makes it inaccessible for gdb even with imported render node f=
d).
> >>>
> >>> Both Sima and I (and partially Dave as well) have pushed back on the =
KFD
> >>> approach. And the long term plan is to get rid of such device driver =
specific
> >>> interface which re-implement existing functionality just differently.
> >> Recapping, this series is not adding it back. The debugger connection
> >> is a separate FD from the DRM one, with separate IOCTL set. We don't a=
llow
> >> the DRM FD any new operations based on ptrace is attached or not. We
> >> don't ever do that check even.
> >>
> >> We only restrict the opening of the debugger connection to given PID w=
ith
> >> ptrace_may_access check for now. That can be changed to something else,
> >> if necessary.
> > Yeah I think unnecessarily tying gpu processes to cpu processes is a bad
> > thing, least because even today all the svm discussions we have still h=
it
> > clear use-cases, where a 1:1 match is not wanted (like multiple gpu svm
> > sections with offsets). Not even speaking of all the gpu usecases where
> > the gpu vm space is still entirely independent of the cpu side.
> >
> > So that's why I think this entirely separate approach looks like the ri=
ght
> > one, with ptrace_may_access as the access control check to make sure we
> > match ptrace on the cpu side.
> >
> > But there's very obviously a bikeshed to be had on what the actual uapi
> > should look like, especially how gdb opens up a gpu debug access fd. Bu=
t I
> > also think that's not much on drm to decide, but whatever gdb wants. And
> > then we aim for some consistency on that lookup/access control part
> > (ideally, I might be missing some reasons why this is a bad idea) across
> > drm drivers.
> >
> >>> So you need to have a really really good explanation why the eudebug =
interface
> >>> is actually necessary.
> >> TL;DR The main point is to decouple the debugging of the EU workloads =
from the
> >> debugging of the CPU process. This avoids the interference with the CP=
U process with
> >> parasitic thread injection. Further this also allows generating a core=
 dump
> >> without any GDB connected. There are also many other smaller pros/cons
> >> which can be discussed but for the context of this patch, this is the
> >> main one.
> >>
> >> So unlike parasitic thread injection, we don't unlock any special IOCT=
L for
> >> the process under debug to be performed by the parasitic thread, but we
> >> allow the minimal set of operations to be performed by GDB as if those=
 were
> >> done on the EUs themselves.
> >>
> >> One can think of it like the minimal subset of ptrace but for EU threa=
ds,
> >> not the CPU threads. And thus, building on this it's possible to extend
> >> the core kernel generated core dumps with DRM specific extension which
> >> would contain the EU thread/memory dump.
> > It might be good to document (in that debugging doc patch probably) why
> > thread injection is not a great option, and why the tradeoffs for
> > debugging are different than for for checkpoint/restore, where with CRIU
> > we landed on doing most of this in userspace, and often requiring
> > injection threads to make it all work.
> >
> > Cheers, Sima
> >
> >> Regards, Joonas
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>
> >>>
> >>>      Matt
> >>>
> >>>      [3] https://patchwork.freedesktop.org/patch/622520/?series=3D140=
200&rev=3D6
> >>>
> >>>
> >>>          Regards,
> >>>          Christian.
> >>>
> >>>
> >>>              Matt
> >>>
> >>>
> >>>                  Regards,
> >>>                  Christian.
> >>>
>
