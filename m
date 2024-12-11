Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072E9ECCA8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 13:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B2B10EB32;
	Wed, 11 Dec 2024 12:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YAsFncED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E7510EB2D;
 Wed, 11 Dec 2024 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733921980; x=1765457980;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:date:message-id;
 bh=z3dobPjaWmEEyM65CevZDmCdH7vYIhnwT87IXV+1W9g=;
 b=YAsFncEDsBbv6U/QGpv9Y9Au8U8k+c2auCm2EaOCZME4X1BO+nKXGAsR
 7CRcYHSCDnyDtiD2AJIvIqaHYws+BOXoR8PQMWSgb0E3eekwIQe4r/l3v
 uW5CJ5Movy5NE1ooOSUf3XxfUjBivgzs0pK1IXJRhHnth4OTBl8Etk8ks
 oOlgCGF0I5TrOc4wGXnkXA5f8N/wyLemxmfwlDSz21c2YP232nDT2Po4E
 1CU2G2F/xA8Wg35b9VCk1gvjcF4W2m7rxaGTya3aIGf+guhlSuvTjrP9P
 swdMOInXdb0Y58RkcyXz2PMDfGsM+I3K8VmsXkMHxtxV38pHNt3JpfM85 w==;
X-CSE-ConnectionGUID: qc/ZWzXYS5ONOmkIQDSscg==
X-CSE-MsgGUID: otqVSCCJRxKPDLPMT75x4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38229411"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38229411"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 04:59:39 -0800
X-CSE-ConnectionGUID: o/9ycHMUSFyuqEs3yDvwIA==
X-CSE-MsgGUID: pbtyFdKTSRWT09yRzMf1kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="100625659"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.119])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 04:59:36 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bbe0193c-8869-488a-ae23-139a244654c8@amd.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
 <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
 <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
 <173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com>
 <bbe0193c-8869-488a-ae23-139a244654c8@amd.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Linux MM <linux-mm@kvack.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Wed, 11 Dec 2024 14:59:33 +0200
Message-ID: <173392197322.40386.12252741494998606453@jlahtine-mobl.ger.corp.intel.com>
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

First of all, do appreciate taking the time to explain your positions
much more verbosely this time.

Quoting Christian K=C3=B6nig (2024-12-10 16:03:14)
> Am 10.12.24 um 12:57 schrieb Joonas Lahtinen:
>=20
>     Quoting Christian K=C3=B6nig (2024-12-10 12:00:48)
>=20
>         Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:
>=20
>             Quoting Christian K=C3=B6nig (2024-12-09 17:42:32)
>=20
>                 Am 09.12.24 um 16:31 schrieb Simona Vetter:
>=20
>                     On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian K=
=C3=B6nig wrote:
>=20
>                         Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>=20
>                             From: Andrzej Hajda <andrzej.hajda@intel.com>
>=20
>                             Debugger needs to read/write program's vmas i=
ncluding userptr_vma.
>                             Since hmm_range_fault is used to pin userptr =
vmas, it is possible
>                             to map those vmas from debugger context.
>=20
>                         Oh, this implementation is extremely questionable=
 as well. Adding the LKML
>                         and the MM list as well.
>=20
>                         First of all hmm_range_fault() does *not* pin any=
thing!
>=20
>                         In other words you don't have a page reference wh=
en the function returns,
>                         but rather just a sequence number you can check f=
or modifications.
>=20
>                     I think it's all there, holds the invalidation lock d=
uring the critical
>                     access/section, drops it when reacquiring pages, retr=
ies until it works.
>=20
>                     I think the issue is more that everyone hand-rolls us=
erptr.
>=20
>                 Well that is part of the issue.
>=20
>                 The general problem here is that the eudebug interface tr=
ies to simulate
>                 the memory accesses as they would have happened by the ha=
rdware.
>=20
>             Could you elaborate, what is that a problem in that, exactly?
>=20
>             It's pretty much the equivalent of ptrace() poke/peek but for=
 GPU memory.
>=20
>=20
>         Exactly that here. You try to debug the GPU without taking contro=
l of the CPU
>         process.
>=20
>     You seem to have a built-in expectation that the CPU threads and memo=
ry space
>     must be interfered with in order to debug a completely different set =
of threads
>     and memory space elsewhere that executes independently. I don't quite=
 see why?
>=20
>=20
> Because the GPU only gets the information it needs to execute the command=
s.

