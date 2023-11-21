Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE287F2FF2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 14:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE09510E4B1;
	Tue, 21 Nov 2023 13:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2270310E4B0;
 Tue, 21 Nov 2023 13:56:25 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E697766072F1;
 Tue, 21 Nov 2023 13:56:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700574983;
 bh=QUgLRv3v8AO4FpbBVhmzxrxkQbyws3HhneTQlbs3Vws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f7mMKdOIkJXpPAmQ/MjIJeT4xMpQKKoTD/gGTu+5vn7uSnbIo4UonMFHdXv7julrH
 TW2QLae3R3rmGdVhU0thBveEUgyHhYlH+Rl5QY2CuV2Z+m0jcPiF63Mu0Pi8iZlQNR
 RezoIQ+6LrQ72h5qSf3Xkh/u2UFKsIu1oIm9IwHN98U7Q8zsj9P6wVokcjqnYLaDuz
 oAirSygOip9jrRvRcMd0QJ/OHeMyHs0r3sq1fgaZ+XIzR54rIdv4Tz0YZrgV0edLjv
 uMjIu1+jLMK787BOfWi4TKOSA/jvUkCtI6i3rGxDCmP91/N3KgGXyAOL3hIFwnGYl2
 5z3orVSpS3tUw==
Date: Tue, 21 Nov 2023 14:56:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5] Documentation/gpu: VM_BIND locking document
Message-ID: <20231121145619.7e7cb541@collabora.com>
In-Reply-To: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
References: <20231121104046.3201-1-thomas.hellstrom@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oak Zeng <oak.zeng@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023 11:40:46 +0100
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Add the first version of the VM_BIND locking document which is
> intended to be part of the xe driver upstreaming agreement.
>=20
> The document describes and discuss the locking used during exec-
> functions, evicton and for userptr gpu-vmas. Intention is to be using the
> same nomenclature as the drm-vm-bind-async.rst.
>=20
> v2:
> - s/gvm/gpu_vm/g (Rodrigo Vivi)
> - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
>   (Rodrigo Vivi)
> - Adjust commit message accordingly.
> - Add SPDX license header.
>=20
> v3:
> - Large update to align with the drm_gpuvm manager locking
> - Add "Efficient userptr gpu_vma exec function iteration" section
> - Add "Locking at bind- and unbind time" section.
>=20
> v4:
> - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> - Minor style fixes and typos (Rodrigo Vivi)
> - Clarify situations where stale GPU mappings are occurring and how
>   access through these mappings are blocked. (Rodrigo Vivi)
> - Insert into the toctree in implementation_guidelines.rst
>=20
> v5:
> - Add a section about recoverable page-faults.
> - Use local references to other documentation where possible
>   (Bagas Sanjaya)
> - General documentation fixes and typos (Danilo Krummrich and
>   Boris Brezillon)
> - Improve the documentation around locks that need to be grabbed from the
>   dm-fence critical section (Boris Brezillon)
> - Add more references to the DRM GPUVM helpers (Danilo Krummrich and
>   Boriz Brezillon)
> - Update the rfc/xe.rst document.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Still have a few comments (see below), and in general, I find some
sentences very long, which has the tendency of confusing me (always
trying to figure out what was the main point, what the pronouns are
referring to, etc). Anyway, I think it's better to have something
imperfect than nothing at all, so here is my

Reviewed-by: Boris Brezillon <boris.brezillon@collabora>

Feel free to add it even if you decide to ignore my comments.

> ---
>  Documentation/core-api/pin_user_pages.rst     |   2 +
>  Documentation/gpu/drm-mm.rst                  |   4 +
>  Documentation/gpu/drm-vm-bind-locking.rst     | 579 ++++++++++++++++++
>  .../gpu/implementation_guidelines.rst         |   1 +
>  Documentation/gpu/rfc/xe.rst                  |   5 +
>  5 files changed, 591 insertions(+)
>  create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
>=20
> diff --git a/Documentation/core-api/pin_user_pages.rst b/Documentation/co=
re-api/pin_user_pages.rst
> index d3c1f6d8c0e0..6b5f7e6e7155 100644
> --- a/Documentation/core-api/pin_user_pages.rst
> +++ b/Documentation/core-api/pin_user_pages.rst
> @@ -153,6 +153,8 @@ NOTE: Some pages, such as DAX pages, cannot be pinned=
 with longterm pins. That's
