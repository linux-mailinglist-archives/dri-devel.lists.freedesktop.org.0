Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74FA6CBCD
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 19:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6E510E044;
	Sat, 22 Mar 2025 18:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="BlTEPn2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7024210E044
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 18:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742668224; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JzTCSNHHLPywezjRAd1z0IvAt6354yVhCUSvK6SMMua83Q2ibwz/AcyaQNETiy47Zf0Z989t9hO3u5d5DaGjupRiEWzEfmu8u5qa04knfaq8QGCY1nm28LmP0QSpQjMMRTzN3lkoFUAii6W/popLm1G19v3LF0yvKyPaXcN/Gf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742668224;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7QIHF3NjHt3xn4pZK4qJww9kq+qlDqM7MmGL3/fOx8M=; 
 b=VRDPM/3DQZGeLqXtaJ5RTLrBUxZ5LQhKEycR0nP5bKxHPkxIAyRO1EwtuSGzXJhzsnw8L5/6PoaOejZ3am0YCAd0W7R7At5qlmULsKWhaptE3s7Q0b9SutQmmKWLqF2oAPmymm8DKMEb7LD8gL0F2yWT0hwLg/unifu9bKh+UwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742668224; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=7QIHF3NjHt3xn4pZK4qJww9kq+qlDqM7MmGL3/fOx8M=;
 b=BlTEPn2Q2kfEk9Jw+oEZMH5XEjKGoZBlRkTUy9MftNTykd1tQomiKTHqu6V+0srQ
 xYnnI3feVQ7sh3r0VyvjGsnYmpvuThjcilDzdEX/CrmX1MbpmvDKLGgvZvIZebLTNhx
 mNrpdsPgk5XKxiECWAofPTlKdMarv9ZEbLT01N+U=
Received: by mx.zohomail.com with SMTPS id 1742668222927774.9008803686191;
 Sat, 22 Mar 2025 11:30:22 -0700 (PDT)
Date: Sat, 22 Mar 2025 18:30:13 +0000
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 1/6] drm/panfrost: Set IOMMU_CACHE flag
Message-ID: <7qixyvz7ll7sk53vqys74kncf6advxcuctfymmve7msygekygg@vwxzowjwm5bz>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
 <20250317145245.910566-2-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317145245.910566-2-ariel.dalessandro@collabora.com>
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

On 17.03.2025 11:52, Ariel D'Alessandro wrote:
> Panfrost does not support uncached mappings, so flag them properly. Also
> flag the pages that are mapped as response to a page fault as cached.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index b91019cd5acb1..9e6f198ef5c1b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -327,7 +327,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	struct drm_gem_object *obj = &shmem->base;
>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
> -	int prot = IOMMU_READ | IOMMU_WRITE;
> +	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
>
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -528,7 +528,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  		goto err_map;
>
>  	mmu_map_sg(pfdev, bomapping->mmu, addr,
> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
> +		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
>
>  	bomapping->active = true;
>  	bo->heap_rss_size += SZ_2M;
> --
> 2.47.2


Adrian Larumbe
