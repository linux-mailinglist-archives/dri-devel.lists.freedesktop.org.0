Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B34EF4BA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 17:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D212110F61A;
	Fri,  1 Apr 2022 15:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562B110F613;
 Fri,  1 Apr 2022 15:38:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D03992F7;
 Fri,  1 Apr 2022 17:38:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1648827497;
 bh=ZbZHyqptx4zXfVnh3lLtRGmNFbGpDjNpeXKOZRDK7xQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FgXAj35YFOVTO+gtKi9wT82VEfAdnvgBLHI4m/79rxJRdT1+QVmu6diwQdNuoHybS
 O2/rDE2rercPR7iTauzJ7Tl7VkiSMV3+3HJYOMrX5OvXAv9wDKytSCoKByyeCHOk03
 hX8jampeZHXuz50KNPhQDDbJKOYHum9KQJszLAto=
Date: Fri, 1 Apr 2022 18:38:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v6 4/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Message-ID: <YkccZgD+f0enx2aV@pendragon.ideasonboard.com>
References: <1648771933-18512-1-git-send-email-quic_abhinavk@quicinc.com>
 <1648771933-18512-5-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1648771933-18512-5-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: hamohammed.sa@gmail.com, suraj.kandpal@intel.com, emma@anholt.net,
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

Thank you for the patch.

On Thu, Mar 31, 2022 at 05:12:13PM -0700, Abhinav Kumar wrote:
> For some vendor driver implementations, display hardware can
> be shared between the encoder used for writeback and the physical
> display.
> 
> In addition resources such as clocks and interrupts can
> also be shared between writeback and the real encoder.
> 
> To accommodate such vendor drivers and hardware, allow
> real encoder to be passed for drm_writeback_connector.
> 
> changes in v6:
> 	- assign the encoder inside
> 	  drm_writeback_connector_init_with_encoder() for
> 	  better readability
> 	- improve some documentation for internal encoder
> 
> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> Signed-off-by: Kandpal Suraj <suraj.kandpal@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>  drivers/gpu/drm/vc4/vc4_txp.c   | 14 ++++++++------
>  include/drm/drm_writeback.h     | 21 +++++++++++++++++++--

Please split this in two patches, one for the DRM core and one for the
VC4 driver. This applies to most patches as a general rule, with the
main exception being API refactoring that requires changing the
implementation and all its users in a single patch.

>  3 files changed, 39 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 797223c..7f72109 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -179,21 +179,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  {
>  	int ret = 0;
>  
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +	drm_encoder_helper_add(&wb_connector->internal_encoder, enc_helper_funcs);
>  
> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
> +	wb_connector->internal_encoder.possible_crtcs = possible_crtcs;
>  
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +	ret = drm_encoder_init(dev, &wb_connector->internal_encoder,
>  			       &drm_writeback_encoder_funcs,
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
> -			con_funcs, formats, n_formats);
> +	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector,
> +			&wb_connector->internal_encoder, con_funcs, formats, n_formats);
>  
>  	if (ret)
> -		drm_encoder_cleanup(&wb_connector->encoder);
> +		drm_encoder_cleanup(&wb_connector->internal_encoder);
>  
>  	return ret;
>  }
> @@ -238,6 +238,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
>  	struct drm_mode_config *config = &dev->mode_config;
>  	int ret = create_writeback_properties(dev);
>  
> +	/*
> +	 * Assign the encoder passed to this API to the wb_connector's encoder.
> +	 * For drm_writeback_connector_init(), this shall be the internal_encoder
> +	 */
> +	wb_connector->encoder = enc;
> +
>  	if (ret != 0)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 5e53f02..a9b4f83 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -151,6 +151,8 @@ struct vc4_txp {
>  
>  	struct platform_device *pdev;
>  
> +	struct drm_encoder drm_enc;
> +
>  	struct drm_writeback_connector connector;
>  
>  	void __iomem *regs;
> @@ -159,7 +161,7 @@ struct vc4_txp {
>  
>  static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>  {
> -	return container_of(encoder, struct vc4_txp, connector.encoder);
> +	return container_of(encoder, struct vc4_txp, drm_enc);
>  }
>  
>  static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> @@ -499,9 +501,9 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  
>  	wb_conn = &txp->connector;
>  
> -	drm_encoder_helper_add(&wb_conn->encoder, &vc4_txp_encoder_helper_funcs);
> +	drm_encoder_helper_add(&txp->drm_enc, &vc4_txp_encoder_helper_funcs);
>  
> -	ret = drm_encoder_init(drm, &wb_conn->encoder,
> +	ret = drm_encoder_init(drm, &txp->drm_enc,
>  			&vc4_txp_encoder_funcs,
>  			DRM_MODE_ENCODER_VIRTUAL, NULL);
>  
> @@ -511,10 +513,10 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &vc4_txp_connector_helper_funcs);
>  
> -	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &wb_conn->encoder,
> +	ret = drm_writeback_connector_init_with_encoder(drm, wb_conn, &txp->drm_enc,
>  			&vc4_txp_connector_funcs, drm_fmts, ARRAY_SIZE(drm_fmts));
>  	if (ret) {
> -		drm_encoder_cleanup(&wb_conn->encoder);
> +		drm_encoder_cleanup(&txp->drm_enc);
>  		return ret;
>  	}
>  
> @@ -523,7 +525,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	encoder = &txp->connector.encoder;
> +	encoder = txp->connector.encoder;
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 4795024..3f5c330 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,15 +25,32 @@ struct drm_writeback_connector {
>  	struct drm_connector base;
>  
>  	/**
> -	 * @encoder: Internal encoder used by the connector to fulfill
> +	 * @encoder: handle to drm_encoder used by the connector to fulfill
>  	 * the DRM framework requirements. The users of the
>  	 * @drm_writeback_connector control the behaviour of the @encoder
>  	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
>  	 * function.
> +	 *
> +	 * For some vendor drivers, the hardware resources are shared between
> +	 * writeback encoder and rest of the display pipeline.
> +	 * To accommodate such cases, encoder is a handle to the real encoder
> +	 * hardware.
> +	 *
> +	 * For current existing writeback users, this shall continue to be the
> +	 * embedded encoder for the writeback connector.
>  	 */
> -	struct drm_encoder encoder;
> +	struct drm_encoder *encoder;
>  
>  	/**
> +	 * @internal_encoder: internal encoder used by writeback when
> +	 * drm_writeback_connector_init() is used.
> +	 * @encoder will be assigned to this for those cases
> +	 *
> +	 * This will be unused when drm_writeback_connector_init_with_encoder()
> +	 * is used.
> +	 */
> +	struct drm_encoder internal_encoder;
> +	/**
>  	 * @pixel_formats_blob_ptr:
>  	 *
>  	 * DRM blob property data for the pixel formats list on writeback
> -- 
> 2.7.4
> 

-- 
Regards,

Laurent Pinchart
