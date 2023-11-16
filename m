Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FC7EE01F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C00310E5E0;
	Thu, 16 Nov 2023 11:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA3A10E5D1;
 Thu, 16 Nov 2023 11:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700135337; x=1731671337;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XRR6VslEkIvuXV5AVIjSoMcVpnC1I6D5QfxU18tEp50=;
 b=dOM0tT5schY6D+iL8aMgo8xpb9d9oLoorS2P6HCfCB3hrwXt/64QnomO
 IT/+Vgq1leY2FP4vfr84xBtxq1rDHqSEVo1eTh5Wotqxjbr3hHekb/HFl
 dIt7PwEOwX9wLs0CK+AahiGfYAZUWWX04G/IJQUkU8y+Vp/kkMOS7r2/E
 oeJj1gdNoaZdhtMSokbmRTOR6TYr91NpoMZZD0OP/ydP2LHeMtE2I1FEU
 WmhM0GE9Ym48xFVYmg1NRvpawrxruJhk+LahaphfdNI7gRXjd52TwqDeP
 PnG8JJtCsDNm99MHZG0tYlF/bJ+J9SFYMGr8Q705e7qneisDcmxIioxxy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9712489"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="9712489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:48:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855982582"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="855982582"
Received: from mcaspar-mobl1.ger.corp.intel.com (HELO [10.249.254.12])
 ([10.249.254.12])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:48:48 -0800
Message-ID: <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 16 Nov 2023 12:48:45 +0100
In-Reply-To: <20231116104851.114bdb08@collabora.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Boris,

Thanks for reviewing. Some comments below:

On Thu, 2023-11-16 at 10:48 +0100, Boris Brezillon wrote:
> Hi Thomas,
>=20
> On Wed, 15 Nov 2023 13:49:37 +0100
> Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
>=20
> > Add the first version of the VM_BIND locking document which is
> > intended to be part of the xe driver upstreaming agreement.
> >=20
> > The document describes and discuss the locking used during exec-
> > functions, evicton and for userptr gpu-vmas. Intention is to be
> > using the
> > same nomenclature as the drm-vm-bind-async.rst.
> >=20
> > v2:
> > - s/gvm/gpu_vm/g (Rodrigo Vivi)
> > - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
> > =C2=A0 (Rodrigo Vivi)
> > - Adjust commit message accordingly.
> > - Add SPDX license header.
> >=20
> > v3:
> > - Large update to align with the drm_gpuvm manager locking
> > - Add "Efficient userptr gpu_vma exec function iteration" section
> > - Add "Locking at bind- and unbind time" section.
> >=20
> > v4:
> > - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> > - Minor style fixes and typos (Rodrigo Vivi)
> > - Clarify situations where stale GPU mappings are occurring and how
> > =C2=A0 access through these mappings are blocked. (Rodrigo Vivi)
> > - Insert into the toctree in implementation_guidelines.rst
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0Documentation/gpu/drm-vm-bind-locking.rst=C2=A0=C2=A0=C2=A0=C2=A0=
 | 503
> > ++++++++++++++++++
> > =C2=A0.../gpu/implementation_guidelines.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A02 files changed, 504 insertions(+)
> > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> >=20
> > diff --git a/Documentation/gpu/drm-vm-bind-locking.rst
> > b/Documentation/gpu/drm-vm-bind-locking.rst
> > new file mode 100644
> > index 000000000000..bc701157cb34
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> > @@ -0,0 +1,503 @@
> > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +VM_BIND locking
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +This document attempts to describe what's needed to get VM_BIND
> > locking right,
> > +including the userptr mmu_notifier locking and it will also
> > discuss some
> > +optimizations to get rid of the looping through of all userptr
> > mappings and
> > +external / shared object mappings that is needed in the simplest
> > +implementation. It will also discuss some implications for
> > faulting gpu_vms.
> > +
> > +Nomenclature
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +* ``Context``: GPU execution context.
> > +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> > +=C2=A0 meta-data. Typically one per client (DRM file-private), or one
> > per
> > +=C2=A0 context.
>=20
> Should we mention that it's a driver object, likely inheriting from
> drm_gpuvm?

