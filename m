Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F349C5912
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 14:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000910E5EC;
	Tue, 12 Nov 2024 13:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqgMFpCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AC810E5E1;
 Tue, 12 Nov 2024 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418235; x=1762954235;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=4lOLn/PhfN3G4+LteuGo2M5nt0zs9RiYdxcrKiVFDvI=;
 b=EqgMFpCQT70a+G6yw1oyVhApUq/lHqOUYyU97JD0b+UW+tFYFdC5wYHD
 U+Yuzc75vXevbUAKKkhh9BQsP6IQ8yho2PffUMChIQv4FMIV6gEFUAxTC
 aQQ+eFm51nGf2p27XMQkwK4dMbRvUe0xAXI8x6usODvHiKuJgOD06Wa1E
 dFS6jXDEw4NsNQUeHW08VxpWAtVAHmQPYVQ6GcTyVJyGmQb7znS1Cwqo2
 gEJLSpm9RBL+DI+nQ7DXAVstzSDYWj7jmZYyTMPS1YEOZawydQsmAuULM
 j1U9W76nL8aek6u/hJQI6P7kGgxK2/wrsogyLNl6vt3Guv6DMmVhCKzWP A==;
X-CSE-ConnectionGUID: VTXunGJMRfmuQ0iPzjty/g==
X-CSE-MsgGUID: 6Z5iiQ2yQT6knoIyxz9Uew==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35184103"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="35184103"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:34 -0800
X-CSE-ConnectionGUID: paiWnIKjSj2wgroYfWK5AA==
X-CSE-MsgGUID: WzWjMTUtQAKTsNRI/Cz+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="87886664"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.173])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:30 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aecad60a-aba6-421c-8e0c-51c2baaca36d@gmail.com>
References: <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <ZzMRk_KVWzYwr-VI@phenom.ffwll.local>
 <aecad60a-aba6-421c-8e0c-51c2baaca36d@gmail.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Huang Rui <ray.huang@amd.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, matthew.auld@intel.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
To: Christian =?utf-8?q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 12 Nov 2024 15:30:26 +0200
Message-ID: <173141822692.132411.17758226622183726447@jlahtine-mobl.ger.corp.intel.com>
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

(+ Thomas and Francois related to the page-faults and scheduling)

Quoting Christian K=C3=B6nig (2024-11-12 10:58:18)
> Am 12.11.24 um 09:28 schrieb Simona Vetter:
> > On Mon, Nov 11, 2024 at 04:00:02PM +0200, Joonas Lahtinen wrote:
> >> Quoting Christian K=C3=B6nig (2024-11-11 13:34:12)
> >>> Am 11.11.24 um 11:10 schrieb Simona Vetter:
> >>>> On Mon, Nov 11, 2024 at 10:00:17AM +0200, Joonas Lahtinen wrote:
> >>>>> Back from some time off and will try to answer below.
> >>>>>
> >>>>> Adding Dave and Sima as this topic has been previously discussed to=
 some
> >>>>> extent and will be good to reach common understanding about what the
> >>>>> series is trying to do and what is the difference to the AMD debugg=
ing
> >>>>> model.
> >>>> I chatted about this thread a bit on irc with folks, and I think an
> >>>> orthogonal issue is the question, what should be in ttm-utils? I've =
asked
> >>>> Matt to type up a DOC patch once we have some consensus, since imo t=
he
> >>>> somewhat lackluster documentation situation for ttm is also somewhat=
 a
