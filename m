Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E7A4ED59D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A0210F69E;
	Thu, 31 Mar 2022 08:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400410F69E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:29:00 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id q129so24588372oif.4
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 01:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kOIkalXlUKFViFyYHy76y6V60ZKdcCMcq4KcqwEXFu0=;
 b=BlDTH0Z4eGC8nSYIeD89sVXMcCe9ASU9i7FpCfcFpaCzv2LohZuE+xLs+qGsx+h0tp
 mTIlOOILdhUNIcqVfPnn+iwjNDHQIoDSg58ST1iTe0jB4HpOMobc0w88dETB4p5VxHAN
 TOx86ah9p2KlftVHElbwxSQx/Ahnul8bGqjm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kOIkalXlUKFViFyYHy76y6V60ZKdcCMcq4KcqwEXFu0=;
 b=Vj8Mu873KbYp0m1rBkq3am7BMsQFLhjSFhH8WavN/B+B9DWGLm/dh1BKBMbT521ZFZ
 oAprVyU/pUeRMFL2T42d2XMIU2w/KTEfCoO01ldPzLd0itDo31IJDihJNn7WuCmd9K+u
 C8MZ/CpqiFnvIQiH8Tj5cda+f3/xVtXLJ6TC/kXHV83gqo4OnuIhiooXC5OR/WiNptzK
 os/+WpKB9IamMTHXzG6zjFNytHYny8y6wTr+II7AEfgS+XboVzH8wPW/tu44Zn+TkcQo
 C1FDsBI0sdfIoM4A9dbGUAtOXX/qKJUz5KncQ+LrYnj6qVUAxJjgL9u+Kjo8tZ2yG54H
 Mp9w==
X-Gm-Message-State: AOAM530rwZGxnafVjvBbWfarkATUpP93UZypSpOKhxhZ6ok0YO2VCQmr
 iVKquHOYZRduVqcSM0unxRMalLZm2CPVz6g4y1bzqg==
X-Google-Smtp-Source: ABdhPJxfBx8tM6fzwMiaAfgSM9un3MFjNZ9K8OviHxtPzsM8f7jDj3+uetDq6HcElnDSMm1YBUuC7Hk7qHOPJPnJ1cc=
X-Received: by 2002:a54:4099:0:b0:2ec:d31c:481d with SMTP id
 i25-20020a544099000000b002ecd31c481dmr2210078oii.7.1648715339664; Thu, 31 Mar
 2022 01:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
 <20220307203146.648-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20220307203146.648-2-niranjana.vishwanathapura@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 31 Mar 2022 10:28:48 +0200
Message-ID: <CAKMK7uE=2=SEEsXnq0fnJD35E52X_C3RjV=w9WNfe-i7UWf0ZQ@mail.gmail.com>
Subject: Re: [RFC v2 1/2] drm/doc/rfc: VM_BIND feature design document
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, 
 Jason Ekstrand <jason@jlekstrand.net>, "Bloomfield,
 Jon" <jon.bloomfield@intel.com>, 
 Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@intel.com, chris.p.wilson@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding a pile of people who've expressed interest in vm_bind for their
drivers.

Also note to the intel folks: This is largely written with me having my
subsystem co-maintainer hat on, i.e. what I think is the right thing to do
here for the subsystem at large. There is substantial rework involved
here, but it's not any different from i915 adopting ttm or i915 adpoting
drm/sched, and I do think this stuff needs to happen in one form or
another.