>  because DAX pages do not have a separate page cache, and so "pinning" im=
plies
>  locking down file system blocks, which is not (yet) supported in that wa=
y.
> =20
> +.. _mmu-notifier-registration-case:
> +
>  CASE 3: MMU notifier registration, with or without page faulting hardware
>  -------------------------------------------------------------------------
>  Device drivers can pin pages via get_user_pages*(), and register for mmu
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index acc5901ac840..d55751cad67c 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,8 @@ DRM MM Range Allocator Function References
>  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>     :export:
> =20
> +.. _drm_gpuvm:
> +
>  DRM GPUVM
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> @@ -481,6 +483,8 @@ Split and Merge
>  .. kernel-doc:: drivers/gpu/drm/drm_gpuvm.c
>     :doc: Split and Merge
> =20
> +.. _drm_gpuvm_locking:
> +
>  Locking
>  -------
> =20
> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gp=
u/drm-vm-bind-locking.rst
> new file mode 100644
> index 000000000000..a7d08eccd50e
> --- /dev/null
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -0,0 +1,579 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +VM_BIND locking
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This document attempts to describe what's needed to get VM_BIND locking =
right,
> +including the userptr mmu_notifier locking and it also discusses some

Could we split this long sentence like this?

   including the userptr mmu_notifier locking. It also discusses ...

> +optimizations to get rid of the looping through of all userptr mappings =
and
> +external / shared object mappings that is needed in the simplest
> +implementation. In addition there is a section describing the VM_BIND lo=
cking
> +required for implementing recoverable pagefaults.
> +
> +The DRM GPUVM set of helpers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +There is a set of helpers for drivers implementing VM_BIND, and this

Nit: I'm not sure drm_gpuvm qualifies as a set of helpers, it's more an
abstraction layer for GPU VM manipulation that's meant to automate some
of the logic drivers will have to implement if they want to expose a
VM_BIND-like uAPI. To me, helpers sound like something you're free to
use (or not) with little to no overhead, and very little changes to the
original code. Inheriting from drm_gpuvm (and all its sub-objects)
sounds a bit more invasive than replacing some internal function by
helper function calls. That's just my 2 cents, not asking you to
rephrase that.

> +set of helpers implements much, but not all of the locking described
> +in this document. In particular it is currently lacking a userptr
> +implementation. Please refer to the :ref:`DRM GPUVM documentation
> +<drm_gpuvm>`. This document does not intend to describe the DRM GPUVM
> +implementation in detail, but in some places uses it as an
> +implementation example. It is highly recommended for any driver
> +implementing VM_BIND to use the DRM GPUVM helpers and to extend it if
> +common functionality is missing.
> +
> +Nomenclature
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +* ``Context``: GPU execution context.
> +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> +  meta-data. Typically one per client (DRM file-private), or one per
> +  context.

I know you don't want to refer to drm_gpuvm, but I would add:

  The driver gpu_vm object would typically embed a drm_gpuvm, and
  extend it with driver-specific fields, if needed.

> +* ``gpu_vma``: Abstraction of a GPU address range within a gpu_vm with
> +  associated meta-data. The backing storage of a gpu_vma can either be
> +  a GEM object or anonymous pages mapped also into the CPU
> +  address space for the process.

Ditto, with drm_gpuva.

> +* ``gpu_vm_bo``: Abstracts the association of a GEM object and
> +  a VM. The GEM object maintains a list of gpu_vm_bos, and a gpu_vm_bo
> +  maintains a list of gpu_vmas.

And here as well, with drm_gpu_vm_bo.

> +* ``userptr gpu_vma or just userptr``: A gpu_vma, whose backing store
> +  is anonymous pages as described above.
> +* ``revalidating``: Revalidating a gpu_vma means making the latest versi=
on
> +  of the backing store resident and making sure the gpu_vma's
> +  page-table entries point to that backing store.
> +* ``dma_fence``: A struct dma_fence that is similar to a struct completi=
on
> +  and which tracks GPU activity. When the GPU activity is finished,
> +  the dma_fence signals. Please refer to the ``DMA Fences`` section of
> +  the :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``dma_resv``: A struct dma_resv (a.k.a reservation object) that is used
> +  to track GPU activity in the form of multiple dma_fences on a
> +  gpu_vm or a GEM object. The dma_resv contains an array / list
> +  of dma_fences and a lock that needs to be held when adding
> +  additional dma_fences to the dma_resv. The lock is of a type that
> +  allows deadlock-safe locking of multiple dma_resvs in arbitrary
> +  order. Please refer to the ``Reservation Objects`` section of the
> +  :doc:`dma-buf doc </driver-api/dma-buf>`.
> +* ``exec function``: An exec function is a function that revalidates all
> +  affected gpu_vmas, submits a GPU command batch and registers the
> +  dma_fence representing the GPU command's activity with all affected
> +  dma_resvs. For completeness, although not covered by this document,
> +  it's worth mentioning that an exec function may also be the
> +  revalidation worker that is used by some drivers in compute /
> +  long-running mode.
> +* ``local object``: A GEM object which is only mapped within a
> +  single VM. Local GEM objects share the gpu_vm's dma_resv.
> +* ``external object``: a.k.a shared object: A GEM object which may be sh=
ared
> +  by multiple gpu_vms and whose backing storage may be shared with
> +  other drivers.
> +
> +Locks and locking order
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +One of the benefits of VM_BIND is that local GEM objects share the gpu_v=
m's
> +dma_resv object and hence the dma_resv lock. So even with a huge
> +number of local GEM objects, only one lock is needed to make the exec
> +sequence atomic.
> +
> +The following locks and locking orders are used:
> +
> +* The ``gpu_vm->lock`` (optionally an rwsem).