> >>>> cause for these big threads on various different topics. Aside from =
the
> >>>> fact that gpu memory management is just hard.
> >>>>
> >>>> On the uapi/design aspect, I think this would serve well with a patc=
h to
> >>>> drm-uapi.rst that adds a debugging section? At least once we have so=
me
> >>>> rough consensus across drivers, and more importantly userspace in th=
e form
> >>>> of gdb upstream (at least I'm not aware of any other upstream debugg=
er
> >>>> patches, I think amd's rocm stuff is also gdb-only).
> >>> Yeah that seems to be a really good idea. Similar design ideas came up
> >>> AMD internally as well but where dropped after pointing people to
> >>> pidfd_getfd().
> > Maybe not yet awake enough yet, but how does pidfd_getfd() sort out
> > debugger uapi fun?
>=20
> It doesn't sorts them out, but it is a good helper to have in the toolbox.

I didn't find any instance of pidfd_getfd in current GDB sources. Maybe
you are referring to downstream trees for existing usage you mentioned
in the other thread, do you have a pointer to such code?

> The key point is it allows a debugger to not only suspend the CPU=20
> threads, peek/pook into the address space etc..., but also interact with =

> the kernel device driver in the same way as the debugged application woul=
d.

Unless you fully stop all the CPU threads, then do the pidfd_getfd and
close the dupped FD before resuming any CPU thread, you are interfering
with the FD lifetime perceived by the the CPU process. Aren't you?

I don't think stopping CPU threads is desireable as per my understanding
stop-all mode (or whatever is the right lingo inside GDB) is not always
good for catching bugs in massively parallel code. So the expectation
is that user may want to disable the stop-all mode so that even if you
would hit a breakpoint in one CPU/GPU thread, the rest of the CPU and GPU
threads would continue running unimpacted.

What you are suggesting seems to inherently always require stopping the CPU
threads to implement GPU debugging actions. Otherwise there is the fear
of interfering with the running CPU process? Stopping always is probably
fine for CRIU type of functionality, where the CPU threads are frozen, too.

My limited understanding to the subject is that the need is to expose
the GPU threads as their own set of threads/inferiors under GDB.
Controlling them should not interfere with the CPU threads. Injecting a
parasitic thread hidden from the user alleviates part of that, but brings
its own set of problems as you seem to agree.

However, for the ultimate details about why interfering with the CPU
threads is bad when controlling the GPU threads, we will probably have
to refer to the GDB experts.

This implementation follows the guideline of not interfering with the CPU
process as a primary design requirement coming from the GDB folks, so if
that needs to be discussed further, we need to pull in other folks and
mailing lists I think.

> So you can for example do things mmap() KMS handles to inspect scanned=20
> out images, or do things like command submission in the context of the=20
> debugged application etc....

That's understood, but we do not need any of that functionality at this poi=
nt
and do not foresee needing it in the future.

> At least for us that made in unnecessary to work with a parasitic thread =

> injected into the debugged application, e.g. it avoided the need for the =

> debugger to run code in the context of the debugged application.

How do you avoid interfering with the application logic if user wants to
have the CPU threads running while single-stepping through the GPU code,
or do you simply not allow that?

> You still need to define the approach, UAPI etc.. but you don't have to=20
> worry about access restrictions any more because that is already check=20
> by pidfd_getfd() and can implement you debugging UAPI just as normal=20
> driver IOCTLs on the DRM render node.

Avoiding the access check is neat indeed. My thinking is we could incorpora=
te
just that part and only allow opening the debug connection if the initating
process provides a FD that maps to the same DRM client that is targeted
for debugging (acquired via pidfd_getfd or explicit sharing). That would
eliminate the need for ptrace_may_access exporting.

<SNIP>

> >>> But the bigger problem seems to be that the design doesn't seems to t=
ake
> >>> the dma_fence requirements into account.
> >> Where would you deduce that?
> >>
> >> We specifically limit the debugging to Long Running contexts which don=
't
> >> depend on dma_fences.
> >>
> >>> In other words attaching gdb to a pid seems to stop the GPU thread of
> >>> this pid without waiting for the XE preemption nor end of operation f=
ence.
> >>>
> >>> I mean if the GPU threads are preempted that could work, but yeah not
> >>> like this :)
> >> For us, hitting a breakpoint inside the workload would always violate
> >> any dma_fence timeout for the submitted workload, as the HW context ca=
n't
> >> be switched out while in the breakpoint.
> >>
> >> For any dma_fence workload the guarantee is that that it completes
> >> within reasonable time after submission (guaranteed by the submitter).=
 I
