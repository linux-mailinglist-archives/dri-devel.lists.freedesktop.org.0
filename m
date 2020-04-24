Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AEA1B7D50
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72D6EAEC;
	Fri, 24 Apr 2020 17:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4F6EAEC;
 Fri, 24 Apr 2020 17:54:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6770020039;
 Fri, 24 Apr 2020 19:54:11 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:54:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 50/59] drm/arc: Inline arcpgu_drm_hdmi_init
Message-ID: <20200424175410.GG7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-51-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-51-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=e5mUnYsNAAAA:8
 a=Ayqi8YQoNp7YY8EPOSwA:9 a=CjuIK1q_8ugA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 15, 2020 at 09:40:25AM +0200, Daniel Vetter wrote:
> Really not worth the function, much less the separate file now that
> almost all the code is gone.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/arc/Makefile      |  2 +-
>  drivers/gpu/drm/arc/arcpgu.h      |  1 -
>  drivers/gpu/drm/arc/arcpgu_drv.c  | 12 +++++++++---
>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 27 ---------------------------
>  4 files changed, 10 insertions(+), 32 deletions(-)
>  delete mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
> 
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> index c686e0287a71..379a1145bc2f 100644
> --- a/drivers/gpu/drm/arc/Makefile
> +++ b/drivers/gpu/drm/arc/Makefile
> @@ -1,3 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -arcpgu-y := arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
> +arcpgu-y := arcpgu_sim.o arcpgu_drv.o
>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index cee2448a07d6..7dce0c2313ba 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -34,7 +34,6 @@ static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
>  	return ioread32(arcpgu->regs + reg);
>  }
>  
> -int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np);
>  
>  #endif
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index 2443e3c78a76..8fbfd956de0a 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -227,9 +227,15 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	}
>  
>  	if (encoder_node) {
> -		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
> -		of_node_put(encoder_node);
This put is missing when arcpgu_drm_hdmi_init() was inlined.
At least in the (!bridge) case - I did not look at the surrounding code.

	Sam

> -		if (ret < 0)
> +		struct drm_bridge *bridge;
> +
> +		/* Locate drm bridge from the hdmi encoder DT node */
> +		bridge = of_drm_find_bridge(encoder_node);
> +		if (!bridge)
> +			return -EPROBE_DEFER;
> +
> +		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
> +		if (ret)
>  			return ret;
>  	} else {
>  		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> deleted file mode 100644
> index d430af686cbc..000000000000
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * ARC PGU DRM driver.
> - *
> - * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> - */
> -
> -#include <drm/drm_bridge.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_encoder.h>
> -#include <drm/drm_device.h>
> -
> -#include "arcpgu.h"
> -
> -int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
> -{
> -	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> -	struct drm_bridge *bridge;
> -
> -	/* Locate drm bridge from the hdmi encoder DT node */
> -	bridge = of_drm_find_bridge(np);
> -	if (!bridge)
> -		return -EPROBE_DEFER;
> -
> -	/* Link drm_bridge to encoder */
> -	return drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
> -}
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