On Mon, Mar 07, 2022 at 12:31:45PM -0800, Niranjana Vishwanathapura wrote:
> VM_BIND design document with description of intended use cases.
>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel=
.com>
> ---
>  Documentation/gpu/rfc/i915_vm_bind.rst | 210 +++++++++++++++++++++++++
>  Documentation/gpu/rfc/index.rst        |   4 +
>  2 files changed, 214 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst
>
> diff --git a/Documentation/gpu/rfc/i915_vm_bind.rst b/Documentation/gpu/r=
fc/i915_vm_bind.rst
> new file mode 100644
> index 000000000000..cdc6bb25b942
> --- /dev/null
> +++ b/Documentation/gpu/rfc/i915_vm_bind.rst
> @@ -0,0 +1,210 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +I915 VM_BIND feature design and use cases
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +VM_BIND feature
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +DRM_I915_GEM_VM_BIND/UNBIND ioctls allows UMD to bind/unbind GEM buffer
> +objects (BOs) or sections of a BOs at specified GPU virtual addresses on
> +a specified address space (VM).
> +
> +These mappings (also referred to as persistent mappings) will be persist=
ent
> +across multiple GPU submissions (execbuff) issued by the UMD, without us=
er
> +having to provide a list of all required mappings during each submission
> +(as required by older execbuff mode).
> +
> +VM_BIND ioctl deferes binding the mappings until next execbuff submissio=
n
> +where it will be required, or immediately if I915_GEM_VM_BIND_IMMEDIATE
> +flag is set (useful if mapping is required for an active context).