> >> don't see how you could really allow interactive debugging of a
> >> breakpoint under those restrictions anyway even if pre-emption was
> >> supported as the workload would not finish in <10 seconds?
> > It defacto amounts to being able to kill a gpu process (if your debugger
> > is stuck for too long), which is random because of memory management
> > dependencies that could happen anywhere in userspace execution. So
> > definitely not something we should enable by default, at most it's tech
> > preview level or robust.

It all exists behind a explicit enable flag that is disabled by default
because on current hardware we have this blocking problem and we also
have to limit to running contexts to single application due to stop-all
command impacting all active EUs for now.

> > But as long as the tdr is there and still works even if a debugger sess=
ion
> > is attached I don't see a fundamental issue. But should document some u=
api
> > expectations for sure in this area.

I think the uAPI expectations equally also apply for any long-running workl=
oads?

> >> For i915 we did have the "pre-emptable but indefinitely long dma_fence=
 workloads"
> >> concept at one point and that was rejected after the lengthy discussio=
n.
> >>
> >> So I think only way to allow interactive debugging is to avoid the
> >> dma_fences. Curious to hear if there are ideas for otherwise.
> > Yeah, if gpu debugging holds up preemption then no dma_fence is the only
> > way out. Which means allowing gdb requires that the gpu context uses hw
> > page faults for everything, so that we can still nuke away memory from
> > underneath it.

Yeah, that has been under discussion. It's anyway highly desireable to use =
the
HW page faults when debugging to be able to catch NULL dereference and
similar bugs.

> > It probably also means you need exclusive access to the gpu, if that mo=
de
> > holds up other workloads. So that's maybe another access rights question
> > the uapi doc patch needs to sort out.

We already require exclusive access because stop-all threads command
impacts all running threads on current hardware. That and the no
pre-emption when on breakpoint are the big reason why it's behind a
sysfs flag disabled by default.

> > I think finally we might want to have some really tainting debug module
> > option know that lifts some of the restrictions, for playing around or
> > people who know what they're doing, as in, they're ok with their
> > application under debugging occasionally just dying in tdr because of
> > timeouts.

That might be an option when the page-faults are not enabled. But once
they are enabled and thus we can satisfy the memory pre-empt fence, my
understanding is that we should be able to avoid dma_fence workloads
from being blocked by the LR workloads.

This would mean limiting the blocking to other LR workloads, and making
the problem into sysadmin decision about exclusive use of engine. And
not about core memory management going belly up due to dma fence
dependencies.

And again, the question arises equally if we're talking about
stuck-in-a-breakpoint workload or just a long thread group. So problem is n=
ot
specific to EU debugging. Thomas and Francois can probably elaborate
more if needed.

Regards, Joonas

