Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D53232B6A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 07:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3C86E853;
	Thu, 30 Jul 2020 05:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB266E853
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 05:33:44 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id BA75D804E5;
 Thu, 30 Jul 2020 07:33:41 +0200 (CEST)
Date: Thu, 30 Jul 2020 07:33:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] drm/ingenic: ipu: Only enable clock when needed
Message-ID: <20200730053340.GC1429781@ravnborg.org>
References: <20200730014626.83895-1-paul@crapouillou.net>
 <20200730014626.83895-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730014626.83895-4-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=ER_8r6IbAAAA:8
 a=aZ_HzrPzBHF4GxD21xUA:9 a=THfZoiQRlKttx8i7:21 a=zS6DgMrn1oIVMBE9:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 03:46:26AM +0200, Paul Cercueil wrote:
> Instead of keeping the IPU clock enabled constantly, enable and disable
> it on demand, when the IPU plane is used.

This explains what the patch does - but fails to mention why.
Could you please add the why part too.

With the chagelog updated:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-ipu.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index f4f0abcd6692..17e682cf1eba 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -49,6 +49,7 @@ struct ingenic_ipu {
>  	struct regmap *map;
>  	struct clk *clk;
>  	const struct soc_info *soc_info;
> +	bool clk_enabled;
>  
>  	unsigned int num_w, num_h, denom_w, denom_h;
>  
> @@ -288,12 +289,23 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>  	const struct drm_format_info *finfo;
>  	u32 ctrl, stride = 0, coef_index = 0, format = 0;
>  	bool needs_modeset, upscaling_w, upscaling_h;
> +	int err;
>  
>  	if (!state || !state->fb)
>  		return;
>  
>  	finfo = drm_format_info(state->fb->format->format);
>  
> +	if (!ipu->clk_enabled) {
> +		err = clk_enable(ipu->clk);
> +		if (err) {
> +			dev_err(ipu->dev, "Unable to enable clock: %d\n", err);
> +			return;
> +		}
> +
> +		ipu->clk_enabled = true;
> +	}
> +
>  	/* Reset all the registers if needed */
>  	needs_modeset = drm_atomic_crtc_needs_modeset(state->crtc->state);
>  	if (needs_modeset) {
> @@ -578,6 +590,11 @@ static void ingenic_ipu_plane_atomic_disable(struct drm_plane *plane,
>  	regmap_clear_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CHIP_EN);
>  
>  	ingenic_drm_plane_disable(ipu->master, plane);
> +
> +	if (ipu->clk_enabled) {
> +		clk_disable(ipu->clk);
> +		ipu->clk_enabled = false;
> +	}
>  }
>  
>  static const struct drm_plane_helper_funcs ingenic_ipu_plane_helper_funcs = {
> @@ -761,9 +778,9 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
>  	drm_object_attach_property(&plane->base, ipu->sharpness_prop,
>  				   ipu->sharpness);
>  
> -	err = clk_prepare_enable(ipu->clk);
> +	err = clk_prepare(ipu->clk);
>  	if (err) {
> -		dev_err(dev, "Unable to enable clock\n");
> +		dev_err(dev, "Unable to prepare clock\n");
>  		return err;
>  	}
>  
> @@ -775,7 +792,7 @@ static void ingenic_ipu_unbind(struct device *dev,
>  {
>  	struct ingenic_ipu *ipu = dev_get_drvdata(dev);
>  
> -	clk_disable_unprepare(ipu->clk);
> +	clk_unprepare(ipu->clk);
>  }
>  
>  static const struct component_ops ingenic_ipu_ops = {
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