I think it'd be worth expanding on why an rwsem is a good match for
this lock (allowing several readers to walk the VM tree concurrently?).

> Protects the gpu_vm's
> +  data structure keeping track of gpu_vmas. It can also protect the
> +  gpu_vm's list of userptr gpu_vmas. With a CPU mm analogy this would
> +  correspond to the mmap_lock.
> +* The ``userptr_seqlock``. This lock is taken in read mode for each
> +  userptr gpu_vma on the gpu_vm's userptr list, and in write mode during=
 mmu
> +  notifier invalidation. This is not a real seqlock but described in
> +  ``mm/mmu_notifier.c`` as a "Collision-retry read-side/write-side
> +  'lock' a lot like a seqcount, however this allows multiple
> +  write-sides to hold it at once...". The read side critical section
> +  is enclosed by ``mmu_interval_read_begin() /
> +  mmu_interval_read_retry()`` with ``mmu_interval_read_begin()``
> +  sleeping if the write side is held.
> +  The write side is held by the core mm while calling mmu interval
> +  invalidation notifiers.
> +* The ``gpu_vm->resv`` lock. Protects the gpu_vm's list of gpu_vmas need=
ing
> +  rebinding, as well as the residency state of all the gpu_vm's local
> +  GEM objects.
> +  Furthermore it typically protects the gpu_vm's list of evicted and
> +  external GEM objects.
> +* The ``gpu_vm->userptr_notifier_lock``. This is an rwsem that is
> +  taken in read mode during exec and write mode during a mmu notifier
> +  invalidation. The userptr notifier lock is per gpu_vm.
> +* The ``gem_object->gpuva_lock`` This lock protects the GEM object's
> +  list of gpu_vm_bos. This is usually the same lock as the GEM
> +  object's dma_resv, but some drivers protects this list differently,
> +  see below.
> +* The ``gpu_vm list spinlocks``. With some implementations they are need=
ed
> +  to be able to update the gpu_vm evicted- and external object
> +  list. For those implementations, the spinlocks are grabbed when the
> +  lists are manipulated. However to avoid locking order violations
> +  with the dma_resv locks, a special scheme is needed when iterating
> +  over the lists.

Yeah, still think we'd want to refer to the corresponding locks/objects
in drm_gpuvm, so we don't end up with new drivers coming up with their
own locks when one already exists. Not going to block the merging of
this patch because of that though.

Just to be clear, I'm talking about
  =20
   gem_object->gpuva_lock =3D> drm_gem_object::resv if
                             drm_gem_gpuva_set_lock() is not called by
                             the driver

   gpu_vm->resv =3D> drm_gpuvm::r_obj::resv

   gpu_vm list spinlocks =3D> drm_gpuvm::{extobj,evict}::lock

> +
> +.. _gpu_vma lifetime:
> +
> +Protection and lifetime of gpu_vm_bos and gpu_vmas
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +The GEM object's list of gpu_vm_bos, and the gpu_vm_bo's list of gpu_vmas
> +is protected by the ``gem_object->gpuva_lock``, which is typically the
> +same as the GEM object's dma_resv, but if the driver
> +needs to access these lists from within a dma_fence signalling
> +critical section, a driver can choose to instead protect it with a
> +separate lock, which can be locked from within the dma_fence signalling
> +critical section. Such drivers then need to pay additional attention
> +to what locks need to be taken from within the loop when iterating
> +over the gpu_vm_bo and gpu_vma lists to avoid locking-order inversion.
> +
> +The DRM GPUVM set of helpers provide lockdep asserts that this lock is
> +held in relevant situations and also provides a means of making itself
> +aware of which lock is actually used: :c:func:`drm_gem_gpuva_set_lock`.
> +
> +Each gpu_vm_bo holds a reference counted pointer to the underlying GEM
> +object, and each gpu_vma holds a reference counted pointer to the
> +gpu_vm_bo. When iterating over the GEM object's list of gpu_vm_bos and
> +over the gpu_vm_bo's list of gpu_vmas, the ``gem_object->gpuva_lock`` mu=
st
> +not be dropped, because if it is dropped, gpu_vmas attached to a

  must not be dropped, otherwise gpu_vmas attached to a ...