> >
> > Cheers, Sima
> >
> >> Regards, Joonas
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> Some wash-up thoughts from me below, but consider them fairly irrele=
vant
> >>>> since I think the main driver for these big questions here should be
> >>>> gdb/userspace.
> >>>>
> >>>>> Quoting Christian K=C3=B6nig (2024-11-07 11:44:33)
> >>>>>> Am 06.11.24 um 18:00 schrieb Matthew Brost:
> >>>>>>
> >>>>>>       [SNIP]
> >>>>>>
> >>>>>>       This is not a generic interface that anyone can freely acces=
s. The same
> >>>>>>       permissions used by ptrace are checked when opening such an =
interface.
> >>>>>>       See [1] [2].
> >>>>>>
> >>>>>>       [1] https://patchwork.freedesktop.org/patch/617470/?series=
=3D136572&rev=3D2
> >>>>>>       [2] https://patchwork.freedesktop.org/patch/617471/?series=
=3D136572&rev=3D2
> >>>>>>
> >>>>>>
> >>>>>> Thanks a lot for those pointers, that is exactly what I was lookin=
g for.
> >>>>>>
> >>>>>> And yeah, it is what I feared. You are re-implementing existing fu=
nctionality,
> >>>>>> but see below.
> >>>>> Could you elaborate on what this "existing functionality" exactly i=
s?
> >>>>> I do not think this functionality exists at this time.
> >>>>>
> >>>>> The EU debugging architecture for Xe specifically avoids the need f=
or GDB
> >>>>> to attach with ptrace to the CPU process or interfere with the CPU =
process for
> >>>>> the debugging via parasitic threads or so.
> >>>>>
> >>>>> Debugger connection is opened to the DRM driver for given PID (whic=
h uses the
> >>>>> ptrace may access check for now) after which the all DRM client of =
that
> >>>>> PID are exposed to the debugger process.
> >>>>>
> >>>>> What we want to expose via that debugger connection is the ability =
for GDB to
> >>>>> read/write the different GPU VM address spaces (ppGTT for Intel GPU=
s) just like
> >>>>> the EU threads would see them. Note that the layout of the ppGTT is
> >>>>> completely up to the userspace driver to setup and is mostly only p=
artially
> >>>>> equal to the CPU address space.
> >>>>>
> >>>>> Specifically as part of reading/writing the ppGTT for debugging pur=
poses,
> >>>>> there are deep flushes needed: for example flushing instruction cac=
he
> >>>>> when adding/removing breakpoints.
> >>>>>
> >>>>> Maybe that will explain the background. I elaborate on this at the =
end some more.
> >>>>>
> >>>>>>               kmap/vmap are used everywhere in the DRM subsystem t=
o access BOs, so I=E2=80=99m
> >>>>>>               failing to see the problem with adding a simple help=
er based on existing
> >>>>>>               code.
> >>>>>>
> >>>>>>           What#s possible and often done is to do kmap/vmap if you=
 need to implement a
> >>>>>>           CPU copy for scanout for example or for copying/validati=
ng command buffers.
> >>>>>>           But that usually requires accessing the whole BO and has=
 separate security
> >>>>>>           checks.
> >>>>>>
> >>>>>>           When you want to access only a few bytes of a BO that so=
unds massively like
> >>>>>>           a peek/poke like interface and we have already rejected =
that more than once.
> >>>>>>           There even used to be standardized GEM IOCTLs for that w=
hich have been
> >>>>>>           removed by now.
> >>>>> Referring to the explanation at top: These IOCTL are not for the de=
bugging target
> >>>>> process to issue. The peek/poke interface is specifically for GDB o=
nly
> >>>>> to facilitate the emulation of memory reads/writes on the GPU addre=
ss
> >>>>> space as they were done by EUs themselves. And to recap: for modify=
ing
> >>>>> instructions for example (add/remove breakpoint), extra level of ca=
che flushing is
> >>>>> needed which is not available to regular userspace.
> >>>>>
> >>>>> I specifically discussed with Sima on the difference before moving =
forward with this
> >>>>> design originally. If something has changed since then, I'm of cour=
se happy to rediscuss.
> >>>>>
> >>>>> However, if this code can't be added, not sure how we would ever be=
 able
> >>>>> to implement core dumps for GPU threads/memory?
> >>>>>
> >>>>>>           If you need to access BOs which are placed in not CPU ac=
cessible memory then
> >>>>>>           implement the access callback for ptrace, see amdgpu_ttm=
_access_memory for
> >>>>>>           an example how to do this.
> >>>>> As also mentioned above, we don't work via ptrace at all when it co=
mes
> >>>>> to debugging the EUs. The only thing used for now is the ptrace_may=
_access to
> >>>>> implement similar access restrictions as ptrace has. This can be ch=
anged
> >>>>> to something else if needed.
> >>>>>
> >>>>>>       Ptrace access via vm_operations_struct.access =E2=86=92 ttm_=
bo_vm_access.
> >>>>>>
> >>>>>>       This series renames ttm_bo_vm_access to ttm_bo_access, with =
no code changes.
> >>>>>>
> >>>>>>       The above function accesses a BO via kmap if it is in SYSTEM=
 / TT,
