Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC58290AF1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34F16EE62;
	Fri, 16 Oct 2020 17:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A2406EE59
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:45:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 276F420030;
 Fri, 16 Oct 2020 19:44:57 +0200 (CEST)
Date: Fri, 16 Oct 2020 19:44:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/stm: Fix bus_flags handling
Message-ID: <20201016174455.GB1333109@ravnborg.org>
References: <20201002230726.242035-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002230726.242035-1-marex@denx.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=JfrnYn6hAAAA:8 a=phlkwaE_AAAA:8 a=e5mUnYsNAAAA:8 a=ojO73d0HoZBe9djj3HsA:9
 a=ofG4AT292ph245RH:21 a=WyLLEquR_rB0hqcw:21 a=CjuIK1q_8ugA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=uKTQOUHymn4LaG7oTSIC:22
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek.

On Sat, Oct 03, 2020 at 01:07:26AM +0200, Marek Vasut wrote:
> The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
> or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode.

So after reading this paragrahp I assumed this patch would fix this, alas
there is no changes to drm_modes.c.
Rather than introducing hacks could we try to fix the root cause here?

Root cause - as you point out is that there is missing some flags in
the conversion.
Another point is that the stm driver could drop the use of
drm_display_mode_to_videomode() - all the information is available in drm_display_mode
and using drm_display_mode_to_videomode() does not help much.

If the point is to have easier access to hsync and friendns maybe we
should have a few helpers operating direct on display_mode and not this
conversion to video_mode which is something that belongs to fbdev and
should IMO not be used inside a drm driver.

	Sam

> Therefore, no
> matter what polarity the next bridge or display might require, these flags
> are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set,
> and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and
> DISPLAY_FLAGS_DE_HIGH were always set.
> 
> The fix for this problem is taken almost verbatim from MXSFB driver. In
> case there is a bridge attached to the LTDC, the bridge might have extra
> polarity requirements, so extract bus_flags from the bridge and use them
> for LTDC configuration. Otherwise, extract bus_flags from the connector,
> which is the display.
> 
> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/stm/ltdc.c | 22 ++++++++++++++++++++--
>  drivers/gpu/drm/stm/ltdc.h |  2 ++
>  2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 07c73079293c..a282a1553497 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -546,11 +546,17 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	struct drm_device *ddev = crtc->dev;
>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>  	struct videomode vm;
> +	u32 bus_flags = 0;
>  	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
>  	u32 total_width, total_height;
>  	u32 val;
>  	int ret;
>  
> +	if (ldev->bridge)
> +		bus_flags = ldev->bridge->timings->input_bus_flags;
> +	else if (ldev->connector)
> +		bus_flags = ldev->connector->display_info.bus_flags;
> +
>  	if (!pm_runtime_active(ddev->dev)) {
>  		ret = pm_runtime_get_sync(ddev->dev);
>  		if (ret) {
> @@ -586,10 +592,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
>  		val |= GCR_VSPOL;
>  
> -	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
> +	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
>  		val |= GCR_DEPOL;
>  
> -	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
> +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
>  		val |= GCR_PCPOL;
>  
>  	reg_update_bits(ldev->regs, LTDC_GCR,
> @@ -1098,6 +1104,8 @@ static const struct drm_encoder_helper_funcs ltdc_encoder_helper_funcs = {
>  
>  static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>  {
> +	struct ltdc_device *ldev = ddev->dev_private;
> +	struct drm_connector_list_iter iter;
>  	struct drm_encoder *encoder;
>  	int ret;
>  
> @@ -1119,6 +1127,16 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
>  		return -EINVAL;
>  	}
>  
> +	ldev->bridge = bridge;
> +
> +	/*
> +	 * Get hold of the connector. This is a bit of a hack, until the bridge
> +	 * API gives us bus flags and formats.
> +	 */
> +	drm_connector_list_iter_begin(ddev, &iter);
> +	ldev->connector = drm_connector_list_iter_next(&iter);
> +	drm_connector_list_iter_end(&iter);
> +
>  	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index f153b908c70e..d0d2c81de29a 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -38,6 +38,8 @@ struct ltdc_device {
>  	u32 irq_status;
>  	struct fps_info plane_fpsi[LTDC_MAX_LAYER];
>  	struct drm_atomic_state *suspend_state;
> +	struct drm_bridge *bridge;
> +	struct drm_connector *connector;
>  };
>  
>  int ltdc_load(struct drm_device *ddev);
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
