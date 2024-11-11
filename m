Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F79C3950
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 09:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452F510E088;
	Mon, 11 Nov 2024 08:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjtbmlmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52E310E041;
 Mon, 11 Nov 2024 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731312026; x=1762848026;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=GpA38n5Y8Xw3obdeMdaO+/+8ZUX/WGfYVaIgtT6cUuc=;
 b=BjtbmlmA9D59jnQDDDMe9/iJB4drcwYprhCyDRIQ6jRopxCDq+3AZvEL
 Wc/hrBI35ECg2Vnpd5Apdh253MjwQ3Hz5jbEIG54cDNqCJ0qrnU7XWmon
 bLj0fgEX/SwrHr8LvTeQuH9CcRG0BgC4rGQWeJQ5Xs6OdhCVWZLr3Kwo1
 MD6vFMSInsER9ye5dDP+w7Vw+vPMIrHaEiFbKgt/gAvIWUml++W7YeQr5
 MP/jiK0HMFnqfrszcMtnK4aFiqEqiGtAidqf5KJI9i+8rEmv6iNcd+Cyp
 zX4tDJXS/dxj2MBtdFhFIlFg/UWvVvnXpGoY3XzOhJyXgetW1+GyTQjnW g==;
X-CSE-ConnectionGUID: vNKG5I2ZTzugJn0KwcsOYg==
X-CSE-MsgGUID: nuvf+3+ySlK0ao8bFfGvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="30522384"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="30522384"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:00:25 -0800
X-CSE-ConnectionGUID: 40bcLxkgSESXA9CHzzegdA==
X-CSE-MsgGUID: k2daoYsUQ8mjxNFVOVUEVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="117613871"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.244.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:00:23 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
References: <20241031181048.2948948-3-matthew.brost@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
 <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Christian =?utf-8?q?K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Mon, 11 Nov 2024 10:00:17 +0200
Message-ID: <173131201749.35893.6727423786823542880@jlahtine-mobl.ger.corp.intel.com>
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

Back from some time off and will try to answer below.

Adding Dave and Sima as this topic has been previously discussed to some
extent and will be good to reach common understanding about what the
series is trying to do and what is the difference to the AMD debugging
model.

Quoting Christian K=C3=B6nig (2024-11-07 11:44:33)
> Am 06.11.24 um 18:00 schrieb Matthew Brost:
>=20
>     [SNIP]
>=20
>     This is not a generic interface that anyone can freely access. The sa=
me
>     permissions used by ptrace are checked when opening such an interface.
>     See [1] [2].
>=20
>     [1] https://patchwork.freedesktop.org/patch/617470/?series=3D136572&r=
ev=3D2
>     [2] https://patchwork.freedesktop.org/patch/617471/?series=3D136572&r=
ev=3D2
>=20
>=20
> Thanks a lot for those pointers, that is exactly what I was looking for.
>=20
> And yeah, it is what I feared. You are re-implementing existing functiona=
lity,
> but see below.

Could you elaborate on what this "existing functionality" exactly is?
I do not think this functionality exists at this time.

The EU debugging architecture for Xe specifically avoids the need for GDB
to attach with ptrace to the CPU process or interfere with the CPU process =
for
the debugging via parasitic threads or so.

Debugger connection is opened to the DRM driver for given PID (which uses t=
he
ptrace may access check for now) after which the all DRM client of that
PID are exposed to the debugger process.

What we want to expose via that debugger connection is the ability for GDB =
to
read/write the different GPU VM address spaces (ppGTT for Intel GPUs) just =
like
the EU threads would see them. Note that the layout of the ppGTT is
completely up to the userspace driver to setup and is mostly only partially
equal to the CPU address space.

Specifically as part of reading/writing the ppGTT for debugging purposes,
there are deep flushes needed: for example flushing instruction cache
when adding/removing breakpoints.

Maybe that will explain the background. I elaborate on this at the end some=
 more.

>             kmap/vmap are used everywhere in the DRM subsystem to access =
BOs, so I=E2=80=99m
>             failing to see the problem with adding a simple helper based =
on existing
>             code.
>=20
>         What#s possible and often done is to do kmap/vmap if you need to =
implement a
>         CPU copy for scanout for example or for copying/validating comman=
d buffers.
>         But that usually requires accessing the whole BO and has separate=
 security
>         checks.
>=20
>         When you want to access only a few bytes of a BO that sounds mass=
ively like
>         a peek/poke like interface and we have already rejected that more=
 than once.
>         There even used to be standardized GEM IOCTLs for that which have=
 been
>         removed by now.

Referring to the explanation at top: These IOCTL are not for the debugging =
target
process to issue. The peek/poke interface is specifically for GDB only
to facilitate the emulation of memory reads/writes on the GPU address
space as they were done by EUs themselves. And to recap: for modifying
instructions for example (add/remove breakpoint), extra level of cache flus=
hing is
needed which is not available to regular userspace.

I specifically discussed with Sima on the difference before moving forward =
with this
design originally. If something has changed since then, I'm of course happy=
 to rediscuss.

However, if this code can't be added, not sure how we would ever be able
to implement core dumps for GPU threads/memory?

>         If you need to access BOs which are placed in not CPU accessible =
memory then
>         implement the access callback for ptrace, see amdgpu_ttm_access_m=
emory for
>         an example how to do this.

