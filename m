Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C5155A34
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A11E6E05F;
	Fri,  7 Feb 2020 14:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B396E05F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 14:57:47 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 31F6529422D;
 Fri,  7 Feb 2020 14:57:46 +0000 (GMT)
Date: Fri, 7 Feb 2020 15:57:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 07/11] drm/meson: meson_dw_hdmi: add bridge and
 switch to drm_bridge_funcs
Message-ID: <20200207155743.24ee9bf0@collabora.com>
In-Reply-To: <20200206191834.6125-8-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
 <20200206191834.6125-8-narmstrong@baylibre.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu,  6 Feb 2020 20:18:30 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Switch the dw-hdmi driver to drm_bridge_funcs by implementing a new local
> bridge, connecting it to the dw-hdmi bridge, then implement the
> atomic_get_input_bus_fmts/atomic_get_output_bus_fmts.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 105 +++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 3bb7ffe5fc39..4b3809626f7e 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -16,6 +16,7 @@
>  
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> @@ -135,6 +136,7 @@ struct meson_dw_hdmi_data {
>  
>  struct meson_dw_hdmi {
>  	struct drm_encoder encoder;
> +	struct drm_bridge bridge;
>  	struct dw_hdmi_plat_data dw_plat_data;
>  	struct meson_drm *priv;
>  	struct device *dev;
> @@ -151,6 +153,8 @@ struct meson_dw_hdmi {
>  };
>  #define encoder_to_meson_dw_hdmi(x) \
>  	container_of(x, struct meson_dw_hdmi, encoder)
> +#define bridge_to_meson_dw_hdmi(x) \
> +	container_of(x, struct meson_dw_hdmi, bridge)
>  
>  static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
>  					const char *compat)
> @@ -368,7 +372,7 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
>  }
>  
>  static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
> -			     struct drm_display_mode *mode)
> +			     const struct drm_display_mode *mode)
>  {
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
> @@ -663,6 +667,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>  
>  /* Encoder */
>  
> +static const u32 meson_dw_hdmi_out_bus_fmts[] = {
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +};
> +
>  static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
>  {
>  	drm_encoder_cleanup(encoder);
> @@ -672,16 +680,63 @@ static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
>  	.destroy        = meson_venc_hdmi_encoder_destroy,
>  };
>  
> -static int meson_venc_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +static u32 *
> +meson_venc_hdmi_encoder_get_out_bus_fmts(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *bridge_state,
> +					 struct drm_crtc_state *crtc_state,
> +					 struct drm_connector_state *conn_state,
> +					 unsigned int *num_output_fmts)
> +{
> +	u32 *output_fmts;
> +
> +	*num_output_fmts = ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts);
> +	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	memcpy(output_fmts, meson_dw_hdmi_out_bus_fmts, *num_output_fmts);
> +
> +	return output_fmts;
> +}
> +
> +static u32 *
> +meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts = NULL;
> +
> +	if (output_fmt == meson_dw_hdmi_out_bus_fmts[0]) {
> +		*num_input_fmts = 1;
> +		input_fmts = kcalloc(*num_input_fmts,
> +				     sizeof(*input_fmts),
> +				     GFP_KERNEL);
> +		if (!input_fmts)
> +			return NULL;
> +
> +		input_fmts[0] = output_fmt;
> +	} else {
> +		*num_input_fmts = 0;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
>  					struct drm_crtc_state *crtc_state,
>  					struct drm_connector_state *conn_state)
>  {
>  	return 0;
>  }
>  
> -static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
> +static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
>  {
> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  
>  	DRM_DEBUG_DRIVER("\n");
> @@ -693,9 +748,9 @@ static void meson_venc_hdmi_encoder_disable(struct drm_encoder *encoder)
>  	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
>  }
>  
> -static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
> +static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
>  {
> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  
>  	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
> @@ -706,11 +761,11 @@ static void meson_venc_hdmi_encoder_enable(struct drm_encoder *encoder)
>  		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
>  }
>  
> -static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
> -				   struct drm_display_mode *mode,
> -				   struct drm_display_mode *adjusted_mode)
> +static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
>  {
> -	struct meson_dw_hdmi *dw_hdmi = encoder_to_meson_dw_hdmi(encoder);
> +	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	int vic = drm_match_cea_mode(mode);
>  
> @@ -726,12 +781,16 @@ static void meson_venc_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>  	writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
>  }
>  
> -static const struct drm_encoder_helper_funcs
> -				meson_venc_hdmi_encoder_helper_funcs = {
> -	.atomic_check	= meson_venc_hdmi_encoder_atomic_check,
> -	.disable	= meson_venc_hdmi_encoder_disable,
> -	.enable		= meson_venc_hdmi_encoder_enable,
> -	.mode_set	= meson_venc_hdmi_encoder_mode_set,
> +static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_output_bus_fmts = meson_venc_hdmi_encoder_get_out_bus_fmts,

Hm, can this bridge element be connected directly to the HDMI connector
without the dw-hdmi bridge in the middle? If that's not the case, then
you probably don't have to implement ->atomic_get_output_bus_fmts()
(only used on the last bridge element).

> +	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_check = meson_venc_hdmi_encoder_atomic_check,
> +	.enable	= meson_venc_hdmi_encoder_enable,
> +	.disable = meson_venc_hdmi_encoder_disable,
> +	.mode_set = meson_venc_hdmi_encoder_mode_set,
>  };
>  
>  /* DW HDMI Regmap */
> @@ -852,6 +911,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	struct drm_device *drm = data;
>  	struct meson_drm *priv = drm->dev_private;
>  	struct dw_hdmi_plat_data *dw_plat_data;
> +	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
>  	struct resource *res;
>  	int irq;
> @@ -953,8 +1013,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	/* Encoder */
>  
> -	drm_encoder_helper_add(encoder, &meson_venc_hdmi_encoder_helper_funcs);
> -
>  	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
>  			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
>  	if (ret) {
> @@ -962,6 +1020,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>  
> +	meson_dw_hdmi->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
> +	drm_bridge_attach(encoder, &meson_dw_hdmi->bridge, NULL);
> +
>  	encoder->possible_crtcs = BIT(0);
>  
>  	DRM_DEBUG_DRIVER("encoder initialized\n");
> @@ -984,11 +1045,15 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, meson_dw_hdmi);
>  
> -	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
> -					   &meson_dw_hdmi->dw_plat_data);
> +	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev,
> +					    &meson_dw_hdmi->dw_plat_data);
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> +	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
> +	if (next_bridge)
> +		drm_bridge_attach(encoder, next_bridge, &meson_dw_hdmi->bridge);
> +
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>  
>  	return 0;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
