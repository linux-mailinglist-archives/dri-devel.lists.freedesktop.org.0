Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080989C5952
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 14:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE86F10E30A;
	Tue, 12 Nov 2024 13:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QEEDeoFQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A2510E30A;
 Tue, 12 Nov 2024 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418878; x=1762954878;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=KohF5tR1C4swuIfptTXT1m3728fg1cSzZ/LA91/ukIw=;
 b=QEEDeoFQy7VkGoj/odef2gi9UoC/fsp6z8cGDBcBKVPfp6Tvyz8tVNLQ
 MGBRKQyTvqj6x68RODdSXqN9QD9apiUcjRiwS/C/Tdxd1S1fl/Gjxvb6I
 m7aGeL5nzx3THuRiBMH1lhefBUfXwH1AC5FYq1k5Uu2LyND9Ft7eupkda
 eTrQICZNfjETMesy17Zqh5Vbd6Hgv+4cmcRzVwcRxBzD0Opx/SSMjSTeG
 l3GRw0k+QniKPrAmdAV7ThT/Teh7YMgg3ulTo4ZWPtF7tk8FJpg9UFOrx
 OeWgJLWAqaY33PT3Kbq9Y60xf/88AAdCjqBNw/jQbolTMCrkgAEQDtgJa A==;
X-CSE-ConnectionGUID: nylQWCkMTlO3Q0WmgAk6Zw==
X-CSE-MsgGUID: o+gXzwlHTfqLsSq2iSjhcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="18862920"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="18862920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:41:18 -0800
X-CSE-ConnectionGUID: lHOQ2jmGSG2z8hZ2Cse0tA==
X-CSE-MsgGUID: LhyUaJfcQEKPNCDEwikU8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="88287926"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.173])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:41:12 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
References: <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
 <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
 <ZzHYB4MBJmVjk-AR@phenom.ffwll.local>
 <a1ffb3f7-77bc-41ff-a98a-5cd889f081fa@amd.com>
 <173133360247.70529.14349388659124962988@jlahtine-mobl.ger.corp.intel.com>
 <8d181425-db3b-46b7-ae73-ae6ef149d185@amd.com>
 <ZzKJHxaMnWKQ5mzV@lstrano-desk.jf.intel.com>
 <31b16d78-708d-4f19-9b33-891e31be5480@gmail.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Thomas =?utf-8?q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 12 Nov 2024 15:41:09 +0200
Message-ID: <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
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

(+ Thomas)

Quoting Christian K=C3=B6nig (2024-11-12 11:23:36)
> Am 11.11.24 um 23:45 schrieb Matthew Brost:
>=20
>     [SNIP]
>=20
>             So I think only way to allow interactive debugging is to avoi=
d the
>             dma_fences. Curious to hear if there are ideas for otherwise.
>=20
>         You need to guarantee somehow that the process is taken from the =
hardware so
>         that the preemption fence can signal.
>=20
>=20
>     Our preemption fences have this functionality.
>=20
>     A preemption fence issues a suspend execution command to the firmware=
. The
>     firmware, in turn, attempts to preempt the workload. If it doesn't re=
spond
>     within a specified period, it resets the hardware queue, sends a mess=
age to KMD,
>     bans the software queue, and signals the preemption fence.
>=20
>     We provide even more protection than that. If, for some reason, the f=
irmware
>     doesn't respond within a longer timeout period, the KMD performs a de=
vice reset,
>     ban the offending software queue(s), and will signal the preemption f=
ences.
>=20
>     This flow remains the same whether a debugger is attached or, for exa=
mple, a
>     user submits a 10-minute non-preemptable workload. In either case, ot=
her
>     processes are guaranteed to make forward progress.
>=20
>=20
> Yeah that is pretty much the same argumentation I have heard before and it
> turned out to not be working.
>=20
>=20
>     The example above illustrates the memory oversubscription case, where=
 two