> >>>>>>       which is existing code.
> >>>>>>
> >>>>>>       This function is only exposed to user space via ptrace permi=
ssions.
> >>>>> Maybe this sentence is what caused the confusion.
> >>>>>
> >>>>> Userspace is never exposed with peek/poke interface, only the debug=
ger
> >>>>> connection which is its own FD.
> >>>>>
> >>>>>>       In this series, we implement a function [3] similar to
> >>>>>>       amdgpu_ttm_access_memory for the TTM vfunc access_memory. Wh=
at is
> >>>>>>       missing is non-visible CPU memory access, similar to
> >>>>>>       amdgpu_ttm_access_memory_sdma. This will be addressed in a f=
ollow-up and
> >>>>>>       was omitted in this series given its complexity.
> >>>>>>
> >>>>>>       So, this looks more or less identical to AMD's ptrace implem=
entation,
> >>>>>>       but in GPU address space. Again, I fail to see what the prob=
lem is here.
> >>>>>>       What am I missing?
> >>>>>>
> >>>>>>
> >>>>>> The main question is why can't you use the existing interfaces dir=
ectly?
> >>>>> We're not working on the CPU address space or BOs. We're working
> >>>>> strictly on the GPU address space as would be seen by an EU thread =
if it
> >>>>> accessed address X.
> >>>>>
> >>>>>> Additional to the peek/poke interface of ptrace Linux has the pidf=
d_getfd
> >>>>>> system call, see here https://man7.org/linux/man-pages/man2/pidfd_=
getfd.2.html.
> >>>>>>
> >>>>>> The pidfd_getfd() allows to dup() the render node file descriptor =
into your gdb
> >>>>>> process. That in turn gives you all the access you need from gdb, =
including
> >>>>>> mapping BOs and command submission on behalf of the application.
> >>>>> We're not operating on the CPU address space nor are we operating o=
n BOs
> >>>>> (there is no concept of BO in the EU debug interface). Each VMA in =
the VM
> >>>>> could come from anywhere, only the start address and size matter. A=
nd
> >>>>> neither do we need to interfere with the command submission of the
> >>>>> process under debug.
> >>>>>
> >>>>>> As far as I can see that allows for the same functionality as the =
eudebug
> >>>>>> interface, just without any driver specific code messing with ptra=
ce
> >>>>>> permissions and peek/poke interfaces.
> >>>>>>
> >>>>>> So the question is still why do you need the whole eudebug interfa=
ce in the
> >>>>>> first place? I might be missing something, but that seems to be su=
perfluous
> >>>>>> from a high level view.
> >>>>> Recapping from above. It is to allow the debugging of EU threads pe=
r DRM
> >>>>> client, completely independent of the CPU process. If ptrace_may_ac=
ces
> >>>>> is the sore point, we could consider other permission checks, too. =
There
> >>>>> is no other connection to ptrace in this architecture as single
> >>>>> permission check to know if PID is fair game to access by debugger
> >>>>> process.
> >>>>>
> >>>>> Why no parasitic thread or ptrace: Going forward, binding the EU de=
bugging to
> >>>>> the DRM client would also pave way for being able to extend core ke=
rnel generated
> >>>>> core dump with each DRM client's EU thread/memory dump. We have sim=
ilar
> >>>>> feature called "Offline core dump" enabled in the downstream public
> >>>>> trees for i915, where we currently attach the EU thread dump to i91=
5 error state
> >>>>> and then later combine i915 error state with CPU core dump file wit=
h a
> >>>>> tool.
> >>>>>
> >>>>> This is relatively little amount of extra code, as this baseline se=
ries
> >>>>> already introduces GDB the ability to perform the necessary actions.
> >>>>> It's just the matter of kernel driver calling: "stop all threads", =
then
> >>>>> copying the memory map and memory contents for GPU threads, just li=
ke is
> >>>>> done for CPU threads.
> >>>>>
> >>>>> With parasitic thread injection, not sure if there is such way forw=
ard,
> >>>>> as it would seem to require to inject quite abit more logic to core=
 kernel?
