Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F1B063F1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 18:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E7110E605;
	Tue, 15 Jul 2025 16:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="V1tAqhh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9338310E220;
 Tue, 15 Jul 2025 16:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752595791; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hMs7rt7fwq+deDxTzWHHM3KT0wjYvXYpEyLXErVtqJpZByfdvAMw7V1VVB5pEKEHl3/BVPZwmf4jxB6zp27lNJIoGEJbD4ia5GRUyjlY87OeOC5IKg/fVkK+YPF/FNj0tgUiNIH13Ld4o1dw23uVHKOIvqmkM6ifXo7PcrQPbn4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752595791;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+iqEtKvkAwh73uSzqqVRBHWDYwSTps8oog7d+PjLOco=; 
 b=aSchnzNXDzXjkIAi/3eqxWGOOlA4RMn9TAQPz+1L/0a0WfGyHzbFCEot/8+3weCexGlJ8LT38k/y3i/bwMMW1TQgRYI0VCeozG1xjpDFCkwqfvFbWYxTGkUGk3nev3ijHAUpiIetzZg9fJSjFdR7DMcawG7b3sY+ATMWNjspLY0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
 dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752595791; 
 s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=+iqEtKvkAwh73uSzqqVRBHWDYwSTps8oog7d+PjLOco=;
 b=V1tAqhh/7RUMYodkc/f4IIDF+gaxetp7oGlc2rJtffpIdPTcuZpBGif+C9FtdyN+
 ggMPdUJvCwb2fIRvTc9TNa5je9BEiuxMUrNYgjt8nk9z1sPmrwGCyAzHJdfnVnUeJBx
 jhVoZ4xEVio+aJZLo5jGa0PiXgkPgsp6rdVAKPV4=
Received: by mx.zohomail.com with SMTPS id 175259578890092.61537384124972;
 Tue, 15 Jul 2025 09:09:48 -0700 (PDT)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v4 1/7] drm/panthor: Add support for atomic page table
 updates
Date: Tue, 15 Jul 2025 18:09:42 +0200
Message-ID: <2150426.BFZWjSADLM@xps>
In-Reply-To: <2813151.QOukoFCf94@xps>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <d4a6208b-a4a4-451f-9799-7b9f5fb20c37@arm.com> <2813151.QOukoFCf94@xps>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

