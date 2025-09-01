Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6FB3DC21
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72DA10E06D;
	Mon,  1 Sep 2025 08:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="cQgfbxyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFEF10E06D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756714734; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fwdlt4YMS2xk/+iXW8Eql8Cx9wnC1W4g10bedHmcNFXt0mlyNHeTnW4FZ66S4xcKbYROnUwK4MBu/pygHuTaIm9y1/jdiCMh3M2emjcevj7O1GqMdXnbq7vZ86iLqmf9K6fYUw8oWthkjPNBx6v/2t5CI4MEekrHx8xCjdmYRR8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756714734;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=VGqloi6I8JXxKXjJsPU33HFlHX0Qk0RFCrz0deLj5B0=; 
 b=Q1gMBED/8I5Eofu5HXnUHfFlKGE+WiwhWblXOWMdWfnaWRo9RO4GWdPqwpB6i1W4+xEVWWy6kw6KD+cNuM2SCe4Ud2KUhw1UsLa9s4/1Zoni6GU1okL8ILdz8Uj+V28mXkhI7CDk5dPeThAbTabhHE5iDVoZvc709baoCh0DB0Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756714734; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=VGqloi6I8JXxKXjJsPU33HFlHX0Qk0RFCrz0deLj5B0=;
 b=cQgfbxyi+RIxos0LZnCCNvLiH6dCqlk/Bv38bAn7sVhDPuqf2NP96Ed5qeU90MIi
 7fS4UN+X1R0wrpbo9ZZ3jpuDxs9msk5iqOc4OnRr5/flOFb3cbtsmwmYYqnK/8CXHTm
 C2SRobTc0vZcDlUm0h80fmle7iDzOYXsJMAKsCB0=
Received: by mx.zohomail.com with SMTPS id 1756714732765507.6871391120619;
 Mon, 1 Sep 2025 01:18:52 -0700 (PDT)
Date: Mon, 1 Sep 2025 09:18:49 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/7] drm/shmem: Add a drm_gem_shmem_sync_mmap() helper
Message-ID: <56gfcb5z757iw5lmj3fkbew37nc7n2oacsxkagu5tlx4h24qeb@lauynfvexbtf>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
 <20250822142954.902402-2-faith.ekstrand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250822142954.902402-2-faith.ekstrand@collabora.com>
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

Hi Faith,

On 22.08.2025 10:29, Faith Ekstrand wrote:
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

This will allocate pages when the BO had no backing storage yet, otherwise it'll increase the
refcnt on those pages, but seems to me this will leave the reference count imbalanced.

I'd say running this function on an object with no storage backing should be considered a no-op:

```
	if (!shmem->pages)
		return 0;
```

On top of that, there are code paths in which we allocate pages, but produce no sgtable for them,
like drm_gem_shmem_mmap(), so maybe we could do as follows:

```
	if (!shmem->sgt) {
		int ret;

		ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
		if (ret)
			return ret;

		sgt = drm_gem_shmem_get_sg_table(shmem);
		if (IS_ERR(sgt))
			return ret;

		shmem->sgt = sgt;
	}
```

Although I think this is something you could factorise with what is being done in drm_gem_shmem_get_pages_sgt_locked.

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
> --
> 2.50.1


Adrian Larumbe