> >>>>>
> >>>>>> It's true that the AMD KFD part has still similar functionality, b=
ut that is
> >>>>>> because of the broken KFD design of tying driver state to the CPU =
process
> >>>>>> (which makes it inaccessible for gdb even with imported render nod=
e fd).
> >>>>>>
> >>>>>> Both Sima and I (and partially Dave as well) have pushed back on t=
he KFD
> >>>>>> approach. And the long term plan is to get rid of such device driv=
er specific
> >>>>>> interface which re-implement existing functionality just different=
ly.
> >>>>> Recapping, this series is not adding it back. The debugger connecti=
on
> >>>>> is a separate FD from the DRM one, with separate IOCTL set. We don'=
t allow
> >>>>> the DRM FD any new operations based on ptrace is attached or not. We
> >>>>> don't ever do that check even.
> >>>>>
> >>>>> We only restrict the opening of the debugger connection to given PI=
D with
> >>>>> ptrace_may_access check for now. That can be changed to something e=
lse,
> >>>>> if necessary.
> >>>> Yeah I think unnecessarily tying gpu processes to cpu processes is a=
 bad
> >>>> thing, least because even today all the svm discussions we have stil=
l hit
> >>>> clear use-cases, where a 1:1 match is not wanted (like multiple gpu =
svm
> >>>> sections with offsets). Not even speaking of all the gpu usecases wh=
ere
> >>>> the gpu vm space is still entirely independent of the cpu side.
> >>>>
> >>>> So that's why I think this entirely separate approach looks like the=
 right
> >>>> one, with ptrace_may_access as the access control check to make sure=
 we
> >>>> match ptrace on the cpu side.
> >>>>
> >>>> But there's very obviously a bikeshed to be had on what the actual u=
api
> >>>> should look like, especially how gdb opens up a gpu debug access fd.=
 But I
> >>>> also think that's not much on drm to decide, but whatever gdb wants.=
 And
> >>>> then we aim for some consistency on that lookup/access control part
> >>>> (ideally, I might be missing some reasons why this is a bad idea) ac=
ross
> >>>> drm drivers.
> >>>>
> >>>>>> So you need to have a really really good explanation why the eudeb=
ug interface
> >>>>>> is actually necessary.
> >>>>> TL;DR The main point is to decouple the debugging of the EU workloa=
ds from the
> >>>>> debugging of the CPU process. This avoids the interference with the=
 CPU process with
> >>>>> parasitic thread injection. Further this also allows generating a c=
ore dump
> >>>>> without any GDB connected. There are also many other smaller pros/c=
ons
> >>>>> which can be discussed but for the context of this patch, this is t=
he
> >>>>> main one.
> >>>>>
> >>>>> So unlike parasitic thread injection, we don't unlock any special I=
OCTL for
> >>>>> the process under debug to be performed by the parasitic thread, bu=
t we
> >>>>> allow the minimal set of operations to be performed by GDB as if th=
ose were
> >>>>> done on the EUs themselves.
> >>>>>
> >>>>> One can think of it like the minimal subset of ptrace but for EU th=
reads,
> >>>>> not the CPU threads. And thus, building on this it's possible to ex=
tend
> >>>>> the core kernel generated core dumps with DRM specific extension wh=
ich
> >>>>> would contain the EU thread/memory dump.
> >>>> It might be good to document (in that debugging doc patch probably) =
why
> >>>> thread injection is not a great option, and why the tradeoffs for
> >>>> debugging are different than for for checkpoint/restore, where with =
CRIU
> >>>> we landed on doing most of this in userspace, and often requiring
> >>>> injection threads to make it all work.
> >>>>
> >>>> Cheers, Sima
> >>>>
> >>>>> Regards, Joonas
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>       Matt
> >>>>>>
> >>>>>>       [3] https://patchwork.freedesktop.org/patch/622520/?series=
=3D140200&rev=3D6
> >>>>>>
> >>>>>>
> >>>>>>           Regards,
> >>>>>>           Christian.
> >>>>>>
> >>>>>>
> >>>>>>               Matt
> >>>>>>
> >>>>>>
> >>>>>>                   Regards,
> >>>>>>                   Christian.
> >>>>>>
>