> +gpu_vm_bo may disappear without notice because they are not

                                          since those are not
  reference-counted.

> +reference-counted. A driver may implement its own scheme to allow this
> +at the expense of additional complexity, and that is out of scope

                                            but this is outside the
                                            scope of this document.

> +for this document.
> +
> +In the DRM GPUVM implementation, each gpu_vm_bo and each gpu_vma
> +holds a reference count on the gpu_vm itself. Due to this, and to avoid =
circular
> +reference counting, cleanup of the gpu_vm's gpu_vmas must not be done fr=
om the
> +gpu_vm's destructor. Drivers typically implements a gpu_vm close
> +function for this cleanup.

Could we maybe detail what is supposed to happen in the VM close path?
I'm basically doing an unmap on the full VA range of the VM, but this
has extra implications, like the fact we might end up with GPU faults
if some GPU contexts were still using the VM when VM_CLOSE
(well, VM_DESTROY in my naming convention) is called. I mean, that's
fine if the GPU can gracefully recover from that (we're in that case),
but I think it's worth mentioning this constraint.

I realize this document is just about the locking, but all these tiny
pieces of information dispatched all over the place make me think
we're lacking something describing the big picture of GPU VM management
(or maybe we do have that already, in which case we should probably
point to it at the beginning of the doc).

> +
> +Revalidation and eviction of local objects
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +(Note that in all the code examples given below we use simplified
> +pseudo-code. In particular, the dma_resv deadlock avoidance algorithm
> +as well as reserving memory for dma_resv fences is left out).

I would drop the parenthesis, but it looks good otherwise.

> +
> +Revalidation
> +____________
> +With VM_BIND, all local objects need to be resident when the gpu is
> +executing using the gpu_vm, and the objects need to have valid
> +gpu_vmas set up pointing to them. Typically each gpu command buffer
> +submission is therefore preceded with a re-validation section:
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // Validation section starts here.
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           // The following list iteration needs the Gem object's
> +           // dma_resv to be held (it protects the gpu_vm_bo's list of
> +           // gpu_vmas, but since local gem objects share the gpu_vm's
> +           // dma_resv, it is already held at this point.
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_=
list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +   // Validation section ends here, and job submission starts.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence =3D gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   dma_resv_unlock(gpu_vm->resv);
> +
> +The reason for having a separate gpu_vm rebind list is that there
> +might be userptr gpu_vmas that are not mapping a buffer object that
> +also need rebinding.
> +
> +Eviction
> +________
> +
> +Eviction of one of these local objects will then look similar to the
> +following:
> +
> +.. code-block:: C
> +
> +   obj =3D get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> +           add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_list);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence =3D gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +Note that since the object is local to the gpu_vm, it will share the gpu=
_vm's
> +dma_resv lock so that ``obj->resv =3D=3D gpu_vm->resv``.

                 ^ such that ... ?

> +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict list,
> +which is protected by ``gpu_vm->resv``, that is always locked while
> +evicting, due to the above equality.

  The gpu_vm_bos marked for eviction are put on the gpu_vm's evict list,
  which is protected by ``gpu_vm->resv``, which in turn guarantees
  that all local objects have their resv locked during the iteration,
  thanks to the above equality.

> +
> +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before eviction,

Not sure what 'VM_BIND gpu_vms' means.

> +Since the driver must ensure that the eviction blit or copy will wait

   ^since

> +for GPU idle or depend on all previous GPU activity.

In general, I'm not sure what you were trying to convey with the above
sentence. I got that the MMU page table teardown can be eluded if the
VM is idle, and deferred until the GPU uses it again, but the phrasing
is a bit weird.

> Furthermore, any
> +subsequent attempt by the GPU to access freed memory through the
> +gpu_vma will be preceded by a new exec function, with a revalidation
> +section which will make sure all gpu_vmas are rebound. The eviction
> +code holding the object's dma_resv while revalidating will ensure a
> +new exec function may not race with the eviction.
> +
> +If a driver, however, is implemented in such a way that, on each exec fu=
nction,
> +only a subset of vmas are selected for rebind, then all vmas that are
> +*not* selected for rebind must be unbound at the time before the exec
> +function workload is submitted.

