Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4D7EE33F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 15:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F0110E60B;
	Thu, 16 Nov 2023 14:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C510E60B;
 Thu, 16 Nov 2023 14:47:14 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C4EA2660734C;
 Thu, 16 Nov 2023 14:47:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700146032;
 bh=ANLNJfWhLmya72L/lYatmTv2SBWTBnT/H2OPpKUbXQY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YjOYFEKfPK0ZrxtaGuBEK55kgHsjxZwJy8CJZCXuT7zTHrKHGRVLMNSf3slBAWh52
 v07Pq53UOV7+0sTVu3b4AUzCoLt2eUgB9lG05p4AuRcNXlY/hIqI95Zdi5r7zTGXwm
 JdQse41KSkeW02ZEVThhPltnXgYRZcykuQtT0hZD1tVSZW9yHiNssyYXhEFRgD4+ap
 vFKvPbtFrYq/mvX0T55l4Gjws8EI1Wvhl8ctwSYYVjwKE99VEsK5uwOibpYHDdboc1
 hxxEG7dnP865u3AlxKw4hCIMhFhyXiN5RuN3X1d32CfMEi9fWzTKYTFbUxH3eUVSbc
 ygjmUpaP2r4RA==
Date: Thu, 16 Nov 2023 15:47:08 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
Message-ID: <20231116154708.148ce241@collabora.com>
In-Reply-To: <656d5f890de7ba3af05616122a9bd399badd35bc.camel@linux.intel.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <20231116104851.114bdb08@collabora.com>
 <0850281b667c4b88163dab60737dbc945ad742fd.camel@linux.intel.com>
 <20231116142707.044aeec2@collabora.com>
 <656d5f890de7ba3af05616122a9bd399badd35bc.camel@linux.intel.com>
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

On Thu, 16 Nov 2023 14:53:50 +0100
Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:

