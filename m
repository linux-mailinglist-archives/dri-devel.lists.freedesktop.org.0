Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E7243AD6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 15:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783486E147;
	Thu, 13 Aug 2020 13:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1D06E147;
 Thu, 13 Aug 2020 13:36:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EEF4C80C;
 Thu, 13 Aug 2020 15:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597325779;
 bh=LFjCPgHaIF6gKZ6ttwoh7vM/ha5xd+8WqVY3LrXFqdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mD2ffodeTiALBx4jMPG8qxz9L2zNHMknBM29LVKDZwsuv+HPNiU01uwaTPvLjoGS1
 sOMLw+vbWye9FliJAd9NJAyN9AUdPYnu7XpJWDyFWNmXGiBOuqF8WtSmdbAdPKkTbA
 m/8ZHk2o7qVvXfCHUPCtVlJuq/Rqpw7zILkn+1Oc=
Date: Thu, 13 Aug 2020 16:36:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
Message-ID: <20200813133605.GJ6057@pendragon.ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813083644.31711-20-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, abdiel.janulgue@linux.intel.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 miaoqinglang@huawei.com, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Thu, Aug 13, 2020 at 10:36:43AM +0200, Thomas Zimmermann wrote:
> The xlnx driver uses CMA helpers with default callback functions.
> Initialize the driver structure with the rsp CMA helper macro. The
> driver is being converted to use GEM object functions as part of
> this change.
> 
> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
> to their default implementations, so they are just kept empty now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 26328c76305b..058044dcc062 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver = {
>  	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
>  					  DRIVER_ATOMIC,
>  
> -	.prime_handle_to_fd		= drm_gem_prime_handle_to_fd,
> -	.prime_fd_to_handle		= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export		= drm_gem_prime_export,
> -	.gem_prime_import		= drm_gem_prime_import,
> -	.gem_prime_get_sg_table		= drm_gem_cma_prime_get_sg_table,
> -	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_vmap			= drm_gem_cma_prime_vmap,
> -	.gem_prime_vunmap		= drm_gem_cma_prime_vunmap,
> -	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
> -	.gem_free_object_unlocked	= drm_gem_cma_free_object,
> -	.gem_vm_ops			= &drm_gem_cma_vm_ops,
> -	.dumb_create			= zynqmp_dpsub_dumb_create,
> -	.dumb_destroy			= drm_gem_dumb_destroy,
> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),

The only effective change here is

-	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table,
-	.gem_prime_mmap			= drm_gem_cma_prime_mmap,
+	.gem_prime_import_sg_table	= drm_gem_cma_prime_import_sg_table_vmap,
+	.gem_prime_mmap			= drm_gem_prime_mmap,

The change is significant, and I have a hard time following the code to
verify that it's correct, or if it's an undesired side effect. If it's
correct, could the change be mentioned in the commit message, with at
least a brief explanation of why this is correct, and what the
consequences here ?

>  
>  	.fops				= &zynqmp_dpsub_drm_fops,
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
