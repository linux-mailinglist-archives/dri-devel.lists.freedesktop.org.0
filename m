Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C17A91861
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 11:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577B810E19C;
	Thu, 17 Apr 2025 09:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsO4uwMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 622EE10E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744883608; x=1776419608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xtGgzNdAw33Nf22wzkzkOa7bjujxN097SOB2zRJTR70=;
 b=CsO4uwMwgKGNdWTQWFKRvR0+P7jT7TH4ZTunywzstucNGZBk23x7U9L6
 eavxM++rChR+xEGk1exp/gFQyWiMOg2T1PlgKOT7o+RgDyYS31mi0o8N+
 Famwo+PEsfG8acBdljbSAizOCMWkEix/AmVA6tzA+H1wkIoo6/QoLjwlk
 Yf+bHp38uLroAYo8/Bl/3KzECfG87GDEF4WnNIW6RTgM+K9fexM5xaUSh
 v1h7TgEvdsHnbnYvgXEmaDrlCOhbSIbzOqgp51lNiiNBiovJpEP8z1mDb
 Is5q0I7r12oCsZ/Rpgl3Fk2pD53P/UrSdk2UWAC/gr/0vRkAZZFBoV7sj w==;
X-CSE-ConnectionGUID: qDC6WIFRR+uRlnfHR1J/Rw==
X-CSE-MsgGUID: zY7eeLa5T/6Sv2m0QFIW9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46348136"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46348136"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:53:27 -0700
X-CSE-ConnectionGUID: 2ZTCTIR4S2ySFP5E6n1tYA==
X-CSE-MsgGUID: FvpFMcDMQ1uLApubVsKCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="135726027"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.140])
 ([10.245.244.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 02:53:25 -0700
Message-ID: <4b14aba4-b9e6-436e-9027-4a3f6a6c7daf@intel.com>
Date: Thu, 17 Apr 2025 10:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Don't create a file offset for NO_MMAP BOs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250417093247.3455096-1-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250417093247.3455096-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 17/04/2025 10:32, Boris Brezillon wrote:
> Right now the DRM_PANTHOR_BO_NO_MMAP flag is ignored by
> panthor_ioctl_bo_mmap_offset(), meaning BOs with this flag set can
> have a file offset but can't be mapped anyway, because
> panthor_gem_mmap() will filter them out.
> 
> If we error out at mmap_offset creation time, we can get rid of
> panthor_gem_mmap() and call drm_gem_shmem_object_mmap directly, and
> we get rid of this inconsistency of having an mmap offset for a
> BO that can never be mmap-ed.
> 
> Changes in v2:
> - Get rid of panthor_gem_mmap()
> - Get rid of the Fixes tag and adjust the commit message accordingly
> - Return ENOPERM instead of EINVAL
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c |  5 +++++
>   drivers/gpu/drm/panthor/panthor_gem.c | 13 +------------
>   2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 06fe46e32073..7cd131af340d 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -940,6 +940,7 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>   					struct drm_file *file)
>   {
>   	struct drm_panthor_bo_mmap_offset *args = data;
> +	struct panthor_gem_object *bo;
>   	struct drm_gem_object *obj;
>   	int ret;
>   
> @@ -950,6 +951,10 @@ static int panthor_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data,
>   	if (!obj)
>   		return -ENOENT;
>   
> +	bo = to_panthor_bo(obj);
> +	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> +		return -EPERM;

Just a drive-by-comment: are we not leaking the bo ref here?

> +
>   	ret = drm_gem_create_mmap_offset(obj);
>   	if (ret)
>   		goto out;
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index fd014ccc3bfc..22d78cef9c66 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -129,17 +129,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>   	return ERR_PTR(ret);
>   }
>   
> -static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> -{
> -	struct panthor_gem_object *bo = to_panthor_bo(obj);
> -
> -	/* Don't allow mmap on objects that have the NO_MMAP flag set. */
> -	if (bo->flags & DRM_PANTHOR_BO_NO_MMAP)
> -		return -EINVAL;
> -
> -	return drm_gem_shmem_object_mmap(obj, vma);
> -}
> -
>   static struct dma_buf *
>   panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
>   {
> @@ -169,7 +158,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
>   	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>   	.vmap = drm_gem_shmem_object_vmap,
>   	.vunmap = drm_gem_shmem_object_vunmap,
> -	.mmap = panthor_gem_mmap,
> +	.mmap = drm_gem_shmem_object_mmap,
>   	.status = panthor_gem_status,
>   	.export = panthor_gem_prime_export,
>   	.vm_ops = &drm_gem_shmem_vm_ops,

