Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BFB4E2F01
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D7210E433;
	Mon, 21 Mar 2022 17:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4B10E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:24:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1213C1042
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 10:24:59 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C58783F66F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 10:24:58 -0700 (PDT)
Date: Mon, 21 Mar 2022 17:24:56 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 2/4] drm: allow real encoder to be passed for
 drm_writeback_connector
Message-ID: <Yji06AeNokYeiOPq@e110455-lin.cambridge.arm.com>
References: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647567936-11971-3-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1647567936-11971-3-git-send-email-quic_abhinavk@quicinc.com>
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

On Thu, Mar 17, 2022 at 06:45:34PM -0700, Abhinav Kumar wrote:
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
> changes in v4:
> 	- split the possible_crtcs change and the parts which should
> 	  belong to the addition of new API to the next change
> 
> Co-developed-by: Kandpal Suraj <suraj.kandpal@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 12 +++++++-----
>  drivers/gpu/drm/vc4/vc4_txp.c   | 14 ++++++++++----
>  include/drm/drm_writeback.h     | 18 ++++++++++++++++--
>  3 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dc2ef12..a4c17d6 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -190,11 +190,13 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  	if (IS_ERR(blob))
>  		return PTR_ERR(blob);
>  
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +	drm_encoder_helper_add(wb_connector->encoder, enc_helper_funcs);
>  
> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
> +	wb_connector->encoder = &wb_connector->internal_encoder;

You need to check here that the wb_connector doesn't have already an attached encoder
before you overwrite the pointer with the internal encoder.

>  
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +	wb_connector->encoder->possible_crtcs = possible_crtcs;
> +
> +	ret = drm_encoder_init(dev, wb_connector->encoder,
>  			       &drm_writeback_encoder_funcs,
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);

Here you have initialised the encoder pointed at by wb_connector->encoder, which is
always wb_connector->internal_encoder with your code.

>  	if (ret)
> @@ -208,7 +210,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  		goto connector_fail;
>  
>  	ret = drm_connector_attach_encoder(connector,
> -						&wb_connector->encoder);
> +						wb_connector->encoder);
>  	if (ret)
>  		goto attach_fail;
>  
> @@ -237,7 +239,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>  	drm_connector_cleanup(connector);
>  connector_fail:
> -	drm_encoder_cleanup(&wb_connector->encoder);
> +	drm_encoder_cleanup(wb_connector->encoder);
>  fail:
>  	drm_property_blob_put(blob);
>  	return ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 3447eb6..341a9be5 100644
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
> @@ -467,6 +469,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	struct vc4_txp *txp;
>  	struct drm_crtc *crtc;
>  	struct drm_encoder *encoder;
> +	struct drm_writeback_connector *wb_conn;
>  	int ret, irq;
>  
>  	irq = platform_get_irq(pdev, 0);
> @@ -492,9 +495,12 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	txp->regset.regs = txp_regs;
>  	txp->regset.nregs = ARRAY_SIZE(txp_regs);
>  
> -	drm_connector_helper_add(&txp->connector.base,
> +	wb_conn = &txp->connector;
> +	wb_conn->encoder = &txp->drm_enc;
> +
> +	drm_connector_helper_add(&wb_conn->base,
>  				 &vc4_txp_connector_helper_funcs);
> -	ret = drm_writeback_connector_init(drm, &txp->connector,
> +	ret = drm_writeback_connector_init(drm, wb_conn,
>  					   &vc4_txp_connector_funcs,
>  					   &vc4_txp_encoder_helper_funcs,
>  					   drm_fmts, ARRAY_SIZE(drm_fmts),

This call will never initialise the txp->drm_enc, as per my comments above. However
if this was the intent, it's fine, but then you need to add a drm_encoder_init() call
here for txp->drm_enc. Otherwise, you need to stop overwriting the pointer in
drm_writeback_connector_init().

> @@ -507,7 +513,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	encoder = &txp->connector.encoder;
> +	encoder = txp->connector.encoder;
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index db6214f..c525b60 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -25,15 +25,29 @@ struct drm_writeback_connector {
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
> +	 * a real encoder is not provided by the vendor drm drivers.
> +	 * @encoder will be assigned to this for those cases.
> +	 */
> +	struct drm_encoder internal_encoder;
> +	/**
>  	 * @pixel_formats_blob_ptr:
>  	 *
>  	 * DRM blob property data for the pixel formats list on writeback
> -- 
> 2.7.4
> 

You need to come up with a bit more sophisticated algorithm for allowing drivers to
pass on a connector with a pre-allocated encoder. If the encoder is pre-populated
then you need to decide if drm_writeback_connector_init() will initialise the encoder
too or if it's going to assume that it has been already initialised (in which case
the error path where we call drm_encoder_cleanup() also needs to know if we're using
the internal encoder or not and act accordingly).

Otherwise the code looks pretty good, thanks for the improvements.

Best regards,
Liviu



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