>     processes are using 51% of the memory.
>=20
>=20
> That isn't even necessary. We have seen applications dying just because t=
he
> core memory management tried to join back small pages into huge pages in =
an
> userptr.
>=20
> That the core memory management jumps in and requests that the pre-emption
> fence signals can happen all the time.

Ouch. Does there happen to be a known reproducer for this behavior or maybe
bug report?

> You can mitigate that a bit, Fedora for example disables joining back sma=
ll
> pages into huge pages by default for example and we even had people sugge=
sting
> to use mprotect() so that userptrs VMAs don't fork() any more (which is of
> course completely illegal).
>=20
> But my long term take away is that you can't block all causes of sudden
> requests to let a pre-emption fence signal.

I think this problem equally applies to the LR-workloads like the EU
debugging ones.

>     Another preemption scenario involves two processes sharing hardware r=
esources.
>     Our firmware follows the same flow here. If an LR workload is using a=
 hardware
>     resource and a DMA-fence workload is waiting, and if the LR workload =
doesn't
>     preempt the in a timely manner, the firmware issues a hardware reset,=
 notifies
>     KMD, and bans the LR software queue. The DMA-fence workload then can =
make
>     forward progress
>=20
>     With the above in mind, this is why I say that if a user tries to run=
 a game and
>     a non-preemptable LR workload, either oversubscribing memory or shari=
ng hardware
>     resources, it is unlikely to work well. However, I don't think this i=
s a common
>     use case. I would expect that when a debugger is open, it is typicall=
y by a
>     power user who knows how to disable other GPU tasks (e.g., by enablin=
g software
>     rendering or using a machine without any display).
>=20
>     Given this, please to reconsider your position.
>=20
>=20
> The key point here is that this isn't stable, you can do that as a tech d=
emo
> but it can always be that debugging an application just randomly dies. And
> believe me AMD has tried this to a rather extreme extend as well.

It's not really only limited to the debuggable applications at all, the
normal LR workloads are equally impacted as far as I understand. Just
harder to catch the issue with LR-workloads if the pre-emption fence
signaling is sporadic.

> What you could potentially work is to taint the kernel and make sure that=
 this
> function is only available to user who absolutely know what they are doin=
g.
>=20
> But I would say we can only allow that if all other options have been exe=
rcised
> and doing it like this is really the only option left.

It sounds like servicing the memory pre-empt fence by stealing the
pages from underneath the workload would be the way to resolve this
issue.

This has been extensively discussed already, but was expected to really
only be needed for low-on-memory scenarios. However it now seems like
the need is much earlier due to the random userptr page joining by core
mm.

If that is done and the memory pre-empt fence is serviced even for
debuggable contexts, do you have further concerns with the presented approa=
ch
from dma-buf and drm/sched perspective?

Regards, Joonas

>=20
> Regards,
> Christian.
>=20
>=20
>         This means that a breakpoint or core dump doesn't halt GPU thread=
s, but
>         rather suspends them. E.g. all running wave data is collected int=
o a state
>         bag which can be restored later on.
>=20
>         I was under the impression that those long running compute thread=
s do
>         exactly that, but when the hardware can't switch out the GPU thre=
ad/process
>         while in a break then that isn't the case.
>=20
>         As long as you don't find a way to avoid that this patch set is a=
 pretty
>         clear NAK from my side as DMA-buf and TTM maintainer.
>=20
>=20
>     I believe this is addressed above.
>=20
>     Matt
>=20
>=20
>         What might work is to keep the submission on the hardware in the =
break state
>         but forbid any memory access. This way you can signal your preemp=
tion fence
>         even when the hardware isn't made available.
>=20
>         Before you continue XE setups a new pre-emption fence and makes s=
ure that
>         all page tables etc... are up to date.
>=20
>         Could be tricky to get this right if completion fence based submi=
ssions are
>         mixed in as well, but that gives you at least a direction you cou=
ld
>         potentially go.
>=20
>         Regards,
>         Christian.
>=20
>=20
>             Regards, Joonas
>=20
>=20
>                 Regards,
>                 Christian.
>=20
>=20
>                     Some wash-up thoughts from me below, but consider the=
m fairly irrelevant
>                     since I think the main driver for these big questions=
 here should be