Right, but even for the CPU process, the debug symbols are not part of the
execution address space either. There similarly are only the instructions
generated by the compiler and the debug symbols are separate. They may be
obtainable by parsing /proc/<PID>/exe but can also be in a completely
different file in a different host machine.

> A simple example would be to single step through the high level shader co=
de.
> That is usually not available to the GPU, but only to the application who=
 has
> submitted the work.
>=20
> The GPU only sees the result of the compiler from high level into low lev=
el
> assembler.

If we were to have unified executable format where both the GPU and CPU
instructions were to be part of the single executable file, so could the
DWARF information for both CPU and GPU.

Then GDB, by loading the executable file, would have all the debug
information it needed. No need to introspect to the CPU process in order
to debug the GPU, similarly as there is no need to introspect CPU
process to debug CPU process.

While we don't currently have that and GPU instructions are often JIT
generated, we tried to make life easier by userspace driver providing
the DWARF information it just generated for the code it JITed as VM_BIND
metadata for a VMA and we make copy to store safely to avoid corruption by
rogue CPU process writes.

In the history it was exported to a file and then loaded by GDB from that
separate file, making user experience quite bad.

So to recap, while for JIT scenarios and for lack of unified carrier
format for GPU and CPU instructions, there is some information that is
convenient to have in CPU address space, I don't think that is a
necessity at all. I guess we could equally export
/sys/class/drm/.../clients/<ID>/{load_map,dwarf_symbols} or whatever,
similar to /proc/<PID>/{maps,exe}.

TL;DR While getting the information from CPU process for JIT scenarios is
convenient for now, I don't think it is a must or explicitly required.

>     In debugging massively parallel workloads, it's a huge drawback to be=
 limited to
>     stop all mode in GDB. If ROCm folks are fine with such limitation, I =
have nothing
>     against them keeping that limitation. Just it was a starting design p=
rinciple for
>     this design to avoid such a limitation.
>=20
>=20
> Well, that's the part I don't understand. Why is that a drawback?

Hmm, same as for not supporting stop-all mode for CPU threads during CPU
debugging? You will not be able to stop and observe a single thread while
letting the other threads run.

If the CPU threads are for example supposed to react to memory
semaphores/fences written by GPU thread and you want to debug by doing
those memory writes from GPU thread from the GDB command line?

Again not being limited to stop-all mode being an input to the design
phase from the folks doing in-field debugging, I'm probably not going to be
able to give out all the good reasons for it.

And as the CPU side supports it, even if you did not support it for the
GPU debugging, if adding GPU to the equation would prevent from using the
existing feature for CPU debugging that feels like a regression in user
experience.

I think those both are major drawbacks, but we can of course seek out furth=
er
opinions if it's highly relevant. I'm pretty sure myself at this point that=
 if
a feature is desireable for CPU threaded debugging, it'll be very shortly a=
sked
to be available for GPU.

That seems to be the trend for any CPU debug feature, even if some are
less feasible than others due to the differences of GPUs and CPUs.

>         This means that you have to re-implement all debug functionalitie=
s which where
>         previously invested for the CPU process for the GPU once more.
>=20
>     Seems like a strawman argument. Can you list the "all interfaces" bei=
ng added
>     that would be possible via indirection via ptrace() beyond peek/poke?
>=20
>=20
>         And that in turn creates a massive attack surface for security re=
lated
>         problems, especially when you start messing with things like user=
ptrs which
>         have a very low level interaction with core memory management.
>=20
>     Again, just seems like a strawman argument. You seem to generalize to=
 some massive
>     attack surface of hypothetical interfaces which you don't list. We're=
 talking
>     about memory peek/poke here.
>=20
>=20
> That peek/poke interface is more than enough to cause problems.

Ok, just wanted to make sure we're talking about concrete things. Happy
to discuss any other problems too, but for now let's focus on the
peek/poke then, and not get sidetracked.

>     Can you explain the high-level difference from security perspective f=
or
>     temporarily pinning userptr pages to write them to page tables for GP=
U to
>     execute a dma-fence workload with and temporarily pinning pages for
>     peek/poke?
>=20
>=20
> If you want to access userptr imported pages from the GPU going through t=
he
> hops of using hhm_range_fault()/get_user_pages() plus an MMU notifier is =
a must
> have.

Right, the intent was always to make this as close to EU thread memory acce=
ss as
possible from both locking and Linux core MM memory point of view so if
we need to improve on that front, we should look into it.

