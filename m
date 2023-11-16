Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF17EE187
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E410610E5DC;
	Thu, 16 Nov 2023 13:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C5910E5DC;
 Thu, 16 Nov 2023 13:27:13 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EED876607346;
 Thu, 16 Nov 2023 13:27:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700141231;
 bh=pIxs4XAKMLoD9l+7yF9sdKD56z79VwuM2yGEc8OYUcA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S6lc9BRJKKYaEXLvj6lOE9pbQasbq+n0CnaSG69iMkCBylHCvbzqoyUw7Dd6Pg9dw
 SSkjEIzqrC4LhFwHIiNJtwlChB6YVSBdtWiBtoMLWx0rMRCqVd5UTNUYq9J85KveuN
 GHTixf62gyHraWLtuokM3grZkqbX2nfToq64xdLv9NaPgHM+kDFigrBMbHmjmxKBvM
 7wfe1y4AnPgJkh8jfBrCAdObUkxEGqx0avrmM2RadqPN8IxZBCfqBnWwUzjcVYR4Ta
 bI5bqYNbw6qyAS2KI3zFeeHisHCiW8Mr1MMIHPnH5lsdIoZVLJel/0npBbPt1QLNqs
 HVBSOrUuhHGwg==
Date: Thu, 16 Nov 2023 14:27:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Message-ID: <20231116142707.044aeec2@collabora.com>
In-Reply-To: <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
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
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Nov 2023 12:48:45 +0100
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> Hi, Boris,
>=20
> Thanks for reviewing. Some comments below:
>=20
> On Thu, 2023-11-16 at 10:48 +0100, Boris Brezillon wrote:
> > Hi Thomas,
> >=20
> > On Wed, 15 Nov 2023 13:49:37 +0100
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >  =20
> > > Add the first version of the VM_BIND locking document which is
> > > intended to be part of the xe driver upstreaming agreement.
> > >=20
> > > The document describes and discuss the locking used during exec-
> > > functions, evicton and for userptr gpu-vmas. Intention is to be
> > > using the
> > > same nomenclature as the drm-vm-bind-async.rst.
> > >=20
> > > v2:
> > > - s/gvm/gpu_vm/g (Rodrigo Vivi)
> > > - Clarify the userptr seqlock with a pointer to mm/mmu_notifier.c
> > > =C2=A0 (Rodrigo Vivi)
> > > - Adjust commit message accordingly.
> > > - Add SPDX license header.
> > >=20
> > > v3:
> > > - Large update to align with the drm_gpuvm manager locking
> > > - Add "Efficient userptr gpu_vma exec function iteration" section
> > > - Add "Locking at bind- and unbind time" section.
> > >=20
> > > v4:
> > > - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> > > - Minor style fixes and typos (Rodrigo Vivi)
> > > - Clarify situations where stale GPU mappings are occurring and how
> > > =C2=A0 access through these mappings are blocked. (Rodrigo Vivi)
> > > - Insert into the toctree in implementation_guidelines.rst
> > >=20
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> > > ---
> > > =C2=A0Documentation/gpu/drm-vm-bind-locking.rst=C2=A0=C2=A0=C2=A0=C2=
=A0 | 503
> > > ++++++++++++++++++
> > > =C2=A0.../gpu/implementation_guidelines.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A02 files changed, 504 insertions(+)
> > > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> > >=20
> > > diff --git a/Documentation/gpu/drm-vm-bind-locking.rst
> > > b/Documentation/gpu/drm-vm-bind-locking.rst
> > > new file mode 100644
> > > index 000000000000..bc701157cb34
> > > --- /dev/null
> > > +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> > > @@ -0,0 +1,503 @@
> > > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +VM_BIND locking
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +This document attempts to describe what's needed to get VM_BIND
> > > locking right,
> > > +including the userptr mmu_notifier locking and it will also
> > > discuss some
> > > +optimizations to get rid of the looping through of all userptr
> > > mappings and
> > > +external / shared object mappings that is needed in the simplest
> > > +implementation. It will also discuss some implications for
> > > faulting gpu_vms.
> > > +
> > > +Nomenclature
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +* ``Context``: GPU execution context.
> > > +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> > > +=C2=A0 meta-data. Typically one per client (DRM file-private), or one
> > > per
> > > +=C2=A0 context. =20
> >=20
> > Should we mention that it's a driver object, likely inheriting from
> > drm_gpuvm? =20
>=20
> Yes, I can try to be a bit more drm_gpuvm-centric throughout the
> document, although I want to avoid being too specific due to the
> current rapid drm_gpuvm rate of change, which might also affect this
> document. I guess I will have to commit for now to update the document
> on each gpuvm series we land...

Well, I'd suggest that the one doing changes to drm_gpuvm gets to
update this document along the way, or even better, make this
documentation part of the drm_gpuvm doc, so there's no excuse to not
update it when drm_gpuvm is extended.