>                     gdb/userspace.
>=20
>=20
>                         Quoting Christian K=C3=B6nig (2024-11-07 11:44:33)
>=20
>                             Am 06.11.24 um 18:00 schrieb Matthew Brost:
>=20
>                                   [SNIP]
>=20
>                                   This is not a generic interface that an=
yone can freely access. The same
>                                   permissions used by ptrace are checked =
when opening such an interface.
>                                   See [1] [2].
>=20
>                                   [1]https://patchwork.freedesktop.org/pa=
tch/617470/?series=3D136572&rev=3D2
>                                   [2]https://patchwork.freedesktop.org/pa=
tch/617471/?series=3D136572&rev=3D2
>=20
>=20
>                             Thanks a lot for those pointers, that is exac=
tly what I was looking for.
>=20
>                             And yeah, it is what I feared. You are re-imp=
lementing existing functionality,
>                             but see below.
>=20
>                         Could you elaborate on what this "existing functi=
onality" exactly is?
>                         I do not think this functionality exists at this =
time.
>=20
>                         The EU debugging architecture for Xe specifically=
 avoids the need for GDB
>                         to attach with ptrace to the CPU process or inter=
fere with the CPU process for
>                         the debugging via parasitic threads or so.
>=20
>                         Debugger connection is opened to the DRM driver f=
or given PID (which uses the
>                         ptrace may access check for now) after which the =
all DRM client of that
>                         PID are exposed to the debugger process.
>=20
>                         What we want to expose via that debugger connecti=
on is the ability for GDB to
>                         read/write the different GPU VM address spaces (p=
pGTT for Intel GPUs) just like
>                         the EU threads would see them. Note that the layo=
ut of the ppGTT is
>                         completely up to the userspace driver to setup an=
d is mostly only partially
>                         equal to the CPU address space.
>=20
>                         Specifically as part of reading/writing the ppGTT=
 for debugging purposes,
>                         there are deep flushes needed: for example flushi=
ng instruction cache
>                         when adding/removing breakpoints.
>=20
>                         Maybe that will explain the background. I elabora=
te on this at the end some more.
>=20
>=20
>                                           kmap/vmap are used everywhere i=
n the DRM subsystem to access BOs, so I=E2=80=99m
>                                           failing to see the problem with=
 adding a simple helper based on existing
>                                           code.
>=20
>                                       What#s possible and often done is t=
o do kmap/vmap if you need to implement a
>                                       CPU copy for scanout for example or=
 for copying/validating command buffers.
>                                       But that usually requires accessing=
 the whole BO and has separate security
>                                       checks.
>=20
>                                       When you want to access only a few =
bytes of a BO that sounds massively like
>                                       a peek/poke like interface and we h=
ave already rejected that more than once.
>                                       There even used to be standardized =
GEM IOCTLs for that which have been
>                                       removed by now.
>=20
>                         Referring to the explanation at top: These IOCTL =
are not for the debugging target
>                         process to issue. The peek/poke interface is spec=
ifically for GDB only
>                         to facilitate the emulation of memory reads/write=
s on the GPU address
>                         space as they were done by EUs themselves. And to=
 recap: for modifying
>                         instructions for example (add/remove breakpoint),=
 extra level of cache flushing is
>                         needed which is not available to regular userspac=
e.
>=20
>                         I specifically discussed with Sima on the differe=
nce before moving forward with this
>                         design originally. If something has changed since=
 then, I'm of course happy to rediscuss.
>=20
>                         However, if this code can't be added, not sure ho=
w we would ever be able
>                         to implement core dumps for GPU threads/memory?
>=20
>=20
>                                       If you need to access BOs which are=
 placed in not CPU accessible memory then
>                                       implement the access callback for p=
trace, see amdgpu_ttm_access_memory for
>                                       an example how to do this.
>=20
>                         As also mentioned above, we don't work via ptrace=
 at all when it comes
