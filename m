Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA4955EE1
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 22:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F095710E182;
	Sun, 18 Aug 2024 20:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mI5yFZ8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA0D10E177;
 Sun, 18 Aug 2024 20:19:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4790C1BA;
 Sun, 18 Aug 2024 22:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1724012331;
 bh=XhKYTILEYLK5hnZgppdmA00tGDJpmsrwPWsR1GIB2Eo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mI5yFZ8nFKdsDUiEJZahI6u8wiKP2UIAgdEmzTJXIciTkRnaNfCUQOrd9UBoEE31i
 981U6V0Y5Jb4BsZMlfaa3RRaLJPhqBNqAyH6no6rsoy+U4WMqOOTv/uiV4Ewp2rTgg
 br97kp4zVYJdpiPSQKTX+9oLwDH4eyduFcQXSmyM=
Date: Sun, 18 Aug 2024 23:19:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 48/86] drm/xlnx: Run DRM default client setup
Message-ID: <20240818201925.GI29465@pendragon.ideasonboard.com>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-49-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-49-tzimmermann@suse.de>
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

Hi Thomas,

Thank you for the patch.

On Fri, Aug 16, 2024 at 02:23:14PM +0200, Thomas Zimmermann wrote:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Michal Simek <michal.simek@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> index bd1368df7870..f26b119322d5 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_blend.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> @@ -402,6 +403,7 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
>  					  DRIVER_ATOMIC,
>  
>  	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>  
>  	.fops				= &zynqmp_dpsub_drm_fops,
>  
> @@ -523,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>  		goto err_poll_fini;
>  
>  	/* Initialize fbdev generic emulation. */
> -	drm_fbdev_dma_setup(drm, 24);
> +	drm_client_setup(drm, drm_format_info(DRM_FORMAT_RGB888));

I know this would be a hassle to change, but do the majority of the
callers of drm_client_setup() have a drm_format_info * already, or do
they need to call drm_format_info() on a 4CC ? In the latter case, would
it be better to pass the 4CC to drm_client_setup() ?

As far as this patch goes,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	return 0;
>  

-- 
Regards,

Laurent Pinchart
