Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA642E0D1
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 20:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD866EB7A;
	Thu, 14 Oct 2021 18:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4856EB7A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 18:07:54 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id a54a012e-2d19-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 18:07:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 670E8194B13;
 Thu, 14 Oct 2021 20:07:58 +0200 (CEST)
Date: Thu, 14 Oct 2021 20:07:48 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/meson: split out encoder from meson_dw_hdmi
Message-ID: <YWhx9JELD7kh0pa9@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-4-narmstrong@baylibre.com>
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

Hi Neil,

I did not verify all the code movements - but it looked correct from a
quick glance.
A few comments below, especially the use of mode_set() should be
addressed as it is deprecated.

	Sam

On Thu, Oct 14, 2021 at 05:26:02PM +0200, Neil Armstrong wrote:
> This moves all the non-DW-HDMI code where it should be:
> an encoder in the drm/meson core driver.
> 
> The bridge functions are copied as-is, the encoder init uses the
> simple kms helper and for now the bridge attach flags is 0.
> 
> The meson dw-hdmi glue is slighly fixed to live without the
> encoder in the same driver.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/Makefile             |   1 +
>  drivers/gpu/drm/meson/meson_drv.c          |   5 +
>  drivers/gpu/drm/meson/meson_dw_hdmi.c      | 341 ++-----------------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c | 359 +++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_encoder_hdmi.h |  12 +
>  5 files changed, 396 insertions(+), 322 deletions(-)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
> 
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> index 28a519cdf66b..523fce45f16b 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -2,6 +2,7 @@
>  meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_venc_cvbs.o
>  meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
>  meson-drm-y += meson_rdma.o meson_osd_afbcd.o
> +meson-drm-y += meson_encoder_hdmi.o
>  
>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index b53606d8825f..0a28a8e29d63 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -32,6 +32,7 @@
>  #include "meson_osd_afbcd.h"
>  #include "meson_registers.h"
>  #include "meson_venc_cvbs.h"
> +#include "meson_encoder_hdmi.h"
>  #include "meson_viu.h"
>  #include "meson_vpp.h"
>  #include "meson_rdma.h"
> @@ -319,6 +320,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  		}
>  	}
>  
> +	ret = meson_encoder_hdmi_init(priv);
> +	if (ret)
> +		goto free_drm;
> +
>  	ret = meson_plane_create(priv);
>  	if (ret)
>  		goto free_drm;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2ed87cfdd735..c2480b3335ac 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -22,14 +22,11 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_print.h>
>  
> -#include <linux/media-bus-format.h>
>  #include <linux/videodev2.h>
>  
>  #include "meson_drv.h"
>  #include "meson_dw_hdmi.h"
>  #include "meson_registers.h"
> -#include "meson_vclk.h"
> -#include "meson_venc.h"
>  
>  #define DRIVER_NAME "meson-dw-hdmi"
>  #define DRIVER_DESC "Amlogic Meson HDMI-TX DRM driver"
> @@ -135,8 +132,6 @@ struct meson_dw_hdmi_data {
>  };
>  
>  struct meson_dw_hdmi {
> -	struct drm_encoder encoder;
> -	struct drm_bridge bridge;
>  	struct dw_hdmi_plat_data dw_plat_data;
>  	struct meson_drm *priv;
>  	struct device *dev;
> @@ -148,12 +143,8 @@ struct meson_dw_hdmi {
>  	struct regulator *hdmi_supply;
>  	u32 irq_stat;
>  	struct dw_hdmi *hdmi;
> -	unsigned long output_bus_fmt;
> +	struct drm_bridge *bridge;
>  };
> -#define encoder_to_meson_dw_hdmi(x) \
> -	container_of(x, struct meson_dw_hdmi, encoder)
> -#define bridge_to_meson_dw_hdmi(x) \
> -	container_of(x, struct meson_dw_hdmi, bridge)
>  
>  static inline int dw_hdmi_is_compatible(struct meson_dw_hdmi *dw_hdmi,
>  					const char *compat)
> @@ -295,14 +286,14 @@ static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
>  
>  /* Setup PHY bandwidth modes */
>  static void meson_hdmi_phy_setup_mode(struct meson_dw_hdmi *dw_hdmi,
> -				      const struct drm_display_mode *mode)
> +				      const struct drm_display_mode *mode,
> +				      bool mode_is_420)
>  {
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	unsigned int pixel_clock = mode->clock;
>  
>  	/* For 420, pixel clock is half unlike venc clock */
> -	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> -		pixel_clock /= 2;
> +	if (mode_is_420) pixel_clock /= 2;
>  
>  	if (dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
>  	    dw_hdmi_is_compatible(dw_hdmi, "amlogic,meson-gxm-dw-hdmi")) {
> @@ -374,68 +365,25 @@ static inline void meson_dw_hdmi_phy_reset(struct meson_dw_hdmi *dw_hdmi)
>  	mdelay(2);
>  }
>  
> -static void dw_hdmi_set_vclk(struct meson_dw_hdmi *dw_hdmi,
> -			     const struct drm_display_mode *mode)
> -{
> -	struct meson_drm *priv = dw_hdmi->priv;
> -	int vic = drm_match_cea_mode(mode);
> -	unsigned int phy_freq;
> -	unsigned int vclk_freq;
> -	unsigned int venc_freq;
> -	unsigned int hdmi_freq;
> -
> -	vclk_freq = mode->clock;
> -
> -	/* For 420, pixel clock is half unlike venc clock */
> -	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> -		vclk_freq /= 2;
> -
> -	/* TMDS clock is pixel_clock * 10 */
> -	phy_freq = vclk_freq * 10;
> -
> -	if (!vic) {
> -		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
> -				 vclk_freq, vclk_freq, vclk_freq, false);
> -		return;
> -	}
> -
> -	/* 480i/576i needs global pixel doubling */
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		vclk_freq *= 2;
> -
> -	venc_freq = vclk_freq;
> -	hdmi_freq = vclk_freq;
> -
> -	/* VENC double pixels for 1080i, 720p and YUV420 modes */
> -	if (meson_venc_hdmi_venc_repeat(vic) ||
> -	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> -		venc_freq *= 2;
> -
> -	vclk_freq = max(venc_freq, hdmi_freq);
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		venc_freq /= 2;
> -
> -	DRM_DEBUG_DRIVER("vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
> -		phy_freq, vclk_freq, venc_freq, hdmi_freq,
> -		priv->venc.hdmi_use_enci);
> -
> -	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
> -			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
> -}
> -
>  static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>  			    const struct drm_display_info *display,
>  			    const struct drm_display_mode *mode)
>  {
>  	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
> +	bool is_hdmi2_sink = display->hdmi.scdc.supported;
>  	struct meson_drm *priv = dw_hdmi->priv;
>  	unsigned int wr_clk =
>  		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
> +	bool mode_is_420 = false;
>  
>  	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
>  			 mode->clock > 340000 ? 40 : 10);
>  
> +	if (drm_mode_is_420_only(display, mode) ||
> +	    (!is_hdmi2_sink &&
> +	     drm_mode_is_420_also(display, mode)))
> +		mode_is_420 = true;
> +
>  	/* Enable clocks */
>  	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
>  
> @@ -457,8 +405,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>  	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
>  
>  	/* TMDS pattern setup */
> -	if (mode->clock > 340000 &&
> -	    dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_YUV8_1X24) {
> +	if (mode->clock > 340000 && !mode_is_420) {
>  		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
>  				  0);
>  		dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
> @@ -476,7 +423,7 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>  	dw_hdmi->data->top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x2);
>  
>  	/* Setup PHY parameters */
> -	meson_hdmi_phy_setup_mode(dw_hdmi, mode);
> +	meson_hdmi_phy_setup_mode(dw_hdmi, mode, mode_is_420);
>  
>  	/* Setup PHY */
>  	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1,
> @@ -622,214 +569,15 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>  		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
>  				       hpd_connected);
>  
> -		drm_helper_hpd_irq_event(dw_hdmi->encoder.dev);
> +		drm_helper_hpd_irq_event(dw_hdmi->bridge->dev);
> +		drm_bridge_hpd_notify(dw_hdmi->bridge,
> +				      hpd_connected ? connector_status_connected
> +						    : connector_status_disconnected);
>  	}
>  
>  	return IRQ_HANDLED;
>  }
>  
> -static enum drm_mode_status
> -dw_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> -		   const struct drm_display_info *display_info,
> -		   const struct drm_display_mode *mode)
> -{
> -	struct meson_dw_hdmi *dw_hdmi = data;
> -	struct meson_drm *priv = dw_hdmi->priv;
> -	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> -	unsigned int phy_freq;
> -	unsigned int vclk_freq;
> -	unsigned int venc_freq;
> -	unsigned int hdmi_freq;
> -	int vic = drm_match_cea_mode(mode);
> -	enum drm_mode_status status;
> -
> -	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> -
> -	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
> -	if (display_info->max_tmds_clock &&
> -	    mode->clock > display_info->max_tmds_clock &&
> -	    !drm_mode_is_420_only(display_info, mode) &&
> -	    !drm_mode_is_420_also(display_info, mode))
> -		return MODE_BAD;
> -
> -	/* Check against non-VIC supported modes */
> -	if (!vic) {
> -		status = meson_venc_hdmi_supported_mode(mode);
> -		if (status != MODE_OK)
> -			return status;
> -
> -		return meson_vclk_dmt_supported_freq(priv, mode->clock);
> -	/* Check against supported VIC modes */
> -	} else if (!meson_venc_hdmi_supported_vic(vic))
> -		return MODE_BAD;
> -
> -	vclk_freq = mode->clock;
> -
> -	/* For 420, pixel clock is half unlike venc clock */
> -	if (drm_mode_is_420_only(display_info, mode) ||
> -	    (!is_hdmi2_sink &&
> -	     drm_mode_is_420_also(display_info, mode)))
> -		vclk_freq /= 2;
> -
> -	/* TMDS clock is pixel_clock * 10 */
> -	phy_freq = vclk_freq * 10;
> -
> -	/* 480i/576i needs global pixel doubling */
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		vclk_freq *= 2;
> -
> -	venc_freq = vclk_freq;
> -	hdmi_freq = vclk_freq;
> -
> -	/* VENC double pixels for 1080i, 720p and YUV420 modes */
> -	if (meson_venc_hdmi_venc_repeat(vic) ||
> -	    drm_mode_is_420_only(display_info, mode) ||
> -	    (!is_hdmi2_sink &&
> -	     drm_mode_is_420_also(display_info, mode)))
> -		venc_freq *= 2;
> -
> -	vclk_freq = max(venc_freq, hdmi_freq);
> -
> -	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> -		venc_freq /= 2;
> -
> -	dev_dbg(dw_hdmi->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
> -		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
> -
> -	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
> -}
> -
> -/* Encoder */
> -
> -static const u32 meson_dw_hdmi_out_bus_fmts[] = {
> -	MEDIA_BUS_FMT_YUV8_1X24,
> -	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> -};
> -
> -static void meson_venc_hdmi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs meson_venc_hdmi_encoder_funcs = {
> -	.destroy        = meson_venc_hdmi_encoder_destroy,
> -};
> -
> -static u32 *
> -meson_venc_hdmi_encoder_get_inp_bus_fmts(struct drm_bridge *bridge,
> -					struct drm_bridge_state *bridge_state,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state,
> -					u32 output_fmt,
> -					unsigned int *num_input_fmts)
> -{
> -	u32 *input_fmts = NULL;
> -	int i;
> -
> -	*num_input_fmts = 0;
> -
> -	for (i = 0 ; i < ARRAY_SIZE(meson_dw_hdmi_out_bus_fmts) ; ++i) {
> -		if (output_fmt == meson_dw_hdmi_out_bus_fmts[i]) {
> -			*num_input_fmts = 1;
> -			input_fmts = kcalloc(*num_input_fmts,
> -					     sizeof(*input_fmts),
> -					     GFP_KERNEL);
> -			if (!input_fmts)
> -				return NULL;
> -
> -			input_fmts[0] = output_fmt;
> -
> -			break;
> -		}
> -	}
> -
> -	return input_fmts;
> -}
> -
> -static int meson_venc_hdmi_encoder_atomic_check(struct drm_bridge *bridge,
> -					struct drm_bridge_state *bridge_state,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state)
> -{
> -	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
> -
> -	dw_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.format;
> -
> -	DRM_DEBUG_DRIVER("output_bus_fmt %lx\n", dw_hdmi->output_bus_fmt);
> -
> -	return 0;
> -}
> -
> -static void meson_venc_hdmi_encoder_disable(struct drm_bridge *bridge)
> -{
> -	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
> -	struct meson_drm *priv = dw_hdmi->priv;
> -
> -	DRM_DEBUG_DRIVER("\n");
> -
> -	writel_bits_relaxed(0x3, 0,
> -			    priv->io_base + _REG(VPU_HDMI_SETTING));
> -
> -	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
> -	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
> -}
> -
> -static void meson_venc_hdmi_encoder_enable(struct drm_bridge *bridge)
> -{
> -	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
> -	struct meson_drm *priv = dw_hdmi->priv;
> -
> -	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
> -
> -	if (priv->venc.hdmi_use_enci)
> -		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
> -	else
> -		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
> -}
> -
> -static void meson_venc_hdmi_encoder_mode_set(struct drm_bridge *bridge,
> -				   const struct drm_display_mode *mode,
> -				   const struct drm_display_mode *adjusted_mode)
> -{
> -	struct meson_dw_hdmi *dw_hdmi = bridge_to_meson_dw_hdmi(bridge);
> -	struct meson_drm *priv = dw_hdmi->priv;
> -	int vic = drm_match_cea_mode(mode);
> -	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
> -	bool yuv420_mode = false;
> -
> -	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
> -
> -	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
> -		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
> -		yuv420_mode = true;
> -	}
> -
> -	/* VENC + VENC-DVI Mode setup */
> -	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
> -
> -	/* VCLK Set clock */
> -	dw_hdmi_set_vclk(dw_hdmi, mode);
> -
> -	if (dw_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> -		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
> -		writel_relaxed(2 | (2 << 2),
> -			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> -	else
> -		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
> -		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> -}
> -
> -static const struct drm_bridge_funcs meson_venc_hdmi_encoder_bridge_funcs = {
> -	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_get_input_bus_fmts = meson_venc_hdmi_encoder_get_inp_bus_fmts,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> -	.atomic_check = meson_venc_hdmi_encoder_atomic_check,
> -	.enable	= meson_venc_hdmi_encoder_enable,
> -	.disable = meson_venc_hdmi_encoder_disable,
> -	.mode_set = meson_venc_hdmi_encoder_mode_set,
> -};
> -
>  /* DW HDMI Regmap */
>  
>  static int meson_dw_hdmi_reg_read(void *context, unsigned int reg,
> @@ -876,28 +624,6 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
>  	.dwc_write = dw_hdmi_g12a_dwc_write,
>  };
>  
> -static bool meson_hdmi_connector_is_available(struct device *dev)
> -{
> -	struct device_node *ep, *remote;
> -
> -	/* HDMI Connector is on the second port, first endpoint */
> -	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
> -	if (!ep)
> -		return false;
> -
> -	/* If the endpoint node exists, consider it enabled */
> -	remote = of_graph_get_remote_port(ep);
> -	if (remote) {
> -		of_node_put(ep);
> -		return true;
> -	}
> -
> -	of_node_put(ep);
> -	of_node_put(remote);
> -
> -	return false;
> -}
> -
>  static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>  {
>  	struct meson_drm *priv = meson_dw_hdmi->priv;
> @@ -976,19 +702,12 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	struct drm_device *drm = data;
>  	struct meson_drm *priv = drm->dev_private;
>  	struct dw_hdmi_plat_data *dw_plat_data;
> -	struct drm_bridge *next_bridge;
> -	struct drm_encoder *encoder;
>  	struct resource *res;
>  	int irq;
>  	int ret;
>  
>  	DRM_DEBUG_DRIVER("\n");
>  
> -	if (!meson_hdmi_connector_is_available(dev)) {
> -		dev_info(drm->dev, "HDMI Output connector not available\n");
> -		return -ENODEV;
> -	}
> -
>  	match = of_device_get_match_data(&pdev->dev);
>  	if (!match) {
>  		dev_err(&pdev->dev, "failed to get match data\n");
> @@ -1004,7 +723,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	meson_dw_hdmi->dev = dev;
>  	meson_dw_hdmi->data = match;
>  	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
> -	encoder = &meson_dw_hdmi->encoder;
>  
>  	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
>  	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> @@ -1076,28 +794,11 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return ret;
>  	}
>  
> -	/* Encoder */
> -
> -	ret = drm_encoder_init(drm, encoder, &meson_venc_hdmi_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, "meson_hdmi");
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to init HDMI encoder\n");
> -		return ret;
> -	}
> -
> -	meson_dw_hdmi->bridge.funcs = &meson_venc_hdmi_encoder_bridge_funcs;
> -	drm_bridge_attach(encoder, &meson_dw_hdmi->bridge, NULL, 0);
> -
> -	encoder->possible_crtcs = BIT(0);
> -
>  	meson_dw_hdmi_init(meson_dw_hdmi);
>  
> -	DRM_DEBUG_DRIVER("encoder initialized\n");
> -
>  	/* Bridge / Connector */
>  
>  	dw_plat_data->priv_data = meson_dw_hdmi;
> -	dw_plat_data->mode_valid = dw_hdmi_mode_valid;
>  	dw_plat_data->phy_ops = &meson_dw_hdmi_phy_ops;
>  	dw_plat_data->phy_name = "meson_dw_hdmi_phy";
>  	dw_plat_data->phy_data = meson_dw_hdmi;
> @@ -1112,15 +813,11 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  
>  	platform_set_drvdata(pdev, meson_dw_hdmi);
>  
> -	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev,
> -					    &meson_dw_hdmi->dw_plat_data);
> +	meson_dw_hdmi->hdmi = dw_hdmi_probe(pdev, &meson_dw_hdmi->dw_plat_data);
>  	if (IS_ERR(meson_dw_hdmi->hdmi))
>  		return PTR_ERR(meson_dw_hdmi->hdmi);
>  
> -	next_bridge = of_drm_find_bridge(pdev->dev.of_node);
> -	if (next_bridge)
> -		drm_bridge_attach(encoder, next_bridge,
> -				  &meson_dw_hdmi->bridge, 0);
> +	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
>  
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>  
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> new file mode 100644
> index 000000000000..c775a1ab5b1e
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -0,0 +1,359 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2016 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
alphabetic order.
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
> +
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
> +
> +#include "meson_drv.h"
> +#include "meson_registers.h"
> +#include "meson_vclk.h"
> +#include "meson_venc.h"
> +
> +struct meson_encoder_hdmi {
> +	struct drm_encoder encoder;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct meson_drm *priv;
> +	unsigned long output_bus_fmt;
> +};
> +
> +#define bridge_to_meson_encoder_hdmi(x) \
> +	container_of(x, struct meson_encoder_hdmi, bridge)
> +
> +static int meson_encoder_hdmi_attach(struct drm_bridge *bridge,
> +				     enum drm_bridge_attach_flags flags)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, encoder_hdmi->next_bridge,
> +				 &encoder_hdmi->bridge, flags);
> +}
> +
> +static void meson_encoder_hdmi_enable(struct drm_bridge *bridge)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +	struct meson_drm *priv = encoder_hdmi->priv;
> +
> +	DRM_DEBUG_DRIVER("%s\n", priv->venc.hdmi_use_enci ? "VENCI" : "VENCP");
Bridge drivers mainly uses dev_xxx logging.
New drivers do not use the deprecated DRM_ logging.