>                         to debugging the EUs. The only thing used for now=
 is the ptrace_may_access to
>                         implement similar access restrictions as ptrace h=
as. This can be changed
>                         to something else if needed.
>=20
>=20
>                                   Ptrace access via vm_operations_struct.=
access =E2=86=92 ttm_bo_vm_access.
>=20
>                                   This series renames ttm_bo_vm_access to=
 ttm_bo_access, with no code changes.
>=20
>                                   The above function accesses a BO via km=
ap if it is in SYSTEM / TT,
>                                   which is existing code.
>=20
>                                   This function is only exposed to user s=
pace via ptrace permissions.
>=20
>                         Maybe this sentence is what caused the confusion.
>=20
>                         Userspace is never exposed with peek/poke interfa=
ce, only the debugger
>                         connection which is its own FD.
>=20
>=20
>                                   In this series, we implement a function=
 [3] similar to
>                                   amdgpu_ttm_access_memory for the TTM vf=
unc access_memory. What is
>                                   missing is non-visible CPU memory acces=
s, similar to
>                                   amdgpu_ttm_access_memory_sdma. This wil=
l be addressed in a follow-up and
>                                   was omitted in this series given its co=
mplexity.
>=20
>                                   So, this looks more or less identical t=
o AMD's ptrace implementation,
>                                   but in GPU address space. Again, I fail=
 to see what the problem is here.
>                                   What am I missing?
>=20
>=20
>                             The main question is why can't you use the ex=
isting interfaces directly?
>=20
>                         We're not working on the CPU address space or BOs=
. We're working
>                         strictly on the GPU address space as would be see=
n by an EU thread if it
>                         accessed address X.
>=20
>=20
>                             Additional to the peek/poke interface of ptra=
ce Linux has the pidfd_getfd
>                             system call, see herehttps://man7.org/linux/m=
an-pages/man2/pidfd_getfd.2.html.
>=20
>                             The pidfd_getfd() allows to dup() the render =
node file descriptor into your gdb
>                             process. That in turn gives you all the acces=
s you need from gdb, including
>                             mapping BOs and command submission on behalf =
of the application.
>=20
>                         We're not operating on the CPU address space nor =
are we operating on BOs
>                         (there is no concept of BO in the EU debug interf=
ace). Each VMA in the VM
>                         could come from anywhere, only the start address =
and size matter. And
>                         neither do we need to interfere with the command =
submission of the
>                         process under debug.
>=20
>=20
>                             As far as I can see that allows for the same =
functionality as the eudebug
>                             interface, just without any driver specific c=
ode messing with ptrace
>                             permissions and peek/poke interfaces.
>=20
>                             So the question is still why do you need the =
whole eudebug interface in the
>                             first place? I might be missing something, bu=
t that seems to be superfluous
>                             from a high level view.
>=20
>                         Recapping from above. It is to allow the debuggin=
g of EU threads per DRM
>                         client, completely independent of the CPU process=
. If ptrace_may_acces
>                         is the sore point, we could consider other permis=
sion checks, too. There
>                         is no other connection to ptrace in this architec=
ture as single
>                         permission check to know if PID is fair game to a=
ccess by debugger
>                         process.
>=20
>                         Why no parasitic thread or ptrace: Going forward,=
 binding the EU debugging to
>                         the DRM client would also pave way for being able=
 to extend core kernel generated
>                         core dump with each DRM client's EU thread/memory=
 dump. We have similar
>                         feature called "Offline core dump" enabled in the=
 downstream public
>                         trees for i915, where we currently attach the EU =
thread dump to i915 error state
>                         and then later combine i915 error state with CPU =
core dump file with a
>                         tool.
>=20
>                         This is relatively little amount of extra code, a=
s this baseline series
>                         already introduces GDB the ability to perform the=
 necessary actions.
