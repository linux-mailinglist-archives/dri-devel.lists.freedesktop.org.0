Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB77A81E7F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 09:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBECA10E7D3;
	Wed,  9 Apr 2025 07:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="V+4cgHPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8AC10E7D3
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 07:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744184642;
 bh=kyNEcvYqmxzy9XeJsxmVp4AjvyT02rLIN9TG0cgY6k8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V+4cgHPaniv/RjehN8rEfqtdTmmf8plgQ2cpi9xHPie8Vfia02ssEA9l3WmP4Es9S
 sus484GTcy6MpWnSyZ+2/xNgqeP9s8T67fbdf7hw63rxiQPa8L/KFNGwUAV3URi/84
 qRAWuPTdel2HwjLp0CC4oiq5SN7AAEi+1p4Faveja/z3fOdWWzo1n/AtBoaJuL2UGS
 xZQuksMi463KSFhTB8Pv4yIxbcOWORWAm690r0LHBewisnrATyc5n8HO9bmj+zDhgC
 NQmr5syqULkFrnC9eKztOsIeo8riLM9pMQjZXivJ4V7QqgZUm/r91N8+LA2471HXPv
 uBPljzp7kcM5Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 64B3517E07F3;
 Wed,  9 Apr 2025 09:44:02 +0200 (CEST)
Date: Wed, 9 Apr 2025 09:43:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 4/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250409094358.79f5d1f6@collabora.com>
In-Reply-To: <20250408222427.1214330-5-adrian.larumbe@collabora.com>
References: <20250408222427.1214330-1-adrian.larumbe@collabora.com>
 <20250408222427.1214330-5-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  8 Apr 2025 23:24:24 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a device DebugFS file that displays a complete list of all the DRM