> For a CPU based debugging interface that isn't necessary, you can just lo=
ok
> directly into the application address space with existing interfaces.

First, this is only even possible when you have mapped everything the GPUs =
have
access also to the CPU address space, and maintain a load map for each indi=
vidual
<DRM client, GPU VM, GPU VMA> =3D> CPU address.

I don't see the need to do that tracking in the userspace just
for debugging, because kernel already has to do all the work.

Second, mapping every GPU VMA to CPU address space will exhaust the
vm.max_map_count [1] quite a bit faster. This problem can already be hit if
a naive userspace application tries to create too many aligned_alloc
blocks for userptr instead of pooling memory.

Third of all when GPU VM size =3D=3D CPU VM size for modern hardware, you w=
ill run
out of VA space in the CPU VM. When you consider you have to add VA blocks =
of
(num DRM clients) * (num VM) * (VM size) where (num VM) roughly equals numb=
er of
engines * 3.

And ultimately, I'm pretty sure there are processes like 32-bit games
and emulators, and even demanding compute applications actually expect
to be able to use most of the CPU address space :) So don't think we should
have a design where we expect to be able to consume significant portions of=
 the
CPU VA space (especially if it is just for debug time functionality).

[1] Documentation/admin-guide/sysctl/vm.rst#max_map_count

>             And it is exactly the kind of interface that makes sense for =
debugger as
>             GPU memory !=3D CPU memory, and they don't need to align at a=
ll.
>=20
>=20
>         And that is what I strongly disagree on. When you debug the GPU i=
t is mandatory
>         to gain control of the CPU process as well.
>=20
>     You are free to disagree on that. I simply don't agree and have in th=
is
>     and previous email presented multiple reasons as to why not. We can
>     agree to disagree on the topic.
>=20
>=20
> Yeah, that's ok. I also think we can agree on that this doesn't matter fo=
r the
> discussion.
>=20
> The question is rather should the userptr functionality be used for debug=
ging
> or not.
>=20
>=20
>         The CPU process is basically the overseer of the GPU activity, so=
 it should
>         know everything about the GPU operation, for example what a mappi=
ng actually
>         means.
>=20
>     How does that relate to what is being discussed here? You just seem to
>     explain how you think userspace driver should work: Maintain a shadow
>     tree of each ppGTT VM layout? I don't agree on that, but I think it is
>     slightly irrelevant here.
>=20
>=20
> I'm trying to understand why you want to debug only the GPU without also
> attaching to the CPU process.

Mostly to ensure we're not limited to stop-all mode as described above and =
to
have a clean independent implementation for the thread run-control between =
the
"inferiors" in GDB. Say you have CPU threads and 2 sets of GPU threads (3
inferiors in total). We don't want the CPU inferior to be impacted by
the user requesting to control the GPU inferiors.

I know the ROCm GDB implementation takes a different approach, and I'm
not quite sure how you folks plan on supporting multi-GPU debugging.

I would spin the question the opposite direction, if you don't need anythin=
g from
the CPU process why would you make them dependent and interfering?

(Reminder, the peek/poke target page has been made available to the GPU
page tables, so we don't want anything from the CPU process per se, we
want to know which page the GPU IOMMU unit would get for its access.

For all practical matters, the CPU process could have already exited and
should not matter if an EU is executing on the GPU still.)

>         The kernel driver and the hardware only have the information nece=
ssary to
>         execute the work prepared by the CPU process. So the information =
available is
>         limited to begin with.
>=20
>     And the point here is? Are you saying kernel does not know the actual=
 mappings
>     maintained in the GPU page tables?
>=20
>=20
> The kernel knows that, the question is why does userspace don't know that?
>=20
> On the other hand I have to agree that this isn't much of a problem.
>=20
> If userspace really doesn't know what is mapped where in the GPU's VM add=
ress
> space then an IOCTL to query that is probably not an issue.
>=20
>                 What the debugger should probably do is to cleanly attach=
 to the
>                 application, get the information which CPU address is map=
ped to which
>                 GPU address and then use the standard ptrace interfaces.
>=20
>             I don't quite agree here -- at all. "Which CPU address is map=
ped to
>             which GPU address" makes no sense when the GPU address space =
and CPU
>             address space is completely controlled by the userspace drive=
r/application.
>=20
>=20
>         Yeah, that's the reason why you should ask the userspace driver/a=
pplication for
>         the necessary information and not go over the kernel to debug thi=
ngs.
>=20
>     What hypothetical necessary information are you referring to exactly?
>=20
>=20
> What you said before: "the GPU address space and CPU address space is
> completely controlled by the userspace driver/application". When that's t=
he
> case, then why as the kernel for help? The driver/application is in contr=
ol.

