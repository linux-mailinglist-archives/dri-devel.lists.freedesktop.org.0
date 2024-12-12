Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAAB9EE1CF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFEB10ED00;
	Thu, 12 Dec 2024 08:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0AOowCu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B5010ED00;
 Thu, 12 Dec 2024 08:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733993371; x=1765529371;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=nc0EXFS466VP4d7lMSVjOKJedH2T3ksIlkvVX9BTgFY=;
 b=U0AOowCux+wIAThINoIv61BooynjralI9LAKQeEIyGyjvGCeXG/IqLh0
 zr1ydHVab+JNuGH4/GRBTb+9nCLlI6O5SHG2NwdKTWLpnzh9WM/9gIee7
 awuStEub7lljtAsfP8980yOJtO2JhA6OsM5vh60YrYAZleYTfwutz94fa
 72cGOyA6lEsJ+a6hwb6eeFfBAb0fNixePNk9tU+HXNwUTK0hCLtfOiP+4
 0BPPkvitEk3cjkQO02GiGVhADGD5NoWLdjQbWgx6qpGCo3hbPBDsCyfAD
 UplYoKDUyMo241+I2eR5AbkpL3a0+wlYSN5C6THakDhZAV+r+0joAO2j/ Q==;
X-CSE-ConnectionGUID: w32SRpduRraAq9iYfwz0WA==
X-CSE-MsgGUID: hTKMVOoTTq6L1Oe13Y0Xig==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45409993"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45409993"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:49:31 -0800
X-CSE-ConnectionGUID: o+iOPzLvSBy235m+9YbFuQ==
X-CSE-MsgGUID: CwnmZe5CQrW0Geei23RsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96589486"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.75])
 ([10.245.246.75])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 00:49:27 -0800
Message-ID: <3c1cc9403eb50bc8c532d180f766eb7a429e8913.camel@linux.intel.com>
Subject: Re: [PATCH 14/26] drm/xe/eudebug: implement userptr_vma access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Mika
 Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org,
 lkml	 <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Date: Thu, 12 Dec 2024 09:49:24 +0100
In-Reply-To: <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
 <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <ec42fe8b-9be0-41cc-96f4-f1869c6bb7e6@amd.com>
 <Z1cNQTvGdAUPp4Y-@phenom.ffwll.local>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-12-09 at 16:31 +0100, Simona Vetter wrote:
> On Mon, Dec 09, 2024 at 03:03:04PM +0100, Christian K=C3=B6nig wrote:
> > Am 09.12.24 um 14:33 schrieb Mika Kuoppala:
> > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > >=20
> > > Debugger needs to read/write program's vmas including
> > > userptr_vma.
> > > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > > to map those vmas from debugger context.
> >=20
> > Oh, this implementation is extremely questionable as well. Adding
> > the LKML
> > and the MM list as well.
> >=20
> > First of all hmm_range_fault() does *not* pin anything!
> >=20
> > In other words you don't have a page reference when the function
> > returns,
> > but rather just a sequence number you can check for modifications.
>=20
> I think it's all there, holds the invalidation lock during the
> critical
> access/section, drops it when reacquiring pages, retries until it
> works.
>=20
> I think the issue is more that everyone hand-rolls userptr. Probably
> time
> we standardize that and put it into gpuvm as an optional part, with
> consistent locking, naming (like not calling it _pin_pages when it's
> unpinnged userptr), kerneldoc and all the nice things so that we
> stop consistently getting confused by other driver's userptr code.
>=20
> I think that was on the plan originally as an eventual step, I guess
> time
> to pump that up. Matt/Thomas, thoughts?

It looks like we have this planned and ongoing but there are some
complications and thoughts.

1) A drm_gpuvm implementation would be based on vma userptrs, and would
be pretty straightforward based on xe's current implementation and, as
you say, renaming.

2) Current Intel work to land this on the drm level is based on
drm_gpusvm (minus migration to VRAM). I'm not fully sure yet how this
will integrate with drm_gpuvm.

3) Christian mentioned a plan to have a common userptr implementation
based off drm_exec. I figure that would be bo-based like the amdgpu
implemeentation still is. Possibly i915 would be interested in this but
I think any VM_BIND based driver would want to use drm_gpuvm /
drm_gpusvm implementation, which is also typically O(1), since userptrs
are considered vm-local.

Ideas / suggestions welcome

