Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910D1A1CF8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA46A6E994;
	Wed,  8 Apr 2020 07:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8F6E990;
 Wed,  8 Apr 2020 07:58:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1BBC420027;
 Wed,  8 Apr 2020 09:58:42 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:58:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 33/44] drm/mcde: Don't use drm_device->dev_private
Message-ID: <20200408075840.GO14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-34-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-34-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=JmR83cBPlZ_W28VoVJ4A:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=E9Po1WZjFZOl8hwRPBS3:22
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

On Fri, Apr 03, 2020 at 03:58:17PM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/mcde/mcde_display.c | 10 +++++-----
>  drivers/gpu/drm/mcde/mcde_drm.h     |  2 ++
>  drivers/gpu/drm/mcde/mcde_drv.c     |  5 ++---
>  drivers/gpu/drm/mcde/mcde_dsi.c     |  2 +-
>  4 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
> index e59907e68854..04e1d38d41f7 100644
> --- a/drivers/gpu/drm/mcde/mcde_display.c
> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> @@ -948,7 +948,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
>  {
>  	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_device *drm = crtc->dev;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	struct drm_pending_vblank_event *event;
>  
>  	drm_crtc_vblank_off(crtc);
> @@ -1020,7 +1020,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>  {
>  	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_device *drm = crtc->dev;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	struct drm_pending_vblank_event *event = crtc->state->event;
>  	struct drm_plane *plane = &pipe->plane;
>  	struct drm_plane_state *pstate = plane->state;
> @@ -1078,7 +1078,7 @@ static int mcde_display_enable_vblank(struct drm_simple_display_pipe *pipe)
>  {
>  	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_device *drm = crtc->dev;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	u32 val;
>  
>  	/* Enable all VBLANK IRQs */
> @@ -1097,7 +1097,7 @@ static void mcde_display_disable_vblank(struct drm_simple_display_pipe *pipe)
>  {
>  	struct drm_crtc *crtc = &pipe->crtc;
>  	struct drm_device *drm = crtc->dev;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  
>  	/* Disable all VBLANK IRQs */
>  	writel(0, mcde->regs + MCDE_IMSCPP);
> @@ -1117,7 +1117,7 @@ static struct drm_simple_display_pipe_funcs mcde_display_funcs = {
>  
>  int mcde_display_init(struct drm_device *drm)
>  {
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	int ret;
>  	static const u32 formats[] = {
>  		DRM_FORMAT_ARGB8888,
> diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
> index 80edd6628979..679c2c4e6d9d 100644
> --- a/drivers/gpu/drm/mcde/mcde_drm.h
> +++ b/drivers/gpu/drm/mcde/mcde_drm.h
> @@ -34,6 +34,8 @@ struct mcde {
>  	struct regulator *vana;
>  };
>  
> +#define to_mcde(dev) container_of(dev, struct mcde, drm)
> +
>  bool mcde_dsi_irq(struct mipi_dsi_device *mdsi);
>  void mcde_dsi_te_request(struct mipi_dsi_device *mdsi);
>  extern struct platform_driver mcde_dsi_driver;
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index bdb525e3c5d7..84f3e2dbd77b 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -164,7 +164,7 @@ static irqreturn_t mcde_irq(int irq, void *data)
>  static int mcde_modeset_init(struct drm_device *drm)
>  {
>  	struct drm_mode_config *mode_config;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	int ret;
>  
>  	if (!mcde->bridge) {
> @@ -311,7 +311,6 @@ static int mcde_probe(struct platform_device *pdev)
>  	if (IS_ERR(mcde))
>  		return PTR_ERR(mcde);
>  	drm = &mcde->drm;
> -	drm->dev_private = mcde;
>  	mcde->dev = dev;
>  	platform_set_drvdata(pdev, drm);
>  
> @@ -486,7 +485,7 @@ static int mcde_probe(struct platform_device *pdev)
>  static int mcde_remove(struct platform_device *pdev)
>  {
>  	struct drm_device *drm = platform_get_drvdata(pdev);
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  
>  	component_master_del(&pdev->dev, &mcde_drm_comp_ops);
>  	clk_disable_unprepare(mcde->mcde_clk);
> diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
> index 7af5ebb0c436..1baa2324cdb9 100644
> --- a/drivers/gpu/drm/mcde/mcde_dsi.c
> +++ b/drivers/gpu/drm/mcde/mcde_dsi.c
> @@ -1020,7 +1020,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
>  			 void *data)
>  {
>  	struct drm_device *drm = data;
> -	struct mcde *mcde = drm->dev_private;
> +	struct mcde *mcde = to_mcde(drm);
>  	struct mcde_dsi *d = dev_get_drvdata(dev);
>  	struct device_node *child;
>  	struct drm_panel *panel = NULL;
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
