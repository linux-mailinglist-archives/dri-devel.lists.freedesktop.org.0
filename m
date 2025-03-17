Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B307A64554
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCC610E3C0;
	Mon, 17 Mar 2025 08:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="graNFns2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1710E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742199982;
 bh=VGurj73sbEsOe8vORjuKEJfMZaChuXR5898uD65O33o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=graNFns2FMKsxT6eAjlonp3YFAOpSXSHjtBi9wxZwz6XU4sKJGtSi0DQJJW7L1/XP
 DcTTQHAexTQSUucyfIZ7k3FQwQL3qPtHZGHH2uEJh/OKEpLkgbZolwTnWLKvOuNdmV
 kA+8vL8FONncRlO7oa6pqJtgt6yx5DuDjn6eQJZCEktgW+i9YxVgurm7YrqxbvrdFb
 JTY9l1X0Nos3Hluz7b+2gLkBWFXKhx54vIBn+uUkuu4D5cinHvLjyKfCEQfuiZwc4O
 ughupjiaCYEfhGz3VaKPrg40Rf5OKMiK/RG7TL/Pyq5dSmERp7yoORP7bnSwh2B+x4
 d+gkkGvPFI2VA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E590517E0FE5;
 Mon, 17 Mar 2025 09:26:21 +0100 (CET)
Date: Mon, 17 Mar 2025 09:26:14 +0100
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
Subject: Re: [PATCH 3/4] drm/panthor: show device-wide list of DRM GEM
 objects over DebugFS
Message-ID: <20250317092614.55b3c4e9@collabora.com>
In-Reply-To: <20250316215139.3940623-4-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
 <20250316215139.3940623-4-adrian.larumbe@collabora.com>
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

On Sun, 16 Mar 2025 21:51:34 +0000
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
>  drivers/gpu/drm/panthor/panthor_device.c |   5 ++
>  drivers/gpu/drm/panthor/panthor_device.h |   8 ++
>  drivers/gpu/drm/panthor/panthor_drv.c    |  26 ++++++
>  drivers/gpu/drm/panthor/panthor_gem.c    | 101 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_gem.h    |  22 +++++
>  5 files changed, 162 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index a9da1d1eeb70..7df12eefc39f 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -263,6 +263,11 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	drmm_mutex_init(&ptdev->base, &ptdev->gems_lock);
> +	INIT_LIST_HEAD(&ptdev->gems);
> +#endif
> +
>  	ret =3D drm_dev_register(&ptdev->base, 0);
>  	if (ret)
>  		goto err_disable_autosuspend;
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index da6574021664..6c030978cdc3 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -205,6 +205,14 @@ struct panthor_device {
> =20
>  	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
>  	unsigned long fast_rate;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/** @gems_lock: Protects the device-wide list of GEM objects. */
> +	struct mutex gems_lock;
> +
> +	/** @gems: Device-wide list of GEM objects owned by at least one file. =
*/
> +	struct list_head gems;

	struct {
		struct mutex lock;
		struct list_head list;
	} gems;

> +#endif
>  };
> =20
>  struct panthor_gpu_usage {
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index f41b8946258f..6663eff44bdc 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1525,9 +1525,35 @@ static const struct file_operations panthor_drm_dr=
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
> +	panthor_gem_print_objects(ptdev, m);
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
> index 3c58bb2965ea..8cea6caf3143 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -17,6 +17,16 @@ static void panthor_gem_free_object(struct drm_gem_obj=
ect *obj)
>  {
>  	struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>  	struct drm_gem_object *vm_root_gem =3D bo->exclusive_vm_root_gem;
> +#ifdef CONFIG_DEBUG_FS
> +	struct drm_device *dev =3D bo->base.base.dev;
> +	struct panthor_device *ptdev =3D container_of(dev, struct panthor_devic=
e, base);
> +
> +	if (!list_empty(&bo->gems_node)) {
> +		mutex_lock(&ptdev->gems_lock);
> +		list_del_init(&bo->gems_node);
> +		mutex_unlock(&ptdev->gems_lock);
> +	}
> +#endif

Can we add helpers to add/remove a GEM to the list and define dummy
implementations for the !CONFIG_DEBUG_FS case?

#ifdef CONFIG_DEBUG_FS
static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
{
	INIT_LIST_HEAD(&obj->gems_node);
	obj->creator.tgid =3D current->group_leader->pid;
	get_task_comm(obj->creator.process_name, current->group_leader);
}

static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
{
	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
						    struct panthor_device, base);

	mutex_lock(&ptdev->gems_lock);
	list_add_tail(&bo->gems_node, &ptdev->gems);
	mutex_unlock(&ptdev->gems_lock);
}

static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
{
	struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
						    struct panthor_device, base);
=09
	if (list_empty(&bo->gems_node))
		return;

	mutex_lock(&ptdev->gems_lock);
	list_del_init(&bo->gems_node);
	mutex_unlock(&ptdev->gems_lock);
}
#else
static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
#endif

