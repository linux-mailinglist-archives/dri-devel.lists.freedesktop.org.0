Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6978D531
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9C610E4EE;
	Wed, 30 Aug 2023 10:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D1110E4FA;
 Wed, 30 Aug 2023 10:52:14 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E49476600BB0;
 Wed, 30 Aug 2023 11:52:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693392733;
 bh=dbS1lvMO+EWcHbCFdrfmh2QjQKfiQs4eFDLWNBEANo0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m72MEeUmHGk1P97OhTJQWD8XI/JHoqzurbw8ObmlSSh44ygfFNWXaxoKhK6IIqMls
 rBJrZkWt0NbanPNU6yuK9eoNvg/nDlz8CEk/LdlPMw402Eh6/IJFUmJz0vnAWCr//c
 amO03Q0ediIepVt/21ALqLLoK/0alL+k3dRAmwtZ3JZOjZKyz/Fto1grZbYbpj0Zg+
 ysMq+eGDVydV+CzURNvTpPgxYt8vMBLj1NZt6ZI3Dy0dJi+DsptmYnv+1GmHSUEIg2
 6WD+SYnPOBeq0vGk3TZhEWbN/9BUJiRlJKHkepfBYeivwpd9nX+JgE9b5bwVHHwJ+V
 7g6AszpfYUtlA==
Date: Wed, 30 Aug 2023 12:52:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Subject: Re: [PATCH v2 5/6] drm/panfrost: Implement generic DRM object RSS
 reporting function