Yes, I can try to be a bit more drm_gpuvm-centric throughout the
document, although I want to avoid being too specific due to the
current rapid drm_gpuvm rate of change, which might also affect this
document. I guess I will have to commit for now to update the document
on each gpuvm series we land...

>=20
> > +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm
> > with
> > +=C2=A0 associated meta-data. The backing storage of a gpu_vma can
> > either be
> > +=C2=A0 a GEM object or anonymous pages mapped also into the CPU
> > +=C2=A0 address space for the process.
> > +* gpu_vm_bo: Abstracts the association of a GEM object and
> > +=C2=A0 a VM. Note that if only one gpu_vma per vm and buffer object
> > were
> > +=C2=A0 allowed, the state stored with a gpu_vm_bo could just as well
> > have
> > +=C2=A0 been stored with the gpu_vma.
>=20
> I find this note confusing, and I don't think it brings any value to
> the rest of the explanation. Sure, there's a way we could have
> optimized things for 1:1 VM:BO mappings, but do we care about this
> very
> restrictive use case in this context.

I'll remove that note.

>=20
> > For the purpose of this document, each
> > +=C2=A0 GEM object maintains a list of gpu_vm_bos, and each gpu_vm_bo
> > +=C2=A0 maintains a list of gpu_vmas.
> > +* ``userptr gpu_vma or just userptr``: A gpu_vma, whose backing
> > store
> > +=C2=A0 is anonymous pages as described above.
> > +* ``revalidating``: Revalidating a gpu_vma means making the latest
> > version
> > +=C2=A0 of the backing store resident and making sure the gpu_vma's
> > +=C2=A0 page-table entries point to that backing store.
> > +* ``dma_fence``: A struct dma_fence that is similar to a struct
> > completion
> > +=C2=A0 and which tracks GPU activity. When the GPU activity is
> > finished,
> > +=C2=A0 the dma_fence signals.
>=20
> Maybe we could point to the dma_fence doc here [1]
>=20
> > +* ``dma_resv``: A struct dma_resv (a.k.a reservation object) that
> > is used
> > +=C2=A0 to track GPU activity in the form of multiple dma_fences on a
> > +=C2=A0 gpu_vm or a GEM object. The dma_resv contains an array / list
> > +=C2=A0 of dma_fences and a lock that needs to be held when adding
> > +=C2=A0 additional dma_fences to the dma_resv. The lock is of a type
> > that
> > +=C2=A0 allows deadlock-safe locking of multiple dma_resvs in arbitrary
> > order.
>=20
> Same for dma_resv [2]
>=20
> > +* ``exec function``: An exec function is a function that
> > revalidates all
> > +=C2=A0 affected gpu_vmas, submits a GPU command batch and registers th=
e
> > +=C2=A0 dma_fence representing the GPU command's activity with all
> > affected
> > +=C2=A0 dma_resvs. For completeness, although not covered by this
> > document,
> > +=C2=A0 it's worth mentioning that an exec function may also be the
> > +=C2=A0 revalidation worker that is used by some drivers in compute /
> > +=C2=A0 long-running mode.
> > +* ``local object``: A GEM object which is local to a gpu_vm.
> > Shared gem
> > +=C2=A0 objects also share the gpu_vm's dma_resv.
> > +* ``shared object``: a.k.a external object: A GEM object which may
> > be shared
> > +=C2=A0 by multiple gpu_vms and whose backing storage may be shared wit=
h
> > +=C2=A0 other drivers.
>=20
> Should we name that one external object and mentions it's sometimes
> also called external object. This way it matches the name used in
> gpuvm
> implementation (extobj).

You mean "... also called shared object"? Shure, can do that.
>=20
> > +
> > +
> > +Locks used and locking orders
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +One of the benefits of VM_BIND is that local GEM objects share the
> > gpu_vm's
> > +dma_resv object and hence the dma_resv lock. So even with a huge
> > +number of local GEM objects, only one lock is needed to make the
> > exec
> > +sequence atomic.
> > +
> > +The following locks and locking orders are used:
> > +
> > +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the
> > gpu_vm is
> > +=C2=A0 partitioned into gpu_vmas. It can also protect the gpu_vm's lis=
t
> > of
> > +=C2=A0 userptr gpu_vmas. With a CPU mm analogy this would correspond t=
o
> > the
> > +=C2=A0 mmap_lock.
>=20
> I don't see any drm_gpuvm::lock field in Danilo's latest patchset,
> so,
> unless I missed one version, and this lock is actually provided by
> drm_gpuvm, I would mention this is a driver-specific lock. This
> comment
> applies to all the locks you describe here actually (mention which
> ones
> are provided by drm_gpuvm, and which ones are driver-specific).

