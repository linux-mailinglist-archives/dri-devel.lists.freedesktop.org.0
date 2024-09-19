Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCD97C620
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 10:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91EB10E14A;
	Thu, 19 Sep 2024 08:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ltkUfERn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46D10E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 08:46:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55C5540009;
 Thu, 19 Sep 2024 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726735577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qKVBGdQ0KGRHXbva3sixdjzkPFtoOD1WGEsGhWuEFRs=;
 b=ltkUfERnCDH6Z2lgs/Sxo/WYi7r9FY1M5UMPeOe4pwNRnjoplWnGRIKeVf+rpu1HjzjwZU
 gmGDirv51tnGRPZQIrryyfXblgiv86pd6uDHXFw7CkVJtrh1qZ/slU6d8kP4QwDIuqq37k
 /3WvC/4HOCtBOMcdRpj7Jz9mhOegMx37FXbnYSwWpp3TM6OTpZJrJEdxbMzV3WnLlOERQk
 C4kVBcDqjpk/v/cIh3vbRAm5sBQdB0JgcznW5OKHpCAy9k3cJu3L8bGMroB5lilVVTvHDl
 Jl4oNgeFUlXgXgfG+xCmOe4I7Bl12xme5Kettr7pJJ/Gi2uDwPWlsTjbDr8ZZA==
Date: Thu, 19 Sep 2024 10:46:14 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH] drm: writeback: Introduce drm managed helpers
Message-ID: <Zuvk1k8VMnx7eVYp@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
 <20240917160235.2947-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917160235.2947-1-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 17/09/24 - 18:02, José Expósito a écrit :