Okay, I think it's worth making it super clear that this is the
LAZY_UNBIND_ON_EVICTION + PARTIAL_VMA_REBIND on revalidation that's
problematic.

> +
> +Locking with external buffer objects
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Since external buffer objects may be shared by multiple gpu_vm's they
> +can't share their reservation object with a single gpu_vm, but will rath=
er
> +have a reservation object of their own. The external objects bound to a
> +gpu_vm using one or many gpu_vmas are therefore put on a
> +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock or
> +one of the :ref:`gpu_vm list spinlocks <Spinlock iteration>`. Once
> +the gpu_vm's reservation object is locked, it is safe to traverse the
> +external object list and lock the dma_resvs of all external
> +objects. However if instead a list spinlock is used, a more elaborate
> +iteration scheme needs to be used.
> +
> +At eviction time we now need to put the gpu_vm_bos of *all* the gpu_vms a

                                                                           =
^an

> +external object is bound to on their gpu_vm's evict list, but we can no =
longer
> +be certain that we hold the gpu_vm's dma_resvs of all the gpu_vms the
> +object is bound to, since at eviction time we only hold the object's

                       since, at eviction time, we ...

> +private dma_resv. If we have a ww_acquire context at hand at eviction
> +time we could grab the those dma_resvs but that could cause

                      s/the those/those/

> +expensive ww_mutex rollbacks. A simple option is to just mark the
> +gpu_vm_bos of the evicted gem object with an ``evicted`` bool that
> +is inspected before the next time the corresponding gpu_vm evicted list =
needs
> +to be traversed, when traversing the list of external objects and
> +locking them.

That's confusing. Can't we just say it's checked next time the external
object list is walked (which happens on the next EXEC), and such evicted
objects are moved to the evicted list at that point, because we hold
all the necessary locks to do the insertion?

> At the time where the evicted list is traversed, the
> +gpu_vm's dma_resv and the object's dma_resv is held, and the gpu_vm_bo
> +marked evicted, can then be added to the gpu_vm's list of evicted
> +gpu_vm_bos.

That's basically what you say here. I feel like the whole paragraph
could be simplified.

> The ``evicted`` bool is protected by the object's
> +dma_resv. Note, that if the gpu_vm's evict list is instead protected

             Note that if ...

> +by a gpu_vm list spinlock, we can grab that lock at eviction time and
> +hence don't need the trick using the ``evicted`` bool.

Do we really need this note? It seems the alternative approach is fully
described in the next section, so maybe just say that instead of
teasing how this would work here.

> +
> +The exec function becomes
> +
> +.. code-block:: C
> +
> +   dma_resv_lock(gpu_vm->resv);
> +
> +   // External object list is protected by the gpu_vm->resv lock.
> +   for_each_gpu_vm_bo_on_extobj_list(gpu_vm, &gpu_vm_bo) {
> +           dma_resv_lock(gpu_vm_bo.gem_obj->resv);
> +           if (gpu_vm_bo_marked_evicted(&gpu_vm_bo))
> +                   add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evic=
t_list);
> +   }
> +
> +   for_each_gpu_vm_bo_on_evict_list(&gpu_vm->evict_list, &gpu_vm_bo) {
> +           validate_gem_bo(&gpu_vm_bo->gem_bo);
> +
> +           for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> +                  move_gpu_vma_to_rebind_list(&gpu_vma, &gpu_vm->rebind_=
list);
> +   }
> +
> +   for_each_gpu_vma_on_rebind_list(&gpu vm->rebind_list, &gpu_vma) {
> +           rebind_gpu_vma(&gpu_vma);
> +           remove_gpu_vma_from_rebind_list(&gpu_vma);
> +   }
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   job_dma_fence =3D gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +   dma_resv_unlock_all_resv_locks();
> +
> +And the corresponding shared-object aware eviction would look like:
> +
> +.. code-block:: C
> +
> +   obj =3D get_object_from_lru();
> +
> +   dma_resv_lock(obj->resv);
> +   for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo)
> +           if (object_is_vm_local(obj))
> +                add_gpu_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm->evict_l=
ist);
> +           else
> +                mark_gpu_vm_bo_evicted(&gpu_vm_bo);
> +
> +   add_dependencies(&eviction_job, &obj->resv);
> +   job_dma_fence =3D gpu_submit(&eviction_job);
> +   add_dma_fence(&obj->resv, job_dma_fence);
> +
> +   dma_resv_unlock(&obj->resv);
> +   put_object(obj);
> +
> +.. _Spinlock iteration:
> +
> +Accessing the gpu_vm's lists without the dma_resv lock held
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Although some drivers will hold the gpu_vm's dma_resv lock when
> +accessing the gpu_vm's evict list and external objects lists, there
> +are drivers that need to access these lists without the dma_resv lock he=
ld,
> +for example due to asynchronous state updates from within the
> +dma_fence signalling critical path. In such case a spinlock can be
> +used to protect manipulation of the lists. However, since higher level
> +sleeping locks need to be taken for each list item while iterating
> +over the lists, the items already iterated over need to be
> +temporarily moved to a private list and the spinlock released
> +while processing each item:

I think it would good to clarify the fact item deletion can happen
concurrently, even if the item has been moved to our local list.

> +
> +.. code block:: C
> +
> +    struct list_head still_in_list;
> +
> +    INIT_LIST_HEAD(&still_in_list);
> +
> +    spin_lock(&gpu_vm->list_lock);
> +    do {
> +            struct list_head *entry =3D list_first_entry_or_null(&gpu_vm=
->list, head);
> +
> +            if (!entry)
> +                    break;
> +
> +            list_move_tail(&entry->head, &still_in_list);
> +            list_entry_get_unless_zero(entry);
> +            spin_unlock(&gpu_vm->list_lock);
> +
> +            process(entry);
> +
> +            spin_lock(&gpu_vm->list_lock);
> +            list_entry_put(entry);
> +    } while (true);
> +
> +    list_splice_tail(&still_in_list, &gpu_vm->list);
> +    spin_unlock(&gpu_vm->list_lock);
> +
> +Due to the additional locking and atomic operations,

Hm, I don't see any atomic operation in the pseudo-code.

> drivers that *can*
> +avoid accessing the gpu_vm's list outside of the dma_resv lock
> +might want to avoid also this iteration scheme. Particularly if the
> +driver anticipates a large number of list items. For lists where the
> +anticipated number of list items is small, where list iteration doesn't
> +happen very often or if there is a significant additional cost
> +associated with each iteration, the atomic operation overhead
> +associated with this type of iteration is, most likely, negligible. Note=
 that
> +if this scheme is used, it is necessary to make sure this list
> +iteration is protected by an outer level lock or semaphore, since list
> +items are temporarily pulled off the list while iterating.
> +
> +Please refer to the :ref:`DRM GPUVM locking section
> +<drm_gpuvm_locking>` and its internal
> +:c:func:`get_next_vm_bo_from_list` function.
> +
> +
> +userptr gpu_vmas
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A userptr gpu_vma is a gpu_vma that, instead of mapping a buffer object =
to a
> +GPU virtual address range, directly maps a CPU mm range of anonymous-
> +or file page-cache pages.
> +A very simple approach would be to just pin the pages using
> +pin_user_pages() at bind time and unpin them at unbind time, but this
> +creates a Denial-Of-Service vector since a single user-space process
> +would be able to pin down all of system memory, which is not
> +desirable. (For special use-cases and with proper accounting pinning mig=
ht
> +still be a desirable feature, though).

  For special use-cases, and assuming proper accounting, pinning might
  still be a desirable feature though.

> What we need to do in the
> +general case is to obtain a reference to the desired pages, make sure
> +we are notified using a MMU notifier just before the CPU mm unmaps the
> +pages, dirty them if they are not mapped read-only to the GPU, and
> +then drop the reference.
> +When we are notified by the MMU notifier that CPU mm is about to drop the
> +pages, we need to stop GPU access to the pages by waiting for VM idle
> +in the MMU notifier and make sure that before the next time the GPU
> +tries to access whatever is now present in the CPU mm range, we unmap
> +the old pages from the GPU page tables and repeat the process of
> +obtaining new page references. (See the :ref:`notifier example
> +<Invalidation example>` below). Note that when the core mm decides to
> +laundry pages, we get such an unmap MMU notification and can mark the
> +pages dirty again before the next GPU access. We also get similar MMU
> +notifications for NUMA accounting which the GPU driver doesn't really
> +need to care about, but so far it has proven difficult to exclude
> +certain notifications.
> +
> +Using a MMU notifier for device DMA (and other methods) is described in
> +:ref:`the pin_user_pages() documentation <mmu-notifier-registration-case=
>`.
> +
> +Now the method of obtaining struct page references using

   Now, the method ...

