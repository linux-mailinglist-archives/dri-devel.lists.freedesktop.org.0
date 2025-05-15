Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B42BAB8185
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7176B10E7C9;
	Thu, 15 May 2025 08:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UtnPOeib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529FE10E7C9;
 Thu, 15 May 2025 08:54:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6990B629ED;
 Thu, 15 May 2025 08:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 993EAC4CEE7;
 Thu, 15 May 2025 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747299273;
 bh=h+VsUgSmErOy2grzt87OXyIDJW5HdE1chW0emZWQhC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UtnPOeib6y06l+qlV9LfdW2QLTo13UdK1gBQz/g7xaT68XnvnR/KQyA3UswXqZN8C
 ZlBBZ5bPPyfll8IolsEuRy+E1tPBs/yBVsyDt4ijeB7GbCNnlyiW9/RGbD4rkNO1oh
 qNGp5nNKLC8yR+SPyCK9gzj8pwno6kweYcBc0Ne+Yf0kwetrO3J2aMZo3WfYo3uT22
 qNa/cvg9R5mpyzD4uEoAl0AkmODpatVQyXOCCNswt6HsXjQK1+cf4Cuwz6RxIMO/7z
 yiXh0Mgui0krxVSfYz++H+cEscRoZkf3g34tv2BzauqzgXCf5XZhBdU9w/23w+ehlN
 dxGHp+tDs2SbA==
Date: Thu, 15 May 2025 10:54:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/40] drm/gpuvm: Don't require obj lock in destructor
 path
Message-ID: <aCWrwz2IF6VBUi4e@pollux>
References: <20250514175527.42488-1-robdclark@gmail.com>
 <20250514175527.42488-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514175527.42488-2-robdclark@gmail.com>
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

Hi Rob,

Can you please CC me on patches for GPUVM?

On Wed, May 14, 2025 at 10:53:15AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> See commit a414fe3a2129 ("drm/msm/gem: Drop obj lock in
> msm_gem_free_object()") for justification.

Please write a proper commit message that explains the problem and the solution.
Please don't just refer to another commit and leave it to the reviewer of the
patch to figure this out.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)


> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f9eb56f24bef..1e89a98caad4 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1511,7 +1511,9 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
>  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
>  
> -	drm_gem_gpuva_assert_lock_held(obj);
> +	if (kref_read(&obj->refcount) > 0)
> +		drm_gem_gpuva_assert_lock_held(obj);
> +
>  	list_del(&vm_bo->list.entry.gem);

This seems wrong.

A VM_BO object keeps a reference of the underlying GEM object, so this should
never happen.

This function calls drm_gem_object_put() before it returns.

>  
>  	if (ops && ops->vm_bo_free)
> @@ -1871,7 +1873,8 @@ drm_gpuva_unlink(struct drm_gpuva *va)
>  	if (unlikely(!obj))
>  		return;
>  
> -	drm_gem_gpuva_assert_lock_held(obj);
> +	if (kref_read(&obj->refcount) > 0)
> +		drm_gem_gpuva_assert_lock_held(obj);
>  	list_del_init(&va->gem.entry);
>  
>  	va->vm_bo = NULL;
> -- 
> 2.49.0
> 