> On Thu, 2023-11-16 at 14:27 +0100, Boris Brezillon wrote:
> > On Thu, 16 Nov 2023 12:48:45 +0100
> > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> >  =20
> > > Hi, Boris,
> > >=20
> > > Thanks for reviewing. Some comments below:
> > >=20
> > > On Thu, 2023-11-16 at 10:48 +0100, Boris Brezillon wrote: =20
> > > > Hi Thomas,
> > > >=20
> > > > On Wed, 15 Nov 2023 13:49:37 +0100
> > > > Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com> wrote:
> > > > =C2=A0  =20
> > > > > Add the first version of the VM_BIND locking document which is
> > > > > intended to be part of the xe driver upstreaming agreement.
> > > > >=20
> > > > > The document describes and discuss the locking used during
> > > > > exec-
> > > > > functions, evicton and for userptr gpu-vmas. Intention is to be
> > > > > using the
> > > > > same nomenclature as the drm-vm-bind-async.rst.
> > > > >=20
> > > > > v2:
> > > > > - s/gvm/gpu_vm/g (Rodrigo Vivi)
> > > > > - Clarify the userptr seqlock with a pointer to
> > > > > mm/mmu_notifier.c
> > > > > =C2=A0 (Rodrigo Vivi)
> > > > > - Adjust commit message accordingly.
> > > > > - Add SPDX license header.
> > > > >=20
> > > > > v3:
> > > > > - Large update to align with the drm_gpuvm manager locking
> > > > > - Add "Efficient userptr gpu_vma exec function iteration"
> > > > > section
> > > > > - Add "Locking at bind- and unbind time" section.
> > > > >=20
> > > > > v4:
> > > > > - Fix tabs vs space errors by untabifying (Rodrigo Vivi)
> > > > > - Minor style fixes and typos (Rodrigo Vivi)
> > > > > - Clarify situations where stale GPU mappings are occurring and
> > > > > how
> > > > > =C2=A0 access through these mappings are blocked. (Rodrigo Vivi)
> > > > > - Insert into the toctree in implementation_guidelines.rst
> > > > >=20
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > > > <thomas.hellstrom@linux.intel.com>
> > > > > ---
> > > > > =C2=A0Documentation/gpu/drm-vm-bind-locking.rst=C2=A0=C2=A0=C2=A0=
=C2=A0 | 503
> > > > > ++++++++++++++++++
> > > > > =C2=A0.../gpu/implementation_guidelines.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > > =C2=A02 files changed, 504 insertions(+)
> > > > > =C2=A0create mode 100644 Documentation/gpu/drm-vm-bind-locking.rst
> > > > >=20
> > > > > diff --git a/Documentation/gpu/drm-vm-bind-locking.rst
> > > > > b/Documentation/gpu/drm-vm-bind-locking.rst
> > > > > new file mode 100644
> > > > > index 000000000000..bc701157cb34
> > > > > --- /dev/null
> > > > > +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> > > > > @@ -0,0 +1,503 @@
> > > > > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +VM_BIND locking
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +This document attempts to describe what's needed to get
> > > > > VM_BIND
> > > > > locking right,
> > > > > +including the userptr mmu_notifier locking and it will also
> > > > > discuss some
> > > > > +optimizations to get rid of the looping through of all userptr
> > > > > mappings and
> > > > > +external / shared object mappings that is needed in the
> > > > > simplest
> > > > > +implementation. It will also discuss some implications for
> > > > > faulting gpu_vms.
> > > > > +
> > > > > +Nomenclature
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +* ``Context``: GPU execution context.
> > > > > +* ``gpu_vm``: Abstraction of a virtual GPU address space with
> > > > > +=C2=A0 meta-data. Typically one per client (DRM file-private), or
> > > > > one
> > > > > per
> > > > > +=C2=A0 context.=C2=A0  =20
> > > >=20
> > > > Should we mention that it's a driver object, likely inheriting
> > > > from
> > > > drm_gpuvm?=C2=A0  =20
> > >=20
> > > Yes, I can try to be a bit more drm_gpuvm-centric throughout the
> > > document, although I want to avoid being too specific due to the
> > > current rapid drm_gpuvm rate of change, which might also affect
> > > this
> > > document. I guess I will have to commit for now to update the
> > > document
> > > on each gpuvm series we land... =20
> >=20
> > Well, I'd suggest that the one doing changes to drm_gpuvm gets to
> > update this document along the way, or even better, make this
> > documentation part of the drm_gpuvm doc, so there's no excuse to not
> > update it when drm_gpuvm is extended. =20
>=20
> Sure, Although I think initial merge will be as is, and then merging
> with drm_gpuvm will come at a later point.

Sure, I have no problem with that.

> > >  =20
> > > > =C2=A0  =20
> > > > > +=C2=A0=C2=A0 add_dma_fence(&obj->resv, job_dma_fence);
> > > > > +
> > > > > +=C2=A0=C2=A0 dma_resv_unlock(&obj->resv);
> > > > > +=C2=A0=C2=A0 put_object(obj);
> > > > > +
> > > > > +Note that since the object is local to the gpu_vm, it will
> > > > > share
> > > > > the gpu_vm's
> > > > > +dma_resv lock so that ``obj->resv =3D=3D gpu_vm->resv``.
> > > > > +The gpu_vm_bos marked for eviction are put on the gpu_vm's
> > > > > evict
> > > > > list,
> > > > > +which is protected by ``gpu_vm->resv``, that is always locked
> > > > > while
> > > > > +evicting, due to the above equality.
> > > > > +
> > > > > +For VM_BIND gpu_vms, gpu_vmas don't need to be unbound before
> > > > > eviction,
> > > > > +Since the driver must ensure that the eviction blit or copy
> > > > > will
> > > > > wait
> > > > > +for GPU idle or depend on all previous GPU activity.
> > > > > Furthermore,
> > > > > any
> > > > > +subsequent attempt by the GPU to access freed memory through
> > > > > the
> > > > > +gpu_vma will be preceded by a new exec function, with a
> > > > > revalidation
> > > > > +section which will make sure all gpu_vmas are rebound. The
> > > > > eviction
> > > > > +code holding the object's dma_resv while revalidating will
> > > > > ensure
> > > > > a
> > > > > +new exec function may not race with the eviction. Note that
> > > > > this
> > > > > will
> > > > > +not hold true, however, if only a subsets of vmas are, due to
> > > > > the
> > > > > +driver implementation, selected for rebinding the next exec
> > > > > +function.=C2=A0  =20
> > > >=20
> > > > This last sentence is hard to follow.
> > > >=20
> > > > "
> > > > Note that this will not hold true if only a subset of vmas
> > > > are selected for rebinding during the next exec call (for
> > > > instance,
> > > > due
> > > > to some driver decision to only partially restore VMAs).
> > > > "
> > > > =C2=A0  =20
> > > > > Then all vmas *not* selected for rebinding needs to be
> > > > > +properly unbound before re-enabling GPU access to the VM.=C2=A0 =
 =20
