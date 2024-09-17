Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FE97B281
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 18:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4210E49A;
	Tue, 17 Sep 2024 16:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dCRN/ZiR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDDA10E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 16:02:21 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb60aff1eso57601625e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726588940; x=1727193740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gAJgzuk44nSHNCAm9YjKFdOqxMHdI/5yJVyNQ4KYIJ4=;
 b=dCRN/ZiRfwpqPBH6b9VMwcXx4ejvuxONHFs2reuAeEvJF7qHCnvHzb6Iow6wV8V6P4
 uXG6YYrXO8xBLxcSeTbqSifDqiTIImFW+yOU4gJVqaZKWH/Vul7HA4qA0FI0aTnCPfu0
 zoyF78FKE+ALje4o/Yue3u6TO7I42GRMhTbU8hCzaN4t+7GP7oc/gLcDmAhZLAjl0X8i
 4UKm3JiNbWODwVyVC8t2fsGeNzrt1GRMJCByyyHoGzr91wq8RwSA2Qht4Bhb1ZXz7hyT
 d8AEcvd5u9+Y0xwWVJvXGjNtvj6Ke5vzcTfLi3Gx/FYLq2nnHLbF8NKXQFe9oPOl9dQI
 DF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726588940; x=1727193740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gAJgzuk44nSHNCAm9YjKFdOqxMHdI/5yJVyNQ4KYIJ4=;
 b=FxmUDRkJ39wugFK9/2MFMRxMVMeN4XHJ+cB30xpNFC4hwwHXblrAJvED2jX/Jkq5yr
 0dwuBG3v46atc7MeEmApPaM7PujdpVUbxJRQxN34u+5iMyEHLvGXtrmLxYhllltCUm21
 RJTQgQTj8yjcdzQcOkxp9Ad+TmilPpltzF7W0VQ7tWNzRfCI81gdRs1FDktbZOzTDv1d
 kd7uL97bSDh0f/Kom5qqGFKq5U6UwtwKBsURhJMFzl0s7XzZQH/Aa7b36dZ/DWt8y7Lx
 6UddIYp7QgRLmFUHrJnxhweaBnd1Q8K3K0kTB5SdEuAJX4UVcV3+kEXhOTyqoBaM/DXJ
 0c8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxMY8cD7G/qxiSC1scmcuWOnlnWtheBSGXyFh8c96Y/7ds+W7FAEMusBe+R9u+e1FS/IoYddKtdyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2bucfiI0+SKrA2FNONyglruVjB8TeQMnergqlpAH2ZTTkWGMm
 gICjOWH+iKTdEeM/K5hYPVv+06c+OCpJRDkq+VVqmDju9dnRIhZH
X-Google-Smtp-Source: AGHT+IH/agTpPN973Qkf1RFZ2hZTP9G4Z1Hjdhm4TT/LOCs7D7EJwdL8UA+azJ4WCsTBI5waPXPhAg==
X-Received: by 2002:a05:600c:510f:b0:42c:bb10:7292 with SMTP id
 5b1f17b1804b1-42cdb5389acmr148261445e9.1.1726588939118; 
 Tue, 17 Sep 2024 09:02:19 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da2426d0esm106860585e9.39.2024.09.17.09.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 09:02:18 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH] drm/vkms: Remove index parameter from init_vkms_output
Date: Tue, 17 Sep 2024 18:02:16 +0200
Message-ID: <20240917160216.2921-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com>
References: <20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com>
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

> VKMS currently supports only one CRTC, so it make no sense to have this
> index configurable. To avoid issues, replace this hardcoded index by
> drm_crtc_mask when applicable.
> 
> There is no need to manually set a crtc mask on primary and cursor plane
> as it is automatically set by drmm_crtc_alloc_with_planes.
> 
> In addition, this will remove the use of an uninitialized structure in
> vkms_add_overlay_plane. This currently works by chance because two things:
> - vkms_plane_init always set a possible_crtcs value, so the problematic
>   branch is never used;
> - drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
>   always have this id.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
>  drivers/gpu/drm/vkms/vkms_drv.h    |  4 ++--
>  drivers/gpu/drm/vkms/vkms_output.c | 42 +++++++++++++-------------------------
>  drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
>  4 files changed, 19 insertions(+), 33 deletions(-)
> 
> 
> ---
> base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
> change-id: 20240906-vkms-remove-index-3a6e04c38e02
> 
> Best regards,
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 0c1a713b7b7b..1226a790bece 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -172,7 +172,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkms_output_init(vkmsdev);
>  }
>  
>  static int vkms_create(struct vkms_config *config)
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 5e46ea5b96dc..dac063f11dcd 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -148,10 +148,10 @@ struct vkms_device {
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init(struct vkms_device *vkmsdev);
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5ce70dd946aa..a6a942b4f84f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -31,47 +31,24 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes    = vkms_conn_get_modes,
>  };
>  
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> -				  struct drm_crtc *crtc)
> -{
> -	struct vkms_plane *overlay;
> -
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> -	if (IS_ERR(overlay))
> -		return PTR_ERR(overlay);
> -
> -	if (!overlay->base.possible_crtcs)
> -		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> -
> -	return 0;
> -}
> -
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder = &output->encoder;
>  	struct drm_crtc *crtc = &output->crtc;
> -	struct vkms_plane *primary, *cursor = NULL;
> +	struct vkms_plane *primary, *overlay, *cursor = NULL;
>  	int ret;
>  	int writeback;
>  	unsigned int n;
>  
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
> -	if (vkmsdev->config->overlay) {
> -		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> -			if (ret)
> -				return ret;
> -		}
> -	}
> -
>  	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
>  	}
> @@ -80,6 +57,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	if (ret)
>  		return ret;
>  
> +	if (vkmsdev->config->overlay) {
> +		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
> +			if (IS_ERR(overlay))
> +				return PTR_ERR(overlay);

At this point the CRTC is initialized and, in case of error, it
would need to be freed with drm_crtc_cleanup().

Instead of returning, you'd need to jump to "err_connector", which
would need to be renamed to something else that makes sense.

Jose

> +			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
> +		}
> +	}
> +
>  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret) {
> @@ -95,7 +81,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  		DRM_ERROR("Failed to init encoder\n");
>  		goto err_encoder;
>  	}
> -	encoder->possible_crtcs = 1;
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e5c625ab8e3e..ad137c9a75f5 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
>  
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, type, NULL);
> 