These will be needed also by gpuvm when implementing userptr vmas, so I
can mention that drm_gpuvm is currently lacking a userptr
implementation, so "the locks described below are to be considered
driver-specific for now"

>=20
> > +* The ``userptr_seqlock``. This lock is taken in read mode for
> > each
> > +=C2=A0 userptr gpu_vma on the gpu_vm's userptr list, and in write mode
> > during mmu
> > +=C2=A0 notifier invalidation. This is not a real seqlock but described
> > in
> > +=C2=A0 ``mm/mmu_notifier.c`` as a "Collision-retry read-side/write-sid=
e
> > +=C2=A0 'lock' a lot like a seqcount, however this allows multiple
> > +=C2=A0 write-sides to hold it at once...". The read side critical
> > section
> > +=C2=A0 is enclosed by ``mmu_interval_read_begin() /
> > +=C2=A0 mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> > +=C2=A0 sleeping if the write side is held.
> > +=C2=A0 The write side is held by the core mm while calling mmu interva=
l
> > +=C2=A0 invalidation notifiers.
> > +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of
> > gpu_vmas needing
> > +=C2=A0 rebinding, and also the residency of all the gpu_vm's local GEM
> > object.
> > +=C2=A0 Furthermore it typically protects the gpu_vm's list of evicted
> > GEM
> > +=C2=A0 objects and external objects.
> > +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is
> > +=C2=A0 taken in read mode during exec and write mode during a mmu
> > notifier
> > +=C2=A0 invalidation. The userptr notifier lock is per gpu_vm.
> > +* The gpu_vm list spinlocks. With some implementations they are
> > needed
> > +=C2=A0 to be able to update the gpu_vm evicted- and external object
> > +=C2=A0 list. For those implementations, the spinlocks are grabbed when
> > the
> > +=C2=A0 lists are manipulated. However to avoid locking order violation=
s
> > +=C2=A0 with the dma_resv locks, a special scheme is needed when
> > iterating
> > +=C2=A0 over the lists.
> > +
> > +.. _gpu_vma lifetime:
> > +
> > +Protection and lifetime of gpu_vm_bos and gpu_vmas
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The GEM object's list of gpu_vm_bos is typically protected by the
> > +GEM object's dma_resv.
>=20
> Should we mention the driver-custom lock here, for cases where the
> driver needs to link a gpu_vm_bo to the GEM list in a dma-signalling
> path?

Yes, can do that.

