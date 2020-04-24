Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B0A1B7CDA
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4726EAE4;
	Fri, 24 Apr 2020 17:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2126EAE4;
 Fri, 24 Apr 2020 17:34:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id AFD1E80453;
 Fri, 24 Apr 2020 19:34:10 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:34:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 42/59] drm/arc: Embedded a drm_simple_display_pipe
Message-ID: <20200424173409.GA7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-43-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-43-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=A5Kf5yaaldvMve3tuPkA:9 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:17AM +0200, Daniel Vetter wrote:
> This is a prep step to convert arc over to the simple kms helpers, for
> now we just use this as an embedding container to drop all the various
> allocations. Big change is the removal of the various devm_kzalloc,
> which have the wrong lifetimes anyway.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/arc/arcpgu.h      | 7 ++++---
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 9 +++------
>  drivers/gpu/drm/arc/arcpgu_drv.c  | 2 +-
>  drivers/gpu/drm/arc/arcpgu_hdmi.c | 5 ++---
>  drivers/gpu/drm/arc/arcpgu_sim.c  | 5 ++---
>  5 files changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index ed77dd5dd5cb..52afd638a4d2 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -8,17 +8,18 @@
>  #ifndef _ARCPGU_H_
>  #define _ARCPGU_H_
>  
> +#include <drm/drm_simple_kms_helper.h>
> +
>  struct arcpgu_drm_private {
>  	struct drm_device	drm;
>  	void __iomem		*regs;
>  	struct clk		*clk;
> -	struct drm_crtc		crtc;
> -	struct drm_plane	*plane;
> +	struct drm_simple_display_pipe pipe;
>  };
>  
>  #define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
>  
> -#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
> +#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, pipe.crtc)
>  
>  static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
>  				 unsigned int reg, u32 value)
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index ba796a216244..88ba2e284fc0 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -182,9 +182,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
>  	struct drm_plane *plane = NULL;
>  	int ret;
>  
> -	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> -	if (!plane)
> -		return ERR_PTR(-ENOMEM);
> +	plane = &arcpgu->pipe.plane;
>  
>  	ret = drm_universal_plane_init(drm, plane, 0xff, &arc_pgu_plane_funcs,
>  				       arc_pgu_supported_formats,
> @@ -195,7 +193,6 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
>  		return ERR_PTR(ret);
>  
>  	drm_plane_helper_add(plane, &arc_pgu_plane_helper_funcs);
> -	arcpgu->plane = plane;
>  
>  	return plane;
>  }
> @@ -210,13 +207,13 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, primary, NULL,
> +	ret = drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, NULL,
>  					&arc_pgu_crtc_funcs, NULL);
>  	if (ret) {
>  		arc_pgu_plane_destroy(primary);
>  		return ret;
>  	}
>  
> -	drm_crtc_helper_add(&arcpgu->crtc, &arc_pgu_crtc_helper_funcs);
> +	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index 81b8d7ae6623..a419f279e129 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -120,7 +120,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
>  	struct drm_device *drm = node->minor->dev;
>  	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	unsigned long clkrate = clk_get_rate(arcpgu->clk);
> -	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
> +	unsigned long mode_clock = arcpgu->pipe.crtc.mode.crtc_clock * 1000;
>  
>  	seq_printf(m, "hw  : %lu\n", clkrate);
>  	seq_printf(m, "mode: %lu\n", mode_clock);
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> index 52839934f2fb..dbad2c9237fe 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -18,14 +18,13 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
>  
>  int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  {
> +	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	struct drm_encoder *encoder;
>  	struct drm_bridge *bridge;
>  
>  	int ret = 0;
>  
> -	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
> -	if (encoder == NULL)
> -		return -ENOMEM;
> +	encoder = &arcpgu->pipe.encoder;
>  
>  	/* Locate drm bridge from the hdmi encoder DT node */
>  	bridge = of_drm_find_bridge(np);
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index 37d961668dfe..134afb9fa625 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -56,14 +56,13 @@ static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
>  
>  int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  {
> +	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	struct arcpgu_drm_connector *arcpgu_connector;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	int ret;
>  
> -	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
> -	if (encoder == NULL)
> -		return -ENOMEM;
> +	encoder = &arcpgu->pipe.encoder;
>  
>  	encoder->possible_crtcs = 1;
>  	encoder->possible_clones = 0;
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