> >  =20
> > > +* ``exec function``: An exec function is a function that
> > > revalidates all
> > > +=C2=A0 affected gpu_vmas, submits a GPU command batch and registers =
the
> > > +=C2=A0 dma_fence representing the GPU command's activity with all
> > > affected
> > > +=C2=A0 dma_resvs. For completeness, although not covered by this
> > > document,
> > > +=C2=A0 it's worth mentioning that an exec function may also be the
> > > +=C2=A0 revalidation worker that is used by some drivers in compute /
> > > +=C2=A0 long-running mode.
> > > +* ``local object``: A GEM object which is local to a gpu_vm.
> > > Shared gem
> > > +=C2=A0 objects also share the gpu_vm's dma_resv.
> > > +* ``shared object``: a.k.a external object: A GEM object which may
> > > be shared
> > > +=C2=A0 by multiple gpu_vms and whose backing storage may be shared w=
ith
> > > +=C2=A0 other drivers. =20
> >=20
> > Should we name that one external object and mentions it's sometimes
> > also called external object. This way it matches the name used in
> > gpuvm
> > implementation (extobj). =20
>=20
> You mean "... also called shared object"?

Yeah, sorry.

> Shure, can do that.
> >  =20
> > > +
> > > +
> > > +Locks used and locking orders
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +One of the benefits of VM_BIND is that local GEM objects share the
> > > gpu_vm's
> > > +dma_resv object and hence the dma_resv lock. So even with a huge
> > > +number of local GEM objects, only one lock is needed to make the
> > > exec
> > > +sequence atomic.
> > > +
> > > +The following locks and locking orders are used:
> > > +
> > > +* The ``gpu_vm->lock`` (optionally an rwsem). Protects how the
> > > gpu_vm is
> > > +=C2=A0 partitioned into gpu_vmas. It can also protect the gpu_vm's l=
ist
> > > of
> > > +=C2=A0 userptr gpu_vmas. With a CPU mm analogy this would correspond=
 to
> > > the
> > > +=C2=A0 mmap_lock. =20
> >=20
> > I don't see any drm_gpuvm::lock field in Danilo's latest patchset,
> > so,
> > unless I missed one version, and this lock is actually provided by
> > drm_gpuvm, I would mention this is a driver-specific lock. This
> > comment
> > applies to all the locks you describe here actually (mention which
> > ones
> > are provided by drm_gpuvm, and which ones are driver-specific). =20
>=20
> These will be needed also by gpuvm when implementing userptr vmas, so I
> can mention that drm_gpuvm is currently lacking a userptr
> implementation, so "the locks described below are to be considered
> driver-specific for now"

Sounds good.

> > > +
> > > +The reason for having a separate gpu_vm rebind list is that there
> > > +might be userptr gpu_vmas that are not mapping a buffer object
> > > that
> > > +also need rebinding.
> > > +
> > > +Eviction
> > > +________
> > > +
> > > +Eviction of one of these local objects will then look similar to
> > > the
> > > +following:
> > > +
> > > +.. code-block:: C
> > > +
> > > +=C2=A0=C2=A0 obj =3D get_object_from_lru();
> > > +
> > > +=C2=A0=C2=A0 dma_resv_lock(obj->resv);
> > > +=C2=A0=C2=A0 for_each_gpu_vm_bo_of_obj(obj, &gpu_vm_bo);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add_gpu=
_vm_bo_to_evict_list(&gpu_vm_bo, &gpu_vm- =20
> > > >evict_list); =20
> > > +
> > > +=C2=A0=C2=A0 add_dependencies(&eviction_job, &obj->resv);
> > > +=C2=A0=C2=A0 job_dma_fence =3D gpu_submit(&eviction_job); =20
> >=20
> > Could you expend a bit on what the eviction job does? On embedded
> > GPUs,
> > where there's no VRAM, we typically don't have a GPU job to teardown
> > GPU mappings. We do have an asynchronous VM_BIND queue though, so I
> > suspect the job here is an async VM_BIND job.
> >=20
> > Not asking you to add that to the doc, I'm just trying to figure out
> > how
> > this would map to the mem-reclaim logic in panthor... =20
>=20
> This would typically be the blit of data from VRAM to system,

Okay, not needed in my case then.

> but async
> jobs here may also include zapping page-tables and TLB flush in case of
> recoverable page-faults.

And that part is synchronous in panthor. Maybe the locking will force
me to make it an asynchronous VM_BIND job. I guess I'll only know when
I get to hook up the shrinker...