>=20
> > Each gpu_vm_bo holds a reference counted pointer
> > +to the underlying GEM object, and each gpu_vma holds a reference
> > counted
> > +pointer to the gpu_vm_bo. When iterating over the GEM object's
> > +list of gpu_vm_bos the gem object's dma_resv must thus be held,
> > +but if it needs to be dropped during the iteration, care needs to
> > be
> > +taken so that any gpu_vm_bo, and the gpu_vm, if dereferenced
> > +while the lock is dropped, do not disappear. The easiest way to
> > avoid
> > +this is to take a reference on affected objects while the dma_resv
> > is
> > +still held. If iterating over the gpu_vm_bo's gpu_vmas, even
> > +greater care needs to be taken since the gpu_vmas are not
> > +reference counted. If a driver accesses a gpu_vma obtained from
> > +the gpu_vm_bo's list of gpu_vmas, and the GEM object's
> > +dma_resv is dropped, at the very least, it should be thoroughly
> > +documented how the gpu_vma is kept alive. Otherwise holding the
> > +GEM object's dma_resv lock also around unlinking a gpu_vma from a
> > +gpu_vm_bo will ensure that doesn't happen.
>=20
> If we have use cases where accessing VMAs without the GEM object
> gpuva_list lock held is useful, it would probably be worth mentioning
> them. If not, I'm not sure we should list it as a possibility, given
> how hard it'd be to guarantee that the VMA is still valid when being
> accessed in that situation (I mean, that could be done with some
> driver-specific refcounting at the VMA object level, but is it really
> something we want to encourage drivers to do?).
>=20
> > +
> > +
> > +Revalidation and eviction of local objects
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Revalidation
> > +____________
> > +With VM_BIND, all local objects need to be resident when the gpu
> > is
> > +executing using the gpu_vm, and the objects need to have valid
> > +gpu_vmas set up pointing to them. Typically each gpu command
> > buffer
> > +submission is therefore preceded with a re-validation section:
> > +
> > +.. code-block:: C
> > +
> > +=C2=A0=C2=A0 dma_resv_lock(gpu_vm->resv);
> > +
> > +=C2=A0=C2=A0 // Validation section starts here.
> > +=C2=A0=C2=A0 for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list,
> > &gpu_vm_bo) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 validate_=
gem_bo(&gpu_vm_bo->gem_bo);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The fo=
llowing list iteration needs the Gem object's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // dma_re=
sv to be held (it protects the gpu_vm_bo's
> > list of
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // gpu_vm=
as, but since local gem objects share the
> > gpu_vm's
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // dma_re=
sv, it is already held at this point.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_=
gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 move_gpu_vma_to_rebind_list(&gpu_vma, &gp=
u_vm-
> > >rebind_list);
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gp=
u_vma)
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rebind_gp=
u_vma(&gpu_vma);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove_gp=
u_vma_from_rebind_list(&gpu_vma);
> > +=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0 // Validation section ends here, and job submission start=
s.
> > +
> > +=C2=A0=C2=A0 add_dependencies(&gpu_job, &gpu_vm->resv);
> > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&gpu_job));
> > +
> > +=C2=A0=C2=A0 add_dma_fence(job_dma_fence, &gpu_vm->resv);
> > +=C2=A0=C2=A0 dma_resv_unlock(gpu_vm->resv);
>=20
> This code excerpt is lacking all the retryable resv-locking + slot
> reservation steps. I mean, we'd normally use a drm_exec (or
> drm_gpuvm_exec) context to acquire the VM resvs, all extobjs resvs +
> all other driver internal resvs that are not attached to any of the
> VM
> BOs. I wonder if this simplification is not going to cause trouble in
> the long run, but at the very least, it should be mentioned that this
> is a simplified version.
>=20
> > +
> > +The reason for having a separate gpu_vm rebind list is that there
> > +might be userptr gpu_vmas that are not mapping a buffer object
> > that
> > +also need rebinding.
> > +
> > +Eviction
> > +________
> > +
> > +Eviction of one of these local objects will then look similar to
> > the
> > +following:
> > +
> > +.. code-block:: C
> > +
> > +=C2=A0=C2=A0 obj =3D get_object_from_lru();
> > +
> > +=C2=A0=C2=A0 dma_resv_lock(obj->resv);
> > +=C2=A0=C2=A0 for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_gpu_v=
m_bo_to_evict_list(&gpu_vm_bo, &gpu_vm-
> > >evict_list);
> > +
> > +=C2=A0=C2=A0 add_dependencies(&eviction_job, &obj->resv);
> > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&eviction_job);
>=20
> Could you expend a bit on what the eviction job does? On embedded
> GPUs,
> where there's no VRAM, we typically don't have a GPU job to teardown
> GPU mappings. We do have an asynchronous VM_BIND queue though, so I
> suspect the job here is an async VM_BIND job.
>=20
> Not asking you to add that to the doc, I'm just trying to figure out
> how
> this would map to the mem-reclaim logic in panthor...

This would typically be the blit of data from VRAM to system, but async
jobs here may also include zapping page-tables and TLB flush in case of
recoverable page-faults.