As also mentioned above, we don't work via ptrace at all when it comes
to debugging the EUs. The only thing used for now is the ptrace_may_access =
to
implement similar access restrictions as ptrace has. This can be changed
to something else if needed.

>     Ptrace access via vm_operations_struct.access =E2=86=92 ttm_bo_vm_acc=
ess.
>=20
>     This series renames ttm_bo_vm_access to ttm_bo_access, with no code c=
hanges.
>=20
>     The above function accesses a BO via kmap if it is in SYSTEM / TT,
>     which is existing code.
>=20
>     This function is only exposed to user space via ptrace permissions.

Maybe this sentence is what caused the confusion.

Userspace is never exposed with peek/poke interface, only the debugger
connection which is its own FD.

>     In this series, we implement a function [3] similar to
>     amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
>     missing is non-visible CPU memory access, similar to
>     amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up =
and
>     was omitted in this series given its complexity.
>=20
>     So, this looks more or less identical to AMD's ptrace implementation,
>     but in GPU address space. Again, I fail to see what the problem is he=
re.
>     What am I missing?
>=20
>=20
> The main question is why can't you use the existing interfaces directly?

We're not working on the CPU address space or BOs. We're working
strictly on the GPU address space as would be seen by an EU thread if it
accessed address X.

> Additional to the peek/poke interface of ptrace Linux has the pidfd_getfd
> system call, see here https://man7.org/linux/man-pages/man2/pidfd_getfd.2=
.html.
>=20
> The pidfd_getfd() allows to dup() the render node file descriptor into yo=
ur gdb
> process. That in turn gives you all the access you need from gdb, includi=
ng
> mapping BOs and command submission on behalf of the application.

We're not operating on the CPU address space nor are we operating on BOs
(there is no concept of BO in the EU debug interface). Each VMA in the VM
could come from anywhere, only the start address and size matter. And
neither do we need to interfere with the command submission of the
process under debug.

> As far as I can see that allows for the same functionality as the eudebug
> interface, just without any driver specific code messing with ptrace
> permissions and peek/poke interfaces.
>=20
> So the question is still why do you need the whole eudebug interface in t=
he
> first place? I might be missing something, but that seems to be superfluo=
us
> from a high level view.

Recapping from above. It is to allow the debugging of EU threads per DRM
client, completely independent of the CPU process. If ptrace_may_acces
is the sore point, we could consider other permission checks, too. There
is no other connection to ptrace in this architecture as single
permission check to know if PID is fair game to access by debugger
process.

Why no parasitic thread or ptrace: Going forward, binding the EU debugging =
to
the DRM client would also pave way for being able to extend core kernel gen=
erated
core dump with each DRM client's EU thread/memory dump. We have similar
feature called "Offline core dump" enabled in the downstream public
trees for i915, where we currently attach the EU thread dump to i915 error =
state
and then later combine i915 error state with CPU core dump file with a
tool.

This is relatively little amount of extra code, as this baseline series
already introduces GDB the ability to perform the necessary actions.
It's just the matter of kernel driver calling: "stop all threads", then
copying the memory map and memory contents for GPU threads, just like is
done for CPU threads.

With parasitic thread injection, not sure if there is such way forward,
as it would seem to require to inject quite abit more logic to core kernel?

> It's true that the AMD KFD part has still similar functionality, but that=
 is
> because of the broken KFD design of tying driver state to the CPU process
> (which makes it inaccessible for gdb even with imported render node fd).
>=20
> Both Sima and I (and partially Dave as well) have pushed back on the KFD
> approach. And the long term plan is to get rid of such device driver spec=
ific
> interface which re-implement existing functionality just differently.

Recapping, this series is not adding it back. The debugger connection
is a separate FD from the DRM one, with separate IOCTL set. We don't allow
the DRM FD any new operations based on ptrace is attached or not. We
don't ever do that check even.

We only restrict the opening of the debugger connection to given PID with
ptrace_may_access check for now. That can be changed to something else,
if necessary.

> So you need to have a really really good explanation why the eudebug inte=
rface
> is actually necessary.

TL;DR The main point is to decouple the debugging of the EU workloads from =
the
debugging of the CPU process. This avoids the interference with the CPU pro=
cess with
parasitic thread injection. Further this also allows generating a core dump
without any GDB connected. There are also many other smaller pros/cons
which can be discussed but for the context of this patch, this is the
main one.

So unlike parasitic thread injection, we don't unlock any special IOCTL for
the process under debug to be performed by the parasitic thread, but we
allow the minimal set of operations to be performed by GDB as if those were
done on the EUs themselves.

One can think of it like the minimal subset of ptrace but for EU threads,
not the CPU threads. And thus, building on this it's possible to extend
the core kernel generated core dumps with DRM specific extension which
would contain the EU thread/memory dump.

Regards, Joonas

>=20
> Regards,
> Christian.
>=20
>=20
>=20
>     Matt
>=20
>     [3] https://patchwork.freedesktop.org/patch/622520/?series=3D140200&r=
ev=3D6
>=20
>=20
>         Regards,
>         Christian.
>=20
>=20
>             Matt
>=20
>=20
>                 Regards,
>                 Christian.
>
