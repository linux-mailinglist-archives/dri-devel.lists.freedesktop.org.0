Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E6177116
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3116EA02;
	Tue,  3 Mar 2020 08:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs30.siol.net [185.57.226.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55836E5BD
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id DBCE552341C;
 Mon,  2 Mar 2020 17:48:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id uejcH_C1Zu8K; Mon,  2 Mar 2020 17:48:57 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 4476B523438;
 Mon,  2 Mar 2020 17:48:57 +0100 (CET)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id CF9BC5233F0;
 Mon,  2 Mar 2020 17:48:55 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 4/4] drm/bridge: dw-hdmi: Add support for RGB limited range
Date: Mon, 02 Mar 2020 17:48:55 +0100
Message-ID: <3027794.oiGErgHkdL@jernej-laptop>
In-Reply-To: <20200302095354.GG11960@pendragon.ideasonboard.com>
References: <20200229163043.158262-1-jernej.skrabec@siol.net>
 <20200229163043.158262-5-jernej.skrabec@siol.net>
 <20200302095354.GG11960@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent!

Dne ponedeljek, 02. marec 2020 ob 10:53:54 CET je Laurent Pinchart napisal(a):
> Hi Jernej,
> 
> Thank you for the patch.
> 
> On Sat, Feb 29, 2020 at 05:30:43PM +0100, Jernej Skrabec wrote:
> > CEA 861 standard request that RGB quantization range is "limited" for
> 
> s/request/requests/
> 
> > CEA modes. Support that by adding CSC matrix which downscales values.
> 
> Interesting, that's related to what I asked in the review of 2/4 :-)
> 
> > This allows to proper color reproduction on TV and PC monitor at the
> > same time. In future, override property can be added, like "Broadcast
> > RGB" in i915 driver.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 36 +++++++++++++++++++++--
> >  1 file changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> > 3d6021119942..101c90156fa0 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -92,6 +92,12 @@ static const u16 csc_coeff_rgb_in_eitu709[3][4] = {
> > 
> >  	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
> >  
> >  };
> > 
> > +static const u16 csc_coeff_rgb_limited[3][4] = {
> 
> Could you name this to make it explicit that we're converting from RGB
> to RGB ? Maybe csc_coeff_rgb_full_to_rgb_limited ?

Ok.

> 
> > +	{ 0x1B7C, 0x0000, 0x0000, 0x0020 },
> > +	{ 0x0000, 0x1B7C, 0x0000, 0x0020 },
> > +	{ 0x0000, 0x0000, 0x1B7C, 0x0020 }
> 
> Lowercase hex constants please.

Ok.

> 
> > +};
> > +
> > 
> >  struct hdmi_vmode {
> >  
> >  	bool mdataenablepolarity;
> > 
> > @@ -109,6 +115,7 @@ struct hdmi_data_info {
> > 
> >  	unsigned int pix_repet_factor;
> >  	unsigned int hdcp_enable;
> >  	struct hdmi_vmode video_mode;
> > 
> > +	bool rgb_limited_range;
> > 
> >  };
> >  
> >  struct dw_hdmi_i2c {
> > 
> > @@ -960,6 +967,13 @@ static int is_color_space_conversion(struct dw_hdmi
> > *hdmi)> 
> >  		hdmi_bus_fmt_is_rgb(hdmi-
>hdmi_data.enc_out_bus_format);
> >  
> >  }
> > 
> > +static int is_rgb_downscale_needed(struct dw_hdmi *hdmi)
> > +{
> > +	return  hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) &&
> > +		hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format) 
&&
> > +		hdmi->hdmi_data.rgb_limited_range;
> > +}
> > +
> > 
> >  static int is_color_space_decimation(struct dw_hdmi *hdmi)
> >  {
> >  
> >  	if (!hdmi_bus_fmt_is_yuv422(hdmi->hdmi_data.enc_out_bus_format))
> > 
> > @@ -1006,6 +1020,8 @@ static void dw_hdmi_update_csc_coeffs(struct dw_hdmi
> > *hdmi)> 
> >  				csc_coeff = 
&csc_coeff_rgb_in_eitu709;
> >  			
> >  			csc_scale = 0;
> >  		
> >  		}
> > 
> > +	} else if (is_rgb_downscale_needed(hdmi)) {
> > +		csc_coeff = &csc_coeff_rgb_limited;
> > 
> >  	}
> >  	
> >  	/* The CSC registers are sequential, alternating MSB then LSB */
> > 
> > @@ -1615,6 +1631,18 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi,
> > struct drm_display_mode *mode)> 
> >  	drm_hdmi_avi_infoframe_from_display_mode(&frame,
> >  	
> >  						 &hdmi-
>connector, mode);
> > 
> > +	if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> > +		drm_hdmi_avi_infoframe_quant_range(&frame, &hdmi-
>connector,
> > +						   mode,
> > +						   hdmi-
>hdmi_data.rgb_limited_range ?
> > +						   
HDMI_QUANTIZATION_RANGE_LIMITED :
> > +						   
HDMI_QUANTIZATION_RANGE_FULL);
> > +	} else {
> > +		frame.quantization_range = 
HDMI_QUANTIZATION_RANGE_DEFAULT;
> > +		frame.ycc_quantization_range =
> > +			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
> > +	}
> > +
> > 
> >  	if (hdmi_bus_fmt_is_yuv444(hdmi->hdmi_data.enc_out_bus_format))
> >  	
> >  		frame.colorspace = HDMI_COLORSPACE_YUV444;
> >  	
> >  	else if (hdmi_bus_fmt_is_yuv422(hdmi-
>hdmi_data.enc_out_bus_format))
> > 
> > @@ -1990,13 +2018,13 @@ static void dw_hdmi_enable_video_path(struct
> > dw_hdmi *hdmi)> 
> >  	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> >  	
> >  	/* Enable csc path */
> > 
> > -	if (is_color_space_conversion(hdmi)) {
> > +	if (is_color_space_conversion(hdmi) || 
is_rgb_downscale_needed(hdmi)) {
> 
> I would fold this change in is_color_space_conversion(), and modify
> dw_hdmi_update_csc_coeffs() accordingly with something like
> 
> 	if (!hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) &&
> 	    hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_out_bus_format)) {
> 		if (hdmi->hdmi_data.enc_out_encoding == 
V4L2_YCBCR_ENC_601)
> 			csc_coeff = &csc_coeff_rgb_out_eitu601;
> 		else
> 			csc_coeff = &csc_coeff_rgb_out_eitu709;
> 	} else if (hdmi_bus_fmt_is_rgb(hdmi->hdmi_data.enc_in_bus_format) 
&&
> 		   !hdmi_bus_fmt_is_rgb(hdmi-
>hdmi_data.enc_out_bus_format)) {
> 		if (hdmi->hdmi_data.enc_out_encoding == 
V4L2_YCBCR_ENC_601)
> 			csc_coeff = &csc_coeff_rgb_in_eitu601;
> 		else
> 			csc_coeff = &csc_coeff_rgb_in_eitu709;
> 		csc_scale = 0;
> 	} else if (is_rgb_downscale_needed(hdmi)) {
> 		csc_coeff = &csc_coeff_rgb_limited;
> 	}