El martes, 15 de julio de 2025 17:08:09 (hora de verano de Europa central),=
=20
Caterina Shablia escribi=C3=B3:
> El viernes, 11 de julio de 2025 15:30:21 (hora de verano de Europa centra=
l),
> Steven Price escribi=C3=B3:
> > On 07/07/2025 18:04, Caterina Shablia wrote:
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > >=20
> > > Move the lock/flush_mem operations around the gpuvm_sm_map() calls so
> > > we can implement true atomic page updates, where any access in the
> > > locked range done by the GPU has to wait for the page table updates
> > > to land before proceeding.
> > >=20
> > > This is needed for vkQueueBindSparse(), so we can replace the dummy
> > > page mapped over the entire object by actual BO backed pages in an
> > > atomic
> > > way.
> > >=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/panthor/panthor_mmu.c | 65 +++++++++++++++++++++++++=
=2D-
> > >  1 file changed, 62 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > b/drivers/gpu/drm/panthor/panthor_mmu.c index b39ea6acc6a9..9caaba03c=
5eb
> > > 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -387,6 +387,15 @@ struct panthor_vm {
> > >=20
> > >  	 * flagged as faulty as a result.
> > >  	 */
> > >  =09
> > >  	bool unhandled_fault;
> > >=20
> > > +
> > > +	/** @locked_region: Information about the currently locked region
> > > currently. */ +	struct {
> > > +		/** @locked_region.start: Start of the locked region.
>=20
> */
>=20
> > > +		u64 start;
> > > +
> > > +		/** @locked_region.size: Size of the locked region. */
> > > +		u64 size;
> > > +	} locked_region;
> > >=20
> > >  };
> > > =20
> > >  /**
> > >=20
> > > @@ -775,6 +784,10 @@ int panthor_vm_active(struct panthor_vm *vm)
> > >=20
> > >  	}
> > >  =09
> > >  	ret =3D panthor_mmu_as_enable(vm->ptdev, vm->as.id, transtab,
>=20
> transcfg,
>=20
> > >  	vm->memattr);>
> > >=20
> > > +	if (!ret && vm->locked_region.size) {
> > > +		lock_region(ptdev, vm->as.id, vm->locked_region.start,
> > > vm->locked_region.size); +		ret =3D wait_ready(ptdev, vm-
> >
> >as.id);
> >
> > > +	}
> >=20
> > Do we need to do this? It seems odd to restore a MMU context and
> > immediately set a lock region. Is there a good reason we can't just
> > WARN_ON if there's a lock region set in panthor_vm_idle()?
>=20
> So IIUC, when things are otherwise idle and we do a vm_bind, the vm will =
be
> inactive, in which case we're not going to poke the mmu to inform it of t=
he
> locked region, because it literally is not aware of this vm. Now if in the
> meanwhile something submits a job and activates the vm, we need to inform
> the mmu of the locked region, as vm_bind job might still be going on. I
> don't see why panthor_vm_idle while a region is locked would be a problem?
> That can arise e.g. when a job completes but there's a concurrent vm_bind
> going on?
> > I think we need to briefly take vm->op_lock to ensure synchronisation
> > but that doesn't seem a big issue. Or perhaps there's a good reason that
> > I'm missing?
>=20
> I think you're right, all other accesses to locked_region are guarded by
> op_lock. GPU job submit poke vm_active concurrently with vm_bind jobs doi=
ng
> region {,un}locks.
>=20
> > >  out_make_active:
> > >  	if (!ret) {
> > >=20
> > > @@ -902,6 +915,9 @@ static int panthor_vm_unmap_pages(struct panthor_=
vm
> > > *vm, u64 iova, u64 size)>
> > >=20
> > >  	struct io_pgtable_ops *ops =3D vm->pgtbl_ops;
> > >  	u64 offset =3D 0;
> > >=20
> > > +	drm_WARN_ON(&ptdev->base,
> > > +		    (iova < vm->locked_region.start) ||
> > > +		    (iova + size > vm->locked_region.start + vm-
> >
> >locked_region.size));
> >
> > >  	drm_dbg(&ptdev->base, "unmap: as=3D%d, iova=3D%llx, len=3D%llx", vm-
> >
> >as.id,
> >
> > >  	iova, size);
> > >  =09
> > >  	while (offset < size) {
> > >=20
> > > @@ -915,13 +931,12 @@ static int panthor_vm_unmap_pages(struct
> > > panthor_vm
> > > *vm, u64 iova, u64 size)>
> > >=20
> > >  				iova + offset + unmapped_sz,
> > >  				iova + offset + pgsize * pgcount,
> > >  				iova, iova + size);
> > >=20
> > > -			panthor_vm_flush_range(vm, iova, offset +
>=20
> unmapped_sz);
>=20
> > >  			return  -EINVAL;
> > >  	=09
> > >  		}
> > >  		offset +=3D unmapped_sz;
> > >  =09
> > >  	}
> > >=20
> > > -	return panthor_vm_flush_range(vm, iova, size);
> > > +	return 0;
> > >=20
> > >  }
> > > =20
> > >  static int
> > >=20
> > > @@ -938,6 +953,10 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64
> > > iova,
> > > int prot,>
> > >=20
> > >  	if (!size)
> > >  =09
> > >  		return 0;
> > >=20
> > > +	drm_WARN_ON(&ptdev->base,
> > > +		    (iova < vm->locked_region.start) ||
> > > +		    (iova + size > vm->locked_region.start + vm-
> >
> >locked_region.size));
> >
> > > +
> > >=20
> > >  	for_each_sgtable_dma_sg(sgt, sgl, count) {
> > >  =09
> > >  		dma_addr_t paddr =3D sg_dma_address(sgl);
> > >  		size_t len =3D sg_dma_len(sgl);
> > >=20
> > > @@ -985,7 +1004,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64
> > > iova,
> > > int prot,>
> > >=20
> > >  		offset =3D 0;
> > >  =09
> > >  	}
> > >=20
> > > -	return panthor_vm_flush_range(vm, start_iova, iova - start_iova);
> > > +	return 0;
> > >=20
> > >  }
> > > =20
> > >  static int flags_to_prot(u32 flags)
> > >=20
> > > @@ -1654,6 +1673,38 @@ static const char *access_type_name(struct
> > > panthor_device *ptdev,>
> > >=20
> > >  	}
> > > =20
> > >  }
> > >=20
> > > +static int panthor_vm_lock_region(struct panthor_vm *vm, u64 start, =
u64
> > > size) +{
> > > +	struct panthor_device *ptdev =3D vm->ptdev;
> > > +	int ret =3D 0;
> > > +
> > > +	mutex_lock(&ptdev->mmu->as.slots_lock);
> > > +	drm_WARN_ON(&ptdev->base, vm->locked_region.start ||
> > > vm->locked_region.size); +	vm->locked_region.start =3D start;
> > > +	vm->locked_region.size =3D size;
> > > +	if (vm->as.id >=3D 0) {
> > > +		lock_region(ptdev, vm->as.id, start, size);
> > > +		ret =3D wait_ready(ptdev, vm->as.id);
> > > +	}
> > > +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void panthor_vm_unlock_region(struct panthor_vm *vm)
> > > +{
> > > +	struct panthor_device *ptdev =3D vm->ptdev;
> > > +
> > > +	mutex_lock(&ptdev->mmu->as.slots_lock);
> > > +	if (vm->as.id >=3D 0) {
> > > +		write_cmd(ptdev, vm->as.id, AS_COMMAND_FLUSH_MEM);
> > > +		drm_WARN_ON(&ptdev->base, wait_ready(ptdev, vm-
> >
> >as.id));
> >
> > > +	}
> > > +	vm->locked_region.start =3D 0;
> > > +	vm->locked_region.size =3D 0;
> > > +	mutex_unlock(&ptdev->mmu->as.slots_lock);
> > > +}
> >=20
> > Do we need to include a drm_dev_enter() somewhere here? I note that
> > panthor_vm_flush_range() has one and you've effectively replaced that
> > code with the above.
>=20
> Looks like we should.
Actually not sure. I think I'm either misunderstanding what drm_dev_enter i=
s,=20
or there's other things that should be doing it. Notably=20
panthor_mmu_as_{en,dis}able or their callers aren't doing drm_dev_enter, ye=
t=20
are poking the hw, so that seems to me like that code also runs the risk of=
=20
poking the hw while/after it was unplugged, but I'm not confident in my=20
understanding at all. I guess an extra drm_dev_enter here or there isn't go=
ing=20
to harm anyone as it's recurrent so I'll put one around the call to=20
lock_region in panthor_vm_lock_region as well.
>=20
> > Thanks,
> > Steve
> >=20
> > > +
> > >=20
> > >  static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32
> > >  status) {
> > > =20
> > >  	bool has_unhandled_faults =3D false;
> > >=20
> > > @@ -2179,6 +2230,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, stru=
ct
> > > panthor_vm_op_ctx *op,>
> > >=20
> > >  	mutex_lock(&vm->op_lock);
> > >  	vm->op_ctx =3D op;
> > >=20
> > > +
> > > +	ret =3D panthor_vm_lock_region(vm, op->va.addr, op->va.range);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > >=20
> > >  	switch (op_type) {
> > >  =09
> > >  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP:
> > >  		if (vm->unusable) {
> > >=20
> > > @@ -2199,6 +2255,9 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct
> > > panthor_vm_op_ctx *op,>
> > >=20
> > >  		break;
> > >  =09
> > >  	}
> > >=20
> > > +	panthor_vm_unlock_region(vm);
> > > +
> > >=20
> > > +out:
> > >  	if (ret && flag_vm_unusable_on_failure)
> > >  =09
> > >  		vm->unusable =3D true;




