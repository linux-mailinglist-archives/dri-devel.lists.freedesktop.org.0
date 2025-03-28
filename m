Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0161A74CA6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D083D10EA3D;
	Fri, 28 Mar 2025 14:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YznXDqnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9477910EA3D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743172232;
 bh=Pa96e8x79k/UMA45sSO0Bm2NraLbKIDuYXr3lSgQH5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YznXDqnmYZl1otjkO/Iehi5cwrsAJ9It7NFNaLuGTZUpPeMku1ZEtuCna6N5Ej3SK
 F0ElI5zBn9Ia7Z1ZnsGo5v2IEltEbug6HkdAtptuMXULOhHAZLaBRZ6Fl8EP1X4pj3
 gzCZdOn754IUG/L6Oe7oJzAyIHdgyTZKxyMG8khucXDhYOKN/ty3izSSWG0fuF5CUI
 u4v5LZ2WueYPxJ3BJoqNj3jYDc50Df76kDDyn7DolyP5rIZdVOeXTL4gFf6LRn97xS
 HV5o0Fo2o2LpTKJYTnbPpt3ztqaiyGsH2QzKiAXMYNpyWgykcagLT9+n0Dgp5EEJM/
 GsHU8TdNeVFpA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 815AF17E09D6;
 Fri, 28 Mar 2025 15:30:31 +0100 (CET)