I guess the emphasis should have been on the application part. Debugger can=
 agree
with userspace driver on conventions to facilitate debugging, but not with =
the
application code.

However, agree that query IOCTL could be avoided maintaining a shadow addre=
ss
space tracking in case ptrace() approach to debugging was otherwise favorab=
le.

>     I already explained there are good reasons not to map all the GPU mem=
ory
>     into the CPU address space.
>=20
>=20
> Well I still don't fully agree to that argumentation, but compared to usi=
ng
> userptr the peek/pook on a GEM handle is basically harmless.

(Sidenote: We don't expose BO handles at all via debugger interface. The de=
bugger
interface fully relies on GPU addresses for everything.)

But sounds like we're coming towards a conclusion that the focus of the
discussion is only really on the controversy of touching userptr with
the debugger peek/poke interface or not.

>             Please try to consider things outside of the ROCm architectur=
e.
>=20
>=20
>         Well I consider a good part of the ROCm architecture rather broke=
n exactly
>         because we haven't pushed back hard enough on bad ideas.
>=20
>=20
>             Something like a register scratch region or EU instructions s=
hould not
>             even be mapped to CPU address space as CPU has no business ac=
cessing it
>             during normal operation. And backing of such region will vary=
 per
>             context/LRC on the same virtual address per EU thread.
>=20
>             You seem to be suggesting to rewrite even our userspace drive=
r to behave
>             the same way as ROCm driver does just so that we could implem=
ent debug memory
>             accesses via ptrace() to the CPU address space.
>=20
>=20
>         Oh, well certainly not. That ROCm has an 1 to 1 mapping between C=
PU and GPU is
>         one thing I've pushed back massively on and has now proven to be =
problematic.
>=20
>     Right, so is your claim then that instead of being 1:1 the CPU addres=
s space
>     should be a superset of all GPU address spaces instead to make sure
>     ptrace() can modify all memory?
>=20
>=20
> Well why not? Mapping a BO and not accessing it has only minimal overhead.
>=20
> We already considered to making that mandatory for TTM drivers for better=
 OOM
> killer handling. That approach was discontinued, but certainly not for the
> overhead.

I listed the reasons earlier in this message.

>     Cause I'm slightly lost here as you don't give much reasoning, just
>     claim things to be certain way.
>=20
>=20
> Ok, that's certainly not what I'm trying to express.
>=20
> Things don't need to be in a certain way, especially not in the way ROCm =
does
> things.
>=20
> But you should not try to re-create GPU accesses with the CPU, especially=
 when
> that isn't memory you have control over in the sense that it was allocated
> through your driver stack.

I guess thats what I don't quite follow.

It's memory pages that are temporarily pinned and made available via GPU PT=
E to
the GPU IOMMU and it will inherently be able to read/write them outside
of the CPU caching domain.

Not sure why replacing "Submit GPU workload to peek/poke such page pinned b=
ehind
PTE" with "Use CPU to peek/poke because userptr is system memory anyway" se=
ems such
controversial and could cause much more complexity than userptr in
general?

>             That seems bit of a radical suggestion, especially given the =
drawbacks
>             pointed out in your suggested design.
>=20
>=20
>                 The whole interface re-invents a lot of functionality whi=
ch is already
>                 there
>=20
>             I'm not really sure I would call adding a single interface fo=
r memory
>             reading and writing to be "re-inventing a lot of functionalit=
y".
>=20
>             All the functionality behind this interface will be needed by=
 GPU core
>             dumping, anyway. Just like for the other patch series.
>=20
>=20
>         As far as I can see exactly that's an absolutely no-go. Device co=
re dumping
>         should *never ever* touch memory imported by userptrs.
>=20
>     Could you again elaborate on what the great difference is to short te=
rm
>     pinning to use in dma-fence workloads? Just the kmap?
>=20
>=20
> The big difference is that the memory doesn't belong to the driver who is=
 core
> dumping.

But the driver who is core dumping is holding a temporary pin on that
memory anyway, and has it in the GPU page tables.

