Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AD1B7C04
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70FD89DDD;
	Fri, 24 Apr 2020 16:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB10D89E0D;
 Fri, 24 Apr 2020 16:46:29 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0F6CB20031;
 Fri, 24 Apr 2020 18:46:28 +0200 (CEST)
Date: Fri, 24 Apr 2020 18:46:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 40/59] drm/arcpgu: Stop using drm_device->dev_private
Message-ID: <20200424164626.GD3822@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-41-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-41-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=UE4azgwP8ybmmgDYK6AA:9 a=CjuIK1q_8ugA:10
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

Hi Daniel.

On Wed, Apr 15, 2020 at 09:40:15AM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

Subject: drm/arc: arcpgu: Stop using drm_device->dev_private

And another bikeshedding below.
With this considered:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/arc/arcpgu.h      | 2 ++
>  drivers/gpu/drm/arc/arcpgu_crtc.c | 4 ++--
>  drivers/gpu/drm/arc/arcpgu_drv.c  | 4 +---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index cd9e932f501e..87821c91a00c 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -17,6 +17,8 @@ struct arcpgu_drm_private {
>  	struct drm_plane	*plane;
>  };
>  
> +#define dev_to_arcpgu(x) container_of(x, struct arcpgu_drm_private, drm)
> +
Preferred name is to_arcgpu(). There is no device in the name of struct
arcpgu_drm_private. And the general consensus it to use to_<driver> for
the top-level struct.

>  #define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
>  
>  static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index be7c29cec318..ba796a216244 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -178,7 +178,7 @@ static const struct drm_plane_funcs arc_pgu_plane_funcs = {
>  
>  static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
>  {
> -	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	struct drm_plane *plane = NULL;
>  	int ret;
>  
> @@ -202,7 +202,7 @@ static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
>  
>  int arc_pgu_setup_crtc(struct drm_device *drm)
>  {
> -	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	struct drm_plane *primary;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index bbd7acb150f3..81b8d7ae6623 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -50,8 +50,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	struct resource *res;
>  	int ret;
>  
> -	drm->dev_private = arcpgu;
> -
>  	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
>  	if (IS_ERR(arcpgu->clk))
>  		return PTR_ERR(arcpgu->clk);
> @@ -120,7 +118,7 @@ static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
>  {
>  	struct drm_info_node *node = (struct drm_info_node *)m->private;
>  	struct drm_device *drm = node->minor->dev;
> -	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
>  	unsigned long clkrate = clk_get_rate(arcpgu->clk);
>  	unsigned long mode_clock = arcpgu->crtc.mode.crtc_clock * 1000;
>  
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
