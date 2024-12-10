Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98A9EB04C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2112510E3A3;
	Tue, 10 Dec 2024 11:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UUAAcqe1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D8810E392;
 Tue, 10 Dec 2024 11:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733831884; x=1765367884;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:to:date:message-id;
 bh=fkQQvhWkts9DOh8Pv3CfVt/3pMfiHZxuWSYMYbfIfCw=;
 b=UUAAcqe1wEgJuLoPjqVGDa3z/jnE0K82gQ6q+jHuWyWaWRVt4Lviq5Zi
 SnUycyO4vu481vr6P4eAPEDoPtyegBIU324dJa2lkCVE+DHWdZpMbr/3/
 t7OGYQ+3TQY3AYt003mUqitndGfIIUZg0ysqtcyLth/qUBL7ppuw7lDG9
 pj7KhiRNmmakBDL51MRIFT5KWNF1YgP9lzI4eab3OfDpfk5yiRy41OVgl
 16Zcg+53wwfquQyGXhCDv11vGm9HzuGJLRsAI4IveSC3lxPpvaNV6DR8l
 ofyzrYpM0EAFaN7X8jq8bMsVOYeHlEljkpkhrjyhH+IQPAmO9Z33/OUW5 A==;
X-CSE-ConnectionGUID: TrE3jWC5QLG1jODPeY/bBA==
X-CSE-MsgGUID: zKdN29WjRPmLm7UPP6lSPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45182374"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="45182374"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:58:04 -0800
X-CSE-ConnectionGUID: VHh2vEPmS/ynGURgYwzjdw==
X-CSE-MsgGUID: a3JQfRXGT0aqEepKq62cRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100433990"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 03:58:01 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
 <e4401ab1-0562-407a-a0e9-2f6e43e5ac22@amd.com>
 <173382321353.8959.8314520413901294535@jlahtine-mobl.ger.corp.intel.com>
 <d2141daa-b556-4487-a310-69a7fea4eae8@amd.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Linux MM <linux-mm@kvack.org>, Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Tue, 10 Dec 2024 13:57:58 +0200
Message-ID: <173383187817.17709.7100544929981970614@jlahtine-mobl.ger.corp.intel.com>
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

Quoting Christian K=C3=B6nig (2024-12-10 12:00:48)
> Am 10.12.24 um 10:33 schrieb Joonas Lahtinen:
>=20
>     Quoting Christian K=C3=B6nig (2024-12-09 17:42:32)
>=20
>         Am 09.12.24 um 16:31 schrieb Simona Vetter:
>=20
>             On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian K=C3=B6ni=
g wrote:
>=20
>                 Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
>=20
>                     From: Andrzej Hajda <andrzej.hajda@intel.com>
>=20
>                     Debugger needs to read/write program's vmas including=
 userptr_vma.
>                     Since hmm_range_fault is used to pin userptr vmas, it=
 is possible
>                     to map those vmas from debugger context.
>=20
>                 Oh, this implementation is extremely questionable as well=
. Adding the LKML
>                 and the MM list as well.
>=20
>                 First of all hmm_range_fault() does *not* pin anything!
>=20
>                 In other words you don't have a page reference when the f=
unction returns,
>                 but rather just a sequence number you can check for modif=
ications.
>=20
>             I think it's all there, holds the invalidation lock during th=
e critical
>             access/section, drops it when reacquiring pages, retries unti=
l it works.
>=20
>             I think the issue is more that everyone hand-rolls userptr.
>=20
>         Well that is part of the issue.
>=20
>         The general problem here is that the eudebug interface tries to s=
imulate
>         the memory accesses as they would have happened by the hardware.
>=20
>     Could you elaborate, what is that a problem in that, exactly?
>=20
>     It's pretty much the equivalent of ptrace() poke/peek but for GPU mem=
ory.
>=20
>=20
> Exactly that here. You try to debug the GPU without taking control of the=
 CPU
> process.

You seem to have a built-in expectation that the CPU threads and memory spa=
ce
must be interfered with in order to debug a completely different set of thr=
eads
and memory space elsewhere that executes independently. I don't quite see w=
hy?

In debugging massively parallel workloads, it's a huge drawback to be limit=
ed to
stop all mode in GDB. If ROCm folks are fine with such limitation, I have n=
othing
against them keeping that limitation. Just it was a starting design princip=
le for
this design to avoid such a limitation.