The CPU side of the memory dump would only reflect what was the CPU side
memory contents at a dump time. It may have different contents of the GPU
side depending on cache flush timing. Maybe this will not be true when
CXL or some other coherency protocl is everywhere, but for now it is.

So those two memory dumps may actually have different contents, and that
might actually be the bug we're trying to debug. For GPU debugging, we're
specifically interested on what was the GPU threads view of the memory.

So I think it is more complex than that.

> That is just something you have imported from the MM subsystem, e.g. anon=
ymous
> memory and file backed mappings.
>=20
> We also don't allow to mmap() dma-bufs on importing devices for similar
> reasons.

That is a reasonable limitation for userspace applications.

And at no point has there been suggestions to expose such API for normal
userspace to shoot itself in the foot.

However debugger is not an average userspace consumer. For an example, it n=
eeds to
be able modify read-only memory (like the EU instructions) and then do spec=
ial cache
flushes to magically change those instructions.

I wouldn't want to expose such a functionality as regular IOCTL for an
application.

>         That's what process core dumping is good for.
>=20
>     Not really sure I agree. If you do not dump the memory as seen by the
>     GPU, then you need to go parsing the CPU address space in order to ma=
ke
>     sense which buffers were mapped where and that CPU memory contents co=
ntaining
>     metadata could be corrupt as we're dealing with a crashing app to beg=
in with.
>=20
>     Big point of relying to the information from GPU VM for the GPU memor=
y layout
>     is that it won't be corrupted by rogue memory accesses in CPU process.
>=20
>=20
> Well that you don't want to use potentially corrupted information is a go=
od
> argument, but why just not dump an information like "range 0xabcd-0xbcde =
came
> as userptr from process 1 VMA 0x1234-0x5678" ?

I guess that could be done for interactive debugging (but would again
add the ptrace() dependency).

In theory you could probably also come up with such a convention for ELF to
support core dumps I guess, but I would have to refer to some folks more
knowledgeable on the topic.

Feels like that would make things more complex via indirection compared
to existing memory maps.

> A process address space is not really something a device driver should be
> messing with.
>=20
>=20
>=20
>=20
>                 just because you don't like the idea to attach to the deb=
ugged
>                 application in userspace.
>=20
>             A few points that have been brought up as drawback to the
>             GPU debug through ptrace(), but to recap a few relevant ones =
for this
>             discussion:
>=20
>             - You can only really support GDB stop-all mode or at least h=
ave to
>               stop all the CPU threads while you control the GPU threads =
to
>               avoid interference. Elaborated on this on the other threads=
 more.
>             - Controlling the GPU threads will always interfere with CPU =
threads.
>               Doesn't seem feasible to single-step an EU thread while CPU=
 threads
>               continue to run freely?
>=20
>=20
>         I would say no.
>=20
>     Should this be understood that you agree these are limitations of the=
 ROCm
>     debug architecture?
>=20
>=20
> ROCm has a bunch of design decisions I would say we should never ever rep=
eat:
>=20
> 1. Forcing a 1 to 1 model between GPU address space and CPU address space.
>=20
> 2. Using a separate file descriptor additional to the DRM render node.
>=20
> 3. Attaching information and context to the CPU process instead of the DRM
> render node.
> ....
>=20
> But stopping the world, e.g. both CPU and GPU threads if you want to debug
> something is not one of the problematic decisions.
>=20
> That's why I'm really surprised that you insist so much on that.

I'm hoping the above explanations clarify my position further.

Again, I would ask myself: "Why add a dependency that is not needed?"

>             - You are very much restricted by the CPU VA ~ GPU VA alignme=
nt
>               requirement, which is not true for OpenGL or Vulkan etc. Se=
ems
>               like one of the reasons why ROCm debugging is not easily ex=
tendable
>               outside compute?
>=20
>=20
>         Well as long as you can't take debugged threads from the hardware=
 you can
>         pretty much forget any OpenGL or Vulkan debugging with this inter=
face since it
>         violates the dma_fence restrictions in the kernel.
>=20
>     Agreed. However doesn't mean because you can't do it right now, you y=
ou should
>     design an architecture that actively prevents you from doing that in =
the future.
>=20
>=20
> Good point. That's what I can totally agree on as well.
>=20
>=20
>             - You have to expose extra memory to CPU process just for GPU
>               debugger access and keep track of GPU VA for each. Makes th=
e GPU more
>               prone to OOB writes from CPU. Exactly what not mapping the =
memory
>               to CPU tried to protect the GPU from to begin with.
>=20
>=20
>                 As far as I can see this whole idea is extremely question=
able. This
>                 looks like re-inventing the wheel in a different color.
>=20
>             I see it like reinventing a round wheel compared to octagonal=
 wheel.