> +get_user_pages() unfortunately can't be used under a dma_resv lock
> +since that would violate the locking order of the dma_resv lock vs the
> +mmap_lock that is grabbed when resolving a CPU pagefault. This means
> +the gpu_vm's list of userptr gpu_vmas needs to be protected by an
> +outer lock, which in our example below is the ``gpu_vm->lock``.
> +
> +The MMU interval seqlock for a userptr gpu_vma is used in the following
> +way:
> +
> +.. code-block:: C
> +
> +   // Exclusive locking mode here is strictly needed only if there are
> +   // invalidated userptr vmas present, to avoid multiple userptr
> +   // revalidations.
> +   down_write(&gpu_vm->lock);
> +   retry:
> +
> +   // Note: mmu_interval_read_begin() blocks until there is no
> +   // invalidation notifier running anymore.
> +   seq =3D mmu_interval_read_begin(&gpu_vma->userptr_interval);
> +   if (seq !=3D gpu_vma->saved_seq) {
> +           obtain_new_page_pointers(&gpu_vma);
> +           dma_resv_lock(&gpu_vm->resv);
> +           add_gpu_vma_to_revalidate_list(&gpu_vma, &gpu_vm);
> +           dma_resv_unlock(&gpu_vm->resv);
> +           gpu_vma->saved_seq =3D seq;
> +   }
> +
> +   // The usual revalidation goes here.
> +
> +   // Final userptr sequence validation may not happen before the
> +   // submission dma_fence is added to the gpu_vm's resv, from the POW
> +   // of the MMU invalidation notifier. Hence the
> +   // userptr_notifier_lock that will make them appear atomic.
> +
> +   add_dependencies(&gpu_job, &gpu_vm->resv);
> +   down_read(&gpu_vm->userptr_notifier_lock);
> +   if (mmu_interval_read_retry(&gpu_vma->userptr_interval, gpu_vma->save=
d_seq)) {
> +          up_read(&gpu_vm->userptr_notifier_lock);
> +          goto retry;
> +   }
> +
> +   job_dma_fence =3D gpu_submit(&gpu_job));
> +
> +   add_dma_fence(job_dma_fence, &gpu_vm->resv);
> +
> +   for_each_external_obj(gpu_vm, &obj)
> +          add_dma_fence(job_dma_fence, &obj->resv);
> +
> +   dma_resv_unlock_all_resv_locks();
> +   up_read(&gpu_vm->userptr_notifier_lock);
> +   up_write(&gpu_vm->lock);
> +
> +The code between ``mmu_interval_read_begin()`` and the
> +``mmu_interval_read_retry()`` marks the read side critical section of
> +what we call the ``userptr_seqlock``. In reality the gpu_vm's userptr
> +gpu_vma list is looped through, and the check is done for *all* of its
> +userptr gpu_vmas, although we only show a single one here.
> +
> +The userptr gpu_vma MMU invalidation notifier might be called from
> +reclaim context and, again to avoid locking order violations, we can't

                  and, again, to avoid ...

> +take any dma_resv lock nor the gpu_vm->lock from within it.
> +
> +.. _Invalidation example:
> +.. code-block:: C
> +
> +  bool gpu_vma_userptr_invalidate(userptr_interval, cur_seq)
> +  {
> +          // Make sure the exec function either sees the new sequence
> +          // and backs off or we wait for the dma-fence:
> +
> +          down_write(&gpu_vm->userptr_notifier_lock);
> +          mmu_interval_set_seq(userptr_interval, cur_seq);
> +          up_write(&gpu_vm->userptr_notifier_lock);
> +
> +          // At this point, the exec function can't succeed in
> +          // submitting a new job, because cur_seq is an invalid
> +          // sequence number and will always cause a retry. When all
> +          // invalidation callbacks, the mmu notifier core will flip
> +          // the sequence number to a valid one. However we need to
> +          // stop gpu access to the old pages here.
> +
> +          dma_resv_wait_timeout(&gpu_vm->resv, DMA_RESV_USAGE_BOOKKEEP,
> +                                false, MAX_SCHEDULE_TIMEOUT);
> +          return true;
> +  }
> +
> +When this invalidation notifier returns, the GPU can no longer be
> +accessing the old pages of the userptr gpu_vma and needs to redo the
> +page-binding before a new GPU submission can succeed.
> +
> +Efficient userptr gpu_vma exec_function iteration
> +_________________________________________________
> +
> +If the gpu_vm's list of userptr gpu_vmas becomes large, it's
> +inefficient to iterate through the complete lists of userptrs on each
> +exec function to check whether each userptr gpu_vma's saved
> +sequence number is stale. A solution to this is to put all
> +*invalidated* userptr gpu_vmas on a separate gpu_vm list and
> +only those gpu_vmas on the list are actually checked on each exec

  and only check the gpu_vmas present in this list on each exec...

> +function. This list will then lend itself very-well to the spinlock
> +locking scheme that is
> +:ref:`described in the spinlock iteration section <Spinlock iteration>`,=
 since