> Hey Louis,
> 
> > Currently drm_writeback_connector are created by
> > drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> > Both of the function uses drm_connector_init and drm_encoder_init, but
> > there is no way to properly clean those structure from outside. By using
> > drm managed variants, we can ensure that the writeback connector is
> > properly cleaned.
> > 
> > This patch introduce drmm_writeback_connector_init, an helper to initialize
> > a writeback connector using drm managed helpers. This function allows the
> > caller to use its own encoder.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Hi Maxime, Jani,
> > 
> > I tried with this commit to implement the drm-managed version of writeback 
> > connector initialization. I tested with the current vkms driver, and it 
> > seems to works (at least no crash/warns).
> > 
> > As suggested by Jani, I only created one function, which takes a 
> > NULL-able pointer for encoder/encoder functions/possible_crtc. What do you 
> > think about it?
> > 
> > Regarding the documentation, I think I repeated too much, can I simply add 
> > comments like "see documentation of @... for the details / requirements"?
> > 
> > Good weekend,
> > Louis Chauvet
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 224 ++++++++++++++++++++++++++++++++++------
> >  include/drm/drm_writeback.h     |   7 ++
> >  2 files changed, 201 insertions(+), 30 deletions(-)
> > 
> > 
> > ---
> > base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
> > change-id: 20240829-writeback-drmm-b9b85dcdaf7b
> > 
> > Best regards,
> > 
> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> > index a031c335bdb9..a161deeea908 100644
> > --- a/drivers/gpu/drm/drm_writeback.c
> > +++ b/drivers/gpu/drm/drm_writeback.c
> > @@ -18,6 +18,7 @@
> >  #include <drm/drm_modeset_helper_vtables.h>
> >  #include <drm/drm_property.h>
> >  #include <drm/drm_writeback.h>
> > +#include <drm/drm_managed.h>
> 
> Includes are sort alphabetically, you might want to move this one up.
> 
> >  
> >  /**
> >   * DOC: overview
> > @@ -202,13 +203,12 @@ int drm_writeback_connector_init(struct drm_device *dev,
> >  EXPORT_SYMBOL(drm_writeback_connector_init);
> >  
> >  /**
> > - * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
> > - * a custom encoder
> > + * __drm_writeback_connector_init - Common initialization code for writeback
> > + * connector
> >   *
> >   * @dev: DRM device
> >   * @wb_connector: Writeback connector to initialize
> >   * @enc: handle to the already initialized drm encoder
> > - * @con_funcs: Connector funcs vtable
> >   * @formats: Array of supported pixel formats for the writeback engine
> >   * @n_formats: Length of the formats array
> >   *
> > @@ -224,41 +224,31 @@ EXPORT_SYMBOL(drm_writeback_connector_init);
> >   * assigning the encoder helper functions, possible_crtcs and any other encoder
> >   * specific operation.
> >   *
> > - * Drivers should always use this function instead of drm_connector_init() to
> > - * set up writeback connectors if they want to manage themselves the lifetime of the
> > - * associated encoder.
> > - *
> >   * Returns: 0 on success, or a negative error code
> >   */
> > -int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> > -		struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
> > -		const struct drm_connector_funcs *con_funcs, const u32 *formats,
> > -		int n_formats)
> > +static int __drm_writeback_connector_init(
> > +	struct drm_device *dev, struct drm_writeback_connector *wb_connector,
> > +	struct drm_encoder *enc, const u32 *formats, int n_formats)
> 
> Not a big deal, but ./scripts/checkpatch.pl complains about this
> ideantation:
> 
>     CHECK: Lines should not end with a '('
>     CHECK: Alignment should match open parenthesis
> 
> You can fix it with:
> 
> static int __drm_writeback_connector_init(struct drm_device *dev,
> 					  struct drm_writeback_connector *wb_connector,
> 					  struct drm_encoder *enc,
> 					  const u32 *formats,
> 					  int n_formats)
> 
> >  {
> > -	struct drm_property_blob *blob;
> >  	struct drm_connector *connector = &wb_connector->base;
> >  	struct drm_mode_config *config = &dev->mode_config;
> > -	int ret = create_writeback_properties(dev);
> > -
> > -	if (ret != 0)
> > -		return ret;
> > -
> > -	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
> > -					formats);
> > -	if (IS_ERR(blob))
> > -		return PTR_ERR(blob);
> > -
> > +	struct drm_property_blob *blob;
> > +	int ret;
> >  
> >  	connector->interlace_allowed = 0;
> >  
> > -	ret = drm_connector_init(dev, connector, con_funcs,
> > -				 DRM_MODE_CONNECTOR_WRITEBACK);
> > +	ret = create_writeback_properties(dev);
> >  	if (ret)
> > -		goto connector_fail;
> > +		return ret;
> >  
> >  	ret = drm_connector_attach_encoder(connector, enc);
> >  	if (ret)
> > -		goto attach_fail;
> > +		return ret;
> > +
> > +	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
> > +					formats);
> > +	if (IS_ERR(blob))
> > +		return PTR_ERR(blob);
> >  
> >  	INIT_LIST_HEAD(&wb_connector->job_queue);
> >  	spin_lock_init(&wb_connector->job_lock);
> > @@ -281,15 +271,189 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> >  	wb_connector->pixel_formats_blob_ptr = blob;
> >  
> >  	return 0;
> > +}
> > +
> > +/**
> > + * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
> > + * a custom encoder
> > + *
> > + * @dev: DRM device
> > + * @wb_connector: Writeback connector to initialize
> > + * @enc: handle to the already initialized drm encoder
> > + * @con_funcs: Connector funcs vtable
> > + * @formats: Array of supported pixel formats for the writeback engine
> > + * @n_formats: Length of the formats array
> > + *
> > + * This function creates the writeback-connector-specific properties if they
> > + * have not been already created, initializes the connector as
> > + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> > + * values.
> > + *
> > + * This function assumes that the drm_writeback_connector's encoder has already been
> > + * created and initialized before invoking this function.
> > + *
> > + * In addition, this function also assumes that callers of this API will manage
> > + * assigning the encoder helper functions, possible_crtcs and any other encoder
> > + * specific operation.
> > + *
> > + * Drivers should always use this function instead of drm_connector_init() to
> > + * set up writeback connectors if they want to manage themselves the lifetime of the
> > + * associated encoder.
> > + *
> > + * Returns: 0 on success, or a negative error code
> > + */
> > +int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> > +		struct drm_writeback_connector *wb_connector, struct drm_encoder *enc,
> > +		const struct drm_connector_funcs *con_funcs, const u32 *formats,
> > +		int n_formats)
> > +{
> > +	struct drm_connector *connector = &wb_connector->base;
> > +	int ret;
> > +
> > +	ret = drm_connector_init(dev, connector, con_funcs,
> > +				 DRM_MODE_CONNECTOR_WRITEBACK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
> > +					     n_formats);
> > +	if (ret)
> > +		drm_connector_cleanup(connector);
> >  
> > -attach_fail:
> > -	drm_connector_cleanup(connector);
> > -connector_fail:
> > -	drm_property_blob_put(blob);
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> >  
> > +/**
> > + * drm_writeback_connector_cleanup - Cleanup the writeback connector
> > + * @dev: DRM device
> > + * @data: Opaque pointer to the writeback connector
> > + *
> > + * This will decrement the reference counter of blobs and it will clean the
> > + * remaining jobs in this writeback connector.
> > + */
> > +static void drm_writeback_connector_cleanup(struct drm_device *dev, void *data)
> > +{
> > +	struct drm_writeback_connector *wb_connector = data;
> > +	unsigned long flags;
> > +	struct drm_writeback_job *pos, *n;
> > +
> > +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> > +
> > +	spin_lock_irqsave(&wb_connector->job_lock, flags);
> > +	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
> > +		drm_writeback_cleanup_job(pos);
> > +		list_del(&pos->list_entry);
> > +	}
> > +	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
> > +}
> > +
> > +/**
> > + * __drmm_writeback_connector_init - Initialize a writeback connector with
> > + * a custom encoder
> > + *
> > + * @dev: DRM device
> > + * @wb_connector: Writeback connector to initialize
> > + * @con_funcs: Connector funcs vtable
> > + * @enc: handle to the already initialized drm encoder
> > + * @formats: Array of supported pixel formats for the writeback engine
> > + * @n_formats: Length of the formats array
> > + *
> > + * This function initialize a writeback connector and register its cleanup.
> > + * It uses the common helper @__drm_writeback_connector_init to do the
> > + * general initialization.
> > + *
> > + * This function assumes that @enc has already been created and initialized
> > + * before invoking this function.
> > + *
> > + * In addition, this function also assumes that callers of this API will manage
> > + * assigning the encoder helper functions, possible_crtcs and any other encoder
> > + * specific operation.
> > + *
> > + * Returns: 0 on success, or a negative error code
> > + */
> > +static int __drmm_writeback_connector_init(
> > +	struct drm_device *dev, struct drm_writeback_connector *wb_connector,
> > +	const struct drm_connector_funcs *con_funcs, struct drm_encoder *enc,
> > +	const u32 *formats, int n_formats)
> 
> checkpatch warnings here as well.
> 
> > +{
> > +	struct drm_connector *connector = &wb_connector->base;
> > +	int ret;
> > +
> > +	ret = drmm_connector_init(dev, connector, con_funcs,
> > +				  DRM_MODE_CONNECTOR_WRITEBACK, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
> > +					     n_formats);
> > +	if (ret) {
> > +		drm_writeback_connector_cleanup(dev, &wb_connector);
> 
> Is it safe to call drm_writeback_connector_cleanup() without initializing
> the job_queue and job_lock?

Right, I don't need to cleanup anything here.

> > +		return ret;
> > +	}
> > +
> > +	ret = drmm_add_action_or_reset(dev, &drm_writeback_connector_cleanup,
> > +				       wb_connector);
> > +	if (ret)
> 
> Missing call to drm_writeback_connector_cleanup()?

I don't need to call it, the version _or_reset already does it [1,2].

[1]:https://dri.freedesktop.org/docs/drm/gpu/drm-internals.html#c.drmm_add_action_or_reset
[2]:https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/drm_managed.c#L165

> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drmm_writeback_connector_init - Initialize a writeback connector with
> > + * a custom encoder
> > + *
> > + * @dev: DRM device
> > + * @wb_connector: Writeback connector to initialize
> > + * @con_funcs: Connector funcs vtable
> > + * @enc: handle to the already initialized drm encoder, optional
> > + * @enc_funcs: Encoder funcs vtable, optional
> 
> I think that this is only used if @enc is NULL, it'd be nice to clarify
> it like you did with @possible_crtcs.

Yes, definitly. On my first implementation it was always used and I forgot 
to update doc.

	@enc_funcs: Encoder funcs vtable, optional, only used when @enc is 
	NULL and a new encoder is created

> > + * @formats: Array of supported pixel formats for the writeback engine
> > + * @n_formats: Length of the formats array
> > + * @possible_crtcs: if @enc is NULL, this will set the possible_crtc for the
> > + *		    newly created encoder
> > + *
> > + * This function initialize a writeback connector and register its cleanup.
> > + *
> > + * This function creates the writeback-connector-specific properties if they
> > + * have not been already created, initializes the connector as
> > + * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
> > + * values.
> > + *
> > + * If @enc is NULL, a drm-managed encoder is created and used.
> > + * If @enc_funcs is not NULL, this vtable is attached to @enc or this new
> > + * encoder.
> 
> Isn't it only attached when @enc is NULL?

Yes!

> > + *
> > + * Returns: 0 on success, or a negative error code
> > + */
> > +int drmm_writeback_connector_init(
> > +	struct drm_device *dev, struct drm_writeback_connector *wb_connector,
> > +	const struct drm_connector_funcs *con_funcs,
> > +	struct drm_encoder *enc,
> > +	const struct drm_encoder_helper_funcs *enc_funcs, const u32 *formats,
> > +	int n_formats, u32 possible_crtcs)
> 
> Same checkpatch issues.
> 
> > +{
> > +	int ret;
> > +
> > +	if (!enc) {
> > +		ret = drmm_encoder_init(dev, &wb_connector->encoder,
> > +					NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
> > +		if (ret)
> > +			return ret;
> > +
> > +		enc = &wb_connector->encoder;
> 
> This modifies an input function parameter, not sure if it's intended
> but undocumented.

It does not change the input function parameter, it changes the pointer 
value, not the pointee value. If I want to change the input functino 
parameter, I would have to use

	*enc = smthing;

> > +		enc->possible_crtcs |= possible_crtcs;
> > +		if (enc_funcs)
> > +			drm_encoder_helper_add(enc, enc_funcs);
> > +	}
> > +
> > +	return __drmm_writeback_connector_init(dev, wb_connector, con_funcs,
> > +					       &wb_connector->encoder, formats,
> > +					       n_formats);
> > +}
> > +EXPORT_SYMBOL(drmm_writeback_connector_init);
> > +
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> >  			 struct drm_framebuffer *fb)
> >  {
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index 17e576c80169..88abfd3d4564 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -161,6 +161,13 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
> >  				const struct drm_connector_funcs *con_funcs, const u32 *formats,
> >  				int n_formats);
> >  
> > +int drmm_writeback_connector_init(
> > +	struct drm_device *dev, struct drm_writeback_connector *wb_connector,
> > +	const struct drm_connector_funcs *con_funcs,
> > +	struct drm_encoder *enc,
> > +	const struct drm_encoder_helper_funcs *enc_funcs, const u32 *formats,
> > +	int n_formats, u32 possible_crtcs);
> > +
> 
> This indentation make checkpatch happy:
> 
> int drmm_writeback_connector_init(struct drm_device *dev,
> 				  struct drm_writeback_connector *wb_connector,
> 				  const struct drm_connector_funcs *con_funcs,
> 				  struct drm_encoder *enc,
> 				  const struct drm_encoder_helper_funcs *enc_funcs,
> 				  const u32 *formats,
> 				  int n_formats,
> 				  u32 possible_crtcs);
> 
> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> >  			 struct drm_framebuffer *fb);
> >  
> > 