Right, but for clarity reasons I'll introduce is_input_rgb and is_output_rgb 
variables.

Thanks for review.

Best regards,
Jernej

> 
> >  		hdmi->mc_clkdis &= ~HDMI_MC_CLKDIS_CSCCLK_DISABLE;
> >  		hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
> >  	
> >  	}
> >  	
> >  	/* Enable color space conversion if needed */
> > 
> > -	if (is_color_space_conversion(hdmi))
> > +	if (is_color_space_conversion(hdmi) || 
is_rgb_downscale_needed(hdmi))
> > 
> >  		hdmi_writeb(hdmi, 
HDMI_MC_FLOWCTRL_FEED_THROUGH_OFF_CSC_IN_PATH,
> >  		
> >  			    HDMI_MC_FLOWCTRL);
> >  	
> >  	else
> > 
> > @@ -2100,6 +2128,10 @@ static int dw_hdmi_setup(struct dw_hdmi *hdmi,
> > struct drm_display_mode *mode)> 
> >  	/* TOFIX: Default to RGB888 output format */
> >  	hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > 
> > +	hdmi->hdmi_data.rgb_limited_range = hdmi->sink_is_hdmi &&
> > +		drm_default_rgb_quant_range(mode) ==
> > +		HDMI_QUANTIZATION_RANGE_LIMITED;
> > +
> > 
> >  	hdmi->hdmi_data.pix_repet_factor = 0;
> >  	hdmi->hdmi_data.hdcp_enable = 0;
> >  	hdmi->hdmi_data.video_mode.mdataenablepolarity = true;




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