> This means that you have to re-implement all debug functionalities which =
where
> previously invested for the CPU process for the GPU once more.

Seems like a strawman argument. Can you list the "all interfaces" being add=
ed
that would be possible via indirection via ptrace() beyond peek/poke?

> And that in turn creates a massive attack surface for security related
> problems, especially when you start messing with things like userptrs whi=
ch
> have a very low level interaction with core memory management.

Again, just seems like a strawman argument. You seem to generalize to some =
massive
attack surface of hypothetical interfaces which you don't list. We're talki=
ng
about memory peek/poke here.

Can you explain the high-level difference from security perspective for
temporarily pinning userptr pages to write them to page tables for GPU to
execute a dma-fence workload with and temporarily pinning pages for
peek/poke?

>     And it is exactly the kind of interface that makes sense for debugger=
 as
>     GPU memory !=3D CPU memory, and they don't need to align at all.
>=20
>=20
> And that is what I strongly disagree on. When you debug the GPU it is man=
datory
> to gain control of the CPU process as well.

You are free to disagree on that. I simply don't agree and have in this
and previous email presented multiple reasons as to why not. We can
agree to disagree on the topic.

> The CPU process is basically the overseer of the GPU activity, so it shou=
ld
> know everything about the GPU operation, for example what a mapping actua=
lly
> means.

How does that relate to what is being discussed here? You just seem to
explain how you think userspace driver should work: Maintain a shadow
tree of each ppGTT VM layout? I don't agree on that, but I think it is
slightly irrelevant here.

> The kernel driver and the hardware only have the information necessary to
> execute the work prepared by the CPU process. So the information availabl=
e is
> limited to begin with.

And the point here is? Are you saying kernel does not know the actual mappi=
ngs
maintained in the GPU page tables?

>         What the debugger should probably do is to cleanly attach to the
>         application, get the information which CPU address is mapped to w=
hich
>         GPU address and then use the standard ptrace interfaces.
>=20
>     I don't quite agree here -- at all. "Which CPU address is mapped to
>     which GPU address" makes no sense when the GPU address space and CPU
>     address space is completely controlled by the userspace driver/applic=
ation.
>=20
>=20
> Yeah, that's the reason why you should ask the userspace driver/applicati=
on for
> the necessary information and not go over the kernel to debug things.

What hypothetical necessary information are you referring to exactly?

I already explained there are good reasons not to map all the GPU memory
into the CPU address space.

>     Please try to consider things outside of the ROCm architecture.
>=20
>=20
> Well I consider a good part of the ROCm architecture rather broken exactly
> because we haven't pushed back hard enough on bad ideas.
>=20
>=20
>     Something like a register scratch region or EU instructions should not
>     even be mapped to CPU address space as CPU has no business accessing =
it
>     during normal operation. And backing of such region will vary per
>     context/LRC on the same virtual address per EU thread.
>=20
>     You seem to be suggesting to rewrite even our userspace driver to beh=
ave
>     the same way as ROCm driver does just so that we could implement debu=
g memory
>     accesses via ptrace() to the CPU address space.
>=20
>=20
> Oh, well certainly not. That ROCm has an 1 to 1 mapping between CPU and G=
PU is
> one thing I've pushed back massively on and has now proven to be problema=
tic.

Right, so is your claim then that instead of being 1:1 the CPU address space
should be a superset of all GPU address spaces instead to make sure
ptrace() can modify all memory?

Cause I'm slightly lost here as you don't give much reasoning, just
claim things to be certain way.

>     That seems bit of a radical suggestion, especially given the drawbacks
>     pointed out in your suggested design.
>=20
>=20
>         The whole interface re-invents a lot of functionality which is al=
ready
>         there
>=20
>     I'm not really sure I would call adding a single interface for memory
>     reading and writing to be "re-inventing a lot of functionality".
>=20
>     All the functionality behind this interface will be needed by GPU core
>     dumping, anyway. Just like for the other patch series.
>=20
>=20
> As far as I can see exactly that's an absolutely no-go. Device core dumpi=
ng
> should *never ever* touch memory imported by userptrs.

Could you again elaborate on what the great difference is to short term
pinning to use in dma-fence workloads? Just the kmap?

> That's what process core dumping is good for.