> +in the mmu notifier, where we add the invalidated gpu_vmas to the
> +list, it's not possible to take any outer locks like the
> +``gpu_vm->lock`` or the ``gpu_vm->resv`` lock. Note that the
> +``gpu_vm->lock`` still needs to be taken while iterating to ensure the l=
ist is
> +complete, as also mentioned in that section.
> +
> +If using an invalidated userptr list like this, the retry check in the
> +exec function trivially becomes a check for invalidated list empty.
> +
> +Locking at bind and unbind time
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +At bind time, assuming a GEM object backed gpu_vma, each
> +gpu_vma needs to be associated with a gpu_vm_bo and that
> +gpu_vm_bo in turn needs to be added to the GEM object's
> +gpu_vm_bo list, and possibly to the gpu_vm's external object
> +list. This is referred to as *linking* the gpu_vma, and typically
> +requires that the ``gpu_vm->lock`` and the ``gem_object->gpuva_lock``
> +are held. When unlinking a gpu_vma the same locks should be held,
> +and that ensures that when iterating over ``gpu_vmas`, either under
> +the ``gpu_vm->resv`` or the GEM object's dma_resv, that the gpu_vmas
> +stay alive as long as the lock under which we iterate is not released. F=
or
> +userptr gpu_vmas it's similarly required that during vma destroy, the
> +outer ``gpu_vm->lock`` is held, since otherwise when iterating over
> +the invalidated userptr list as described in the previous section,
> +there is nothing keeping those userptr gpu_vmas alive.
> +
> +Locking for recoverable page-fault page-table updates
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +There are two important things we need to ensure with locking for
> +recoverable page-faults:
> +
> +* At the time we return pages back to the system / allocator for
> +  reuse, there should be no remaining GPU mappings and any GPU TLB
> +  must have been flushed.
> +* The unmapping and mapping of a gpu_vma must not race.
> +
> +Since the unmapping (or zapping) of GPU ptes is typically taking place
> +where it is hard or even impossible to take any outer level locks we
> +must either introduce a new lock that is held at both mapping and
> +unmapping time, or look at the locks we do hold at unmapping time and
> +make sure that they are held also at mapping time. For userptr
> +gpu_vmas, the ``userptr_seqlock`` is held in write mode in the mmu
> +invalidation notifier where zapping happens. Hence, if the
> +``userptr_seqlock`` as well as the ``gpu_vm->userptr_notifier_lock``
> +is held in read mode during mapping, it will not race with the
> +zapping. For GEM object backed gpu_vmas, zapping will take place under
> +the GEM object's dma_resv and ensuring that the dma_resv is held also
> +when populating the page-tables for any gpu_vma pointing to the GEM
> +object, will similarly ensure we are race-free.
> +
> +If any part of the mapping is performed asynchronously
> +under a dma-fence with these locks released, the zapping will need to
> +wait for that dma-fence to signal under the relevant lock before
> +starting to modify the page-table.
> +
> +Since modifying the
> +page-table structure in a way that frees up page-table memory
> +might also require outer level locks, the zapping of GPU ptes
> +typically focuses only on zeroing page-table or page-directory entries
> +and flushing TLB, whereas freeing of page-table memory is deferred to
> +unbind or rebind time.
> diff --git a/Documentation/gpu/implementation_guidelines.rst b/Documentat=
ion/gpu/implementation_guidelines.rst
> index 138e637dcc6b..dbccfa72f1c9 100644
> --- a/Documentation/gpu/implementation_guidelines.rst
> +++ b/Documentation/gpu/implementation_guidelines.rst
> @@ -7,3 +7,4 @@ Misc DRM driver uAPI- and feature implementation guidelin=
es
>  .. toctree::
> =20
>     drm-vm-bind-async
> +   drm-vm-bind-locking
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> index c29113a0ac30..ceb21219d52e 100644
> --- a/Documentation/gpu/rfc/xe.rst
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -123,10 +123,15 @@ Documentation should include:
> =20
>   * O(1) complexity under VM_BIND.
> =20
> +The document is now included in the drm documentation :doc:`here </gpu/d=
rm-vm-bind-async>`.
> +
>  Some parts of userptr like mmu_notifiers should become GPUVA or DRM help=
ers when
>  the second driver supporting VM_BIND+userptr appears. Details to be defi=
ned when
>  the time comes.
> =20
> +The DRM GPUVM helpers do not yet include the userptr parts, but discussi=
ons
> +about implementing them are ongoing.
> +
>  Long running compute: minimal data structure/scaffolding
>  --------------------------------------------------------
>  The generic scheduler code needs to include the handling of endless comp=
ute