> =20
>  	kfree(bo->label);
>  	mutex_destroy(&bo->label_lock);
> @@ -201,6 +211,12 @@ struct drm_gem_object *panthor_gem_create_object(str=
uct drm_device *ddev, size_t
>  	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
>  	mutex_init(&obj->label_lock);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	INIT_LIST_HEAD(&obj->gems_node);
> +	obj->creator.tgid =3D current->group_leader->pid;
> +	get_task_comm(obj->creator.process_name, current->group_leader);
> +#endif

	panthor_gem_debugfs_bo_init(obj);
=09
> +
>  	return &obj->base.base;
>  }
> =20
> @@ -224,6 +240,10 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	int ret;
>  	struct drm_gem_shmem_object *shmem;
>  	struct panthor_gem_object *bo;
> +#ifdef CONFIG_DEBUG_FS
> +	struct panthor_device *ptdev =3D
> +		container_of(ddev, struct panthor_device, base);
> +#endif
> =20
>  	shmem =3D drm_gem_shmem_create(ddev, *size);
>  	if (IS_ERR(shmem))
> @@ -249,6 +269,12 @@ panthor_gem_create_with_handle(struct drm_file *file,
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +	mutex_lock(&ptdev->gems_lock);
> +	list_add_tail(&bo->gems_node, &ptdev->gems);
> +	mutex_unlock(&ptdev->gems_lock);
> +#endif

	panthor_gem_debugfs_bo_rm(bo);

> +
>  	return ret;
>  }
> =20
> @@ -265,3 +291,78 @@ panthor_gem_label_bo(struct drm_gem_object *obj, con=
st char *label)
> =20
>  	kfree(old_label);
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
> +void panthor_gem_print_objects(struct panthor_device *ptdev,
> +				struct seq_file *m)
> +{
> +	size_t total =3D 0, total_resident =3D 0, total_reclaimable =3D 0;
> +	struct panthor_gem_object *bo;
> +
> +	seq_puts(m, "created-by                      global-name     refcount  =
      size            resident-size   file-offset     flags           label=
\n");
> +	seq_puts(m, "----------------------------------------------------------=
---------------------------------------------------------------------------=
-----------\n");
> +
> +	mutex_lock(&ptdev->gems_lock);
> +	list_for_each_entry(bo, &ptdev->gems, gems_node) {
> +		unsigned int refcount =3D kref_read(&bo->base.base.refcount);
> +		char creator_info[32] =3D {};
> +		bool has_flags =3D false;
> +		size_t resident_size;
> +
> +		/* Skip BOs being destroyed. */
> +		if (!refcount)
> +			continue;
> +
> +		resident_size =3D bo->base.pages !=3D NULL ? bo->base.base.size : 0;
> +
> +		snprintf(creator_info, sizeof(creator_info),
> +			 "%s/%d", bo->creator.process_name, bo->creator.tgid);
> +		seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd%-16lx",
> +			   creator_info,
> +			   bo->base.base.name,
> +			   refcount,
> +			   bo->base.base.size,
> +			   resident_size,
> +			   drm_vma_node_start(&bo->base.base.vma_node));
> +
> +		seq_puts(m, "(");
> +		has_flags =3D panfrost_gem_print_flag("imported", bo->base.base.import=
_attach !=3D NULL,
> +						    has_flags, m);
> +		has_flags =3D panfrost_gem_print_flag("exported", bo->base.base.dma_bu=
f !=3D NULL,
> +						    has_flags, m);
> +		if (bo->base.madv < 0)
> +			has_flags =3D panfrost_gem_print_flag("purged", true, has_flags, m);
> +		else if (bo->base.madv > 0)
> +			has_flags =3D panfrost_gem_print_flag("purgeable", true, has_flags, m=
);
> +		if (!has_flags)
> +			seq_puts(m, "none");
> +		seq_puts(m, ")");
> +
> +		mutex_lock(&bo->label_lock);
> +		seq_printf(m, "%-16s%-60s", "", bo->label ? : NULL);
> +		mutex_unlock(&bo->label_lock);
> +		seq_puts(m, "\n");

Let's have a panthor_gem_debugfs_bo_print() helper to print a single BO.

> +
> +		total +=3D bo->base.base.size;
> +		total_resident +=3D resident_size;
> +		if (bo->base.madv > 0)
> +			total_reclaimable +=3D resident_size;
> +	}
> +	mutex_unlock(&ptdev->gems_lock);
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
> +		   total, total_resident, total_reclaimable);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index da9268d24566..c0be30434b34 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -55,6 +55,23 @@ struct panthor_gem_object {
> =20
>  	/** @label_lock: Lock that protects access to the @label field. */
>  	struct mutex label_lock;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	/**
> +	 * @gems_node: Node used to insert the object in the device-wide list of
> +	 * GEM objects, to display information about it through a DebugFS file.
> +	 */
> +	struct list_head gems_node;
> +
> +	/** @creator: Information about the UM process which created the GEM. */
> +	struct {
> +		/** @process_name: Group leader name in owning thread's process */
> +		char process_name[TASK_COMM_LEN];
> +
> +		/** @tgid: PID of the thread's group leader within its process */
> +		pid_t tgid;
> +	} creator;

Can we put all these fields under a debugfs struct?

struct panthor_gem_debugfs {
	/**
	 * @gems_node: Node used to insert the object in the device-wide list of
	 * GEM objects, to display information about it through a DebugFS file.
	 */
	struct list_head gems_node;

	/** @creator: Information about the UM process which created the GEM. */
	struct {
		/** @process_name: Group leader name in owning thread's process */
		char process_name[TASK_COMM_LEN];
=09
		/** @tgid: PID of the thread's group leader within its process */
		pid_t tgid;
	} creator;
};

...

struct panthor_gem_object {
	...

#ifdef CONFIG_DEBUG_FS
	struct panthor_gem_debugfs debugfs;
#endif

	...
};

> +#endif
>  };
> =20
>  /**
> @@ -150,4 +167,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
> =20
>  void panthor_kernel_bo_destroy(struct panthor_kernel_bo *bo);
> =20
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_gem_print_objects(struct panthor_device *pfdev,
> +			       struct seq_file *m);

s/panthor_gem_print_objects/panthor_gem_debugfs_print_bos/

> +#endif
> +
>  #endif /* __PANTHOR_GEM_H__ */