Not really sure I agree. If you do not dump the memory as seen by the
GPU, then you need to go parsing the CPU address space in order to make
sense which buffers were mapped where and that CPU memory contents containi=
ng
metadata could be corrupt as we're dealing with a crashing app to begin wit=
h.

Big point of relying to the information from GPU VM for the GPU memory layo=
ut
is that it won't be corrupted by rogue memory accesses in CPU process.

>         just because you don't like the idea to attach to the debugged
>         application in userspace.
>=20
>     A few points that have been brought up as drawback to the
>     GPU debug through ptrace(), but to recap a few relevant ones for this
>     discussion:
>=20
>     - You can only really support GDB stop-all mode or at least have to
>       stop all the CPU threads while you control the GPU threads to
>       avoid interference. Elaborated on this on the other threads more.
>     - Controlling the GPU threads will always interfere with CPU threads.
>       Doesn't seem feasible to single-step an EU thread while CPU threads
>       continue to run freely?
>=20
>=20
> I would say no.

Should this be understood that you agree these are limitations of the ROCm
debug architecture?

>     - You are very much restricted by the CPU VA ~ GPU VA alignment
>       requirement, which is not true for OpenGL or Vulkan etc. Seems
>       like one of the reasons why ROCm debugging is not easily extendable
>       outside compute?
>=20
>=20
> Well as long as you can't take debugged threads from the hardware you can
> pretty much forget any OpenGL or Vulkan debugging with this interface sin=
ce it
> violates the dma_fence restrictions in the kernel.

Agreed. However doesn't mean because you can't do it right now, you you sho=
uld
design an architecture that actively prevents you from doing that in the fu=
ture.

>     - You have to expose extra memory to CPU process just for GPU
>       debugger access and keep track of GPU VA for each. Makes the GPU mo=
re
>       prone to OOB writes from CPU. Exactly what not mapping the memory
>       to CPU tried to protect the GPU from to begin with.
>=20
>=20
>         As far as I can see this whole idea is extremely questionable. Th=
is
>         looks like re-inventing the wheel in a different color.
>=20
>     I see it like reinventing a round wheel compared to octagonal wheel.
>=20
>     Could you elaborate with facts much more on your position why the ROCm
>     debugger design is an absolute must for others to adopt?
>=20
>=20
> Well I'm trying to prevent some of the mistakes we did with the ROCm desi=
gn.

Well, I would say that the above limitations are direct results of the ROCm
debugging design. So while we're eager to learn about how you perceive
GPU debugging should work, would you mind addressing the above
shortcomings?

> And trying to re-invent well proven kernel interfaces is one of the big
> mistakes made in the ROCm design.

Appreciate the feedback. Please work on the representation a bit as it curr=
ently
doesn't seem very helpful but appears just as an attempt to try to throw a =
spanner
in the works.

> If you really want to expose an interface to userspace

To a debugger process, enabled only behind a flag.

> which walks the process
> page table, installs an MMU notifier

This part is already done to put an userptr to the GPU page tables to
begin with. So hopefully not too controversial.

> kmaps the resulting page

In addition to having it in the page tables where GPU can access it.

> and then memcpy
> to/from it then you absolutely *must* run that by guys like Christoph Hel=
lwig,
> Andrew and even Linus.

Surely, that is why we're seeking out for review.

We could also in theory use an in-kernel GPU context on the GPU hardware for
doing the peek/poke operations on userptr.

But that seems like a high-overhead thing to do due to the overhead of
setting up a transfer per data word and going over the PCI bus twice
compared to accessing the memory directly by CPU when it trivially can.

So this is the current proposal.

Regards, Joonas

>=20
> I'm pretty sure that those guys will note that a device driver should
> absolutely not mess with such stuff.
>=20
> Regards,
> Christian.
>=20
>=20
>     Otherwise it just looks like you are trying to prevent others from
>     implementing a more flexible debugging interface through vague commen=
ts about
>     "questionable design" without going into details. Not listing much co=
ncrete
>     benefits nor addressing the very concretely expressed drawbacks of yo=
ur
>     suggested design, makes it seem like a very biased non-technical disc=
ussion.
>=20
>     So while review interest and any comments are very much appreciated, =
please
>     also work on providing bit more reasoning and facts instead of just c=
laiming
>     things. That'll help make the discussion much more fruitful.
>=20
>     Regards, Joonas
>=20
>