This goes for all logging in this file.
Remember to drop include of drm_print.h


> +
> +	if (priv->venc.hdmi_use_enci)
> +		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
> +	else
> +		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
> +}
> +
> +static void meson_encoder_hdmi_disable(struct drm_bridge *bridge)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +	struct meson_drm *priv = encoder_hdmi->priv;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	writel_bits_relaxed(0x3, 0,
> +			    priv->io_base + _REG(VPU_HDMI_SETTING));
> +
> +	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
> +	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
> +}
> +
> +static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
> +					const struct drm_display_mode *mode)
> +{
> +	struct meson_drm *priv = encoder_hdmi->priv;
> +	int vic = drm_match_cea_mode(mode);
> +	unsigned int phy_freq;
> +	unsigned int vclk_freq;
> +	unsigned int venc_freq;
> +	unsigned int hdmi_freq;
> +
> +	vclk_freq = mode->clock;
> +
> +	/* For 420, pixel clock is half unlike venc clock */
> +	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> +		vclk_freq /= 2;
> +
> +	/* TMDS clock is pixel_clock * 10 */
> +	phy_freq = vclk_freq * 10;
> +
> +	if (!vic) {
> +		meson_vclk_setup(priv, MESON_VCLK_TARGET_DMT, phy_freq,
> +				 vclk_freq, vclk_freq, vclk_freq, false);
> +		return;
> +	}
> +
> +	/* 480i/576i needs global pixel doubling */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		vclk_freq *= 2;
> +
> +	venc_freq = vclk_freq;
> +	hdmi_freq = vclk_freq;
> +
> +	/* VENC double pixels for 1080i, 720p and YUV420 modes */
> +	if (meson_venc_hdmi_venc_repeat(vic) ||
> +	    encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> +		venc_freq *= 2;
> +
> +	vclk_freq = max(venc_freq, hdmi_freq);
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		venc_freq /= 2;
> +
> +	DRM_DEBUG_DRIVER("vclk:%d phy=%d venc=%d hdmi=%d enci=%d\n",
> +		phy_freq, vclk_freq, venc_freq, hdmi_freq,
> +		priv->venc.hdmi_use_enci);
> +
> +	meson_vclk_setup(priv, MESON_VCLK_TARGET_HDMI, phy_freq, vclk_freq,
> +			 venc_freq, hdmi_freq, priv->venc.hdmi_use_enci);
> +}
> +
> +static enum drm_mode_status meson_encoder_hdmi_mode_valid(struct drm_bridge *bridge,
> +					const struct drm_display_info *display_info,
> +					const struct drm_display_mode *mode)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +	struct meson_drm *priv = encoder_hdmi->priv;
> +	bool is_hdmi2_sink = display_info->hdmi.scdc.supported;
> +	unsigned int phy_freq;
> +	unsigned int vclk_freq;
> +	unsigned int venc_freq;
> +	unsigned int hdmi_freq;
> +	int vic = drm_match_cea_mode(mode);
> +	enum drm_mode_status status;
> +
> +	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +
> +	/* If sink does not support 540MHz, reject the non-420 HDMI2 modes */
> +	if (display_info->max_tmds_clock &&
> +	    mode->clock > display_info->max_tmds_clock &&
> +	    !drm_mode_is_420_only(display_info, mode) &&
> +	    !drm_mode_is_420_also(display_info, mode))
> +		return MODE_BAD;
> +
> +	/* Check against non-VIC supported modes */
> +	if (!vic) {
> +		status = meson_venc_hdmi_supported_mode(mode);
> +		if (status != MODE_OK)
> +			return status;
> +
> +		return meson_vclk_dmt_supported_freq(priv, mode->clock);
> +	/* Check against supported VIC modes */
> +	} else if (!meson_venc_hdmi_supported_vic(vic))
> +		return MODE_BAD;
> +
> +	vclk_freq = mode->clock;
> +
> +	/* For 420, pixel clock is half unlike venc clock */
> +	if (drm_mode_is_420_only(display_info, mode) ||
> +	    (!is_hdmi2_sink &&
> +	     drm_mode_is_420_also(display_info, mode)))
> +		vclk_freq /= 2;
> +
> +	/* TMDS clock is pixel_clock * 10 */
> +	phy_freq = vclk_freq * 10;
> +
> +	/* 480i/576i needs global pixel doubling */
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		vclk_freq *= 2;
> +
> +	venc_freq = vclk_freq;
> +	hdmi_freq = vclk_freq;
> +
> +	/* VENC double pixels for 1080i, 720p and YUV420 modes */
> +	if (meson_venc_hdmi_venc_repeat(vic) ||
> +	    drm_mode_is_420_only(display_info, mode) ||
> +	    (!is_hdmi2_sink &&
> +	     drm_mode_is_420_also(display_info, mode)))
> +		venc_freq *= 2;
> +
> +	vclk_freq = max(venc_freq, hdmi_freq);
> +
> +	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +		venc_freq /= 2;
> +
> +	dev_dbg(priv->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
> +		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
> +
> +	return meson_vclk_vic_supported_freq(priv, phy_freq, vclk_freq);
> +}
> +
> +static void meson_encoder_hdmi_mode_set(struct drm_bridge *bridge,
> +				   const struct drm_display_mode *mode,
> +				   const struct drm_display_mode *adjusted_mode)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +	struct meson_drm *priv = encoder_hdmi->priv;
> +	int vic = drm_match_cea_mode(mode);
> +	unsigned int ycrcb_map = VPU_HDMI_OUTPUT_CBYCR;
> +	bool yuv420_mode = false;
> +
> +	DRM_DEBUG_DRIVER("\"%s\" vic %d\n", mode->name, vic);
> +
> +	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
> +		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
> +		yuv420_mode = true;
> +	}
> +
> +	/* VENC + VENC-DVI Mode setup */
> +	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
> +
> +	/* VCLK Set clock */
> +	meson_encoder_hdmi_set_vclk(encoder_hdmi, mode);
> +
> +	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24)
> +		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
> +		writel_relaxed(2 | (2 << 2),
> +			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> +	else
> +		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
> +		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
> +}
> +
> +static const u32 meson_encoder_hdmi_out_bus_fmts[] = {
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> +};
> +
> +static u32 *
> +meson_encoder_hdmi_get_inp_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts = NULL;
> +	int i;
> +
> +	*num_input_fmts = 0;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(meson_encoder_hdmi_out_bus_fmts) ; ++i) {
> +		if (output_fmt == meson_encoder_hdmi_out_bus_fmts[i]) {
> +			*num_input_fmts = 1;
> +			input_fmts = kcalloc(*num_input_fmts,
> +					     sizeof(*input_fmts),
> +					     GFP_KERNEL);
In code similar to this in a previous patch kmalloc() was used.
Both are OK, I just noticed that the code differs.

> +			if (!input_fmts)
> +				return NULL;
> +
> +			input_fmts[0] = output_fmt;
> +
> +			break;
> +		}
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> +	struct drm_connector_state *old_conn_state =
> +		drm_atomic_get_old_connector_state(conn_state->state, conn_state->connector);
> +
> +	encoder_hdmi->output_bus_fmt = bridge_state->output_bus_cfg.format;
> +
> +	DRM_DEBUG_DRIVER("output_bus_fmt %lx\n", encoder_hdmi->output_bus_fmt);
> +
> +	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state))
> +		crtc_state->mode_changed = true;
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs meson_encoder_hdmi_bridge_funcs = {
> +	.attach = meson_encoder_hdmi_attach,
> +	.enable	= meson_encoder_hdmi_enable,
> +	.disable = meson_encoder_hdmi_disable,
> +	.mode_valid = meson_encoder_hdmi_mode_valid,
> +	.mode_set = meson_encoder_hdmi_mode_set,
Use of mode_set is deprecated, new drivers shall set their mode in the
atomic_enable operation.
> +	.atomic_get_input_bus_fmts = meson_encoder_hdmi_get_inp_bus_fmts,
> +	.atomic_check = meson_encoder_hdmi_atomic_check,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +int meson_encoder_hdmi_init(struct meson_drm *priv)
> +{
> +	struct meson_encoder_hdmi *meson_encoder_hdmi;
> +	struct device_node *remote;
> +	int ret;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	meson_encoder_hdmi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_hdmi), GFP_KERNEL);
> +	if (!meson_encoder_hdmi)
> +		return -ENOMEM;
> +
> +	/* HDMI Transceiver Bridge */
> +	remote = of_graph_get_remote_node(priv->dev->of_node, 1, 0);
> +	if (!remote) {
> +		dev_err(priv->dev, "HDMI transceiver device is disabled");
> +		return 0;
> +	}
> +
> +	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
> +	if (!meson_encoder_hdmi->next_bridge) {
> +		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	/* HDMI Encoder Bridge */
> +	meson_encoder_hdmi->bridge.funcs = &meson_encoder_hdmi_bridge_funcs;
> +	meson_encoder_hdmi->bridge.of_node = priv->dev->of_node;
> +	meson_encoder_hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> +
> +	drm_bridge_add(&meson_encoder_hdmi->bridge);
> +
> +	meson_encoder_hdmi->priv = priv;
> +
> +	/* Encoder */
> +	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
> +				      DRM_MODE_ENCODER_TMDS);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
> +		return ret;
> +	}
> +
> +	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
> +
> +	/* Attach HDMI Encoder Bridge to Encoder */
> +	ret = drm_bridge_attach(&meson_encoder_hdmi->encoder, &meson_encoder_hdmi->bridge, NULL, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * We should have now in place:
> +	 * encoder->[hdmi encoder bridge]->[dw-hdmi bridge]->[dw-hdmi connector]
> +	 */
> +
> +	DRM_DEBUG_DRIVER("HDMI encoder initialized\n");
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.h b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> new file mode 100644
> index 000000000000..ed19494f0956
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2021 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#ifndef __MESON_ENCODER_HDMI_H
> +#define __MESON_ENCODER_HDMI_H
> +
> +int meson_encoder_hdmi_init(struct meson_drm *priv);
> +
> +#endif /* __MESON_ENCODER_HDMI_H */
> -- 
> 2.25.1