So this is a screw-up I've done, and for upstream I think we need to fix
it: Implicit sync is bad, and it's also still a bad idea for vm_bind, and
I was wrong suggesting we should do this a few years back when we kicked
this off internally :-(

What I think we need is just always VM_BIND_IMMEDIATE mode, and then a few
things on top:
- in and out fences, like with execbuf, to allow userspace to sync with
  execbuf as needed
- for compute-mode context this means userspace memory fences
- for legacy context this means a timeline syncobj in drm_syncobj

No sync_file or anything else like this at all. This means a bunch of
work, but also it'll have benefits because it means we should be able to
use exactly the same code paths and logic for both compute and for legacy
context, because drm_syncobj support future fence semantics.

Also on the implementation side we still need to install dma_fence to the
various dma_resv, and for this we need the new dma_resv_usage series from
Christian K=C3=B6nig first. vm_bind fences can then use the USAGE_BOOKKEEPI=
NG
flag to make sure they never result in an oversync issue with execbuf. I
don't think trying to land vm_bind without that prep work in
dma_resv_usage makes sense.

Also as soon as dma_resv_usage has landed there's a few cleanups we should
do in i915:
- ttm bo moving code should probably simplify a bit (and maybe more of the
  code should be pushed as helpers into ttm)
- clflush code should be moved over to using USAGE_KERNEL and the various
  hacks and special cases should be ditched. See df94fd05e69e ("drm/i915:
  expand on the kernel-doc for cache_dirty") for a bit more context

This is still not yet enough, since if a vm_bind races with an eviction we
might stall on the new buffers being readied first before the context can
continue. This needs some care to make sure that vma which aren't fully
bound yet are on a separate list, and vma which are marked for unbinding
are removed from the main working set list as soon as possible.

All of these things are relevant for the uapi semantics, which means
- they need to be documented in the uapi kerneldoc, ideally with example
  flows
- umd need to ack this

The other thing here is the async/nonblocking path. I think we still need
that one, but again it should not sync with anything going on in execbuf,
but simply execute the ioctl code in a kernel thread. The idea here is
that this works like a special gpu engine, so that compute and vk can
schedule bindings interleaved with rendering. This should be enough to get
a performant vk sparse binding/textures implementation.

But I'm not entirely sure on this one, so this definitely needs acks from
umds.

> +VM_BIND feature is advertised to user via I915_PARAM_HAS_VM_BIND.
> +User has to opt-in for VM_BIND mode of binding for an address space (VM)
> +during VM creation time via I915_VM_CREATE_FLAGS_USE_VM_BIND extension.
> +A VM in VM_BIND mode will not support older execbuff mode of binding.
> +
> +UMDs can still send BOs of these persistent mappings in execlist of exec=
buff
> +for specifying BO dependencies (implicit fencing) and to use BO as a bat=
ch,
> +but those BOs should be mapped ahead via vm_bind ioctl.

should or must?

Also I'm not really sure that's a great interface. The batchbuffer really
only needs to be an address, so maybe all we need is an extension to
supply an u64 batchbuffer address instead of trying to retrofit this into
an unfitting current uapi.

And for implicit sync there's two things:
- for vk I think the right uapi is the dma-buf fence import/export ioctls
  from Jason Ekstrand. I think we should land that first instead of
  hacking funny concepts together
- for gl the dma-buf import/export might not be fast enough, since gl
  needs to do a _lot_ of implicit sync. There we might need to use the
  execbuffer buffer list, but then we should have extremely clear uapi
  rules which disallow _everything_ except setting the explicit sync uapi

Again all this stuff needs to be documented in detail in the kerneldoc
uapi spec.

> +VM_BIND features include,
> +- Multiple Virtual Address (VA) mappings can map to the same physical pa=
ges
> +  of an object (aliasing).
> +- VA mapping can map to a partial section of the BO (partial binding).
> +- Support capture of persistent mappings in the dump upon GPU error.
> +- TLB is flushed upon unbind completion. Batching of TLB flushes in some
> +  usecases will be helpful.
> +- Asynchronous vm_bind and vm_unbind support.
> +- VM_BIND uses user/memory fence mechanism for signaling bind completion
> +  and for signaling batch completion in long running contexts (explained
> +  below).

This should all be in the kerneldoc.

> +VM_PRIVATE objects
> +------------------
> +By default, BOs can be mapped on multiple VMs and can also be dma-buf
> +exported. Hence these BOs are referred to as Shared BOs.
> +During each execbuff submission, the request fence must be added to the
> +dma-resv fence list of all shared BOs mapped on the VM.
> +
> +VM_BIND feature introduces an optimization where user can create BO whic=
h
> +is private to a specified VM via I915_GEM_CREATE_EXT_VM_PRIVATE flag dur=
ing
> +BO creation. Unlike Shared BOs, these VM private BOs can only be mapped =
on
> +the VM they are private to and can't be dma-buf exported.
> +All private BOs of a VM share the dma-resv object. Hence during each exe=
cbuff
> +submission, they need only one dma-resv fence list updated. Thus the fas=
t
> +path (where required mappings are already bound) submission latency is O=
(1)
> +w.r.t the number of VM private BOs.

Two things:

- I think the above is required to for initial vm_bind for vk, it kinda
  doesn't make much sense without that, and will allow us to match amdgpu
  and radeonsi

- Christian K=C3=B6nig just landed ttm bulk lru helpers, and I think we nee=
d to
  use those. This means vm_bind will only work with the ttm backend, but
  that's what we have for the big dgpu where vm_bind helps more in terms
  of performance, and the igfx conversion to ttm is already going on.

Furthermore the i915 shrinker lru has stopped being an lru, so I think
that should also be moved over to the ttm lru in some fashion to make sure
we once again have a reasonable and consistent memory aging and reclaim
architecture. The current code is just too much of a complete mess.

And since this is all fairly integral to how the code arch works I don't
think merging a different version which isn't based on ttm bulk lru
helpers makes sense.

Also I do think the page table lru handling needs to be included here,
because that's another complete hand-rolled separate world for not much
good reasons. I guess that can happen in parallel with the initial vm_bind
bring-up, but it needs to be completed by the time we add the features
beyond the initial support needed for vk.

> +VM_BIND locking hirarchy
> +-------------------------
> +VM_BIND locking order is as below.
> +
> +1) A vm_bind mutex will protect vm_bind lists. This lock is taken in vm_=
bind/
> +   vm_unbind ioctl calls, in the execbuff path and while releasing the m=
apping.
> +
> +   In future, when GPU page faults are supported, we can potentially use=
 a
> +   rwsem instead, so that multiple pagefault handlers can take the read =
side
> +   lock to lookup the mapping and hence can run in parallel.
> +
> +2) The BO's dma-resv lock will protect i915_vma state and needs to be he=
ld
> +   while binding a vma and while updating dma-resv fence list of a BO.
> +   The private BOs of a VM will all share a dma-resv object.
> +
> +   This lock is held in vm_bind call for immediate binding, during vm_un=
bind
> +   call for unbinding and during execbuff path for binding the mapping a=
nd
> +   updating the dma-resv fence list of the BO.
> +
> +3) Spinlock/s to protect some of the VM's lists.
> +
> +We will also need support for bluk LRU movement of persistent mapping to
> +avoid additional latencies in execbuff path.

