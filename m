Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCCB4E56C8
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 17:46:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBDF10E24A;
	Wed, 23 Mar 2022 16:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEC7910E24A
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 16:46:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E6CB1474
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:46:25 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAEB63F73D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:46:24 -0700 (PDT)
Date: Wed, 23 Mar 2022 16:46:22 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 2/4] drm: introduce
 drm_writeback_connector_init_with_encoder() API
Message-ID: <YjtO3o3gchzEPCBD@e110455-lin.cambridge.arm.com>
References: <1647907005-27004-1-git-send-email-quic_abhinavk@quicinc.com>
 <1647907005-27004-3-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1647907005-27004-3-git-send-email-quic_abhinavk@quicinc.com>
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

On Mon, Mar 21, 2022 at 04:56:43PM -0700, Abhinav Kumar wrote:
> For vendors drivers which pass an already allocated and
> initialized encoder especially for cases where the encoder
> hardware is shared OR the writeback encoder shares the resources
> with the rest of the display pipeline introduce a new API,
> drm_writeback_connector_init_with_encoder() which expects
> an initialized encoder as a parameter and only sets up the
> writeback connector.
> 
> changes in v5:
> 	- reorder this change to come before in the series
> 	  to avoid incorrect functionality in subsequent changes
> 	- continue using struct drm_encoder instead of
> 	  struct drm_encoder * and switch it in next change
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Hi Abhinav,

> ---
>  drivers/gpu/drm/drm_writeback.c | 143 ++++++++++++++++++++++++++++------------
>  include/drm/drm_writeback.h     |   5 ++
>  2 files changed, 106 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index dc2ef12..abe78b9 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -149,37 +149,15 @@ static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
>  	.destroy = drm_encoder_cleanup,
>  };
>  
> -/**
> - * drm_writeback_connector_init - Initialize a writeback connector and its properties
> - * @dev: DRM device
> - * @wb_connector: Writeback connector to initialize
> - * @con_funcs: Connector funcs vtable
> - * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
> - * @formats: Array of supported pixel formats for the writeback engine
> - * @n_formats: Length of the formats array
> - * @possible_crtcs: possible crtcs for the internal writeback encoder
> - *
> - * This function creates the writeback-connector-specific properties if they
> - * have not been already created, initializes the connector as
> - * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> - * values. It will also create an internal encoder associated with the
> - * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
> - * the encoder helper.
> - *
> - * Drivers should always use this function instead of drm_connector_init() to
> - * set up writeback connectors.
> - *
> - * Returns: 0 on success, or a negative error code
> - */
> -int drm_writeback_connector_init(struct drm_device *dev,
> -				 struct drm_writeback_connector *wb_connector,
> -				 const struct drm_connector_funcs *con_funcs,
> -				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
> -				 const u32 *formats, int n_formats, uint32_t possible_crtcs)
> +static int drm_writeback_connector_setup(struct drm_device *dev,
> +		struct drm_writeback_connector *wb_connector,
> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
> +		int n_formats)
>  {
>  	struct drm_property_blob *blob;
> -	struct drm_connector *connector = &wb_connector->base;
>  	struct drm_mode_config *config = &dev->mode_config;
> +	struct drm_connector *connector = &wb_connector->base;
> +

Point of this reordering the statements is...?

>  	int ret = create_writeback_properties(dev);
>  
>  	if (ret != 0)
> @@ -187,18 +165,10 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  
>  	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
>  					formats);
> -	if (IS_ERR(blob))
> -		return PTR_ERR(blob);
> -
> -	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> -
> -	wb_connector->encoder.possible_crtcs = possible_crtcs;
> -
> -	ret = drm_encoder_init(dev, &wb_connector->encoder,
> -			       &drm_writeback_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret)
> -		goto fail;
> +	if (IS_ERR(blob)) {
> +		ret = PTR_ERR(blob);
> +		return ret;
> +	}

I don't see why you have changed the earlier code to store the result of PTR_ERR into
ret other than to help your debugging. I suggest that you keep the existing code that
returns PTR_ERR(blob) directly and you will have a nicer diff stat as well.

