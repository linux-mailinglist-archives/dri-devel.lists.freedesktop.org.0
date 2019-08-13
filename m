Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AC38E6D8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766736E8FF;
	Thu, 15 Aug 2019 08:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B586E107
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 23:47:13 +0000 (UTC)
Received: from kevin (unknown [IPv6:2600:1010:b066:4e65:17cd:ab50:f77e:97f7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A50328AA3A;
 Wed, 14 Aug 2019 00:47:10 +0100 (BST)
Date: Tue, 13 Aug 2019 16:47:06 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] drm/panfrost: Implement per FD address spaces
Message-ID: <20190813234706.GA4914@kevin>
References: <20190813150115.30338-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190813150115.30338-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0503789953=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0503789953==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Tue, Aug 13, 2019 at 09:01:15AM -0600, Rob Herring wrote:
> Up until now, a single shared GPU address space was used. This is not
> ideal as there's no protection between processes and doesn't work for
> supporting the same GPU/CPU VA feature. Most importantly, this will
> hopefully mitigate Alyssa's fear of WebGL, whatever that is.
>=20
> Most of the changes here are moving struct drm_mm and struct
> panfrost_mmu objects from the per device struct to the per FD struct.
> The critical function is panfrost_mmu_as_get() which handles allocating
> and switching the h/w address spaces.
>=20
> There's 3 states an AS can be in: free, allocated, and in use. When a
> job runs, it requests an address space and then marks it not in use when
> job is complete(but stays assigned). The first time thru, we find a free
> AS in the alloc_mask and assign the AS to the FD. Then the next time
> thru, we most likely already have our AS and we just mark it in use with
> a ref count. We need a ref count because we have multiple job slots. If
> the job/FD doesn't have an AS assigned and there are no free ones, then
> we pick an allocated one not in use from our LRU list and switch the AS
> from the old FD to the new one.
>=20
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Fix assignment of color_adjust ptr
> - Move clearing of job array ptrs to ISR
> - Add locking between mmu_hw_do_operation() and panfrost_mmu_as_get()
> - Drop unnecessary panfrost_mmu_enable() when we already assigned an AS
> - Use as_lru_list instead of file list to iterate thru all active ASs
> - Rework the AS reset handling
>=20
>  drivers/gpu/drm/panfrost/TODO              |   4 -
>  drivers/gpu/drm/panfrost/panfrost_device.c |   2 +
>  drivers/gpu/drm/panfrost/panfrost_device.h |  24 ++-
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  31 ++-
>  drivers/gpu/drm/panfrost/panfrost_gem.c    |  15 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |   3 +
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  14 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 222 +++++++++++++++------
>  drivers/gpu/drm/panfrost/panfrost_mmu.h    |   8 +
>  9 files changed, 236 insertions(+), 87 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/TODO b/drivers/gpu/drm/panfrost/TODO
> index e7727b292355..536a0d4f8d29 100644
> --- a/drivers/gpu/drm/panfrost/TODO
> +++ b/drivers/gpu/drm/panfrost/TODO
> @@ -6,10 +6,6 @@
>    - Bifrost specific feature and issue handling
>    - Coherent DMA support
> =20
> -- Per FD address space support. The h/w supports multiple addresses spac=
es.
> -  The hard part is handling when more address spaces are needed than what
> -  the h/w provides.
> -
>  - Support userspace controlled GPU virtual addresses. Needed for Vulkan.=
 (Tomeu)
> =20
>  - Compute job support. So called 'compute only' jobs need to be plumbed =
up to
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 9814f4ccbd26..4da71bb56c20 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -123,8 +123,10 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
>  	mutex_init(&pfdev->sched_lock);
>  	mutex_init(&pfdev->reset_lock);
>  	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
> +	INIT_LIST_HEAD(&pfdev->as_lru_list);
> =20
>  	spin_lock_init(&pfdev->hwaccess_lock);
> +	spin_lock_init(&pfdev->as_lock);
> =20
>  	err =3D panfrost_clk_init(pfdev);
>  	if (err) {
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 4e5641db9c7e..f503c566e99f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -5,6 +5,8 @@
>  #ifndef __PANFROST_DEVICE_H__
>  #define __PANFROST_DEVICE_H__
> =20
> +#include <linux/atomic.h>
> +#include <linux/io-pgtable.h>
>  #include <linux/spinlock.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_mm.h>
> @@ -63,9 +65,6 @@ struct panfrost_device {
> =20
>  	spinlock_t hwaccess_lock;
> =20
> -	struct drm_mm mm;
> -	spinlock_t mm_lock;
> -
>  	void __iomem *iomem;
>  	struct clk *clock;
>  	struct clk *bus_clock;
> @@ -74,7 +73,11 @@ struct panfrost_device {
> =20
>  	struct panfrost_features features;
> =20
> -	struct panfrost_mmu *mmu;
> +	spinlock_t as_lock;
> +	unsigned long as_in_use_mask;
> +	unsigned long as_alloc_mask;
> +	struct list_head as_lru_list;
> +
>  	struct panfrost_job_slot *js;
> =20
>  	struct panfrost_job *jobs[NUM_JOB_SLOTS];
> @@ -98,10 +101,23 @@ struct panfrost_device {
>  	} devfreq;
>  };
> =20
> +struct panfrost_mmu {
> +	struct io_pgtable_cfg pgtbl_cfg;
> +	struct io_pgtable_ops *pgtbl_ops;
> +	struct mutex lock;
> +	int as;
> +	atomic_t as_count;
> +	struct list_head list;
> +};
> +
>  struct panfrost_file_priv {
>  	struct panfrost_device *pfdev;
> =20
>  	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> +
> +	struct panfrost_mmu mmu;
> +	struct drm_mm mm;
> +	spinlock_t mm_lock;
>  };
> =20
>  static inline struct panfrost_device *to_panfrost_device(struct drm_devi=
ce *ddev)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index a1352750984c..fc22f7ca1107 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -403,6 +403,7 @@ static void panfrost_drm_mm_color_adjust(const struct=
 drm_mm_node *node,
>  static int
>  panfrost_open(struct drm_device *dev, struct drm_file *file)
>  {
> +	int ret;
>  	struct panfrost_device *pfdev =3D dev->dev_private;
>  	struct panfrost_file_priv *panfrost_priv;
> =20
> @@ -413,7 +414,28 @@ panfrost_open(struct drm_device *dev, struct drm_fil=
e *file)
>  	panfrost_priv->pfdev =3D pfdev;
>  	file->driver_priv =3D panfrost_priv;
> =20
> -	return panfrost_job_open(panfrost_priv);
> +	spin_lock_init(&panfrost_priv->mm_lock);
> +
> +	/* 4G enough for now. can be 48-bit */
> +	drm_mm_init(&panfrost_priv->mm, SZ_32M >> PAGE_SHIFT, (SZ_4G - SZ_32M) =
>> PAGE_SHIFT);
> +	panfrost_priv->mm.color_adjust =3D panfrost_drm_mm_color_adjust;
> +
> +	ret =3D panfrost_mmu_pgtable_alloc(panfrost_priv);
> +	if (ret)
> +		goto err_pgtable;
> +
> +	ret =3D panfrost_job_open(panfrost_priv);
> +	if (ret)
> +		goto err_job;
> +
> +	return 0;
> +
> +err_job:
> +	panfrost_mmu_pgtable_free(panfrost_priv);
> +err_pgtable:
> +	drm_mm_takedown(&panfrost_priv->mm);
> +	kfree(panfrost_priv);
> +	return ret;
>  }
> =20
>  static void
> @@ -424,6 +446,8 @@ panfrost_postclose(struct drm_device *dev, struct drm=
_file *file)
>  	panfrost_perfcnt_close(panfrost_priv);
>  	panfrost_job_close(panfrost_priv);
> =20
> +	panfrost_mmu_pgtable_free(panfrost_priv);
> +	drm_mm_takedown(&panfrost_priv->mm);
>  	kfree(panfrost_priv);
>  }
> =20
> @@ -496,14 +520,9 @@ static int panfrost_probe(struct platform_device *pd=
ev)
>  	ddev->dev_private =3D pfdev;
>  	pfdev->ddev =3D ddev;
> =20
> -	spin_lock_init(&pfdev->mm_lock);
>  	mutex_init(&pfdev->shrinker_lock);
>  	INIT_LIST_HEAD(&pfdev->shrinker_list);
> =20
> -	/* 4G enough for now. can be 48-bit */
> -	drm_mm_init(&pfdev->mm, SZ_32M >> PAGE_SHIFT, (SZ_4G - SZ_32M) >> PAGE_=
SHIFT);
> -	pfdev->mm.color_adjust =3D panfrost_drm_mm_color_adjust;
> -
>  	pm_runtime_use_autosuspend(pfdev->dev);
>  	pm_runtime_set_autosuspend_delay(pfdev->dev, 50); /* ~3 frames */
>  	pm_runtime_enable(pfdev->dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index e71f27c4041e..e084bc4e9083 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -47,8 +47,8 @@ static int panfrost_gem_open(struct drm_gem_object *obj=
, struct drm_file *file_p
>  	size_t size =3D obj->size;
>  	u64 align;
>  	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> -	struct panfrost_device *pfdev =3D obj->dev->dev_private;
>  	unsigned long color =3D bo->noexec ? PANFROST_BO_NOEXEC : 0;
> +	struct panfrost_file_priv *priv =3D file_priv->driver_priv;
> =20
>  	/*
>  	 * Executable buffers cannot cross a 16MB boundary as the program
> @@ -61,8 +61,9 @@ static int panfrost_gem_open(struct drm_gem_object *obj=
, struct drm_file *file_p
>  	else
>  		align =3D size >=3D SZ_2M ? SZ_2M >> PAGE_SHIFT : 0;
> =20
> -	spin_lock(&pfdev->mm_lock);
> -	ret =3D drm_mm_insert_node_generic(&pfdev->mm, &bo->node,
> +	bo->mmu =3D &priv->mmu;
> +	spin_lock(&priv->mm_lock);
> +	ret =3D drm_mm_insert_node_generic(&priv->mm, &bo->node,
>  					 size >> PAGE_SHIFT, align, color, 0);
>  	if (ret)
>  		goto out;
> @@ -73,22 +74,22 @@ static int panfrost_gem_open(struct drm_gem_object *o=
bj, struct drm_file *file_p
>  			drm_mm_remove_node(&bo->node);
>  	}
>  out:
> -	spin_unlock(&pfdev->mm_lock);
> +	spin_unlock(&priv->mm_lock);
>  	return ret;
>  }
> =20
>  static void panfrost_gem_close(struct drm_gem_object *obj, struct drm_fi=
le *file_priv)
>  {
>  	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> -	struct panfrost_device *pfdev =3D obj->dev->dev_private;
> +	struct panfrost_file_priv *priv =3D file_priv->driver_priv;
> =20
>  	if (bo->is_mapped)
>  		panfrost_mmu_unmap(bo);
> =20
> -	spin_lock(&pfdev->mm_lock);
> +	spin_lock(&priv->mm_lock);
>  	if (drm_mm_node_allocated(&bo->node))
>  		drm_mm_remove_node(&bo->node);
> -	spin_unlock(&pfdev->mm_lock);
> +	spin_unlock(&priv->mm_lock);
>  }
> =20
>  static int panfrost_gem_pin(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index e10f58316915..50920819cc16 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -7,10 +7,13 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_mm.h>
> =20
> +struct panfrost_mmu;
> +
>  struct panfrost_gem_object {
>  	struct drm_gem_shmem_object base;
>  	struct sg_table *sgts;
> =20
> +	struct panfrost_mmu *mmu;
>  	struct drm_mm_node node;
>  	bool is_mapped		:1;
>  	bool noexec		:1;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index d567ce98494c..ccfac0e5bdd0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -153,6 +153,8 @@ static void panfrost_job_hw_submit(struct panfrost_jo=
b *job, int js)
>  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js))))
>  		goto end;
> =20
> +	cfg =3D panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
> +
>  	panfrost_devfreq_record_transition(pfdev, js);
>  	spin_lock_irqsave(&pfdev->hwaccess_lock, flags);
> =20
> @@ -163,8 +165,7 @@ static void panfrost_job_hw_submit(struct panfrost_jo=
b *job, int js)
> =20
>  	/* start MMU, medium priority, cache clean/flush on end, clean/flush on
>  	 * start */
> -	/* TODO: different address spaces */
> -	cfg =3D JS_CONFIG_THREAD_PRI(8) |
> +	cfg |=3D JS_CONFIG_THREAD_PRI(8) |
>  		JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
>  		JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE;
> =20
> @@ -377,8 +378,9 @@ static void panfrost_job_timedout(struct drm_sched_jo=
b *sched_job)
>  	if (dma_fence_is_signaled(job->done_fence))
>  		return;
> =20
> -	dev_err(pfdev->dev, "gpu sched timeout, js=3D%d, status=3D0x%x, head=3D=
0x%x, tail=3D0x%x, sched_job=3D%p",
> +	dev_err(pfdev->dev, "gpu sched timeout, js=3D%d, config=3D0x%x, status=
=3D0x%x, head=3D0x%x, tail=3D0x%x, sched_job=3D%p",
>  		js,
> +		job_read(pfdev, JS_CONFIG(js)),
>  		job_read(pfdev, JS_STATUS(js)),
>  		job_read(pfdev, JS_HEAD_LO(js)),
>  		job_read(pfdev, JS_TAIL_LO(js)),
> @@ -448,8 +450,12 @@ static irqreturn_t panfrost_job_irq_handler(int irq,=
 void *data)
>  		}
> =20
>  		if (status & JOB_INT_MASK_DONE(j)) {
> +			struct panfrost_job *job =3D pfdev->jobs[j];
> +
> +			pfdev->jobs[j] =3D NULL;
> +			panfrost_mmu_as_put(pfdev, &job->file_priv->mmu);
>  			panfrost_devfreq_record_transition(pfdev, j);
> -			dma_fence_signal(pfdev->jobs[j]->done_fence);
> +			dma_fence_signal(job->done_fence);
>  		}
> =20
>  		status &=3D ~mask;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index 2ed411f09d80..f22d8f02568d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier:	GPL-2.0
>  /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +#include <linux/atomic.h>
>  #include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -22,12 +23,6 @@
>  #define mmu_write(dev, reg, data) writel(data, dev->iomem + reg)
>  #define mmu_read(dev, reg) readl(dev->iomem + reg)
> =20
> -struct panfrost_mmu {
> -	struct io_pgtable_cfg pgtbl_cfg;
> -	struct io_pgtable_ops *pgtbl_ops;
> -	struct mutex lock;
> -};
> -
>  static int wait_ready(struct panfrost_device *pfdev, u32 as_nr)
>  {
>  	int ret;
> @@ -85,13 +80,19 @@ static void lock_region(struct panfrost_device *pfdev=
, u32 as_nr,
>  }
> =20
> =20
> -static int mmu_hw_do_operation(struct panfrost_device *pfdev, u32 as_nr,
> -		u64 iova, size_t size, u32 op)
> +static int mmu_hw_do_operation(struct panfrost_device *pfdev,
> +			       struct panfrost_mmu *mmu,
> +			       u64 iova, size_t size, u32 op)
>  {
> -	unsigned long flags;
> -	int ret;
> +	int ret, as_nr;
> =20
> -	spin_lock_irqsave(&pfdev->hwaccess_lock, flags);
> +	spin_lock(&pfdev->as_lock);
> +	as_nr =3D mmu->as;
> +
> +	if (as_nr < 0) {
> +		spin_unlock(&pfdev->as_lock);
> +		return 0;
> +	}
> =20
>  	if (op !=3D AS_COMMAND_UNLOCK)
>  		lock_region(pfdev, as_nr, iova, size);
> @@ -102,14 +103,15 @@ static int mmu_hw_do_operation(struct panfrost_devi=
ce *pfdev, u32 as_nr,
>  	/* Wait for the flush to complete */
>  	ret =3D wait_ready(pfdev, as_nr);
> =20
> -	spin_unlock_irqrestore(&pfdev->hwaccess_lock, flags);
> +	spin_unlock(&pfdev->as_lock);
> =20
>  	return ret;
>  }
> =20
> -static void panfrost_mmu_enable(struct panfrost_device *pfdev, u32 as_nr)
> +static void panfrost_mmu_enable(struct panfrost_device *pfdev, struct pa=
nfrost_mmu *mmu)
>  {
> -	struct io_pgtable_cfg *cfg =3D &pfdev->mmu->pgtbl_cfg;
> +	int as_nr =3D mmu->as;
> +	struct io_pgtable_cfg *cfg =3D &mmu->pgtbl_cfg;
>  	u64 transtab =3D cfg->arm_mali_lpae_cfg.transtab;
>  	u64 memattr =3D cfg->arm_mali_lpae_cfg.memattr;
> =20
> @@ -136,9 +138,75 @@ static void mmu_disable(struct panfrost_device *pfde=
v, u32 as_nr)
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
> =20
> +u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu)
> +{
> +	int as;
> +
> +	spin_lock(&pfdev->as_lock);
> +
> +	as =3D mmu->as;
> +	if (as >=3D 0) {
> +		int en =3D atomic_inc_return(&mmu->as_count);
> +		WARN_ON(en >=3D NUM_JOB_SLOTS);
> +
> +		list_move(&mmu->list, &pfdev->as_lru_list);
> +		goto out;
> +	}
> +
> +	/* Check for a free AS */
> +	as =3D ffz(pfdev->as_alloc_mask);
> +	if (!(BIT(as) & pfdev->features.as_present)) {
> +		struct panfrost_mmu *lru_mmu;
> +
> +		list_for_each_entry_reverse(lru_mmu, &pfdev->as_lru_list, list) {
> +			if (!atomic_read(&lru_mmu->as_count))
> +				break;
> +		}
> +		WARN_ON(&lru_mmu->list =3D=3D &pfdev->as_lru_list);
> +
> +		list_del_init(&lru_mmu->list);
> +		as =3D lru_mmu->as;
> +
> +		WARN_ON(as < 0);
> +		lru_mmu->as =3D -1;
> +	}
> +
> +	/* Assign the free or reclaimed AS to the FD */
> +	mmu->as =3D as;
> +	set_bit(as, &pfdev->as_alloc_mask);
> +	atomic_set(&mmu->as_count, 1);
> +	list_add(&mmu->list, &pfdev->as_lru_list);
> +
> +	dev_dbg(pfdev->dev, "Assigned AS%d to mmu %p, alloc_mask=3D%lx", as, mm=
u, pfdev->as_alloc_mask);
> +
> +	panfrost_mmu_enable(pfdev, mmu);
> +
> +out:
> +	spin_unlock(&pfdev->as_lock);
> +	return as;
> +}
> +
> +void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_=
mmu *mmu)
> +{
> +	atomic_dec(&mmu->as_count);
> +	WARN_ON(atomic_read(&mmu->as_count) < 0);
> +}
> +
>  void panfrost_mmu_reset(struct panfrost_device *pfdev)
>  {
> -	panfrost_mmu_enable(pfdev, 0);
> +	struct panfrost_mmu *mmu, *mmu_tmp;
> +
> +	spin_lock(&pfdev->as_lock);
> +
> +	pfdev->as_alloc_mask =3D 0;
> +
> +	list_for_each_entry_safe(mmu, mmu_tmp, &pfdev->as_lru_list, list) {
> +		mmu->as =3D -1;
> +		atomic_set(&mmu->as_count, 0);
> +		list_del_init(&mmu->list);
> +	}
> +
> +	spin_unlock(&pfdev->as_lock);
> =20
>  	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
>  	mmu_write(pfdev, MMU_INT_MASK, ~0);
> @@ -152,21 +220,21 @@ static size_t get_pgsize(u64 addr, size_t size)
>  	return SZ_2M;
>  }
> =20
> -static int mmu_map_sg(struct panfrost_device *pfdev, u64 iova,
> -		      int prot, struct sg_table *sgt)
> +static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu=
 *mmu,
> +		      u64 iova, int prot, struct sg_table *sgt)
>  {
>  	unsigned int count;
>  	struct scatterlist *sgl;
> -	struct io_pgtable_ops *ops =3D pfdev->mmu->pgtbl_ops;
> +	struct io_pgtable_ops *ops =3D mmu->pgtbl_ops;
>  	u64 start_iova =3D iova;
> =20
> -	mutex_lock(&pfdev->mmu->lock);
> +	mutex_lock(&mmu->lock);
> =20
>  	for_each_sg(sgt->sgl, sgl, sgt->nents, count) {
>  		unsigned long paddr =3D sg_dma_address(sgl);
>  		size_t len =3D sg_dma_len(sgl);
> =20
> -		dev_dbg(pfdev->dev, "map: iova=3D%llx, paddr=3D%lx, len=3D%zx", iova, =
paddr, len);
> +		dev_dbg(pfdev->dev, "map: as=3D%d, iova=3D%llx, paddr=3D%lx, len=3D%zx=
", mmu->as, iova, paddr, len);
> =20
>  		while (len) {
>  			size_t pgsize =3D get_pgsize(iova | paddr, len);
> @@ -178,10 +246,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev=
, u64 iova,
>  		}
>  	}
> =20
> -	mmu_hw_do_operation(pfdev, 0, start_iova, iova - start_iova,
> +	mmu_hw_do_operation(pfdev, mmu, start_iova, iova - start_iova,
>  			    AS_COMMAND_FLUSH_PT);
> =20
> -	mutex_unlock(&pfdev->mmu->lock);
> +	mutex_unlock(&mmu->lock);
> =20
>  	return 0;
>  }
> @@ -208,7 +276,7 @@ int panfrost_mmu_map(struct panfrost_gem_object *bo)
>  	if (ret < 0)
>  		return ret;
> =20
> -	mmu_map_sg(pfdev, bo->node.start << PAGE_SHIFT, prot, sgt);
> +	mmu_map_sg(pfdev, bo->mmu, bo->node.start << PAGE_SHIFT, prot, sgt);
> =20
>  	pm_runtime_mark_last_busy(pfdev->dev);
>  	pm_runtime_put_autosuspend(pfdev->dev);
> @@ -221,7 +289,7 @@ void panfrost_mmu_unmap(struct panfrost_gem_object *b=
o)
>  {
>  	struct drm_gem_object *obj =3D &bo->base.base;
>  	struct panfrost_device *pfdev =3D to_panfrost_device(obj->dev);
> -	struct io_pgtable_ops *ops =3D pfdev->mmu->pgtbl_ops;
> +	struct io_pgtable_ops *ops =3D bo->mmu->pgtbl_ops;
>  	u64 iova =3D bo->node.start << PAGE_SHIFT;
>  	size_t len =3D bo->node.size << PAGE_SHIFT;
>  	size_t unmapped_len =3D 0;
> @@ -230,13 +298,13 @@ void panfrost_mmu_unmap(struct panfrost_gem_object =
*bo)
>  	if (WARN_ON(!bo->is_mapped))
>  		return;
> =20
> -	dev_dbg(pfdev->dev, "unmap: iova=3D%llx, len=3D%zx", iova, len);
> +	dev_dbg(pfdev->dev, "unmap: as=3D%d, iova=3D%llx, len=3D%zx", bo->mmu->=
as, iova, len);
> =20
>  	ret =3D pm_runtime_get_sync(pfdev->dev);
>  	if (ret < 0)
>  		return;
> =20
> -	mutex_lock(&pfdev->mmu->lock);
> +	mutex_lock(&bo->mmu->lock);
> =20
>  	while (unmapped_len < len) {
>  		size_t unmapped_page;
> @@ -250,10 +318,10 @@ void panfrost_mmu_unmap(struct panfrost_gem_object =
*bo)
>  		unmapped_len +=3D pgsize;
>  	}
> =20
> -	mmu_hw_do_operation(pfdev, 0, bo->node.start << PAGE_SHIFT,
> +	mmu_hw_do_operation(pfdev, bo->mmu, bo->node.start << PAGE_SHIFT,
>  			    bo->node.size << PAGE_SHIFT, AS_COMMAND_FLUSH_PT);
> =20
> -	mutex_unlock(&pfdev->mmu->lock);
> +	mutex_unlock(&bo->mmu->lock);
> =20
>  	pm_runtime_mark_last_busy(pfdev->dev);
>  	pm_runtime_put_autosuspend(pfdev->dev);
> @@ -262,9 +330,9 @@ void panfrost_mmu_unmap(struct panfrost_gem_object *b=
o)
> =20
>  static void mmu_tlb_inv_context_s1(void *cookie)
>  {
> -	struct panfrost_device *pfdev =3D cookie;
> +	struct panfrost_file_priv *priv =3D cookie;
> =20
> -	mmu_hw_do_operation(pfdev, 0, 0, ~0UL, AS_COMMAND_FLUSH_MEM);
> +	mmu_hw_do_operation(priv->pfdev, &priv->mmu, 0, ~0UL, AS_COMMAND_FLUSH_=
MEM);
>  }
> =20
>  static void mmu_tlb_inv_range_nosync(unsigned long iova, size_t size,
> @@ -283,16 +351,69 @@ static const struct iommu_gather_ops mmu_tlb_ops =
=3D {
>  	.tlb_sync	=3D mmu_tlb_sync_context,
>  };
> =20
> +int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv)
> +{
> +	struct panfrost_mmu *mmu =3D &priv->mmu;
> +	struct panfrost_device *pfdev =3D priv->pfdev;
> +
> +	mutex_init(&mmu->lock);
> +	INIT_LIST_HEAD(&mmu->list);
> +	mmu->as =3D -1;
> +
> +	mmu->pgtbl_cfg =3D (struct io_pgtable_cfg) {
> +		.pgsize_bitmap	=3D SZ_4K | SZ_2M,
> +		.ias		=3D FIELD_GET(0xff, pfdev->features.mmu_features),
> +		.oas		=3D FIELD_GET(0xff00, pfdev->features.mmu_features),
> +		.tlb		=3D &mmu_tlb_ops,
> +		.iommu_dev	=3D pfdev->dev,
> +	};
> +
> +	mmu->pgtbl_ops =3D alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
> +					      priv);
> +	if (!mmu->pgtbl_ops)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +void panfrost_mmu_pgtable_free(struct panfrost_file_priv *priv)
> +{
> +	struct panfrost_device *pfdev =3D priv->pfdev;
> +	struct panfrost_mmu *mmu =3D &priv->mmu;
> +
> +	spin_lock(&pfdev->as_lock);
> +	if (mmu->as >=3D 0) {
> +		clear_bit(mmu->as, &pfdev->as_alloc_mask);
> +		clear_bit(mmu->as, &pfdev->as_in_use_mask);
> +		list_del(&mmu->list);
> +	}
> +	spin_unlock(&pfdev->as_lock);
> +
> +	free_io_pgtable_ops(mmu->pgtbl_ops);
> +}
> +
>  static struct drm_mm_node *addr_to_drm_mm_node(struct panfrost_device *p=
fdev, int as, u64 addr)
>  {
> -	struct drm_mm_node *node;
> +	struct drm_mm_node *node =3D NULL;
>  	u64 offset =3D addr >> PAGE_SHIFT;
> +	struct panfrost_mmu *mmu;
> =20
> -	drm_mm_for_each_node(node, &pfdev->mm) {
> -		if (offset >=3D node->start && offset < (node->start + node->size))
> -			return node;
> +	spin_lock(&pfdev->as_lock);
> +	list_for_each_entry(mmu, &pfdev->as_lru_list, list) {
> +		struct panfrost_file_priv *priv;
> +		if (as !=3D mmu->as)
> +			continue;
> +
> +		priv =3D container_of(mmu, struct panfrost_file_priv, mmu);
> +		drm_mm_for_each_node(node, &priv->mm) {
> +			if (offset >=3D node->start && offset < (node->start + node->size))
> +				goto out;
> +		}
>  	}
> -	return NULL;
> +
> +out:
> +	spin_unlock(&pfdev->as_lock);
> +	return node;
>  }
> =20
>  #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
> @@ -317,6 +438,8 @@ int panfrost_mmu_map_fault_addr(struct panfrost_devic=
e *pfdev, int as, u64 addr)
>  			 node->start << PAGE_SHIFT);
>  		return -EINVAL;
>  	}
> +	WARN_ON(bo->mmu->as !=3D as);
> +
>  	/* Assume 2MB alignment and size multiple */
>  	addr &=3D ~((u64)SZ_2M - 1);
>  	page_offset =3D addr >> PAGE_SHIFT;
> @@ -367,11 +490,11 @@ int panfrost_mmu_map_fault_addr(struct panfrost_dev=
ice *pfdev, int as, u64 addr)
>  		goto err_map;
>  	}
> =20
> -	mmu_map_sg(pfdev, addr, IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +	mmu_map_sg(pfdev, bo->mmu, addr, IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXE=
C, sgt);
> =20
>  	bo->is_mapped =3D true;
> =20
> -	dev_dbg(pfdev->dev, "mapped page fault @ %llx", addr);
> +	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
> =20
>  	return 0;
> =20
> @@ -480,15 +603,8 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(i=
nt irq, void *data)
> =20
>  int panfrost_mmu_init(struct panfrost_device *pfdev)
>  {
> -	struct io_pgtable_ops *pgtbl_ops;
>  	int err, irq;
> =20
> -	pfdev->mmu =3D devm_kzalloc(pfdev->dev, sizeof(*pfdev->mmu), GFP_KERNEL=
);
> -	if (!pfdev->mmu)
> -		return -ENOMEM;
> -
> -	mutex_init(&pfdev->mmu->lock);
> -
>  	irq =3D platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
>  	if (irq <=3D 0)
>  		return -ENODEV;
> @@ -501,22 +617,6 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  		dev_err(pfdev->dev, "failed to request mmu irq");
>  		return err;
>  	}
> -	pfdev->mmu->pgtbl_cfg =3D (struct io_pgtable_cfg) {
> -		.pgsize_bitmap	=3D SZ_4K | SZ_2M,
> -		.ias		=3D FIELD_GET(0xff, pfdev->features.mmu_features),
> -		.oas		=3D FIELD_GET(0xff00, pfdev->features.mmu_features),
> -		.tlb		=3D &mmu_tlb_ops,
> -		.iommu_dev	=3D pfdev->dev,
> -	};
> -
> -	pgtbl_ops =3D alloc_io_pgtable_ops(ARM_MALI_LPAE, &pfdev->mmu->pgtbl_cf=
g,
> -					 pfdev);
> -	if (!pgtbl_ops)
> -		return -ENOMEM;
> -
> -	pfdev->mmu->pgtbl_ops =3D pgtbl_ops;
> -
> -	panfrost_mmu_enable(pfdev, 0);
> =20
>  	return 0;
>  }
> @@ -525,6 +625,4 @@ void panfrost_mmu_fini(struct panfrost_device *pfdev)
>  {
>  	mmu_write(pfdev, MMU_INT_MASK, 0);
>  	mmu_disable(pfdev, 0);
> -
> -	free_io_pgtable_ops(pfdev->mmu->pgtbl_ops);
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.h
> index d5f9b24537db..7c5b6775ae23 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -5,6 +5,8 @@
>  #define __PANFROST_MMU_H__
> =20
>  struct panfrost_gem_object;
> +struct panfrost_file_priv;
> +struct panfrost_mmu;
> =20
>  int panfrost_mmu_map(struct panfrost_gem_object *bo);
>  void panfrost_mmu_unmap(struct panfrost_gem_object *bo);
> @@ -13,4 +15,10 @@ int panfrost_mmu_init(struct panfrost_device *pfdev);
>  void panfrost_mmu_fini(struct panfrost_device *pfdev);
>  void panfrost_mmu_reset(struct panfrost_device *pfdev);
> =20
> +u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_m=
mu *mmu);
> +void panfrost_mmu_as_put(struct panfrost_device *pfdev, struct panfrost_=
mmu *mmu);
> +
> +int panfrost_mmu_pgtable_alloc(struct panfrost_file_priv *priv);
> +void panfrost_mmu_pgtable_free(struct panfrost_file_priv *priv);
> +
>  #endif
> --=20
> 2.20.1
>=20

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1TS/MACgkQ/v5QWgr1
WA3gmg//bHlbGZOgE5VZqLUDRm1OeFdXkDWjkRKecwq3jfoDpNn/WlW/QsByOFYw
wh+q/hq+ZAdr8gd9QcC8gefavh4apoUNdnJyWBh9jYzwJMLX7P5jRS+bf+p8cYEs
9WufAbfJVvZrMad8GhEmfOj6svTfqBxT5mljNt9eC5vheZ4q11VDBBNl/LAVmrBV
nHT659zoTXayQkbi7n9JmoKDTw5khWbd1qG2lDfQTclnyV78wJX0RPAbEMNBBbdc
FchfFdIaCsdYYFstKxe8FY89P3MabmdLq1QraIkjQqBGCps1RSGnhzGLaBv3kC+R
hTxU9TpEFIVVOtrGxRiqDQyURBBqNqwxWu8wkRkw5uV8lMeWSvgFCTiBkbVquqFt
vVYyeZG7AVDtI8WebjmcVw+B5iZhbV0aNHxZLSi0wdMOZpiOKOBhYGqK73kcxLbo
Sa9DL3UmJFYbXZC46sam0lEETVZ+qc8BADfy0V85IXxdpeajAZVNOlOoThBSsHc/
zEDbY/hw05QaK4AcHuzxexZc3YGhlMn5yfnrDAapednjL/htMf3xWENkqkE1CYm8
HSM+cIZHjyBqIj3Yd7vJZlUz3hqqORIQent/YsmObCb7hnlqDElmqlUkbpSlcxCt
9vNCHKFoiIPvG1PmGpmcR+IVyAqzKY9d13t8R24QZeuCpVZw+ag=
=CGTP
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--

--===============0503789953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0503789953==--