> GEM objects that are exposed to UM through a DRM handle.
>=20
> Since leaking object identifiers that might belong to a different NS is
> inadmissible, this functionality is only made available in debug builds
> with DEBUGFS support enabled.
>=20
> File format is that of a table, with each entry displaying a variety of
> fields with information about each GEM object.
>=20
> Each GEM object entry in the file displays the following information
> fields: Client PID, BO's global name, reference count, BO virtual size,
> BO resize size, VM address in its DRM-managed range, BO label and a GEM
> state flags.
>=20
> There's also a kflags field for the type of BO, which tells us whether
> it's a kernel BO and/or mapped onto the FW's address space.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_device.h |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 168 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h    |  65 +++++++++
>  5 files changed, 275 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index a9da1d1eeb70..b776e1a2e4f3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -184,6 +184,11 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	drmm_mutex_init(&ptdev->base, &ptdev->gems.lock);
> +	INIT_LIST_HEAD(&ptdev->gems.node);
> +#endif
> +
>  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>  	p =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
>  	if (!p)
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index da6574021664..86206a961b38 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -205,6 +205,17 @@ struct panthor_device {
> =20
>  	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
>  	unsigned long fast_rate;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/** @gems: Device-wide list of GEM objects owned by at least one file. =
*/
> +	struct {
> +		/** @gems.lock: Protects the device-wide list of GEM objects. */
> +		struct mutex lock;
> +
> +		/** @node: Used to keep track of all the device's DRM objects */
> +		struct list_head node;
> +	} gems;
> +#endif
>  };
> =20
>  struct panthor_gpu_usage {
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 163c027562aa..935ca9e6138e 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1534,9 +1534,35 @@ static const struct file_operations panthor_drm_dr=
iver_fops =3D {
>  };
> =20
>  #ifdef CONFIG_DEBUG_FS
> +static int panthor_gems_show(struct seq_file *m, void *data)
> +{
> +	struct drm_info_node *node =3D m->private;
> +	struct drm_device *dev =3D node->minor->dev;
> +	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> +
> +	panthor_gem_debugfs_print_bos(ptdev, m);
> +
> +	return 0;
> +}
> +
> +
> +static struct drm_info_list panthor_debugfs_list[] =3D {
> +	{"gems", panthor_gems_show, 0, NULL},
> +};
> +
> +static int panthor_gems_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(panthor_debugfs_list,
> +				 ARRAY_SIZE(panthor_debugfs_list),
> +				 minor->debugfs_root, minor);
> +
> +	return 0;
> +}
> +
>  static void panthor_debugfs_init(struct drm_minor *minor)
>  {
>  	panthor_mmu_debugfs_init(minor);
> +	panthor_gems_debugfs_init(minor);
>  }
>  #endif
> =20
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 742192c42f58..439f2ae4e6bb 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -2,6 +2,7 @@
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>  /* Copyright 2023 Collabora ltd. */
> =20
> +#include <linux/cleanup.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> @@ -10,14 +11,51 @@
>  #include <drm/panthor_drm.h>
> =20
>  #include "panthor_device.h"
> +#include "panthor_fw.h"
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
> =20
> +#ifdef CONFIG_DEBUG_FS
> +static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> +				       struct panthor_gem_object *bo)
> +{
> +	INIT_LIST_HEAD(&bo->debugfs.node);
> +
> +	bo->debugfs.creator.tgid =3D current->group_leader->pid;
> +	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_add_tail(&bo->debugfs.node, &ptdev->gems.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +
> +static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> +						    struct panthor_device, base);
> +
> +	if (list_empty(&bo->debugfs.node))
> +		return;
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_del_init(&bo->debugfs.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +
> +#else
> +static void panthor_gem_debugfs_bo_add(struct panthor_device *ptdev,
> +				       struct panthor_gem_object *bo)
> +{}
> +static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
> +#endif
> +
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
>  {
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem =3D bo->exclusive_vm_root_gem;
> =20
> +	panthor_gem_debugfs_bo_rm(bo);
> +
>  	/*
>  	 * Label might have been allocated with kstrdup_const(),
>  	 * we need to take that into account when freeing the memory
> @@ -86,6 +124,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev,=
 struct panthor_vm *vm,
>  	struct drm_gem_shmem_object *obj;
>  	struct panthor_kernel_bo *kbo;
>  	struct panthor_gem_object *bo;
> +	u32 debug_flags =3D PANTHOR_DEBUGFS_BO_FLAGS_KERNEL;
>  	int ret;
> =20
>  	if (drm_WARN_ON(&ptdev->base, !vm))
> @@ -105,7 +144,11 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
>  	kbo->obj =3D &obj->base;
>  	bo->flags =3D bo_flags;
> =20
> +	if (vm =3D=3D panthor_fw_vm(ptdev))
> +		debug_flags |=3D PANTHOR_DEBUGFS_BO_FW_FLAG_MAPPED;
> +
>  	panthor_gem_kernel_bo_set_label(kbo, name);
> +	panthor_gem_debugfs_bo_set_mask(to_panthor_bo(kbo->obj), debug_flags);
> =20
>  	/* The system and GPU MMU page size might differ, which becomes a
>  	 * problem for FW sections that need to be mapped at explicit address
> @@ -208,6 +251,8 @@ struct drm_gem_object *panthor_gem_create_object(stru=
ct drm_device *ddev, size_t
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>  	mutex_init(&obj->label.lock);
> =20
> +	panthor_gem_debugfs_bo_add(ptdev, obj);
> +
>  	return &obj->base.base;
>  }
> =20
> @@ -256,6 +301,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
> =20
> +	panthor_gem_debugfs_bo_set_mask(bo, 0);

Can we add a comment to explain why we need to
explicitly set the flags to zero (panthor_gem_debugfs_bo_set_mask()
also implicitly sets the INITIALIZED bit).

> +
>  	return ret;
>  }
> =20
> @@ -287,3 +334,124 @@ panthor_gem_kernel_bo_set_label(struct panthor_kern=
el_bo *bo, const char *label)
> =20
>  	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +static void
> +panthor_gem_debugfs_print_flags(struct seq_file *m,
> +				const char *names[],
> +				u32 name_count,
> +				u32 flags)
> +{
> +	bool first =3D true;
> +
> +	seq_puts(m, "(");
> +
> +	if (!flags)
> +		seq_puts(m, "none");
> +
> +	while (flags) {
> +		u32 bit =3D fls(flags) - 1;
> +
> +		if (!first)
> +			seq_puts(m, ",");
> +
> +		if (bit >=3D name_count || !names[bit])
> +			seq_printf(m, "unknown-bit%d", bit);
> +		else
> +			seq_printf(m, "%s", names[bit]);
> +
> +		first =3D false;
> +		flags &=3D ~BIT(bit);
> +	}
> +
> +	seq_puts(m, ")");
> +}
> +
> +struct gem_size_totals {
> +	size_t size;
> +	size_t resident;
> +	size_t reclaimable;
> +};
> +
> +static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
> +					 struct seq_file *m,
> +					 struct gem_size_totals *totals)
> +{
> +	unsigned int refcount =3D kref_read(&bo->base.base.refcount);
> +	char creator_info[32] =3D {};
> +	u32 gem_state_flags =3D 0;
> +	size_t resident_size;
> +
> +	static const char *gem_status_flags[] =3D {
> +		"imported", "exported", "purged", "purgeable"
> +	};

Let's be explicit about the index -> string mapping so we don't
rely on flags being properly ordered and consecutive:

	static const char *gem_status_flags[] =3D {
		[PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPORTED] =3D "imported",
		...
	}

> +
> +	static const char *panthor_bo_flags[] =3D {
> +		"kernel", "fw"
> +	};

Ditto.

> +
> +	/* Skip BOs being destroyed. */
> +	if (!refcount)
> +		return;
> +
> +	resident_size =3D bo->base.pages !=3D NULL ? bo->base.base.size : 0;
> +
> +	snprintf(creator_info, sizeof(creator_info),
> +		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
> +	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
> +		   creator_info,
> +		   bo->base.base.name,
> +		   refcount,
> +		   bo->base.base.size,
> +		   resident_size,
> +		   drm_vma_node_start(&bo->base.base.vma_node));
> +
> +
> +	if (bo->base.base.import_attach !=3D NULL)
> +		gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_IMPORTED;
> +	if (bo->base.base.dma_buf !=3D NULL)
> +		gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_EXPORTED;
> +	if (bo->base.madv < 0)
> +		gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_PURGED;
> +	if (bo->base.madv)

Either
	else if (bo->base.madv)
or
	if (bo->base.madv > 0)

otherwise a BO can be flagged as both purged and purgeable, which
doesn't seem right.

> +		gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_PURGEABLE;

BTW, we're not implementing the MADVISE ioctl() and probably never
will be (we are going for a transparent mem reclaim mechanism where
the user doesn't have to flag unused BOs), so I'm questioning
the need for these state flags. It would make sense in panfrost,
but not here, at least not until someone comes with a real use case
for MADVISE.

> +
> +	panthor_gem_debugfs_print_flags(m, gem_status_flags,
> +					sizeof(gem_status_flags), gem_state_flags);

					ARRAY_SIZE(gem_status_flags)

> +	seq_printf(m, "%-4s", "");
> +	panthor_gem_debugfs_print_flags(m, panthor_bo_flags, sizeof(panthor_bo_=
flags),

Ditto, sizeof -> ARRAY_SIZE.

> +					bo->debugfs.flags & (u32)~PANTHOR_DEBUGFS_BO_FLAG_INITIALISED);
> +
> +	mutex_lock(&bo->label.lock);
> +	seq_printf(m, "%-6s%-60s", "", bo->label.str ? : NULL);

What's the point of testing for NULL if you pass NULL eventually?
I guess it was supposed to be

	seq_printf(m, "%-6s%-60s", "", bo->label.str ? : "");

> +	mutex_unlock(&bo->label.lock);

Looks like a good candidate for a

	scoped_guard(mutex, &bo->label.lock) {
		seq_printf(m, "%-6s%-60s", "", bo->label.str ? : "");
	}

> +	seq_puts(m, "\n");
> +
> +	totals->size +=3D bo->base.base.size;
> +	totals->resident +=3D resident_size;
> +	if (bo->base.madv > 0)
> +		totals->reclaimable +=3D resident_size;
> +}
> +
> +void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> +				   struct seq_file *m)
> +{
> +	struct gem_size_totals totals =3D {0};
> +	struct panthor_gem_object *bo;
> +
> +	seq_puts(m, "created-by                      global-name     refcount  =
      size            resident-size   file-offset     state     kflags     =
label\n");

																		^usage (see below)

> +	seq_puts(m, "----------------------------------------------------------=
---------------------------------------------------------------------------=
-----------\n");
> +
> +	scoped_guard(mutex, &ptdev->gems.lock) {
> +		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> +			if (bo->debugfs.flags & PANTHOR_DEBUGFS_BO_FLAG_INITIALISED)
> +				panthor_gem_debugfs_bo_print(bo, m, &totals);
> +		}
> +
> +	}
> +
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable:=
 %zd\n",
> +		   totals.size, totals.resident, totals.reclaimable);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 49daa5088a0d..58575f38ee26 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -15,6 +15,54 @@ struct panthor_vm;
> =20
>  #define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
> =20
> +enum panthor_debugfs_gem_state_flags {
> +	/** @PANTHOR_DEBUGFS_GEM_IMPORTED: GEM BO is PRIME imported. */
> +	PANTHOR_DEBUGFS_GEM_IMPORTED =3D BIT(0),

Let's prefix it with PANTHOR_DEBUGFS_GEM_STATE_ instead of
PANTHOR_DEBUGFS_GEM_.

> +
> +	/** @PANTHOR_DEBUGFS_GEM_EXPORTED: GEM BO is PRIME exported. */
> +	PANTHOR_DEBUGFS_GEM_EXPORTED =3D BIT(1),
> +
> +	/** @PANTHOR_DEBUGFS_GEM_PURGED: GEM BO was reclaimed by the shrinker. =
*/
> +	PANTHOR_DEBUGFS_GEM_PURGED =3D BIT(2),
> +
> +	/** @PANTHOR_DEBUGFS_GEM_PURGEABLE: GEM BO can be reclaimed by the shri=
nker. */
> +	PANTHOR_DEBUGFS_GEM_PURGEABLE =3D BIT(3),
> +};
> +
> +enum panthor_debugfs_bo_flags {

BOs and GEMs are the essentially the same thing, so let's try to use
_gem_ to keep the naming consistent and find another discriminant for
these flags. Since they seem to encode how the GEM is used (or by whom
it's used), I would go for
s/panthor_debugfs_bo_flags/panthor_debugfs_gem_usage_flags/

> +	/** @PANTHOR_DEBUGFS_BO_KERNEL: BO is for kernel use only. */
> +	PANTHOR_DEBUGFS_BO_FLAGS_KERNEL =3D BIT(0),

s/PANTHOR_DEBUGFS_BO_FLAGS_KERNEL/PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL/

> +
> +	/** @PANTHOR_DEBUGFS_BO_FW_MAPPED: BO is mapped on the FW VM. */
> +	PANTHOR_DEBUGFS_BO_FW_FLAG_MAPPED =3D BIT(1),

s/PANTHOR_DEBUGFS_BO_FW_FLAG_MAPPED/PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPE=
D/

> +
> +	/** @PANTHOR_DEBUGFS_BO_INITIALISED: BO is ready for DebugFS display. */
> +	PANTHOR_DEBUGFS_BO_FLAG_INITIALISED =3D BIT(31),

s/PANTHOR_DEBUGFS_BO_FLAG_INITIALISED/PANTHOR_DEBUGFS_GEM_USAGE_FLAG_INITIA=
LIZED/

I know both initialized and initialised are correct, but

# git grep INITIALIZED | wc -l
885

# git grep INITIALISED | wc -l
17

so I'd be tempted to go for the American spelling here :-).

> +};
> +
> +/**
> + * struct panthor_gem_debugfs - GEM object's DebugFS list information
> + */
> +struct panthor_gem_debugfs {
> +	/**
> +	 * @node: Node used to insert the object in the device-wide list of
> +	 * GEM objects, to display information about it through a DebugFS file.
> +	 */
> +	struct list_head node;
> +
> +	/** @creator: Information about the UM process which created the GEM. */
> +	struct {
> +		/** @creator.process_name: Group leader name in owning thread's proces=
s */
> +		char process_name[TASK_COMM_LEN];
> +
> +		/** @creator.tgid: PID of the thread's group leader within its process=
 */
> +		pid_t tgid;
> +	} creator;
> +
> +	/** @bo_mask: Combination of panthor_debugfs_bo_flags flags */
> +	u32 flags;
> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> @@ -62,6 +110,10 @@ struct panthor_gem_object {
>  		/** @lock.str: Protects access to the @label.str field. */
>  		struct mutex lock;
>  	} label;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_gem_debugfs debugfs;
> +#endif
>  };
> =20
>  /**
> @@ -157,4 +209,17 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
> +				   struct seq_file *m);
> +static inline void
> +panthor_gem_debugfs_bo_set_mask(struct panthor_gem_object *bo, u32 type_=
mask)
> +{
> +	bo->debugfs.flags =3D type_mask | PANTHOR_DEBUGFS_BO_FLAG_INITIALISED;
> +}
> +
> +#else
> +void panthor_gem_debugfs_bo_set_mask(struct panthor_gem_object *bo, u32 =
type_mask) {};
> +#endif
> +
>  #endif /* __PANTHOR_GEM_H__ */

