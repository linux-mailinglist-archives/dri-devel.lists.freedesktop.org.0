Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF6ABD09F
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BA910E464;
	Tue, 20 May 2025 07:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="duhG9Y/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008A10E3DB;
 Tue, 20 May 2025 07:40:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F22F761155;
 Tue, 20 May 2025 07:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C58C4CEE9;
 Tue, 20 May 2025 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747726852;
 bh=du74CvAlwH4+uIAs8YMtDE8dudviPCVlSuJEObPE4mI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=duhG9Y/rUhQTeP5uq0AvsyPyA05wrS1p6pnd3HTUHErD22cXzXEUD74P0Muc5lzgr
 pSi6kcm8M6ZmvksEV66bQsu0jMdZLz88XzZ4re6wYkRztJZ2tfnLCI/yzgS5PdteQk
 xD5zp7EmiwEvIDrXYf/2uUJKV3DkyrUgY64DEYlDme4ovUJrNHVKHZ33zpDTYLBq06
 16nJ6VpllazGgcoTYBQhc056TzooRD1c3BJ8dph1i8z8VNFhPnQ8/ZW8X24loc2W5y
 quMPl+RljKtPnzw9Oih2EBowcIPHlu306jTqXVths11vKrLunhSStzKPx8X6gSBMve
 /dwEblfQ0YSaw==
Date: Tue, 20 May 2025 09:40:47 +0200
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
Subject: Re: [PATCH v5 02/40] drm/gpuvm: Allow VAs to hold soft reference to
 BOs
Message-ID: <aCwx_9KIc9QBd7_0@pollux>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175348.11924-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519175348.11924-3-robdclark@gmail.com>
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

On Mon, May 19, 2025 at 10:51:25AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Eases migration for drivers where VAs don't hold hard references to
> their associated BO, avoiding reference loops.
> 
> In particular, msm uses soft references to optimistically keep around
> mappings until the BO is distroyed.  Which obviously won't work if the
> VA (the mapping) is holding a reference to the BO.
> 
> By making this a per-VM flag, we can use normal hard-references for
> mappings in a "VM_BIND" managed VM, but soft references in other cases,
> such as kernel-internal VMs (for display scanout, etc).
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 37 ++++++++++++++++++++++++++++++++-----
>  include/drm/drm_gpuvm.h     | 19 +++++++++++++++++--
>  2 files changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 1e89a98caad4..892b62130ff8 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1125,6 +1125,8 @@ __drm_gpuvm_prepare_objects(struct drm_gpuvm *gpuvm,
>  	LIST_HEAD(extobjs);
>  	int ret = 0;
>  
> +	WARN_ON(gpuvm->flags & DRM_GPUVM_VA_WEAK_REF);

No, here and below, please don't scatter WARN_ON() calls in various code paths
for this hack.

This won't ever be a valid and supported mode, please keep the diff as small as
possible.

<snip>

> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 2a9629377633..652e0fb66413 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -205,10 +205,25 @@ enum drm_gpuvm_flags {
>  	 */
>  	DRM_GPUVM_RESV_PROTECTED = BIT(0),
>  
> +	/**
> +	 * @DRM_GPUVM_VA_WEAK_REF:
> +	 *
> +	 * Flag indicating that the &drm_gpuva (or more correctly, the
> +	 * &drm_gpuvm_bo) only holds a weak reference to the &drm_gem_object.
> +	 * This mode is intended to ease migration to drm_gpuvm for drivers
> +	 * where the GEM object holds a referece to the VA, rather than the
> +	 * other way around.
> +	 *
> +	 * In this mode, drm_gpuvm does not track evicted or external objects.
> +	 * It is intended for legacy mode, where the needed objects are attached
> +	 * to the command submission ioctl, therefore this tracking is unneeded.
> +	 */
> +	DRM_GPUVM_VA_WEAK_REF = BIT(1),

As mentioned in v4, I do *not* agree with making this a valid and supported
mode. If at all, it should be an exception for MSM, i.e.
DRM_GPUVM_MSM_LEGACY_QUIRK with an explicit approval from Dave / Sima [1].

It invalidates the whole design and makes a lot of functions fundamentally
invalid to call, which is well demonstrated by all the WARN_ON() calls this
patch attempts to add.

> +
>  	/**
>  	 * @DRM_GPUVM_USERBITS: user defined bits
>  	 */
> -	DRM_GPUVM_USERBITS = BIT(1),
> +	DRM_GPUVM_USERBITS = BIT(2),
>  };

[1] https://lore.kernel.org/dri-devel/aCb-72KH-NrzvGXy@pollux/