> > > >=20
> > > > I think I get the problem, but can we have a use case where
> > > > partial
> > > > VMA restoration is useful? I mean, if some VMAs are not needed,
> > > > we
> > > > might be able to save MMU page table allocation/setup-time, but
> > > > given
> > > > the mess it then is to track those non-live VMAs, I'm wondering
> > > > if
> > > > it's
> > > > leaving the door open for that, unless there's a good reason to
> > > > do
> > > > it.=C2=A0  =20
> > >=20
> > > This is the use-case Christian has been flagging for for OpenGL and
> > > Media where he warns that the single-vm-memory-overcommit case
> > > would
> > > otherwise make the app crawl. =20
> >=20
> > IIUC, the partial VMA restore is about not restoring all VMAs
> > attached
> > to a vm_bo, but as soon as you restore one, this makes the BO
> > resident,
> > so all you're saving here is the extra page table for non-restored
> > VMAs.
> > I don't think that would significantly help the overcommit use case,
> > unless you have so many VMAs attached to a single vm_bo that the
> > amount of extra page tables becomes non-negligible compared to the BO
> > size itself.
> >=20
> > What would really help the overcommit use case is not restoring all
> > evicted BOs, if some of them are known to be in a range that's not
> > accessed by a GPU job. In that situation, you can decide to leave
> > vm_bos in the evicted list if none of their VMAs overlap any of the
> > VM
> > ranges used by a job. =20
>=20
> Yes this section here is the key: The vmas belonging to evicted bos not
> restored would be the ones not "selected for rebind".

Okay, but then I don't see the problem if you leave such vm_bos in the
evicted list. Those will still be considered for 'rebind' next time the
evicted list is walked (basically on the next exec), right?

>=20
> >  =20
> > >=20
> > > Generalized one might want to think of these as groups of (or
> > > perhaps
> > > virtual ranges of) vmas that need to be resident for a single job
> > > submission. Currently we assume the residency-group <-> vm mapping
> > > is
> > > 1:1, allowing for the unbind-before-eviction to be ignored, but I
> > > figure moving forward and addressing performance problems of real-
> > > world
> > > applications that may not always be true. =20
> >=20
> > Maybe I don't understand what unbind-before-eviction means. To me
> > it's
> > the operation of tearing down all VM mappings (unbind) before
> > returning
> > BO pages to the system (evict). I don't see a situation where the
> > eviction of a BO doesn't imply killing all VM mapping pointing to
> > this
> > BO. =20
>=20
> It's the point of teardown that matters here. You can return the pages
> to system without tearing down the GPU mappings, as long as you tear
> them down before there are any GPU activity on that vm again. In xe we
> tear down the old mappings as part of the rebind process after we've
> validated the evicted bo again, (but before submitting the GPU job).=C2=A0
> The point is the stale mappings can be left as long as there is no gpu
> job accessing them.

I see. As long as you're sure the VM is completely inactive, and that
such mappings are destroyed before the VM is used again, that's fine I
guess. Might be worth a detailed explanation about the different
scenarios though.