>=20
> > +=C2=A0=C2=A0 add_dma_fence(&obj->resv, job_dma_fence);
> > +
> > +=C2=A0=C2=A0 dma_resv_unlock(&obj->resv);
> > +=C2=A0=C2=A0 put_object(obj);
> > +
> > +Note that since the object is local to the gpu_vm, it will share
> > the gpu_vm's
> > +dma_resv lock so that ``obj->resv =3D=3D gpu_vm->resv``.
> > +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict
> > list,
> > +which is protected by ``gpu_vm->resv``, that is always locked
> > while
> > +evicting, due to the above equality.
> > +
> > +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before
> > eviction,
> > +Since the driver must ensure that the eviction blit or copy will
> > wait
> > +for GPU idle or depend on all previous GPU activity. Furthermore,
> > any
> > +subsequent attempt by the GPU to access freed memory through the
> > +gpu_vma will be preceded by a new exec function, with a
> > revalidation
> > +section which will make sure all gpu_vmas are rebound. The
> > eviction
> > +code holding the object's dma_resv while revalidating will ensure
> > a
> > +new exec function may not race with the eviction. Note that this
> > will
> > +not hold true, however, if only a subsets of vmas are, due to the
> > +driver implementation, selected for rebinding the next exec
> > +function.
>=20
> This last sentence is hard to follow.
>=20
> "
> Note that this will not hold true if only a subset of vmas
> are selected for rebinding during the next exec call (for instance,
> due
> to some driver decision to only partially restore VMAs).
> "
>=20
> > Then all vmas *not* selected for rebinding needs to be
> > +properly unbound before re-enabling GPU access to the VM.
>=20
> I think I get the problem, but can we have a use case where partial
> VMA restoration is useful? I mean, if some VMAs are not needed, we
> might be able to save MMU page table allocation/setup-time, but given
> the mess it then is to track those non-live VMAs, I'm wondering if
> it's
> leaving the door open for that, unless there's a good reason to do
> it.

This is the use-case Christian has been flagging for for OpenGL and
Media where he warns that the single-vm-memory-overcommit case would
otherwise make the app crawl.

Generalized one might want to think of these as groups of (or perhaps
virtual ranges of) vmas that need to be resident for a single job
submission. Currently we assume the residency-group <-> vm mapping is
1:1, allowing for the unbind-before-eviction to be ignored, but I
figure moving forward and addressing performance problems of real-world
applications that may not always be true.

>=20
> > +
> > +
> > +Locking with external (or shared) buffer objects
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Since shared buffer objects may be shared by multiple gpu_vm's
> > they
> > +can't share their reservation object with a single gpu_vm, but
> > will rather
> > +have a reservation object of their own. The shared objects bound
> > to a
> > +gpu_vm using one or many gpu_vmas are therefore typically put on a
> > +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock.
> > Once
> > +the gpu_vm's reservation object=C2=A0 is locked, it is safe to travers=
e
> > the
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ extra space
>=20
> > +external object list and lock the dma_resvs of all external
> > objects.
> > +
> > +At eviction time we now need to put the gpu_vm_bos of *all*
> > gpu_vms a
> > +shared object is bound to on the gpu_vm's evict list, but we can
> > no longer
> > +be certain that we hold the gpu_vm's dma_resv of all the gpu_vms
> > the
> > +object is bound to, since at eviction time we only hold the
> > object's
> > +private dma_resv. If we have a ww_acquire context at hand at
> > eviction
> > +time we could grab the those dma_resvs but that could cause
> > +expensive ww_mutex rollbacks. A simple option is to just mark the
> > +gpu_vm_bos of the evicted gem object with an ``evicted`` bool that
> > +is inspected the next time the corresponding gpu_vm evicted list
> > needs
> > +to be traversed.
>=20
> IIUC, the vm_bo is not added to the evicted list immediately in that
> case, so I suspect you meant the next time the corresponding gpu_vm
> *extobj* list needs to be traversed.

I like to think of the concept as "lock and validate the list before
traversing it" and you're right in this case, the validation occurs
slightly before we actually start looking at the evicted list. But I
could perhaps rephrase to "...bool that is inspected *before* the next
time..."

