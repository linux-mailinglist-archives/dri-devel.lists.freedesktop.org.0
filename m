Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE9F97BD16
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EE410E139;
	Wed, 18 Sep 2024 13:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oSa7hHAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FA910E139
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:33:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF86F1BF209;
 Wed, 18 Sep 2024 13:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1726666428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dgCNdG7gkzcMv7H/i1kGXt4E7ouR1FPgjV5W7tCYbAE=;
 b=oSa7hHARW/QdPD0kUa6hqows1LwF7EH+zvhVm2C791jNLNkfJX8pP11Owdg7v/QRWPwkE2
 ptPumBUlRGw+f94qUdgQH7ZYvNHZqHehPFM6VW1u9bvo0crut3GOJbrVxzBEKI3ClcooyE
 px/y03cruF/igigl16w8eLUHKPHM59yj2cF/r4jmF71jqkQglVppBwmX7BffF3inWtOdue
 xDChJAUGYUupjoxuciTGGbaYN9X03M/8XGbBRapew1+wfDIHoPHSdPdkV+Vx7Z3LrD1WcZ
 R7KNrg2kUQ6OR0lhs6cxhHEyPYpb20KH/cKqPvGdNTEioU0is95UqlSDzYYJyQ==
Date: Wed, 18 Sep 2024 15:33:45 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
Subject: Re: [PATCH 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Message-ID: <ZurWue_53IjafFti@localhost.localdomain>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org,
 rodrigosiqueiramelo@gmail.com, thomas.petazzoni@bootlin.com,
 tzimmermann@suse.de
References: <20240912-b4-vkms-allocated-v1-3-29abbaa14af9@bootlin.com>
 <20240917160200.2888-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240917160200.2888-1-jose.exposito89@gmail.com>
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
> Hi Louis,
> 
> Thanks for this series!
> 
> The first 2 patches look good to me. It could make sense to move the
> alloc + init pair of calls to a function (vkms_connector_init() and
> vkms_encoder_init() for example), but we can always move it in the
> furure:

I don't think this is strictly needed at this point, but as I want to 
introduce connector configuration, yes, I will probably create 
struct vkms_connector and _init function.
 
> This one looks good, but I added couple of comments:

I will send a v2 with your modification in one or two weeks, I am 
currently at LPC.

> > specific allocation for the CRTC is not strictly necessary at this point,
> > but in order to implement dynamic configuration of VKMS (configFS), it
> > will be easier to have one allocation per CRTC.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c      | 28 ++++++++++++++-----------
> >  drivers/gpu/drm/vkms/vkms_drv.h       |  9 ++++----
> >  drivers/gpu/drm/vkms/vkms_output.c    | 39 ++++++++++++++++++-----------------
> >  drivers/gpu/drm/vkms/vkms_writeback.c | 17 ++++++++-------
> >  4 files changed, 50 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index 821b9ac746083630116e05c1cf8e3dc2424ac66a..1169eb5a5e521fb42b1af85082425cd71aa2be4d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -88,7 +88,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> >  {
> >  	struct drm_device *dev = crtc->dev;
> >  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
> 
> vkmsdev is unused.
> 
> > -	struct vkms_output *output = &vkmsdev->output;
> > +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
> >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> >  
> >  	if (!READ_ONCE(vblank->enabled)) {
> > @@ -281,19 +281,23 @@ static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
> >  	destroy_workqueue(vkms_out->composer_workq);
> >  }
> >  
> > -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > -		   struct drm_plane *primary, struct drm_plane *cursor)
> > +struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
> > +				   struct drm_plane *cursor)
> >  {
> > -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> > +	struct vkms_output *vkms_out;
> > +	struct drm_crtc *crtc;
> >  	int ret;
> >  
> > -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > -					 &vkms_crtc_funcs, NULL);
> > -	if (ret) {
> > -		DRM_ERROR("Failed to init CRTC\n");
> > -		return ret;
> > +	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
> > +					       primary, cursor,
> > +					       &vkms_crtc_funcs, NULL);
> > +	if (IS_ERR(vkms_out)) {
> > +		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
> > +		return vkms_out;
> >  	}
> >  
> > +	crtc = &vkms_out->crtc;
> > +
> >  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> >  
> >  	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> > @@ -304,12 +308,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> >  
> >  	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
> >  	if (!vkms_out->composer_workq)
> > -		return -ENOMEM;
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
> >  				       vkms_out);
> >  	if (ret)
> > -		return ret;
> > +		return ERR_PTR(ret);
> >  
> > -	return ret;
> > +	return vkms_out;
> >  }
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 972aee6853f2b29909291e33652f68740fdc9dbc..a97164c0c2d62c4b6bb5641d09b3607a742cf585 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -126,7 +126,6 @@ struct vkms_config {
> >  struct vkms_device {
> >  	struct drm_device drm;
> >  	struct platform_device *platform;
> > -	struct vkms_output output;
> >  	const struct vkms_config *config;
> >  };
> >  
> > @@ -143,8 +142,9 @@ struct vkms_device {
> >  	container_of(target, struct vkms_plane_state, base.base)
> >  
> >  /* CRTC */
> > -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> > -		   struct drm_plane *primary, struct drm_plane *cursor);
> > +struct vkms_output *vkms_crtc_init(struct drm_device *dev,
> > +				   struct drm_plane *primary,
> > +				   struct drm_plane *cursor);
> 
> Do you think that it could make sense to rename vkms_output to vkms_crtc
> in a follow up patch?

Do you mean the patch that I forgot to include in this series? [1] :') 
Definitly yes! I will add it in the v2.

[1]:https://lore.kernel.org/all/20240827-google-vkms-managed-v2-3-f41104553aeb@bootlin.com/

Thanks,
Louis chauvet

> I find a bit confusing that vkms_crtc_init returns a different type.
> Renaming it would make drm_crtc_to_vkms_output() consistent with the
> other container_of macros.
> 
> >  
> >  int vkms_output_init(struct vkms_device *vkmsdev);
> >  
> > @@ -165,6 +165,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
> >  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
> >  
> >  /* Writeback */
> > -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> > +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> > +				    struct vkms_output *vkms_out);
> >  
> >  #endif /* _VKMS_DRV_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> > index 60d5365f8d41b8f20da489cfb9dbc85eb9df4916..a57a0cfa21964577f98e564acf87711b2e85fa67 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -29,11 +29,11 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
> >  
> >  int vkms_output_init(struct vkms_device *vkmsdev)
> >  {
> > -	struct vkms_output *output = &vkmsdev->output;
> > +
> 
> Extra blank line.
> 
> >  	struct drm_device *dev = &vkmsdev->drm;
> >  	struct drm_connector *connector;
> >  	struct drm_encoder *encoder;
> > -	struct drm_crtc *crtc = &output->crtc;
> > +	struct vkms_output *output;
> >  	struct vkms_plane *primary, *overlay, *cursor = NULL;
> >  	int ret;
> >  	int writeback;
> > @@ -49,31 +49,33 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  			return PTR_ERR(cursor);
> >  	}
> >  
> > -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> > -	if (ret)
> > -		return ret;
> > +	output = vkms_crtc_init(dev, &primary->base,
> > +				cursor ? &cursor->base : NULL);
> > +	if (IS_ERR(output)) {
> > +		DRM_ERROR("Failed to allocate CRTC\n");
> > +		return PTR_ERR(output);
> > +	}
> >  
> >  	if (vkmsdev->config->overlay) {
> >  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> >  			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> >  			if (IS_ERR(overlay))
> >  				return PTR_ERR(overlay);
> > -			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> > +			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
> >  		}
> >  	}
> >  
> >  	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> >  	if (!connector) {
> >  		DRM_ERROR("Failed to allocate connector\n");
> > -		ret = -ENOMEM;
> > -		goto err_connector;
> > +		return -ENOMEM;
> >  	}
> >  
> >  	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> >  				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to init connector\n");
> > -		goto err_connector;
> > +		return ret;
> >  	}
> >  
> >  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> > @@ -81,34 +83,33 @@ int vkms_output_init(struct vkms_device *vkmsdev)
> >  	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> >  	if (!encoder) {
> >  		DRM_ERROR("Failed to allocate encoder\n");
> > -		ret = -ENOMEM;
> > -		goto err_connector;
> > +		return -ENOMEM;
> >  	}
> >  	ret = drmm_encoder_init(dev, encoder, NULL,
> >  				DRM_MODE_ENCODER_VIRTUAL, NULL);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to init encoder\n");
> > -		goto err_connector;
> > +		return ret;
> >  	}
> > -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> > +	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
> >  
> > +	/* Attach the encoder and the connector */
> >  	ret = drm_connector_attach_encoder(connector, encoder);
> >  	if (ret) {
> >  		DRM_ERROR("Failed to attach connector to encoder\n");
> >  		return ret;
> >  	}
> >  
> > +	/* Initialize the writeback component */
> >  	if (vkmsdev->config->writeback) {
> > -		writeback = vkms_enable_writeback_connector(vkmsdev);
> > -		if (writeback)
> > +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
> > +		if (writeback) {
> >  			DRM_ERROR("Failed to init writeback connector\n");
> > +			return ret;
> > +		}
> >  	}
> >  
> >  	drm_mode_config_reset(dev);
> >  
> >  	return 0;
> > -
> > -err_connector:
> > -	drm_crtc_cleanup(crtc);
> > -	return ret;
> >  }
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index a948f4598764efef971f76e1016fc1a963fbbba7..f91c6418480f71ab3ec9989ea85814460e10d231 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -105,7 +105,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
> >  				struct drm_writeback_job *job)
> >  {
> >  	struct vkms_writeback_job *vkmsjob = job->priv;
> > -	struct vkms_device *vkmsdev;
> > +	struct vkms_output *vkms_output = container_of(connector,
> > +						       struct vkms_output,
> > +						       wb_connector);
> >  
> >  	if (!job->fb)
> >  		return;
> > @@ -114,8 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
> >  
> >  	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
> >  
> > -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> > -	vkms_set_composer(&vkmsdev->output, false);
> > +	vkms_set_composer(vkms_output, false);
> >  	kfree(vkmsjob);
> >  }
> >  
> > @@ -124,8 +125,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  {
> >  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
> >  											 conn);
> > -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> > -	struct vkms_output *output = &vkmsdev->output;
> > +	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
> >  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
> >  	struct drm_connector_state *conn_state = wb_conn->base.state;
> >  	struct vkms_crtc_state *crtc_state = output->composer_state;
> > @@ -139,7 +139,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	if (!conn_state)
> >  		return;
> >  
> > -	vkms_set_composer(&vkmsdev->output, true);
> > +	vkms_set_composer(output, true);
> >  
> >  	active_wb = conn_state->writeback_job->priv;
> >  	wb_frame_info = &active_wb->wb_frame_info;
> > @@ -167,9 +167,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
> >  	.atomic_check = vkms_wb_atomic_check,
> >  };
> >  
> > -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> > +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> > +				    struct vkms_output *vkms_output)
> >  {
> > -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> > +	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
> >  
> >  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
> >  
> > 