Date: Fri, 28 Mar 2025 15:30:27 +0100
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
Subject: Re: [PATCH v3 3/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250328153027.2c0641f1@collabora.com>
In-Reply-To: <20250327140845.105962-4-adrian.larumbe@collabora.com>
References: <20250327140845.105962-1-adrian.larumbe@collabora.com>
 <20250327140845.105962-4-adrian.larumbe@collabora.com>
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

On Thu, 27 Mar 2025 14:08:36 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Add a device DebugFS file that displays a complete list of all the DRM GEM
> objects that are exposed to UM through a DRM handle.
>=20
> Since leaking object identifiers that might belong to a different NS is
> inadmissible, this functionality is only made available in debug builds
> with DEBUGFS support enabled.
>=20
> File format is that of a table, with each entry displaying a variety of
> fields with information about each GEM object.
>=20
> Each GEM object entry in the file displays the following information
> fields: Client PID, BO's global name, reference count, BO virtual size, BO
> resize size, VM address in its DRM-managed range, BO label and a flag
> bitmask.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |   5 +
>  drivers/gpu/drm/panthor/panthor_device.h |  11 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  26 +++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 130 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h    |  29 +++++
>  5 files changed, 201 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index a9da1d1eeb70..bae1a74d7111 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -263,6 +263,11 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	drmm_mutex_init(&ptdev->base, &ptdev->gems.lock);
> +	INIT_LIST_HEAD(&ptdev->gems.node);
> +#endif
> +
>  	ret =3D drm_dev_register(&ptdev->base, 0);
>  	if (ret)
>  		goto err_disable_autosuspend;
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
> index 488d17466494..0ba68a51b4ef 100644
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
> index 7d017f9d1d52..fbf560920194 100644
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
> @@ -13,11 +14,49 @@
>  #include "panthor_gem.h"
>  #include "panthor_mmu.h"
> =20
> +#ifdef CONFIG_DEBUG_FS
> +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> +{
> +	INIT_LIST_HEAD(&bo->gems.node);
> +	bo->gems.creator.tgid =3D current->group_leader->pid;
> +	get_task_comm(bo->gems.creator.process_name, current->group_leader);
> +}
> +
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev =3D  container_of(bo->base.base.dev,
> +						     struct panthor_device, base);
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_add_tail(&bo->gems.node, &ptdev->gems.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +
> +static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> +{
> +	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> +						    struct panthor_device, base);
> +
> +	if (list_empty(&bo->gems.node))
> +		return;
> +
> +	mutex_lock(&ptdev->gems.lock);
> +	list_del_init(&bo->gems.node);
> +	mutex_unlock(&ptdev->gems.lock);
> +}
> +#else
> +static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> +static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
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
> @@ -206,6 +245,8 @@ struct drm_gem_object *panthor_gem_create_object(stru=
ct drm_device *ddev, size_t
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>  	mutex_init(&obj->label.lock);
> =20
> +	panthor_gem_debugfs_bo_init(obj);
> +
>  	return &obj->base.base;
>  }
> =20
> @@ -254,6 +295,8 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
> =20
> +	panthor_gem_debugfs_bo_add(bo);

As mentioned in the other thread, I'd be tempted to:

- merge panthor_gem_debugfs_bo_init() into panthor_gem_debugfs_bo_add()
- call panthor_gem_debugfs_bo_add() from panthor_gem_create_object()
- have a way to differentiates kernel and user BOs.

> +
>  	return ret;
>  }
> =20
> @@ -285,3 +328,90 @@ panthor_gem_kernel_bo_set_label(struct panthor_kerne=
l_bo *bo, const char *label)
> =20
>  	panthor_gem_bo_set_label(bo->obj, kstrdup_const(str, GFP_KERNEL));
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +static bool panfrost_gem_print_flag(const char *name,
> +				    bool is_set,
> +				    bool other_flags_printed,
> +				    struct seq_file *m)
> +{
> +	if (is_set)
> +		seq_printf(m, "%s%s", other_flags_printed ? "," : "", name);
> +
> +	return is_set | other_flags_printed;
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
> +	bool has_flags =3D false;
> +	size_t resident_size;
> +
> +	/* Skip BOs being destroyed. */
> +	if (!refcount)
> +		return;
> +
> +	resident_size =3D bo->base.pages !=3D NULL ? bo->base.base.size : 0;
> +
> +	snprintf(creator_info, sizeof(creator_info),
> +		 "%s/%d", bo->gems.creator.process_name, bo->gems.creator.tgid);
> +	seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
> +		   creator_info,
> +		   bo->base.base.name,
> +		   refcount,
> +		   bo->base.base.size,
> +		   resident_size,
> +		   drm_vma_node_start(&bo->base.base.vma_node));
> +
> +	seq_puts(m, "(");
> +	has_flags =3D panfrost_gem_print_flag("imported", bo->base.base.import_=
attach !=3D NULL,
> +					    has_flags, m);
> +	has_flags =3D panfrost_gem_print_flag("exported", bo->base.base.dma_buf=
 !=3D NULL,
> +					    has_flags, m);
> +	if (bo->base.madv < 0)
> +		has_flags =3D panfrost_gem_print_flag("purged", true, has_flags, m);
> +	else if (bo->base.madv > 0)
> +		has_flags =3D panfrost_gem_print_flag("purgeable", true, has_flags, m);
> +	if (!has_flags)
> +		seq_puts(m, "none");
> +	seq_puts(m, ")");
> +
> +	mutex_lock(&bo->label.lock);
> +	seq_printf(m, "%-16s%-60s", "", bo->label.str ? : NULL);
> +	mutex_unlock(&bo->label.lock);
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
      size            resident-size   file-offset     flags           label=
\n");
> +	seq_puts(m, "----------------------------------------------------------=
---------------------------------------------------------------------------=
-----------\n");
> +
> +	scoped_guard(mutex, &ptdev->gems.lock) {
> +		list_for_each_entry(bo, &ptdev->gems.node, gems.node)
> +			panthor_gem_debugfs_bo_print(bo, m, &totals);
> +	}
> +
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
\n");
> +	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable:=
 %zd\n",
> +		   totals.size, totals.resident, totals.reclaimable);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 0582826b341a..7c896ec35801 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -13,6 +13,26 @@
> =20
>  struct panthor_vm;
> =20
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

Add a

	bool kernel_only;

to reflect the fact the BO can't be accessed by the UMD.

> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
> @@ -60,6 +80,10 @@ struct panthor_gem_object {
>  		/** @lock.str: Protects access to the @label.str field. */
>  		struct mutex lock;
>  	} label;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_gem_debugfs gems;

s/gems/debugfs/

> +#endif
>  };
> =20
>  /**
> @@ -155,4 +179,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_gem_debugfs_print_bos(struct panthor_device *pfdev,
> +				   struct seq_file *m);
> +#endif
> +
>  #endif /* __PANTHOR_GEM_H__ */

