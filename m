Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E609B33767
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 09:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4F810E3C6;
	Mon, 25 Aug 2025 07:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I2Y/pkM+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196F310E1AB;
 Mon, 25 Aug 2025 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756105754;
 bh=iUR1+y42WvW+BSZ7IHiyGJ9P9sfY7TKHI2TsSml0YKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I2Y/pkM+TgiZug17GVODXPxW68NOiUie7faHTtXV/LfPQpBeMfYHXhiZrsc+/Glzx
 5klU06EyCtvZmMLBcKtV/6Bzc7wpkDhTtbpHm2BndQKYHJQ2gXTf1hwWFrKRUQxoEc
 GwBbS6pwuQuVUZPZVw6EnwbU29AQMU6SBkmtqjWH6TtTQpmZi16uDjzuRl8FfPtvEL
 J3Vo8hMScBqUNtmRF4M61dt0hXjAyPti0oboU/ILO5tSPm0YZ3XDD2XRRgsUxq3YF7
 G3cMtWjzQAlpLaX2Q3Y3KOMRi2pbRCtobNj+VjOByCYB20GAFtklSvX6z9M9BXBQaD
 AeCQsMVa5fnVA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E77E017E1357;
 Mon, 25 Aug 2025 09:09:13 +0200 (CEST)
Date: Mon, 25 Aug 2025 09:09:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danct12 <danct12@disroot.org>
Subject: Re: [PATCH] drm/msm: fix msm_gem_vma_new() allocations for managed
 GPUVMs
Message-ID: <20250825090908.269e1119@fedora>
In-Reply-To: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
References: <20250823-msm-fix-gpuvm-init-v1-1-e199cd5b1983@oss.qualcomm.com>
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

On Sat, 23 Aug 2025 03:12:00 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> Since commit 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()") MSM
> driver fails to init, failing with "[drm:msm_gpu_init] *ERROR* could not
> allocate memptrs: -22" errors. The mentioned commit reworked the
> function, but didn't take into account that op_map is initialized at the
> top of the function, while ranges might change if GPUVM is managed by
> the kernel.
> 
> Move op_mode initialization after finalizing all addresses and right
> before the drm_gpuva_init_from_op() call.
> 
> Reported-by: Danct12 <danct12@disroot.org>
> Fixes: 3309323241fb ("drm/gpuvm: Kill drm_gpuva_init()")
> Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 3f440bc1f7106f3b0091f037611d0b433e5e2c18..6df6b7c0984da57fe64de41fa54f7dea0a324c74 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -368,12 +368,6 @@ struct drm_gpuva *
>  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  		u64 offset, u64 range_start, u64 range_end)
>  {
> -	struct drm_gpuva_op_map op_map = {
> -		.va.addr = range_start,
> -		.va.range = range_end - range_start,
> -		.gem.obj = obj,
> -		.gem.offset = offset,
> -	};
>  	struct msm_gem_vm *vm = to_msm_vm(gpuvm);
>  	struct drm_gpuvm_bo *vm_bo;
>  	struct msm_gem_vma *vma;
> @@ -402,6 +396,13 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  	if (obj)
>  		GEM_WARN_ON((range_end - range_start) > obj->size);
>  
> +	struct drm_gpuva_op_map op_map = {
> +		.va.addr = range_start,
> +		.va.range = range_end - range_start,
> +		.gem.obj = obj,
> +		.gem.offset = offset,
> +	};

OOC, are we now allowed to declare local variables in the middle of a
code block in kernel code? I must admit that's not something I tried
doing recently, but I've had gcc warnings in the past because of that.

> +
>  	drm_gpuva_init_from_op(&vma->base, &op_map);
>  	vma->mapped = false;
>  
> 
> ---
> base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
> change-id: 20250823-msm-fix-gpuvm-init-520d87ebcf26
> 
> Best regards,