>=20
>             Could you elaborate with facts much more on your position why=
 the ROCm
>             debugger design is an absolute must for others to adopt?
>=20
>=20
>         Well I'm trying to prevent some of the mistakes we did with the R=
OCm design.
>=20
>     Well, I would say that the above limitations are direct results of th=
e ROCm
>     debugging design. So while we're eager to learn about how you perceive
>     GPU debugging should work, would you mind addressing the above
>     shortcomings?
>=20
>=20
> Yeah, absolutely. That you don't have a 1 to 1 mapping on the GPU is a st=
ep in
> the right direction if you ask me.

Right, that is to have a possibility of extending to OpenGL/Vulkan etc.=20

>         And trying to re-invent well proven kernel interfaces is one of t=
he big
>         mistakes made in the ROCm design.
>=20
>     Appreciate the feedback. Please work on the representation a bit as i=
t currently
>     doesn't seem very helpful but appears just as an attempt to try to th=
row a spanner
>     in the works.
>=20
>=20
>         If you really want to expose an interface to userspace
>=20
>     To a debugger process, enabled only behind a flag.
>=20
>=20
>         which walks the process
>         page table, installs an MMU notifier
>=20
>     This part is already done to put an userptr to the GPU page tables to
>     begin with. So hopefully not too controversial.
>=20
>=20
>         kmaps the resulting page
>=20
>     In addition to having it in the page tables where GPU can access it.
>=20
>=20
>         and then memcpy
>         to/from it then you absolutely *must* run that by guys like Chris=
toph Hellwig,
>         Andrew and even Linus.
>=20
>     Surely, that is why we're seeking out for review.
>=20
>     We could also in theory use an in-kernel GPU context on the GPU hardw=
are for
>     doing the peek/poke operations on userptr.
>=20
>=20
> Yeah, I mean that should clearly work out. We have something similar.

Right, and that might actually be desireable for the more special GPU VMA
like interconnect addresses.

However userptr is one of the items where it makes least sense, given
we'd have to set up the transfer over bus, the transfer would read
system memory over bus and write the result back to system memory over
bus.

And this is just to avoid kmap'ing a page that would otherwise be
already temporarily pinned for being in the PTEs.

I'm not saying it can't be done, but I just don't feel like it's a
technically sound solution.

>     But that seems like a high-overhead thing to do due to the overhead of
>     setting up a transfer per data word and going over the PCI bus twice
>     compared to accessing the memory directly by CPU when it trivially ca=
n.
>=20
>=20
> Understandable, but that will create another way of accessing process mem=
ory.

Well, we hopefully should be able to align with the regular temporary
pinning and making page available to PTEs, but instead of making
available to PTEs, do a peek/poke and then release the page already.

I'm kind of hoping to build the case for it making a lot of sense for
peek/poke performance (which is important for single-stepping), and
should not be a burden due to new locking chains.

And thanks once again for taking the time to share the details behind
the thinking and bearing with all my questions.

It seems like the peek/poke access to userptr is the big remaining open
where opinions differ, so maybe we should first focus on aligning on it.
It impacts both core dumping and interactive debugging.

Regards, Joonas

>=20
> Regards,
> Christian.
>=20
>=20
>=20
>     So this is the current proposal.
>=20
>     Regards, Joonas
>=20
>=20
>         I'm pretty sure that those guys will note that a device driver sh=
ould
>         absolutely not mess with such stuff.
>=20
>         Regards,
>         Christian.
>=20
>=20
>             Otherwise it just looks like you are trying to prevent others=
 from
>             implementing a more flexible debugging interface through vagu=
e comments about
>             "questionable design" without going into details. Not listing=
 much concrete
>             benefits nor addressing the very concretely expressed drawbac=
ks of your
>             suggested design, makes it seem like a very biased non-techni=
cal discussion.
>=20
>             So while review interest and any comments are very much appre=
ciated, please
>             also work on providing bit more reasoning and facts instead o=
f just claiming
>             things. That'll help make the discussion much more fruitful.
>=20
>             Regards, Joonas
>=20
>=20
>=20
>