Message-ID: <20230830125210.3d1172db@collabora.com>
In-Reply-To: <20230824013604.466224-6-adrian.larumbe@collabora.com>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-6-adrian.larumbe@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023 02:34:48 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> BO's RSS is updated every time new pages are allocated and mapped for the
> object, either in its entirety at creation time for non-heap buffers, or
> else on demand for heap buffers at GPU page fault's IRQ handler.
>=20
> Same calculations had to be done for imported PRIME objects, since backing
> storage for it might have already been allocated by the exporting driver.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 16 +++++++++++-----
>  3 files changed, 38 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.c
> index aea16b0e4dda..c6bd1f16a6d4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -206,6 +206,17 @@ static enum drm_gem_object_status panfrost_gem_statu=
s(struct drm_gem_object *obj
> =20
>  	return res;
>  }
> +
> +size_t panfrost_gem_rss(struct drm_gem_object *obj)
> +{
> +	struct panfrost_gem_object *bo =3D to_panfrost_bo(obj);
> +
> +	if (!bo->base.pages)
> +		return 0;
> +
> +	return bo->rss_size;
> +}
> +
>  static const struct drm_gem_object_funcs panfrost_gem_funcs =3D {
>  	.free =3D panfrost_gem_free_object,
>  	.open =3D panfrost_gem_open,
> @@ -218,6 +229,7 @@ static const struct drm_gem_object_funcs panfrost_gem=
_funcs =3D {
>  	.vunmap =3D drm_gem_shmem_object_vunmap,
>  	.mmap =3D drm_gem_shmem_object_mmap,
>  	.status =3D panfrost_gem_status,
> +	.rss =3D panfrost_gem_rss,
>  	.vm_ops =3D &drm_gem_shmem_vm_ops,
>  };
> =20
> @@ -274,13 +286,23 @@ panfrost_gem_prime_import_sg_table(struct drm_devic=
e *dev,
>  {
>  	struct drm_gem_object *obj;
>  	struct panfrost_gem_object *bo;
> +	struct scatterlist *sgl;
> +	unsigned int count;
> +	size_t total =3D 0;
> =20
>  	obj =3D drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
> =20
> +	for_each_sgtable_dma_sg(sgt, sgl, count) {
> +		size_t len =3D sg_dma_len(sgl);
> +
> +		total +=3D len;
> +	}

Why not simply have bo->rss_size =3D obj->size here? Not sure I see a
reason to not trust dma_buf?

> +
>  	bo =3D to_panfrost_bo(obj);
>  	bo->noexec =3D true;
> +	bo->rss_size =3D total;
> =20
>  	return obj;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/pa=
nfrost/panfrost_gem.h
> index e06f7ceb8f73..e2a7c46403c7 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -36,6 +36,11 @@ struct panfrost_gem_object {
>  	 */
>  	atomic_t gpu_usecount;
> =20
> +	/*
> +	 * Object chunk size currently mapped onto physical memory
> +	 */
> +	size_t rss_size;
> +
>  	bool noexec		:1;
>  	bool is_heap		:1;
>  	bool is_purgable	:1;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index c0123d09f699..e03a5a9da06f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -285,17 +285,19 @@ static void panfrost_mmu_flush_range(struct panfros=
t_device *pfdev,
>  	pm_runtime_put_autosuspend(pfdev->dev);
>  }
> =20
> -static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu=
 *mmu,
> +static size_t mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_=
mmu *mmu,
>  		      u64 iova, int prot, struct sg_table *sgt)
>  {
>  	unsigned int count;
>  	struct scatterlist *sgl;
>  	struct io_pgtable_ops *ops =3D mmu->pgtbl_ops;
>  	u64 start_iova =3D iova;
> +	size_t total =3D 0;
> =20
>  	for_each_sgtable_dma_sg(sgt, sgl, count) {
>  		unsigned long paddr =3D sg_dma_address(sgl);
>  		size_t len =3D sg_dma_len(sgl);
> +		total +=3D len;
> =20
>  		dev_dbg(pfdev->dev, "map: as=3D%d, iova=3D%llx, paddr=3D%lx, len=3D%zx=
", mmu->as, iova, paddr, len);
> =20
> @@ -315,7 +317,7 @@ static int mmu_map_sg(struct panfrost_device *pfdev, =
struct panfrost_mmu *mmu,
> =20
>  	panfrost_mmu_flush_range(pfdev, mmu, start_iova, iova - start_iova);
> =20
> -	return 0;
> +	return total;
>  }
> =20
>  int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
> @@ -326,6 +328,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *map=
ping)
>  	struct panfrost_device *pfdev =3D to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
>  	int prot =3D IOMMU_READ | IOMMU_WRITE;
> +	size_t mapped_size;
> =20
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -337,9 +340,10 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *ma=
pping)
>  	if (WARN_ON(IS_ERR(sgt)))
>  		return PTR_ERR(sgt);
> =20
> -	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
> +	mapped_size =3D mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start <=
< PAGE_SHIFT,
>  		   prot, sgt);
>  	mapping->active =3D true;
> +	bo->rss_size +=3D mapped_size;

Actually, the GEM might be resident even before panfrost_mmu_map() is
called: as soon as drm_gem_shmem_get_pages[_locked]() is called, it's
resident (might get evicted after that point though). That means any
mmap coming from userspace will make the buffer resident too. I know
we're automatically mapping GEMs to the GPU VM in panfrost_gem_open(),
so it makes no difference, but I think I'd prefer if we keep ->rss_size
for heap BOs only (we probably want to rename it heap_rss_size) and
then have


	if (bo->is_heap)
		return bo->heap_rss_size;
	else if (bo->base.pages)
		return bo->base.base.size;
	else
		return 0;

in panfrost_gem_rss().

> =20
>  	return 0;
>  }
> @@ -447,6 +451,7 @@ static int panfrost_mmu_map_fault_addr(struct panfros=
t_device *pfdev, int as,
>  	pgoff_t page_offset;
>  	struct sg_table *sgt;
>  	struct page **pages;
> +	size_t mapped_size;
> =20
>  	bomapping =3D addr_to_mapping(pfdev, as, addr);
>  	if (!bomapping)
> @@ -518,10 +523,11 @@ static int panfrost_mmu_map_fault_addr(struct panfr=
ost_device *pfdev, int as,
>  	if (ret)
>  		goto err_map;
> =20
> -	mmu_map_sg(pfdev, bomapping->mmu, addr,
> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +	mapped_size =3D mmu_map_sg(pfdev, bomapping->mmu, addr,
> +				 IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> =20
>  	bomapping->active =3D true;
> +	bo->rss_size +=3D mapped_size;
> =20
>  	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
> =20

