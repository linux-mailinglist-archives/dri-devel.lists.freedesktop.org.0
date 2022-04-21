Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A340A509DF1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 12:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11C610EAE1;
	Thu, 21 Apr 2022 10:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEEF210EAE1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 10:47:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61EB01515
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 03:47:05 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 295BC3F5A1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 03:47:05 -0700 (PDT)
Date: Thu, 21 Apr 2022 11:47:03 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 3/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Message-ID: <YmE2J9b+g3VQMGhK@e110455-lin.cambridge.arm.com>
References: <1649465635-20542-1-git-send-email-quic_abhinavk@quicinc.com>
 <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1649465635-20542-4-git-send-email-quic_abhinavk@quicinc.com>
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
 rodrigosiqueiramelo@gmail.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, melissa.srw@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, dmitry.baryshkov@linaro.org,
 james.qian.wang@arm.com, quic_aravindh@quicinc.com, mihail.atanassov@arm.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Abhinav,

Sorry for the delay in reviewing this, Easter break happened in between.

On Fri, Apr 08, 2022 at 05:53:54PM -0700, Abhinav Kumar wrote:
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
> For existing clients, drm_writeback_connector_init() will use
> an internal_encoder under the hood and hence no changes will
> be needed.
> 
> changes in v7:
> 	- move this change before the vc4 change in the series
> 	  to minimize the changes to vendor drivers in drm core
> 	  changes
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 18 ++++++++++++------
>  drivers/gpu/drm/vc4/vc4_txp.c   |  4 ++--
>  include/drm/drm_writeback.h     | 22 ++++++++++++++++++++--
>  3 files changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index 92658ad..0538674 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -180,21 +180,21 @@ int drm_writeback_connector_init(struct drm_device *dev,
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
> @@ -239,6 +239,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
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
> index 3447eb6..7e063a9 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -159,7 +159,7 @@ struct vc4_txp {
>  
>  static inline struct vc4_txp *encoder_to_vc4_txp(struct drm_encoder *encoder)
>  {
> -	return container_of(encoder, struct vc4_txp, connector.encoder);
> +	return container_of(encoder, struct vc4_txp, connector.internal_encoder);

This doesn't feel right. First, vc4_txp should not be aware of the existance of
internal_encoder, that is only for the use of drm_writeback_connector when someone
doesn't pass on an encoder. Second, how do we know someone didn't actually use the
'encoder' pointer from drm_writeback_connector? I think we should be consistent and
only use encoder member.

Best regards,
Liviu

>  }
>  
>  static inline struct vc4_txp *connector_to_vc4_txp(struct drm_connector *conn)
> @@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	encoder = &txp->connector.encoder;
> +	encoder = txp->connector.encoder;
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index bb306fa..3fbae9d 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,13 +25,31 @@ struct drm_writeback_connector {
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
> +	 */
> +	struct drm_encoder *encoder;
> +
> +	/**
> +	 * @internal_encoder: internal encoder used by writeback when
> +	 * drm_writeback_connector_init() is used.
> +	 * @encoder will be assigned to this for those cases
> +	 *
> +	 * This will be unused when drm_writeback_connector_init_with_encoder()
> +	 * is used.
>  	 */
> -	struct drm_encoder encoder;
> +	struct drm_encoder internal_encoder;
>  
>  	/**
>  	 * @pixel_formats_blob_ptr:
> -- 
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
