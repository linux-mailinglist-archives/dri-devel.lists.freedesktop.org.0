Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C09C4E2E9B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBB610E00D;
	Mon, 21 Mar 2022 16:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEDAD10E00D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:56:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E19E81042
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:56:11 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A09333F66F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 09:56:11 -0700 (PDT)
Date: Mon, 21 Mar 2022 16:56:08 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 1/4] drm: allow passing possible_crtcs to
 drm_writeback_connector_init()
Message-ID: <YjiuKB92IRoz78Rg@e110455-lin.cambridge.arm.com>
References: <1647567936-11971-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647567936-11971-2-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1647567936-11971-2-git-send-email-quic_abhinavk@quicinc.com>
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

Hi,

On Thu, Mar 17, 2022 at 06:45:33PM -0700, Abhinav Kumar wrote:
> Clients of drm_writeback_connector_init() initialize the
> possible_crtcs and then invoke the call to this API.
> 
> To simplify things, allow passing possible_crtcs as a parameter
> to drm_writeback_connector_init() and make changes to the
> other drm drivers to make them compatible with this change.
> 
> changes in v4:
>      - keep only changes related to possible_crtcs
> 	 - add line breaks after ARRAY_SIZE
> 	 - stop using temporary variables for possible_crtcs
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c | 3 +--
>  drivers/gpu/drm/arm/malidp_mw.c                          | 4 ++--
>  drivers/gpu/drm/drm_writeback.c                          | 6 +++++-
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c              | 4 ++--
>  drivers/gpu/drm/vc4/vc4_txp.c                            | 3 ++-
>  drivers/gpu/drm/vkms/vkms_writeback.c                    | 4 ++--
>  include/drm/drm_writeback.h                              | 2 +-
>  7 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index e465cc4..40774e6 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -155,7 +155,6 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  	kwb_conn->wb_layer = kcrtc->master->wb_layer;
>  
>  	wb_conn = &kwb_conn->base;
> -	wb_conn->encoder.possible_crtcs = BIT(drm_crtc_index(&kcrtc->base));
>  
>  	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>  					       kwb_conn->wb_layer->layer_type,
> @@ -164,7 +163,7 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  	err = drm_writeback_connector_init(&kms->base, wb_conn,
>  					   &komeda_wb_connector_funcs,
>  					   &komeda_wb_encoder_helper_funcs,
> -					   formats, n_formats);
> +					   formats, n_formats, BIT(drm_crtc_index(&kcrtc->base)));
>  	komeda_put_fourcc_list(formats);
>  	if (err) {
>  		kfree(kwb_conn);
> diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
> index f5847a7..e54921d 100644
> --- a/drivers/gpu/drm/arm/malidp_mw.c
> +++ b/drivers/gpu/drm/arm/malidp_mw.c
> @@ -212,7 +212,6 @@ int malidp_mw_connector_init(struct drm_device *drm)
>  	if (!malidp->dev->hw->enable_memwrite)
>  		return 0;
>  
> -	malidp->mw_connector.encoder.possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
>  	drm_connector_helper_add(&malidp->mw_connector.base,
>  				 &malidp_mw_connector_helper_funcs);
>  
> @@ -223,7 +222,8 @@ int malidp_mw_connector_init(struct drm_device *drm)
>  	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
>  					   &malidp_mw_connector_funcs,
>  					   &malidp_mw_encoder_helper_funcs,
> -					   formats, n_formats);
> +					   formats, n_formats,
> +					  (1 << drm_crtc_index(&malidp->crtc)));
>  	kfree(formats);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dccf4504..dc2ef12 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -157,6 +157,7 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>   * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
>   * @formats: Array of supported pixel formats for the writeback engine
>   * @n_formats: Length of the formats array
> + * @possible_crtcs: possible crtcs for the internal writeback encoder
>   *
>   * This function creates the writeback-connector-specific properties if they
>   * have not been already created, initializes the connector as
> @@ -174,7 +175,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_writeback_connector *wb_connector,
>  				 const struct drm_connector_funcs *con_funcs,
>  				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
> -				 const u32 *formats, int n_formats)
> +				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
>  {
>  	struct drm_property_blob *blob;
>  	struct drm_connector *connector = &wb_connector->base;
> @@ -190,6 +191,9 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  		return PTR_ERR(blob);
>  
>  	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +
> +	wb_connector->encoder.possible_crtcs = possible_crtcs;
> +
>  	ret = drm_encoder_init(dev, &wb_connector->encoder,
>  			       &drm_writeback_encoder_funcs,
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);

For all of the above changes:

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index c79d125..fcfb0b3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -200,7 +200,6 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  {
>  	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
>  
> -	wb_conn->encoder.possible_crtcs = 1 << drm_crtc_index(&rcrtc->crtc);
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
> @@ -208,7 +207,8 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  					    &rcar_du_wb_conn_funcs,
>  					    &rcar_du_wb_enc_helper_funcs,
>  					    writeback_formats,
> -					    ARRAY_SIZE(writeback_formats));
> +					    ARRAY_SIZE(writeback_formats),
> +					   (1 << drm_crtc_index(&rcrtc->crtc)));
>  }
>  
>  void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index 9809ca3..3447eb6 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -497,7 +497,8 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
>  	ret = drm_writeback_connector_init(drm, &txp->connector,
>  					   &vc4_txp_connector_funcs,
>  					   &vc4_txp_encoder_helper_funcs,
> -					   drm_fmts, ARRAY_SIZE(drm_fmts));
> +					   drm_fmts, ARRAY_SIZE(drm_fmts),
> +					   0);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index 8694227..6d01e55 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -140,12 +140,12 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
>  {
>  	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
>  
> -	vkmsdev->output.wb_connector.encoder.possible_crtcs = 1;
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
>  	return drm_writeback_connector_init(&vkmsdev->drm, wb,
>  					    &vkms_wb_connector_funcs,
>  					    &vkms_wb_encoder_helper_funcs,
>  					    vkms_wb_formats,
> -					    ARRAY_SIZE(vkms_wb_formats));
> +					    ARRAY_SIZE(vkms_wb_formats),
> +					    1);
>  }
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 9697d27..db6214f 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -150,7 +150,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 struct drm_writeback_connector *wb_connector,
>  				 const struct drm_connector_funcs *con_funcs,
>  				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
> -				 const u32 *formats, int n_formats);
> +				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
>  
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb);
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