> -Sima
>=20
> >=20
> > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > v3: - iterate over system pages instead of DMA, fixes iommu
> > > enabled
> > > =C2=A0=C2=A0=C2=A0=C2=A0 - s/xe_uvma_access/xe_vm_uvma_access/ (Matt)
> > >=20
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v1
> > > ---
> > > =C2=A0 drivers/gpu/drm/xe/xe_eudebug.c |=C2=A0 3 ++-
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 47
> > > +++++++++++++++++++++++++++++++++
> > > =C2=A0 drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +++
> > > =C2=A0 3 files changed, 52 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c
> > > b/drivers/gpu/drm/xe/xe_eudebug.c
> > > index 9d87df75348b..e5949e4dcad8 100644
> > > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > > @@ -3076,7 +3076,8 @@ static int xe_eudebug_vma_access(struct
> > > xe_vma *vma, u64 offset_in_vma,
> > > =C2=A0=C2=A0		return ret;
> > > =C2=A0=C2=A0	}
> > > -	return -EINVAL;
> > > +	return xe_vm_userptr_access(to_userptr_vma(vma),
> > > offset_in_vma,
> > > +				=C2=A0=C2=A0=C2=A0 buf, bytes, write);
> > > =C2=A0 }
> > > =C2=A0 static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 0f17bc8b627b..224ff9e16941 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -3414,3 +3414,50 @@ void xe_vm_snapshot_free(struct
> > > xe_vm_snapshot *snap)
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	kvfree(snap);
> > > =C2=A0 }
> > > +
> > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > offset,
> > > +			 void *buf, u64 len, bool write)
> > > +{
> > > +	struct xe_vm *vm =3D xe_vma_vm(&uvma->vma);
> > > +	struct xe_userptr *up =3D &uvma->userptr;
> > > +	struct xe_res_cursor cur =3D {};
> > > +	int cur_len, ret =3D 0;
> > > +
> > > +	while (true) {
> > > +		down_read(&vm->userptr.notifier_lock);
> > > +		if (!xe_vma_userptr_check_repin(uvma))
> > > +			break;
> > > +
> > > +		spin_lock(&vm->userptr.invalidated_lock);
> > > +		list_del_init(&uvma->userptr.invalidate_link);
> > > +		spin_unlock(&vm->userptr.invalidated_lock);
> > > +
> > > +		up_read(&vm->userptr.notifier_lock);
> > > +		ret =3D xe_vma_userptr_pin_pages(uvma);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (!up->sg) {
> > > +		ret =3D -EINVAL;
> > > +		goto out_unlock_notifier;
> > > +	}
> > > +
> > > +	for (xe_res_first_sg_system(up->sg, offset, len, &cur);
> > > cur.remaining;
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 xe_res_next(&cur, cur_len)) {
> > > +		void *ptr =3D kmap_local_page(sg_page(cur.sgl)) +
> > > cur.start;
> >=20
> > The interface basically creates a side channel to access userptrs
> > in the way
> > an userspace application would do without actually going through
> > userspace.
> >=20
> > That is generally not something a device driver should ever do as
> > far as I
> > can see.
> >=20
> > > +
> > > +		cur_len =3D min(cur.size, cur.remaining);
> > > +		if (write)
> > > +			memcpy(ptr, buf, cur_len);
> > > +		else
> > > +			memcpy(buf, ptr, cur_len);
> > > +		kunmap_local(ptr);
> > > +		buf +=3D cur_len;
> > > +	}
> > > +	ret =3D len;
> > > +
> > > +out_unlock_notifier:
> > > +	up_read(&vm->userptr.notifier_lock);
> >=20
> > I just strongly hope that this will prevent the mapping from
> > changing.
> >=20
> > Regards,
> > Christian.
> >=20
> > > +	return ret;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.h
> > > b/drivers/gpu/drm/xe/xe_vm.h
> > > index 23adb7442881..372ad40ad67f 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > > @@ -280,3 +280,6 @@ struct xe_vm_snapshot
> > > *xe_vm_snapshot_capture(struct xe_vm *vm);
> > > =C2=A0 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot
> > > *snap);
> > > =C2=A0 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct
> > > drm_printer *p);
> > > =C2=A0 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > > +
> > > +int xe_vm_userptr_access(struct xe_userptr_vma *uvma, u64
> > > offset,
> > > +			 void *buf, u64 len, bool write);
> >=20
>=20

