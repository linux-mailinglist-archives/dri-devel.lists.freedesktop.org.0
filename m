Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BB97B27D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0510E499;
	Tue, 17 Sep 2024 16:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kui4s+DG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD9910E499
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:02:04 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so57484825e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726588923; x=1727193723; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m5KQ1kLnN8DMSlG9w5BfJJLpfIAjSTIsA7znasV0gTg=;
 b=Kui4s+DGSRDChgmhdfIIqGaPNrQEebT8FRXUpz/Jk+EdDAE0CxCqcG/6sl9njd7Fpe
 9zzizUwMM7Rv5XKfTBxnccG4MJkboiRuWoNCDuEJuucMHD1Tti/cil7fjGoYqSt6CaAR
 Nl0Rj/eDO6FrFbiaEL2H8pT9IBt9D7nsZ+1LTdjIY9GSc70RtlxRmyYlWmmdxwBCPpF2
 m87RXPUmG6YPW10miYCNohsby7vUibVWz1J/bgW19o5ixe/TRd5Nkr81vimylTgpLvwP
 XH5Bs0ZCMPx5gfnCCmYp2Y9fjMFu/RhenASJ4K8DBgyMTjrnQ6lbLajZ/dLJ6UeX7Yw0
 9IdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588923; x=1727193723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m5KQ1kLnN8DMSlG9w5BfJJLpfIAjSTIsA7znasV0gTg=;
 b=quQyNAt+khyiJFGy81XFwW+ZBahhcO7SzQCXzWp+bRdnYjidGCSIs+PgXelOW81LJY
 uwvYMXJ0XEKMu6ODCqVj4YVBiCPg+NbAekPsGt1FV2QMC1C+CIwBHn0faFfOaHG+Lpis
 AC8BU/gHVaWfXUx2QVoEflSpglmuEBCt5/bVGXfCWxh1Jg80tAzsnIedqCTVsOM/Rg63
 A3HFb45dN+KqX18ZE08mdne+d2scFx9iyuKniyR33UXfM8AMS86gSxH+UKi3bDvWs/qs
 QfjCVnlUL1UIpa7tByGzqbXUb/lGYObc7YJ4/NCpJhfPmfyn06Ne03ZP+LsSrBo1X/jn
 vmcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXh6B3eSLRrMHzA1J+prJ7m8eVPA2Y7WI3zyU9+XQZF4pZteXN8reIWDcaPN5eqTSfJBdSqtU2CRTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5AMZWOSOZqXBlhch4f2Rvxaf6aPqnRQBQU849QZGP3p0vEoG6
 swzGuq3khgtcMnizdICaeYpg89tvXfZ/RvLTogRY697n2otdZ3UN
X-Google-Smtp-Source: AGHT+IFEFYqkN8FhiJkkKF9AnGNvNEYelsyf87w6eG31+Zh8MeE18OaiUzbDO3QzrD4Fj7t9ZH1nFw==
X-Received: by 2002:a05:600c:2e48:b0:42c:de6f:6ab3 with SMTP id
 5b1f17b1804b1-42cde6f6b81mr150925295e9.6.1726588922489; 
 Tue, 17 Sep 2024 09:02:02 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78044easm9902317f8f.91.2024.09.17.09.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:02:01 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH 3/3] drm/vkms: Switch to dynamic allocation for CRTC
Date: Tue, 17 Sep 2024 18:02:00 +0200
Message-ID: <20240917160200.2888-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240912-b4-vkms-allocated-v1-3-29abbaa14af9@bootlin.com>
References: <20240912-b4-vkms-allocated-v1-3-29abbaa14af9@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Louis,

Thanks for this series!

The first 2 patches look good to me. It could make sense to move the
alloc + init pair of calls to a function (vkms_connector_init() and
vkms_encoder_init() for example), but we can always move it in the
furure:

This one looks good, but I added couple of comments:

> specific allocation for the CRTC is not strictly necessary at this point,
> but in order to implement dynamic configuration of VKMS (configFS), it
> will be easier to have one allocation per CRTC.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c      | 28 ++++++++++++++-----------
>  drivers/gpu/drm/vkms/vkms_drv.h       |  9 ++++----
>  drivers/gpu/drm/vkms/vkms_output.c    | 39 ++++++++++++++++++-----------------
>  drivers/gpu/drm/vkms/vkms_writeback.c | 17 ++++++++-------
>  4 files changed, 50 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 821b9ac746083630116e05c1cf8e3dc2424ac66a..1169eb5a5e521fb42b1af85082425cd71aa2be4d 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -88,7 +88,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);

vkmsdev is unused.

> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  
>  	if (!READ_ONCE(vblank->enabled)) {
> @@ -281,19 +281,23 @@ static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
>  	destroy_workqueue(vkms_out->composer_workq);
>  }
>  
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor)
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
> +				   struct drm_plane *cursor)
>  {
> -	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_output *vkms_out;
> +	struct drm_crtc *crtc;
>  	int ret;
>  
> -	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
> -					 &vkms_crtc_funcs, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init CRTC\n");
> -		return ret;
> +	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
> +					       primary, cursor,
> +					       &vkms_crtc_funcs, NULL);
> +	if (IS_ERR(vkms_out)) {
> +		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
> +		return vkms_out;
>  	}
>  
> +	crtc = &vkms_out->crtc;
> +
>  	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>  
>  	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
> @@ -304,12 +308,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
>  	if (!vkms_out->composer_workq)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
>  				       vkms_out);
>  	if (ret)
> -		return ret;
> +		return ERR_PTR(ret);
>  
> -	return ret;
> +	return vkms_out;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 972aee6853f2b29909291e33652f68740fdc9dbc..a97164c0c2d62c4b6bb5641d09b3607a742cf585 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -126,7 +126,6 @@ struct vkms_config {
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> -	struct vkms_output output;
>  	const struct vkms_config *config;
>  };
>  
> @@ -143,8 +142,9 @@ struct vkms_device {
>  	container_of(target, struct vkms_plane_state, base.base)
>  
>  /* CRTC */
> -int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
> -		   struct drm_plane *primary, struct drm_plane *cursor);
> +struct vkms_output *vkms_crtc_init(struct drm_device *dev,
> +				   struct drm_plane *primary,
> +				   struct drm_plane *cursor);

Do you think that it could make sense to rename vkms_output to vkms_crtc
in a follow up patch?

I find a bit confusing that vkms_crtc_init returns a different type.
Renaming it would make drm_crtc_to_vkms_output() consistent with the
other container_of macros.

>  
>  int vkms_output_init(struct vkms_device *vkmsdev);
>  
> @@ -165,6 +165,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
>  void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
>  
>  /* Writeback */
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_output *vkms_out);
>  
>  #endif /* _VKMS_DRV_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 60d5365f8d41b8f20da489cfb9dbc85eb9df4916..a57a0cfa21964577f98e564acf87711b2e85fa67 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -29,11 +29,11 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  
>  int vkms_output_init(struct vkms_device *vkmsdev)
>  {
> -	struct vkms_output *output = &vkmsdev->output;
> +

Extra blank line.

>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_output *output;
>  	struct vkms_plane *primary, *overlay, *cursor = NULL;
>  	int ret;
>  	int writeback;
> @@ -49,31 +49,33 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  			return PTR_ERR(cursor);
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
> -	if (ret)
> -		return ret;
> +	output = vkms_crtc_init(dev, &primary->base,
> +				cursor ? &cursor->base : NULL);
> +	if (IS_ERR(output)) {
> +		DRM_ERROR("Failed to allocate CRTC\n");
> +		return PTR_ERR(output);
> +	}
>  
>  	if (vkmsdev->config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
>  			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
>  			if (IS_ERR(overlay))
>  				return PTR_ERR(overlay);
> -			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
>  		}
>  	}
>  
>  	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
>  	if (!connector) {
>  		DRM_ERROR("Failed to allocate connector\n");
> -		ret = -ENOMEM;
> -		goto err_connector;
> +		return -ENOMEM;
>  	}
>  
>  	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
>  				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		return ret;
>  	}
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -81,34 +83,33 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
>  	if (!encoder) {
>  		DRM_ERROR("Failed to allocate encoder\n");
> -		ret = -ENOMEM;
> -		goto err_connector;
> +		return -ENOMEM;
>  	}
>  	ret = drmm_encoder_init(dev, encoder, NULL,
>  				DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
> -		goto err_connector;
> +		return ret;
>  	}
> -	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
>  
> +	/* Attach the encoder and the connector */
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
>  		return ret;
>  	}
>  
> +	/* Initialize the writeback component */
>  	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev);
> -		if (writeback)
> +		writeback = vkms_enable_writeback_connector(vkmsdev, output);
> +		if (writeback) {
>  			DRM_ERROR("Failed to init writeback connector\n");
> +			return ret;
> +		}
>  	}
>  
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> -
> -err_connector:
> -	drm_crtc_cleanup(crtc);
> -	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index a948f4598764efef971f76e1016fc1a963fbbba7..f91c6418480f71ab3ec9989ea85814460e10d231 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -105,7 +105,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  				struct drm_writeback_job *job)
>  {
>  	struct vkms_writeback_job *vkmsjob = job->priv;
> -	struct vkms_device *vkmsdev;
> +	struct vkms_output *vkms_output = container_of(connector,
> +						       struct vkms_output,
> +						       wb_connector);
>  
>  	if (!job->fb)
>  		return;
> @@ -114,8 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
>  
>  	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
>  
> -	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
> -	vkms_set_composer(&vkmsdev->output, false);
> +	vkms_set_composer(vkms_output, false);
>  	kfree(vkmsjob);
>  }
>  
> @@ -124,8 +125,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  {
>  	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
>  											 conn);
> -	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
> -	struct vkms_output *output = &vkmsdev->output;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
>  	struct drm_writeback_connector *wb_conn = &output->wb_connector;
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
> @@ -139,7 +139,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	if (!conn_state)
>  		return;
>  
> -	vkms_set_composer(&vkmsdev->output, true);
> +	vkms_set_composer(output, true);
>  
>  	active_wb = conn_state->writeback_job->priv;
>  	wb_frame_info = &active_wb->wb_frame_info;
> @@ -167,9 +167,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
>  	.atomic_check = vkms_wb_atomic_check,
>  };
>  
> -int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
> +int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
> +				    struct vkms_output *vkms_output)
>  {
> -	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
> +	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
>  
>  	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
>  
> 
