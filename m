Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CF42C521B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 11:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B356E855;
	Thu, 26 Nov 2020 10:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955396E855
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 10:35:48 +0000 (UTC)
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kiEcm-00065O-L3; Thu, 26 Nov 2020 11:35:41 +0100
Message-ID: <d5336c30883c5ed3192a5e18fc5741dfcb5f8987.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Date: Thu, 26 Nov 2020 11:35:38 +0100
In-Reply-To: <20201105145018.27255-1-laurentiu.palcu@oss.nxp.com>
References: <20201105145018.27255-1-laurentiu.palcu@oss.nxp.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL,T_FILL_THIS_FORM_SHORT autolearn=no
 autolearn_force=no version=3.4.2
Subject: Re: [PATCH] drm/imx/dcss: allow using nearest neighbor
 interpolation scaling
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-11-05 at 16:50 +0200, Laurentiu Palcu wrote:
> This patch adds support for using NN interpolation scaling by setting the
> SCALING_FILTER plane property to 1. Otherwise, the default method is used.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed and pushed into drm-misc-next.

Regards,
Lucas

> ---
> I had no retro pixel art games to test this with, so I used modetest to see the
> results:
> 
> To test, I used a 240x135 buffer, upscaled 8 times to 1920x1080:
>  * default scaling method using gaussian filter:
> /usr/bin/modetest -M imx-dcss -w 33:SCALING_FILTER:0 -P 33@38:240x135*8@XR24
>  * NN interpolation method:
> /usr/bin/modetest -M imx-dcss -w 33:SCALING_FILTER:1 -P 33@38:240x135*8@XR24
> 
> Thanks,
> laurentiu
> 
>  drivers/gpu/drm/imx/dcss/dcss-dev.h    |  3 ++
>  drivers/gpu/drm/imx/dcss/dcss-plane.c  | 10 +++++-
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 47 +++++++++++++++++++++-----
>  3 files changed, 50 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> index c642ae17837f..1e582270c6ea 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> @@ -7,6 +7,7 @@
>  #define __DCSS_PRV_H__
>  
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_plane.h>
>  #include <linux/io.h>
>  #include <video/videomode.h>
>  
> @@ -165,6 +166,8 @@ void dcss_ss_sync_set(struct dcss_ss *ss, struct videomode *vm,
>  /* SCALER */
>  int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base);
>  void dcss_scaler_exit(struct dcss_scaler *scl);
> +void dcss_scaler_set_filter(struct dcss_scaler *scl, int ch_num,
> +			    enum drm_scaling_filter scaling_filter);
>  void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
>  		       const struct drm_format_info *format,
>  		       int src_xres, int src_yres, int dst_xres, int dst_yres,
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> index 5db093aada2f..03ba88f7f995 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
> @@ -257,7 +257,8 @@ static bool dcss_plane_needs_setup(struct drm_plane_state *state,
>  	       state->src_h  != old_state->src_h  ||
>  	       fb->format->format != old_fb->format->format ||
>  	       fb->modifier  != old_fb->modifier ||
> -	       state->rotation != old_state->rotation;
> +	       state->rotation != old_state->rotation ||
> +	       state->scaling_filter != old_state->scaling_filter;
>  }
>  
>  static void dcss_plane_atomic_update(struct drm_plane *plane,
> @@ -313,6 +314,9 @@ static void dcss_plane_atomic_update(struct drm_plane *plane,
>  	is_rotation_90_or_270 = state->rotation & (DRM_MODE_ROTATE_90 |
>  						   DRM_MODE_ROTATE_270);
>  
> +	dcss_scaler_set_filter(dcss->scaler, dcss_plane->ch_num,
> +			       state->scaling_filter);
> +
>  	dcss_scaler_setup(dcss->scaler, dcss_plane->ch_num,
>  			  state->fb->format,
>  			  is_rotation_90_or_270 ? src_h : src_w,
> @@ -394,6 +398,10 @@ struct dcss_plane *dcss_plane_init(struct drm_device *drm,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	drm_plane_create_scaling_filter_property(&dcss_plane->base,
> +					BIT(DRM_SCALING_FILTER_DEFAULT) |
> +					BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
> +
>  	drm_plane_create_rotation_property(&dcss_plane->base,
>  					   DRM_MODE_ROTATE_0,
>  					   DRM_MODE_ROTATE_0   |
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> index cd21905de580..47852b9dd5ea 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> @@ -77,6 +77,8 @@ struct dcss_scaler_ch {
>  
>  	u32 c_vstart;
>  	u32 c_hstart;
> +
> +	bool use_nn_interpolation;
>  };
>  
>  struct dcss_scaler {
> @@ -243,6 +245,17 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
>  	}
>  }
>  
> +static void dcss_scaler_nearest_neighbor_filter(bool use_5_taps,
> +						int coef[][PSC_NUM_TAPS])
> +{
> +	int i, j;
> +
> +	for (i = 0; i < PSC_STORED_PHASES; i++)
> +		for (j = 0; j < PSC_NUM_TAPS; j++)
> +			coef[i][j] = j == PSC_NUM_TAPS >> 1 ?
> +						(1 << PSC_COEFF_PRECISION) : 0;
> +}
> +
>  /**
>   * dcss_scaler_filter_design() - Compute filter coefficients using
>   *				 Gaussian filter.
> @@ -253,7 +266,8 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
>   */
>  static void dcss_scaler_filter_design(int src_length, int dst_length,
>  				      bool use_5_taps, bool phase0_identity,
> -				      int coef[][PSC_NUM_TAPS])
> +				      int coef[][PSC_NUM_TAPS],
> +				      bool nn_interpolation)
>  {
>  	int fc_q;
>  
> @@ -263,8 +277,11 @@ static void dcss_scaler_filter_design(int src_length, int dst_length,
>  	else
>  		fc_q = div_q(dst_length, src_length * PSC_NUM_PHASES);
>  
> -	/* compute gaussian filter coefficients */
> -	dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
> +	if (nn_interpolation)
> +		dcss_scaler_nearest_neighbor_filter(use_5_taps, coef);
> +	else
> +		/* compute gaussian filter coefficients */
> +		dcss_scaler_gaussian_filter(fc_q, use_5_taps, phase0_identity, coef);
>  }
>  
>  static void dcss_scaler_write(struct dcss_scaler_ch *ch, u32 val, u32 ofs)
> @@ -653,12 +670,14 @@ static void dcss_scaler_yuv_coef_set(struct dcss_scaler_ch *ch,
>  
>  	/* horizontal luma */
>  	dcss_scaler_filter_design(src_xres, dst_xres, false,
> -				  src_xres == dst_xres, coef);
> +				  src_xres == dst_xres, coef,
> +				  ch->use_nn_interpolation);
>  	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
>  
>  	/* vertical luma */
>  	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
> -				  src_yres == dst_yres, coef);
> +				  src_yres == dst_yres, coef,
> +				  ch->use_nn_interpolation);
>  
>  	if (program_5_taps)
>  		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
> @@ -678,14 +697,14 @@ static void dcss_scaler_yuv_coef_set(struct dcss_scaler_ch *ch,
>  	/* horizontal chroma */
>  	dcss_scaler_filter_design(src_xres, dst_xres, false,
>  				  (src_xres == dst_xres) && (ch->c_hstart == 0),
> -				  coef);
> +				  coef, ch->use_nn_interpolation);
>  
>  	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HCHR, coef);
>  
>  	/* vertical chroma */
>  	dcss_scaler_filter_design(src_yres, dst_yres, program_5_taps,
>  				  (src_yres == dst_yres) && (ch->c_vstart == 0),
> -				  coef);
> +				  coef, ch->use_nn_interpolation);
>  	if (program_5_taps)
>  		dcss_scaler_program_5_coef_set(ch, DCSS_SCALER_COEF_VCHR, coef);
>  	else
> @@ -700,12 +719,14 @@ static void dcss_scaler_rgb_coef_set(struct dcss_scaler_ch *ch,
>  
>  	/* horizontal RGB */
>  	dcss_scaler_filter_design(src_xres, dst_xres, false,
> -				  src_xres == dst_xres, coef);
> +				  src_xres == dst_xres, coef,
> +				  ch->use_nn_interpolation);
>  	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_HLUM, coef);
>  
>  	/* vertical RGB */
>  	dcss_scaler_filter_design(src_yres, dst_yres, false,
> -				  src_yres == dst_yres, coef);
> +				  src_yres == dst_yres, coef,
> +				  ch->use_nn_interpolation);
>  	dcss_scaler_program_7_coef_set(ch, DCSS_SCALER_COEF_VLUM, coef);
>  }
>  
> @@ -751,6 +772,14 @@ static void dcss_scaler_set_rgb10_order(struct dcss_scaler_ch *ch,
>  	ch->sdata_ctrl |= a2r10g10b10_format << A2R10G10B10_FORMAT_POS;
>  }
>  
> +void dcss_scaler_set_filter(struct dcss_scaler *scl, int ch_num,
> +			    enum drm_scaling_filter scaling_filter)
> +{
> +	struct dcss_scaler_ch *ch = &scl->ch[ch_num];
> +
> +	ch->use_nn_interpolation = scaling_filter == DRM_SCALING_FILTER_NEAREST_NEIGHBOR;
> +}
> +
>  void dcss_scaler_setup(struct dcss_scaler *scl, int ch_num,
>  		       const struct drm_format_info *format,
>  		       int src_xres, int src_yres, int dst_xres, int dst_yres,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