>=20
> > At that time the gpu_vm's dma_resv and the object's
> > +dma_resv is held, and the gpu_vm_bo marked evicted, can then be
> > added
> > +to the gpu_vm's list of evicted gpu_vm_bos. The ``evicted`` bool
> > would
> > +then be protected by the object's dma_resv.
>=20
> I would be more asserted here:
>=20
> "
> Note that accesses to the ``evicted`` bool are protected by the
> GEM object's dma_resv.
> "
>=20
>=20
> > +
> > +The exec function would then become
> > +
> > +.. code-block:: C
> > +
> > +=C2=A0=C2=A0 dma_resv_lock(gpu_vm->resv);
> > +
> > +=C2=A0=C2=A0 // External object list is protected by the gpu_vm->resv =
lock.
> > +=C2=A0=C2=A0 for_each_gpu_vm_bo_on_extobj_list(gpu_vm, &gpu_vm_bo) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_=
lock(gpu_vm_bo.gem_obj->resv);
>=20
> Ok, so it's really pseudo-code where you're assuming dma_resv_lock()
> calls are actually locks with a ww_acquire context. This really needs
> to be clarified to people don't copy/paste this code directly.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (gpu_v=
m_bo_marked_evicted(&gpu_vm_bo))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_gpu_vm_bo_to_evict_list(&gpu_vm=
_bo,
> > &gpu_vm->evict_list);
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list,
> > &gpu_vm_bo) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 validate_=
gem_bo(&gpu_vm_bo->gem_bo);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_=
gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 move_gpu_vma_to_rebind_list(&gpu_vma, &gp=
u_vm-
> > >rebind_list);
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gp=
u_vma)
> > {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rebind_gp=
u_vma(&gpu_vma);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remove_gp=
u_vma_from_rebind_list(&gpu_vma);
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 add_dependencies(&gpu_job, &gpu_vm->resv);
> > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&gpu_job));
> > +
> > +=C2=A0=C2=A0 add_dma_fence(job_dma_fence, &gpu_vm->resv);
> > +=C2=A0=C2=A0 for_each_shared_obj(gpu_vm, &obj)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_dma_fence(j=
ob_dma_fence, &obj->resv);
> > +=C2=A0=C2=A0 dma_resv_unlock_all_resv_locks();
> > +
> > +And the corresponding shared-object aware eviction would look
> > like:
> > +
> > +.. code-block:: C
> > +
> > +=C2=A0=C2=A0 obj =3D get_object_from_lru();
> > +
> > +=C2=A0=C2=A0 dma_resv_lock(obj->resv);
> > +=C2=A0=C2=A0 for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (objec=
t_is_vm_local(obj))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm-
> > >evict_list);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 mark_gpu_vm_bo_evicted(&gpu_vm_bo);
> > +
> > +=C2=A0=C2=A0 add_dependencies(&eviction_job, &obj->resv);
> > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&eviction_job);
> > +=C2=A0=C2=A0 add_dma_fence(&obj->resv, job_dma_fence);
> > +
> > +=C2=A0=C2=A0 dma_resv_unlock(&obj->resv);
> > +=C2=A0=C2=A0 put_object(obj);
> > +
> > +.. _Spinlock iteration:
> > +
> > +Accessing the gpu_vm's lists without the dma_resv lock held
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Although some drivers will hold the gpu_vm's dma_resv lock when
> > +accessing the gpu_vm's evict list and external objects lists,
> > there
> > +are drivers that need to access these lists without the dma_resv
> > lock held,
> > +for example due to asynchronous state updates from within the
> > +dma_fence signalling critical path. In such case a spinlock can be
> > +used to protect manipulation of the lists. However, since higher
> > level
> > +sleeping locks needs to be taken for each list item while
> > iterating
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ need
>=20
> > +over the lists, the items already iterated over needs to be
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ^ need
>=20
> > +temporarily moved to a private list and the spinlock released
> > +while processing each item:
> > +
> > +.. code block:: C
> > +
> > +=C2=A0=C2=A0=C2=A0 struct list_head still_in_list;
> > +
> > +=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&still_in_list);
> > +
> > +=C2=A0=C2=A0=C2=A0 spin_lock(&gpu_vm->list_lock);
> > +=C2=A0=C2=A0=C2=A0 do {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=
uct list_head *entry =3D
> > list_first_entry_or_null(&gpu_vm->list, head);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(!entry)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lis=
t_move_tail(&entry->head, &still_in_list);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lis=
t_entry_get_unless_zero(entry);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi=
n_unlock(&gpu_vm->list_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pro=
cess(entry);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spi=
n_lock(&gpu_vm->list_lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lis=
t_entry_put(entry);
> > +=C2=A0=C2=A0=C2=A0 } while (true);
> > +
> > +=C2=A0=C2=A0=C2=A0 list_splice_tail(&still_in_list, &gpu_vm->list);
> > +=C2=A0=C2=A0=C2=A0 spin_unlock(&gpu_vm->list_lock);
> > +
> > +However, due to the additional locking and atomic operations,
> > drivers that *can*
>=20
> I would drop the 'However'.
>=20
> > +avoid accessing the gpu_vm's list outside of the dma_resv lock
> > +might want to avoid this iteration scheme, if the driver
> > anticipates a
> > +large number of list items. For lists where the anticipated number
> > of
> > +list items is small, list iteration doesn't happen very often, or
> > +there is a significant additional cost associated with each
> > iteration,
> > +the atomic operation overhead associated with this type of
> > iteration
> > +is, however, probably negligible. Note that if this scheme is
>=20
> 'however' can be dropped here as well.
>=20
> > +used, it is necessary to make sure this list iteration is
> > protected by
> > +an outer level lock or semaphore, since list items are temporarily
> > +pulled off the list while iterating.
> > +
> > +TODO: Pointer to the gpuvm code implementation if this iteration
> > and
> > +how to choose either iteration scheme.
> > +
> > +userptr gpu_vmas
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer
> > object to a
> > +GPU virtual address range, directly maps a CPU mm range of
> > anonymous-
> > +or file page-cache pages.
> > +A very simple approach would be to just pin the pages using
> > +pin_user_pages() at bind time and unpin them at unbind time, but
> > this
> > +creates a Denial-Of-Service vector since a single user-space
> > process
> > +would be able to pin down all of system memory, which is not
> > +desirable. (For special use-cases and with proper accounting
> > pinning might
> > +still be a desirable feature, though). What we need to do in the
> > +general case is to obtain a reference to the desired pages, make
> > sure
> > +we are notified using a MMU notifier just before the CPU mm unmaps
> > the
> > +pages, dirty them if they are not mapped read-only to the GPU, and
> > +then drop the reference.
> > +When we are notified by the MMU notifier that CPU mm is about to
> > drop the
> > +pages, we need to stop GPU access to the pages by waiting for VM
> > idle
> > +in the MMU notifier and make sure that before the next time the
> > GPU
> > +tries to access whatever is now present in the CPU mm range, we
> > unmap
> > +the old pages from the GPU page tables and repeat the process of
> > +obtaining new page references. (See the :ref:`notifier example
> > +<Invalidation example>` below). Note that when the core mm decides
> > to
> > +laundry pages, we get such an unmap MMU notification and can mark
> > the
> > +pages dirty again before the next GPU access. We also get similar
> > MMU
> > +notifications for NUMA accounting which the GPU driver doesn't
> > really
> > +need to care about, but so far it has proven difficult to exclude
> > +certain notifications.
> > +
> > +Using a MMU notifier for device DMA (and other methods) is
> > described in
> > +`this document
> > +<
> > https://docs.kernel.org/core-api/pin_user_pages.html#case-3-mmu-not
> > ifier-registration-with-or-without-page-faulting-hardware>`_.
> > +
> > +Now the method of obtaining struct page references using
> > +get_user_pages() unfortunately can't be used under a dma_resv lock
> > +since that would violate the locking order of the dma_resv lock vs
> > the
> > +mmap_lock that is grabbed when resolving a CPU pagefault. This
> > means
> > +the gpu_vm's list of userptr gpu_vmas needs to be protected by an
> > +outer lock.
> > +
> > +The MMU interval seqlock for a userptr gpu_vma is used in the
> > following
> > +way:
> > +
> > +.. code-block:: C
> > +
> > +=C2=A0=C2=A0 // Exclusive locking mode here is strictly needed only if=
 there
> > are
> > +=C2=A0=C2=A0 // invalidated userptr vmas present, to avoid multiple us=
erptr
> > +=C2=A0=C2=A0 // revalidations.
> > +=C2=A0=C2=A0 down_write(&gpu_vm->lock);
> > +=C2=A0=C2=A0 retry:
> > +
> > +=C2=A0=C2=A0 // Note: mmu_interval_read_begin() blocks until there is =
no
> > +=C2=A0=C2=A0 // invalidation notifier running anymore.
> > +=C2=A0=C2=A0 seq =3D mmu_interval_read_begin(&gpu_vma->userptr_interva=
l);
> > +=C2=A0=C2=A0 if (seq !=3D gpu_vma->saved_seq) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obtain_ne=
w_page_pointers(&gpu_vma);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_=
lock(&gpu_vm->resv);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_gpu_v=
ma_top_revalidate_list(&gpu_vma, &gpu_vm);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_=
unlock(&gpu_vm->resv);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpu_vma->=
saved_seq =3D seq;
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 // The usual revalidation goes here.
> > +
> > +=C2=A0=C2=A0 // Final userptr sequence validation may not happen befor=
e the
> > +=C2=A0=C2=A0 // submission dma_fence is added to the gpu_vm's resv, fr=
om the
> > POW
> > +=C2=A0=C2=A0 // of the MMU invalidation notifier. Hence the
> > +=C2=A0=C2=A0 // userptr_notifier_lock that will make them appear atomi=
c.
> > +
> > +=C2=A0=C2=A0 add_dependencies(&gpu_job, &gpu_vm->resv);
> > +=C2=A0=C2=A0 down_read(&gpu_vm->userptr_notifier_lock);
> > +=C2=A0=C2=A0 if (mmu_interval_read_retry(&gpu_vma->userptr_interval,
> > gpu_vma->saved_seq)) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 up_read(&gpu_vm=
->userptr_notifier_lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto retry;
> > +=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&gpu_job));
> > +
> > +=C2=A0=C2=A0 add_dma_fence(job_dma_fence, &gpu_vm->resv);
> > +
> > +=C2=A0=C2=A0 for_each_shared_obj(gpu_vm, &obj)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_dma_fence(j=
ob_dma_fence, &obj->resv);
> > +
> > +=C2=A0=C2=A0 dma_resv_unlock_all_resv_locks();
> > +=C2=A0=C2=A0 up_read(&gpu_vm->userptr_notifier_lock);
> > +=C2=A0=C2=A0 up_write(&gpu_vm->lock);
> > +
> > +The code between ``mmu_interval_read_begin()`` and the
> > +``mmu_interval_read_retry()`` marks the read side critical section
> > of
> > +what we call the ``userptr_seqlock``. In reality the gpu_vm's
> > userptr
> > +gpu_vma list is looped through, and the check is done for *all* of
> > its
> > +userptr gpu_vmas, although we only show a single one here.
> > +
> > +The userptr gpu_vma MMU invalidation notifier might be called from
> > +reclaim context and, again to avoid locking order violations, we
> > can't
> > +take any dma_resv lock nor the gpu_vm->lock from within it.
> > +
> > +.. _Invalidation example:
> > +.. code-block:: C
> > +
> > +=C2=A0 bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> > +=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Make sure th=
e exec function either sees the new
> > sequence
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // and backs of=
f or we wait for the dma-fence:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_write(&gpu=
_vm->userptr_notifier_lock);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_interval_se=
t_seq(userptr_interval, cur_seq);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 up_write(&gpu_v=
m->userptr_notifier_lock);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // At this poin=
t, the exec function can't succeed in
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // submitting a=
 new job, because cur_seq is an invalid
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // sequence num=
ber and will always cause a retry. When
> > all
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // invalidation=
 callbacks, the mmu notifier core will
> > flip
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // the sequence=
 number to a valid one. However we need
> > to
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // stop gpu acc=
ess to the old pages here.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_resv_wait_t=
imeout(&gpu_vm->resv,
> > DMA_RESV_USAGE_BOOKKEEP,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
> > +=C2=A0 }
> > +
> > +When this invalidation notifier returns, the GPU can no longer be
> > +accessing the old pages of the userptr gpu_vma and needs to redo
> > the
> > +page-binding before a new GPU submission can succeed.
>=20
> Don't know enough about userptr to properly review this section,
> sorry
> :-/.
>=20

NP. I will address the review as stated above including all review
points where I didn't leave a comment.

Thanks,
Thomas