>                         It's just the matter of kernel driver calling: "s=
top all threads", then
>                         copying the memory map and memory contents for GP=
U threads, just like is
>                         done for CPU threads.
>=20
>                         With parasitic thread injection, not sure if ther=
e is such way forward,
>                         as it would seem to require to inject quite abit =
more logic to core kernel?
>=20
>=20
>                             It's true that the AMD KFD part has still sim=
ilar functionality, but that is
>                             because of the broken KFD design of tying dri=
ver state to the CPU process
>                             (which makes it inaccessible for gdb even wit=
h imported render node fd).
>=20
>                             Both Sima and I (and partially Dave as well) =
have pushed back on the KFD
>                             approach. And the long term plan is to get ri=
d of such device driver specific
>                             interface which re-implement existing functio=
nality just differently.
>=20
>                         Recapping, this series is not adding it back. The=
 debugger connection
>                         is a separate FD from the DRM one, with separate =
IOCTL set. We don't allow
>                         the DRM FD any new operations based on ptrace is =
attached or not. We
>                         don't ever do that check even.
>=20
>                         We only restrict the opening of the debugger conn=
ection to given PID with
>                         ptrace_may_access check for now. That can be chan=
ged to something else,
>                         if necessary.
>=20
>                     Yeah I think unnecessarily tying gpu processes to cpu=
 processes is a bad
>                     thing, least because even today all the svm discussio=
ns we have still hit
>                     clear use-cases, where a 1:1 match is not wanted (lik=
e multiple gpu svm
>                     sections with offsets). Not even speaking of all the =
gpu usecases where
>                     the gpu vm space is still entirely independent of the=
 cpu side.
>=20
>                     So that's why I think this entirely separate approach=
 looks like the right
>                     one, with ptrace_may_access as the access control che=
ck to make sure we
>                     match ptrace on the cpu side.
>=20
>                     But there's very obviously a bikeshed to be had on wh=
at the actual uapi
>                     should look like, especially how gdb opens up a gpu d=
ebug access fd. But I
>                     also think that's not much on drm to decide, but what=
ever gdb wants. And
>                     then we aim for some consistency on that lookup/acces=
s control part
>                     (ideally, I might be missing some reasons why this is=
 a bad idea) across
>                     drm drivers.
>=20
>=20
>                             So you need to have a really really good expl=
anation why the eudebug interface
>                             is actually necessary.
>=20
>                         TL;DR The main point is to decouple the debugging=
 of the EU workloads from the
>                         debugging of the CPU process. This avoids the int=
erference with the CPU process with
>                         parasitic thread injection. Further this also all=
ows generating a core dump
>                         without any GDB connected. There are also many ot=
her smaller pros/cons
>                         which can be discussed but for the context of thi=
s patch, this is the
>                         main one.
>=20
>                         So unlike parasitic thread injection, we don't un=
lock any special IOCTL for
>                         the process under debug to be performed by the pa=
rasitic thread, but we
>                         allow the minimal set of operations to be perform=
ed by GDB as if those were
>                         done on the EUs themselves.
>=20
>                         One can think of it like the minimal subset of pt=
race but for EU threads,
>                         not the CPU threads. And thus, building on this i=
t's possible to extend
>                         the core kernel generated core dumps with DRM spe=
cific extension which
>                         would contain the EU thread/memory dump.
>=20
>                     It might be good to document (in that debugging doc p=
atch probably) why
>                     thread injection is not a great option, and why the t=
radeoffs for
>                     debugging are different than for for checkpoint/resto=
re, where with CRIU
>                     we landed on doing most of this in userspace, and oft=
en requiring
>                     injection threads to make it all work.
>=20
>                     Cheers, Sima
>=20
>=20
>                         Regards, Joonas
>=20
>=20
>                             Regards,
>                             Christian.
>=20
>=20
>=20
>                                   Matt
>=20
>                                   [3]https://patchwork.freedesktop.org/pa=
tch/622520/?series=3D140200&rev=3D6
>=20
>=20
>                                       Regards,
>                                       Christian.
>=20
>=20
>                                           Matt
>=20
>=20
>                                               Regards,
>                                               Christian.
>=20
>=20
>