This needs more detail and explanation of how each level is required. Also
the shared dma_resv for VM_PRIVATE objects is kinda important to explain.

Like "some of the VM's lists" explains pretty much nothing.

> +
> +GPU page faults
> +----------------
> +Both older execbuff mode and the newer VM_BIND mode of binding will requ=
ire
> +using dma-fence to ensure residency.
> +In future when GPU page faults are supported, no dma-fence usage is requ=
ired
> +as residency is purely managed by installing and removing/invalidating p=
tes.

This is a bit confusing. I think one part of this should be moved into the
section with future vm_bind use-cases (we're not going to support page
faults with legacy softpin or even worse, relocations). The locking
discussion should be part of the much longer list of uses cases that
motivate the locking design.

> +
> +
> +User/Memory Fence
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The idea is to take a user specified virtual address and install an inte=
rrupt
> +handler to wake up the current task when the memory location passes the =
user
> +supplied filter.
> +
> +User/Memory fence is a <address, value> pair. To signal the user fence,
> +specified value will be written at the specified virtual address and
> +wakeup the waiting process. User can wait on an user fence with the
> +gem_wait_user_fence ioctl.
> +
> +It also allows the user to emit their own MI_FLUSH/PIPE_CONTROL notify
> +interrupt within their batches after updating the value to have sub-batc=
h
> +precision on the wakeup. Each batch can signal an user fence to indicate
> +the completion of next level batch. The completion of very first level b=
atch
> +needs to be signaled by the command streamer. The user must provide the
> +user/memory fence for this via the DRM_I915_GEM_EXECBUFFER_EXT_USER_FENC=
E
> +extension of execbuff ioctl, so that KMD can setup the command streamer =
to
> +signal it.
> +
> +User/Memory fence can also be supplied to the kernel driver to signal/wa=
ke up
> +the user process after completion of an asynchronous operation.
> +
> +When VM_BIND ioctl was provided with a user/memory fence via the
> +I915_VM_BIND_EXT_USER_FENCE extension, it will be signaled upon the comp=
letion
> +of binding of that mapping. All async binds/unbinds are serialized, henc=
e
> +signaling of user/memory fence also indicate the completion of all previ=
ous
> +binds/unbinds.
> +
> +This feature will be derived from the below original work:
> +https://patchwork.freedesktop.org/patch/349417/

This is 1:1 tied to long running compute mode contexts (which in the uapi
doc must reference the endless amounts of bikeshed summary we have in the
docs about indefinite fences).

I'd put this into a new section about compute and userspace memory fences
support, with this and the next chapter ...
> +
> +
> +VM_BIND use cases
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

... and then make this section here focus entirely on additional vm_bind
use-cases that we'll be adding later on. Which doesn't need to go into any
details, it's just justification for why we want to build the world on top
of vm_bind.

> +
> +Long running Compute contexts
> +------------------------------
> +Usage of dma-fence expects that they complete in reasonable amount of ti=
me.
> +Compute on the other hand can be long running. Hence it is appropriate f=
or
> +compute to use user/memory fence and dma-fence usage will be limited to
> +in-kernel consumption only. This requires an execbuff uapi extension to =
pass
> +in user fence. Compute must opt-in for this mechanism with
> +I915_CONTEXT_CREATE_FLAGS_LONG_RUNNING flag during context creation.
> +
> +The dma-fence based user interfaces like gem_wait ioctl, execbuff out fe=
nce
> +and implicit dependency setting is not allowed on long running contexts.
> +
> +Where GPU page faults are not available, kernel driver upon buffer inval=
idation
> +will initiate a suspend (preemption) of long running context with a dma-=
fence
> +attached to it. And upon completion of that suspend fence, finish the
> +invalidation, revalidate the BO and then resume the compute context. Thi=
s is
> +done by having a per-context fence (called suspend fence) proxying as
> +i915_request fence. This suspend fence is enabled when there is a wait o=
n it,
> +which triggers the context preemption.
> +
> +This is much easier to support with VM_BIND compared to the current heav=
ier
> +execbuff path resource attachment.