>=20
> >  =20
> > > +=C2=A0=C2=A0 add_dma_fence(&obj->resv, job_dma_fence);
> > > +
> > > +=C2=A0=C2=A0 dma_resv_unlock(&obj->resv);
> > > +=C2=A0=C2=A0 put_object(obj);
> > > +
> > > +Note that since the object is local to the gpu_vm, it will share
> > > the gpu_vm's
> > > +dma_resv lock so that ``obj->resv =3D=3D gpu_vm->resv``.
> > > +The gpu_vm_bos marked for eviction are put on the gpu_vm's evict
> > > list,
> > > +which is protected by ``gpu_vm->resv``, that is always locked
> > > while
> > > +evicting, due to the above equality.
> > > +
> > > +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before
> > > eviction,
> > > +Since the driver must ensure that the eviction blit or copy will
> > > wait
> > > +for GPU idle or depend on all previous GPU activity. Furthermore,
> > > any
> > > +subsequent attempt by the GPU to access freed memory through the
> > > +gpu_vma will be preceded by a new exec function, with a
> > > revalidation
> > > +section which will make sure all gpu_vmas are rebound. The
> > > eviction
> > > +code holding the object's dma_resv while revalidating will ensure
> > > a
> > > +new exec function may not race with the eviction. Note that this
> > > will
> > > +not hold true, however, if only a subsets of vmas are, due to the
> > > +driver implementation, selected for rebinding the next exec
> > > +function. =20
> >=20
> > This last sentence is hard to follow.
> >=20
> > "
> > Note that this will not hold true if only a subset of vmas
> > are selected for rebinding during the next exec call (for instance,
> > due
> > to some driver decision to only partially restore VMAs).
> > "
> >  =20
> > > Then all vmas *not* selected for rebinding needs to be
> > > +properly unbound before re-enabling GPU access to the VM. =20
> >=20
> > I think I get the problem, but can we have a use case where partial
> > VMA restoration is useful? I mean, if some VMAs are not needed, we
> > might be able to save MMU page table allocation/setup-time, but given
> > the mess it then is to track those non-live VMAs, I'm wondering if
> > it's
> > leaving the door open for that, unless there's a good reason to do
> > it. =20
>=20
> This is the use-case Christian has been flagging for for OpenGL and
> Media where he warns that the single-vm-memory-overcommit case would
> otherwise make the app crawl.

IIUC, the partial VMA restore is about not restoring all VMAs attached
to a vm_bo, but as soon as you restore one, this makes the BO resident,
so all you're saving here is the extra page table for non-restored VMAs.
I don't think that would significantly help the overcommit use case,
unless you have so many VMAs attached to a single vm_bo that the
amount of extra page tables becomes non-negligible compared to the BO
size itself.

What would really help the overcommit use case is not restoring all
evicted BOs, if some of them are known to be in a range that's not
accessed by a GPU job. In that situation, you can decide to leave
vm_bos in the evicted list if none of their VMAs overlap any of the VM
ranges used by a job.

>=20
> Generalized one might want to think of these as groups of (or perhaps
> virtual ranges of) vmas that need to be resident for a single job
> submission. Currently we assume the residency-group <-> vm mapping is
> 1:1, allowing for the unbind-before-eviction to be ignored, but I
> figure moving forward and addressing performance problems of real-world
> applications that may not always be true.

Maybe I don't understand what unbind-before-eviction means. To me it's
the operation of tearing down all VM mappings (unbind) before returning
BO pages to the system (evict). I don't see a situation where the
eviction of a BO doesn't imply killing all VM mapping pointing to this
BO.

>=20
> >  =20
> > > +
> > > +
> > > +Locking with external (or shared) buffer objects
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > > +
> > > +Since shared buffer objects may be shared by multiple gpu_vm's
> > > they
> > > +can't share their reservation object with a single gpu_vm, but
> > > will rather
> > > +have a reservation object of their own. The shared objects bound
> > > to a
> > > +gpu_vm using one or many gpu_vmas are therefore typically put on a
> > > +per-gpu_vm list which is protected by the gpu_vm's dma_resv lock.
> > > Once
> > > +the gpu_vm's reservation object=C2=A0 is locked, it is safe to trave=
rse
> > > the =20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^ extra space
> >  =20
> > > +external object list and lock the dma_resvs of all external
> > > objects.
> > > +
> > > +At eviction time we now need to put the gpu_vm_bos of *all*
> > > gpu_vms a
> > > +shared object is bound to on the gpu_vm's evict list, but we can
> > > no longer
> > > +be certain that we hold the gpu_vm's dma_resv of all the gpu_vms
> > > the
> > > +object is bound to, since at eviction time we only hold the
> > > object's
> > > +private dma_resv. If we have a ww_acquire context at hand at
> > > eviction
> > > +time we could grab the those dma_resvs but that could cause
> > > +expensive ww_mutex rollbacks. A simple option is to just mark the
> > > +gpu_vm_bos of the evicted gem object with an ``evicted`` bool that
> > > +is inspected the next time the corresponding gpu_vm evicted list
> > > needs
> > > +to be traversed. =20
> >=20
> > IIUC, the vm_bo is not added to the evicted list immediately in that
> > case, so I suspect you meant the next time the corresponding gpu_vm
> > *extobj* list needs to be traversed. =20
>=20
> I like to think of the concept as "lock and validate the list before
> traversing it" and you're right in this case, the validation occurs
> slightly before we actually start looking at the evicted list. But I
> could perhaps rephrase to "...bool that is inspected *before* the next
> time..."

My point was, you detect such evicted vm_bos when iterating the
extobj list, not the evicted list, because the vm_bo won't be in the
evicted list until you've walked extobj and inserted evicted vm_bos the
the evicted list. Even with your rephrasing, it sounds like those are
detected by iterating the evicted list. How about

"
A simple option is to just mark the gpu_vm_bos of the evicted gem
object with an ``evicted`` bool. Those gpu_vm_bos will be moved to
the evicted list next time the extobj list is inspected for vm_bo
revalidation.
"