>  
>  	connector->interlace_allowed = 0;
>  
> @@ -237,13 +207,102 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  attach_fail:
>  	drm_connector_cleanup(connector);
>  connector_fail:
> -	drm_encoder_cleanup(&wb_connector->encoder);
> -fail:
>  	drm_property_blob_put(blob);
>  	return ret;
>  }
> +
> +/**
> + * drm_writeback_connector_init - Initialize a writeback connector and its properties
> + * @dev: DRM device
> + * @wb_connector: Writeback connector to initialize
> + * @con_funcs: Connector funcs vtable
> + * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
> + * @formats: Array of supported pixel formats for the writeback engine
> + * @n_formats: Length of the formats array
> + * @possible_crtcs: possible crtcs for the internal writeback encoder
> + *
> + * This function creates the writeback-connector-specific properties if they
> + * have not been already created, initializes the connector as
> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> + * values. It will also create an internal encoder associated with the
> + * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
> + * the encoder helper.
> + *
> + * Drivers should always use this function instead of drm_connector_init() to
> + * set up writeback connectors.
> + *
> + * Returns: 0 on success, or a negative error code
> + */
> +int drm_writeback_connector_init(struct drm_device *dev,
> +		struct drm_writeback_connector *wb_connector,
> +		const struct drm_connector_funcs *con_funcs,
> +		const struct drm_encoder_helper_funcs *enc_helper_funcs,
> +		const u32 *formats, int n_formats, uint32_t possible_crtcs)
> +{
> +	int ret = 0;
> +
> +	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> +
> +	wb_connector->encoder.possible_crtcs = possible_crtcs;
> +
> +	ret = drm_encoder_init(dev, &wb_connector->encoder,
> +			       &drm_writeback_encoder_funcs,
> +			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
> +			n_formats);
> +
> +	if (ret)
> +		drm_encoder_cleanup(&wb_connector->encoder);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_writeback_connector_init);
>  
> +/**
> + * drm_writeback_connector_init_with_encoder - Initialize a writeback connector and its properties
> + * using the encoder which already assigned and initialized
> + *
> + * @dev: DRM device
> + * @wb_connector: Writeback connector to initialize
> + * @con_funcs: Connector funcs vtable
> + * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
> + * @formats: Array of supported pixel formats for the writeback engine
> + * @n_formats: Length of the formats array
> + *
> + * This function creates the writeback-connector-specific properties if they
> + * have not been already created, initializes the connector as
> + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> + * values.
> + *
> + * This function assumes that the drm_writebac_connector's encoder has already been

spelling: writeback

> + * created and initialized before invoking this function.
> + *
> + * In addition, this function also assumes that callers of this API will manage
> + * assigning the encoder helper functions, possible_crtcs and any other encoder
> + * specific operation which is otherwise handled by drm_writeback_connector_init().
> + *
> + * Drivers should always use this function instead of drm_connector_init() to
> + * set up writeback connectors.

.... if they want to manage themselves the lifetime of the associated encoder.

We're not trying to replace drm_writeback_connector_init() function here, only to
provide an alternative function to call for special cases.

> + *
> + * Returns: 0 on success, or a negative error code
> + */
> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> +		struct drm_writeback_connector *wb_connector,
> +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
> +		int n_formats)

Where is the encoder parameter? Isn't that the reason why the function is called
`_with_encoder`?

I think there might have been too many version of these patchsets and things are
starting to be confusing. Please revisit the series without rushing and come up with
a plan of action. My understanding of watching this series has been that you're
trying to come up with a function that does *connector* initialisation but skips the
*encoder* initialisation because it might have been already done by the driver. The
idea will be then to have a function `drm_writeback_connector_init_with_encoder()`
that does *all* the work that `drm_writeback_connector_init()` does at the moment minus
the encoder initialisation part. Then `drm_writeback_connector_init()` only
initialises the internal encoder and calls `drm_writeback_connector_init_with_encoder()`.
There is no need to have the `drm_writeback_connector_setup()` function at all.

Best regards,
Liviu
 

> +{
> +	int ret = 0;
> +
> +	ret = drm_writeback_connector_setup(dev, wb_connector, con_funcs, formats,
> +			n_formats);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb)
>  {
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index db6214f..0093bab 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -152,6 +152,11 @@ int drm_writeback_connector_init(struct drm_device *dev,
>  				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
>  				 const u32 *formats, int n_formats, uint32_t possible_crtcs);
>  
> +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> +				struct drm_writeback_connector *wb_connector,
> +				const struct drm_connector_funcs *con_funcs, const u32 *formats,
> +				int n_formats);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb);
>  
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