There's a bunch of tricky code around compute mode context support, like
the preempt ctx fence (or suspend fence or whatever you want to call it),
and the resume work. And I think that code should be shared across
drivers.

I think the right place to put this is into drm/sched, somewhere attached
to the drm_sched_entity structure. I expect i915 folks to collaborate with
amd and ideally also get amdkfd to adopt the same thing if possible. At
least Christian has mentioned in the past that he's a bit unhappy about
how this works.

Also drm/sched has dependency tracking, which will be needed to pipeline
context resume operations. That needs to be used instead of i915-gem
inventing yet another dependency tracking data structure (it already has 3
and that's roughly 3 too many).

This means compute mode support and userspace memory fences are blocked on
the drm/sched conversion, but *eh* add it to the list of reasons for why
drm/sched needs to happen.

Also since we only have support for compute mode ctx in our internal tree
with the guc scheduler backend anyway, and the first conversion target is
the guc backend, I don't think this actually holds up a lot of the code.

> +Low Latency Submission
> +-----------------------
> +Allows compute UMD to directly submit GPU jobs instead of through execbu=
ff
> +ioctl. VM_BIND allows map/unmap of BOs required for directly submitted j=
obs.

This is really just a special case of compute mode contexts, I think I'd
include that in there, but explain better what it requires (i.e. vm_bind
not being synchronized against execbuf).

> +
> +Debugger
> +---------
> +With debug event interface user space process (debugger) is able to keep=
 track
> +of and act upon resources created by another process (debuggee) and atta=
ched
> +to GPU via vm_bind interface.
> +
> +Mesa/Valkun
> +------------
> +VM_BIND can potentially reduce the CPU-overhead in Mesa thus improving
> +performance. For Vulkan it should be straightforward to use VM_BIND.
> +For Iris implicit buffer tracking must be implemented before we can harn=
ess
> +VM_BIND benefits. With increasing GPU hardware performance reducing CPU
> +overhead becomes more important.

Just to clarify, I don't think we can land vm_bind into upstream if it
doesn't work 100% for vk. There's a bit much "can" instead of "will in
this section".

> +
> +Page level hints settings
> +--------------------------
> +VM_BIND allows any hints setting per mapping instead of per BO.
> +Possible hints include read-only, placement and atomicity.
> +Sub-BO level placement hint will be even more relevant with
> +upcoming GPU on-demand page fault support.
> +
> +Page level Cache/CLOS settings
> +-------------------------------
> +VM_BIND allows cache/CLOS settings per mapping instead of per BO.
> +
> +Shared Virtual Memory (SVM) support
> +------------------------------------
> +VM_BIND interface can be used to map system memory directly (without gem=
 BO
> +abstraction) using the HMM interface.

Userptr is absent here (and it's not the same as svm, at least on
discrete), and this is needed for the initial version since otherwise vk
can't use it because we're not at feature parity.

Irc discussions by Maarten and Dave came up with the idea that maybe
userptr for vm_bind should work _without_ any gem bo as backing storage,
since that guarantees that people don't come up with funny ideas like
trying to share such bo across process or mmap it and other nonsense which
just doesn't work.

> +
> +
> +Broder i915 cleanups
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Supporting this whole new vm_bind mode of binding which comes with its o=
wn
> +usecases to support and the locking requirements requires proper integra=
tion
> +with the existing i915 driver. This calls for some broader i915 driver
> +cleanups/simplifications for maintainability of the driver going forward=
.
> +Here are few things identified and are being looked into.
> +
> +- Make pagetable allocations evictable and manage them similar to VM_BIN=
D
> +  mapped objects. Page table pages are similar to persistent mappings of=
 a
> +  VM (difference here are that the page table pages will not
> +  have an i915_vma structure and after swapping pages back in, parent pa=
ge
> +  link needs to be updated).

See above, but I think this should be included as part of the initial
vm_bind push.

> +- Remove vma lookup cache (eb->gem_context->handles_vma). VM_BIND featur=
e
> +  do not use it and complexity it brings in is probably more than the
> +  performance advantage we get in legacy execbuff case.
> +- Remove vma->open_count counting
> +- Remove i915_vma active reference tracking. Instead use underlying BO's
> +  dma-resv fence list to determine if a i915_vma is active or not.

So this is a complete mess, and really should not exist. I think it needs
to be removed before we try to make i915_vma even more complex by adding
vm_bind.

The other thing I've been pondering here is that vm_bind is really
completely different from legacy vm structures for a lot of reasons:
- no relocation or softpin handling, which means vm_bind has no reason to
  ever look at the i915_vma structure in execbuf code. Unfortunately
  execbuf has been rewritten to be vma instead of obj centric, so it's a
  100% mismatch

- vm_bind never has to manage any vm lru. Legacy execbuf has to maintain
  that because the kernel manages the virtual address space fully. Again
  ideally that entire vma_move_to_active code and everything related to it
  would simply not exist.

- similar on the eviction side, the rules are quite different: For vm_bind
  we never tear down the vma, instead it's just moved to the list of
  evicted vma. Legacy vm have no need for all these additional lists, so
  another huge confusion.

- if the refcount is done correctly for vm_bind we wouldn't need the
  tricky code in the bo close paths. Unfortunately legacy vm with
  relocations and softpin require that vma are only a weak reference, so
  that cannot be removed.

- there's also a ton of special cases for ggtt handling, like the
  different views (for display, partial views for mmap), but also the
  gen2/3 alignment and padding requirements which vm_bind never needs.

I think the right thing here is to massively split the implementation
behind some solid vm/vma abstraction, with a base clase for vm and vma
which _only_ has the pieces which both vm_bind and the legacy vm stuff
needs. But it's a bit tricky to get there. I think a workable path would
be:
- Add a new base class to both i915_address_space and i915_vma, which
  starts out empty.

- As vm_bind code lands, move things that vm_bind code needs into these
  base classes

- The goal should be that these base classes are a stand-alone library
  that other drivers could reuse. Like we've done with the buddy
  allocator, which first moved from i915-gem to i915-ttm, and which amd
  now moved to drm/ttm for reuse by amdgpu. Ideally other drivers
  interested in adding something like vm_bind should be involved from the
  start (or maybe the entire thing reused in amdgpu, they're looking at
  vk sparse binding support too or at least have perf issues I think).

- Locking must be the same across all implemntations, otherwise it's
  really not an abstract. i915 screwed this up terribly by having
  different locking rules for ppgtt and ggtt, which is just nonsense.

- The legacy specific code needs to be extracted as much as possible and
  shoved into separate files. In execbuf this means we need to get back to
  object centric flow, and the slowpaths need to become a lot simpler
  again (Maarten has cleaned up some of this, but there's still a silly
  amount of hacks in there with funny layering).

- I think if stuff like the vma eviction details (list movement and
  locking and refcounting of the underlying object)

> +
> +These can be worked upon after intitial vm_bind support is added.

I don't think that works, given how badly i915-gem team screwed up in
other places. And those places had to be fixed by adopting shared code
like ttm. Plus there's already a huge unfulffiled promise pending with the
drm/sched conversion, i915-gem team is clearly deeply in the red here :-/

Cheers, Daniel

> +
> +
> +UAPI
> +=3D=3D=3D=3D=3D
> +Uapi definiton can be found here:
> +.. kernel-doc:: Documentation/gpu/rfc/i915_vm_bind.h
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/inde=
x.rst
> index 91e93a705230..7d10c36b268d 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -23,3 +23,7 @@ host such documentation:
>  .. toctree::
>
>      i915_scheduler.rst
> +
> +.. toctree::
> +
> +    i915_vm_bind.rst
> --
> 2.21.0.rc0.32.g243a4c7e27
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
