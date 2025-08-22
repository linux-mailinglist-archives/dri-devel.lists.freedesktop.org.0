Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5E9B31DC9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B147C10EB4E;
	Fri, 22 Aug 2025 15:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="b+htDaSY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DFF10EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755875639;
 bh=FIVbq4h9WopdJU4m06foToyWvVTvEx6P7jg4PSWPJRM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b+htDaSYseZPw2jdj8Gl9gayh6d+xlBkzmu1rEwgIieuwejFAUeK2vuNU48UDQFec
 RfCANnZkGgEHQfeVPSi1YFYyD0E+UCbP6ieyf95vMRJJIASYMQiKhCH+feVC7nM5W9
 J93be6Mi2SaWNoCcPzGL9Q2dR2mpKAHaegXpk+w64+Aeyg6MPG1Fs/Jayvmlp7MIqu
 OtaZImw21Z/wN/Xqoq1Zl0QCx2yBbyVCLpu9BQtqhNM3aViqVT6m63L/b/XKbkPtFY
 pddchMhYr+RcePnPe8kpulSakkHmdXtwEB2zY7UVexY287p2zfTW6860WATHbCbux6
 Q0acT7kGCGu0Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C5FAD17E12DF;
 Fri, 22 Aug 2025 17:13:58 +0200 (CEST)
Date: Fri, 22 Aug 2025 17:13:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, Faith Ekstrand
 <faith.ekstrand@collabora.com>
Subject: Re: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Message-ID: <20250822171354.3c125883@fedora>
In-Reply-To: <20250822142954.902402-2-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-2-faith.ekstrand@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 22 Aug 2025 10:29:10 -0400
Faith Ekstrand <faith@gfxstrand.net> wrote:

> This enables syncing mapped GEM objects between the CPU and GPU via calls
> to dma_sync_*().  It's a bit annoying as it requires walking the sg_table
> so it's best if every driver doesn't hand-roll it.
> 
> Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 64 ++++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     |  3 ++
>  2 files changed, 67 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ac0b1fa5287..50907c1fa11f 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -658,6 +658,70 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
>  
> +/**
> + * drm_gem_shmem_sync_mmap - Sync memor-mapped data to/from the device

                                     ^ CPU-mapped

> + * @shmem: shmem GEM object
> + * @offset: Offset into the GEM object
> + * @size: Size of the area to sync
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int
> +drm_gem_shmem_sync_mmap(struct drm_gem_shmem_object *shmem,
> +			size_t offset, size_t size,
> +			enum dma_data_direction dir)

Feels weird to name this function sync_mmap when all it's being passed
is a region is a GEM, not a virtual address in the process address
space. I can also imagine this helper being used for kernel-mapped BOs,
making _mmap a bit of a lie. Maybe we should just go for _sync() or
_sync_cpu(). 

> +{
> +	struct drm_device *dev = shmem->base.dev;
> +	struct sg_table *sgt;
> +	struct scatterlist *sgl;
> +	unsigned int count;
> +
> +	if (dir == DMA_NONE)
> +		return 0;
> +
> +	/* Don't bother if it's WC-mapped */
> +	if (shmem->map_wc)
> +		return 0;
> +
> +	if (size == 0)
> +		return 0;
> +
> +	if (offset + size < offset || offset + size > shmem->base.size)
> +		return -EINVAL;
> +
> +	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> +	if (IS_ERR(sgt))
> +		return PTR_ERR(sgt);
> +
> +	for_each_sgtable_dma_sg(sgt, sgl, count) {
> +		if (size == 0)
> +			break;
> +
> +		dma_addr_t paddr = sg_dma_address(sgl);
> +		size_t len = sg_dma_len(sgl);
> +
> +		if (len <= offset) {
> +			offset -= len;
> +			continue;
> +		}
> +
> +		paddr += offset;
> +		len -= offset;
> +		len = min_t(size_t, len, size);
> +		size -= len;
> +		offset = 0;
> +
> +		if (dir == DMA_FROM_DEVICE)
> +			dma_sync_single_for_cpu(dev->dev, paddr, len, dir);
> +		else
> +			dma_sync_single_for_device(dev->dev, paddr, len, dir);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_sync_mmap);
> +
>  /**
>   * drm_gem_shmem_print_info() - Print &drm_gem_shmem_object info for debugfs
>   * @shmem: shmem GEM object
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 92f5db84b9c2..8e057a8e6c83 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -121,6 +121,9 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
>  				 struct iosys_map *map);
>  int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct *vma);
> +int drm_gem_shmem_sync_mmap(struct drm_gem_shmem_object *shmem,
> +			    size_t offset, size_t size,
> +			    enum dma_data_direction dir);
>  
>  int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem);
>  void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem);

