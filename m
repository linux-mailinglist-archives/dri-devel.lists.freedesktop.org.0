Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D586996D8A7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B7110E12A;
	Thu,  5 Sep 2024 12:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="icqBugc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4027010E12A
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:34:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-374c1963cb6so437783f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539660; x=1726144460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I8WsCigj/cB5z79KDg6UMenJBs0sH3Bhud/v9yMqgZs=;
 b=icqBugc3IhgPL5/82TINCR1076H0P3opc7LrncoTOIJqkfm0Ss5ZfADvLP8QzXMqLa
 Fhe9XE0w2H+CWtIZyg39UO3dPw3RYDO1wmYgqwrL8eKj0hiSUUrv1I7DXwneJdgYwF5a
 2r0Wh+zo/AOcRZa62AmNOprjrszae17FRw7+GO4K6OuG7R68X2fyUCpkwFvsY3jTwNm+
 LcjiqNS4bCQmrz+lb2TuFQLx3RVrf0atmhaopLlzjf0fJovF65JlC3k3//CXPjW8SRCI
 tiDvBejUNkhHzxs9c/W5JdcXC4gxM1o0EvdgvMpXxdkOe681TFTM5ahPkqfKnagBDmOi
 fZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539660; x=1726144460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8WsCigj/cB5z79KDg6UMenJBs0sH3Bhud/v9yMqgZs=;
 b=lT2AiPI8mSYk7Jr9Buq/wjfMBnpFr/H+nbg+J21vLRDEbQ0eQNA4mp1RjsDMO1wlTr
 S4kMZvARIR/QGXZrnqf2NoSN8CQPSqrJTOUY3e4x+8GDJMKyliLmE4FFczPxpubCICIU
 wV+QoMYBFapVTDJQ+FN71woqBvsrAPl79MVLfDMD1UOl1qwJeYH7cmFSDnjXCwzkHtJP
 HSsZyPInbCR8nYuJe8WPfHhJV3VhxOPXMLl5aJQxogGHr6YrAT0AyRn8T92OR05Wkr7o
 eNiIVEB6pvuPpDT2LOn+bEv3ayXuGaCTlRrpVhEhvkulmO31snnIDxSEwsCdfm3wHuY7
 zifA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPjXUm6ARoPrJ9RqntLHCoXiUnVMRVgW6RjRgYAzJKeeRTYKsY7gr2wvdkBygLR+w17LH2NZEdsJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS5aAHXMlFseQZkmT7jrEW3+f0QqADi3qmNl9KDFCSGvf2H0ce
 Z1w8eaD88jpHpIJok7XfItOAmD6CnjmR7Ved5khTVSFbLg+jQMjp
X-Google-Smtp-Source: AGHT+IHigy7QntQnsYJ+PK5oQKAjSIu3p67NvbgZJC7QXJx+LdxRhIe8zMFtxlortAHrKZmi2xG4Gg==
X-Received: by 2002:adf:dd86:0:b0:374:c1c5:859e with SMTP id
 ffacd0b85a97d-374c1c5883fmr10573873f8f.42.1725539660267; 
 Thu, 05 Sep 2024 05:34:20 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b6f7ef8esm16272041f8f.8.2024.09.05.05.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:34:19 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 12/15] drm/vkms: Add configuration for CRTCs and encoders
Date: Thu,  5 Sep 2024 14:34:18 +0200
Message-ID: <20240905123418.3139-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-12-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-12-6e179abf9fd4@bootlin.com>
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

> The current VKMS driver can only uses one CRTC and one encoder. This patch
> introduce in the same time CRTC and encoders as they are tighly linked.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 266 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/vkms/vkms_config.h | 102 +++++++++++++-
>  drivers/gpu/drm/vkms/vkms_crtc.c   |  20 ++-
>  drivers/gpu/drm/vkms/vkms_crtc.h   |   3 +-
>  drivers/gpu/drm/vkms/vkms_drv.c    |  87 ++++++------
>  5 files changed, 405 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index e9e30974523a..fcd4a128c21b 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -14,6 +14,8 @@ struct vkms_config *vkms_config_create(void)
>  		return ERR_PTR(-ENOMEM);
>  
>  	INIT_LIST_HEAD(&config->planes);
> +	INIT_LIST_HEAD(&config->crtcs);
> +	INIT_LIST_HEAD(&config->encoders);
>  
>  	return config;
>  }
> @@ -22,12 +24,24 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  					      bool enable_cursor)
>  {
>  	struct vkms_config_plane *plane;
> +	struct vkms_config_encoder *encoder;
> +	struct vkms_config_crtc *crtc;
>  	struct vkms_config *vkms_config = vkms_config_create();
>  
>  	if (IS_ERR(vkms_config))
>  		return vkms_config;
>  
> -	vkms_config->writeback = enable_writeback;
> +	crtc = vkms_config_create_crtc(vkms_config);
> +	if (!crtc)
> +		goto err_alloc;
> +	crtc->writeback = enable_writeback;
> +
> +	encoder = vkms_config_create_encoder(vkms_config);
> +	if (!encoder)
> +		goto err_alloc;
> +
> +	if (vkms_config_encoder_attach_crtc(encoder, crtc))
> +		goto err_alloc;
>  
>  	plane = vkms_config_create_plane(vkms_config);
>  	if (!plane)
> @@ -39,6 +53,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  		goto err_alloc;
>  	sprintf(plane->name, "primary");
>  
> +	if (vkms_config_plane_attach_crtc(plane, crtc))
> +		goto err_alloc;
> +
>  	if (enable_overlay) {
>  		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
>  			plane = vkms_config_create_plane(vkms_config);
> @@ -49,6 +66,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  			if (!plane->name)
>  				goto err_alloc;
>  			snprintf(plane->name, 10, "plane-%d", i);
> +
> +			if (vkms_config_plane_attach_crtc(plane, crtc))
> +				goto err_alloc;
>  		}
>  	}
>  	if (enable_cursor) {
> @@ -60,6 +80,9 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  		if (!plane->name)
>  			goto err_alloc;
>  		sprintf(plane->name, "cursor");
> +
> +		if (vkms_config_plane_attach_crtc(plane, crtc))
> +			goto err_alloc;
>  	}
>  
>  	return vkms_config;
> @@ -89,38 +112,196 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
>  	vkms_config_overlay->supported_color_range = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  						     BIT(DRM_COLOR_YCBCR_FULL_RANGE);
>  	vkms_config_overlay->default_color_range = DRM_COLOR_YCBCR_FULL_RANGE;
> +	xa_init_flags(&vkms_config_overlay->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add(&vkms_config_overlay->link, &vkms_config->planes);
>  
>  	return vkms_config_overlay;
>  }
>  
> -void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
> +struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config)
>  {
> -	if (!vkms_config_overlay)
> +	if (!vkms_config)
> +		return NULL;
> +
> +	struct vkms_config_crtc *vkms_config_crtc = kzalloc(sizeof(*vkms_config_crtc),
> +							    GFP_KERNEL);
> +
> +	if (!vkms_config_crtc)
> +		return NULL;
> +
> +	list_add(&vkms_config_crtc->link, &vkms_config->crtcs);
> +	xa_init_flags(&vkms_config_crtc->possible_planes, XA_FLAGS_ALLOC);
> +	xa_init_flags(&vkms_config_crtc->possible_encoders, XA_FLAGS_ALLOC);
> +
> +	return vkms_config_crtc;
> +}
> +
> +struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_config)
> +{
> +	if (!vkms_config)
> +		return NULL;
> +
> +	struct vkms_config_encoder *vkms_config_encoder = kzalloc(sizeof(*vkms_config_encoder),
> +								  GFP_KERNEL);
> +
> +	if (!vkms_config_encoder)
> +		return NULL;
> +
> +	list_add(&vkms_config_encoder->link, &vkms_config->encoders);
> +	xa_init_flags(&vkms_config_encoder->possible_crtcs, XA_FLAGS_ALLOC);
> +
> +	return vkms_config_encoder;
> +}
> +
> +void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
> +			      struct vkms_config *vkms_config)
> +{
> +	struct vkms_config_crtc *crtc_config;
> +	struct vkms_config_plane *plane;
> +
> +	if (!vkms_config_plane)
> +		return;
> +	list_del(&vkms_config_plane->link);
> +	xa_destroy(&vkms_config_plane->possible_crtcs);
> +
> +	list_for_each_entry(crtc_config, &vkms_config->crtcs, link) {
> +		unsigned long idx = 0;
> +
> +		xa_for_each(&crtc_config->possible_planes, idx, plane) {
> +			if (plane == vkms_config_plane)
> +				xa_erase(&crtc_config->possible_planes, idx);
> +		}
> +	}
> +
> +	kfree(vkms_config_plane->name);
> +	kfree(vkms_config_plane);
> +}
> +
> +void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
> +			     struct vkms_config *vkms_config)
> +{
> +	struct vkms_config_crtc *crtc_config;
> +	struct vkms_config_plane *plane_config;
> +	struct vkms_config_encoder *encoder_config;
> +
> +	if (!vkms_config_crtc)
> +		return;
> +	list_del(&vkms_config_crtc->link);
> +	xa_destroy(&vkms_config_crtc->possible_planes);
> +	xa_destroy(&vkms_config_crtc->possible_encoders);
> +
> +	list_for_each_entry(plane_config, &vkms_config->planes, link) {
> +		unsigned long idx = 0;
> +
> +		xa_for_each(&plane_config->possible_crtcs, idx, crtc_config) {
> +			if (crtc_config == vkms_config_crtc)
> +				xa_erase(&plane_config->possible_crtcs, idx);
> +		}
> +	}
> +
> +	list_for_each_entry(encoder_config, &vkms_config->encoders, link) {
> +		unsigned long idx = 0;
> +
> +		xa_for_each(&encoder_config->possible_crtcs, idx, crtc_config) {
> +			if (crtc_config == vkms_config_crtc)
> +				xa_erase(&encoder_config->possible_crtcs, idx);
> +		}
> +	}
> +
> +	kfree(vkms_config_crtc);
> +}
> +
> +void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
> +				struct vkms_config *vkms_config)
> +{
> +	if (!vkms_config_encoder)
>  		return;
> -	list_del(&vkms_config_overlay->link);
> -	kfree(vkms_config_overlay->name);
> -	kfree(vkms_config_overlay);
> +	list_del(&vkms_config_encoder->link);
> +	xa_destroy(&vkms_config_encoder->possible_crtcs);
> +
> +	struct vkms_config_crtc *crtc_config;
> +	struct vkms_config_encoder *encoder;
> +
> +	list_for_each_entry(crtc_config, &vkms_config->crtcs, link) {
> +		unsigned long idx = 0;
> +
> +		xa_for_each(&crtc_config->possible_encoders, idx, encoder) {
> +			if (encoder == vkms_config_encoder)
> +				xa_erase(&crtc_config->possible_encoders, idx);
> +		}
> +	}
> +
> +	kfree(vkms_config_encoder);
>  }
>  
>  void vkms_config_destroy(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *vkms_config_plane, *tmp_plane;
> +	struct vkms_config_encoder *vkms_config_encoder, *tmp_encoder;
> +	struct vkms_config_crtc *vkms_config_crtc, *tmp_crtc;
> +
>  
>  	list_for_each_entry_safe(vkms_config_plane, tmp_plane, &config->planes, link) {
> -		vkms_config_delete_plane(vkms_config_plane);
> +		vkms_config_delete_plane(vkms_config_plane, config);
> +	}
> +	list_for_each_entry_safe(vkms_config_encoder, tmp_encoder, &config->encoders, link) {
> +		vkms_config_delete_encoder(vkms_config_encoder, config);
> +	}
> +	list_for_each_entry_safe(vkms_config_crtc, tmp_crtc, &config->crtcs, link) {
> +		vkms_config_delete_crtc(vkms_config_crtc, config);
>  	}
>  
>  	kfree(config);
>  }
>  
> +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_config_plane,
> +					       struct vkms_config_crtc *vkms_config_crtc)
> +{
> +	u32 crtc_idx, encoder_idx;
> +	int ret;
> +
> +	ret = xa_alloc(&vkms_config_plane->possible_crtcs, &crtc_idx, vkms_config_crtc,
> +		       xa_limit_32b, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	ret = xa_alloc(&vkms_config_crtc->possible_planes, &encoder_idx, vkms_config_plane,
> +		       xa_limit_32b, GFP_KERNEL);
> +	if (ret) {
> +		xa_erase(&vkms_config_plane->possible_crtcs, crtc_idx);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkms_config_encoder,
> +						 struct vkms_config_crtc *vkms_config_crtc)
> +{
> +	u32 crtc_idx, encoder_idx;
> +	int ret;
> +
> +	ret = xa_alloc(&vkms_config_encoder->possible_crtcs, &crtc_idx, vkms_config_crtc,
> +		       xa_limit_32b, GFP_KERNEL);
> +	if (ret)
> +		return ret;
> +
> +	ret = xa_alloc(&vkms_config_crtc->possible_encoders, &encoder_idx, vkms_config_encoder,
> +		       xa_limit_32b, GFP_KERNEL);
> +	if (ret) {
> +		xa_erase(&vkms_config_encoder->possible_crtcs, crtc_idx);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
>  bool vkms_config_is_valid(struct vkms_config *config)

I still need to look into the xa_* code in more detail, but I think
that it is a great solution for the problem I had handling possible_crtcs
and possible_encoders.

About the validation, If I undertood the docs correctly:

  "All drivers should provide one primary plane per CRTC"
  https://www.kernel.org/doc/html/v4.17/gpu/drm-kms.html#plane-abstraction

We'd need to check that the number of primary planes is equal to the number
of CRTCs and that a configuration to assing one primary plane to each CRTC
is available.

To illustrate it with an example, this is a valid config:

  CRTC 0
  CRTC 1
  Primary Plane 0: possible_crtcs -> CRTC 0 and CRTC 1
  Primary Plane 1: possible_crtcs -> CRTC 0

But this is not a valid config because there are no compatible planes with
CRTC 1:

  CRTC 0
  CRTC 1
  Primary Plane 0: possible_crtcs -> CRTC 0
  Primary Plane 1: possible_crtcs -> CRTC 0

I think that your code would fail in the first example because of:

  // Multiple primary planes for only one CRTC
  if (has_primary)
    return false;

Also, we'd need to check that the number of CRTCs and encoders is <= 32.

>  {
>  	struct vkms_config_plane *config_plane;
> -
> -	bool has_cursor = false;
> -	bool has_primary = false;
> +	struct vkms_config_crtc *config_crtc;
> +	struct vkms_config_encoder *config_encoder;
>  
>  	list_for_each_entry(config_plane, &config->planes, link) {
>  		// Default rotation not in supported rotations
> @@ -141,22 +322,47 @@ bool vkms_config_is_valid(struct vkms_config *config)
>  		    BIT(config_plane->default_color_range))
>  			return false;
>  
> -		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
> -			// Multiple primary planes for only one CRTC
> -			if (has_primary)
> -				return false;
> -			has_primary = true;
> -		}
> -		if (config_plane->type == DRM_PLANE_TYPE_CURSOR) {
> -			// Multiple cursor planes for only one CRTC
> -			if (has_cursor)
> -				return false;
> -			has_cursor = true;
> -		}
> +		// No CRTC linked to this plane
> +		if (xa_empty(&config_plane->possible_crtcs))
> +			return false;
> +	}
> +
> +	list_for_each_entry(config_encoder, &config->encoders, link) {
> +		// No CRTC linked to this encoder
> +		if (xa_empty(&config_encoder->possible_crtcs))
> +			return false;
>  	}
>  
> -	if (!has_primary)
> -		return false;
> +	list_for_each_entry(config_crtc, &config->crtcs, link) {
> +		bool has_primary = false;
> +		bool has_cursor = false;
> +		unsigned long idx = 0;
> +
> +		// No encoder attached to this CRTC
> +		if (xa_empty(&config_crtc->possible_encoders))
> +			return false;
> +
> +		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
> +			if (config_plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +				// Multiple primary planes for only one CRTC
> +				if (has_primary)
> +					return false;
> +
> +				has_primary = true;
> +			}
> +			if (config_plane->type == DRM_PLANE_TYPE_CURSOR) {
> +				// Multiple cursor planes for only one CRTC
> +				if (has_cursor)
> +					return false;
> +
> +				has_cursor = true;
> +			}
> +		}
> +
> +		// No primary plane for this CRTC
> +		if (!has_primary)
> +			return false;
> +	}
>  
>  	return true;
>  }
> @@ -167,8 +373,9 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	struct drm_device *dev = entry->dev;
>  	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	struct vkms_config_plane *config_plane;
> +	struct vkms_config_crtc *config_crtc;
> +	struct vkms_config_encoder *config_encoder;
>  
> -	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
>  		seq_puts(m, "plane:\n");
>  		seq_printf(m, "\tname: %s\n", config_plane->name);
> @@ -185,6 +392,15 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   config_plane->default_color_range);
>  	}
>  
> +	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
> +		seq_puts(m, "encoder:\n");
> +	}
> +
> +	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
> +		seq_puts(m, "crtc:\n");
> +		seq_printf(m, "\twriteback: %d\n", config_crtc->writeback);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index d668aeab9d26..8f247fc09373 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -9,16 +9,59 @@
>  /**
>   * struct vkms_config - General configuration for VKMS driver
>   *
> - * @writeback: If true, a writeback buffer can be attached to the CRTC
>   * @planes: List of planes configured for this device. They are created by the function
>   *          vkms_config_create_plane().
> + * @crtcs: List of crtcs configured for this device. They are created by the function
> + *         vkms_config_create_crtc().
> + * @encoders: List of encoders configured for this device. They are created by the function
> + *            vkms_config_create_encoder().
>   * @dev: Used to store the current vkms device. Only set when the device is instancied.
>   */
>  struct vkms_config {
> -	bool writeback;
>  	struct vkms_device *dev;
>  
>  	struct list_head planes;
> +	struct list_head crtcs;
> +	struct list_head encoders;
> +};
> +
> +/**
> + * struct vkms_config_crtc
> + *
> + * @link: Link to the others CRTCs
> + * @possible_planes: List of planes that can be used with this CRTC
> + * @possible_encoders: List of encoders that can be used with this CRTC
> + * @crtc: Internal usage. This pointer should never be considered as valid. It can be used to
> + *         store a temporary reference to a vkms crtc during device creation. This pointer is
> + *         not managed by the configuration and must be managed by other means.
> + */
> +struct vkms_config_crtc {
> +	struct list_head link;
> +
> +	bool writeback;
> +	struct xarray possible_planes;
> +	struct xarray possible_encoders;
> +
> +	/* Internal usage */
> +	struct vkms_crtc *crtc;
> +};
> +
> +/**
> + * struct vkms_config_encoder
> + *
> + * @link: Link to the others encoders
> + * @possible_crtcs: List of CRTC that can be used with this encoder
> + * @encoder: Internal usage. This pointer should never be considered as valid. It can be used to
> + *         store a temporary reference to a vkms encoder during device creation. This pointer is
> + *         not managed by the configuration and must be managed by other means.
> + */
> +struct vkms_config_encoder {
> +	struct list_head link;
> +
> +	struct xarray possible_crtcs;
> +
> +	/* Internal usage */
> +	struct drm_encoder *encoder;
>  };
>  
>  /**
> @@ -34,6 +77,7 @@ struct vkms_config {
>   * @supported_color_encoding: Color encoding that this plane will support
>   * @default_color_range: Default color range that should be used by this plane
>   * @supported_color_range: Color range that this plane will support
> + * @possible_crtcs: List of CRTC that can be used with this plane.
>   * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
>   *         store a temporary reference to a vkms plane during device creation. This pointer is
>   *         not managed by the configuration and must be managed by other means.
> @@ -50,6 +94,7 @@ struct vkms_config_plane {
>  	enum drm_color_range default_color_range;
>  	unsigned int supported_color_range;
>  
> +	struct xarray possible_crtcs;
>  	/* Internal usage */
>  	struct vkms_plane *plane;
>  };
> @@ -84,14 +129,63 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
>   */
>  struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
>  
> +/**
> + * vkms_config_create_crtc() - Create a crtc configuration
> + *
> + * This will allocate and add a new crtc configuration to @vkms_config.
> + * @vkms_config: Configuration where to insert new crtc configuration
> + */
> +struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config);
> +
> +/**
> + * vkms_config_create_encoder() - Create an encoder configuration
> + *
> + * This will allocate and add a new encoder configuration to @vkms_config.
> + * @vkms_config: Configuration where to insert new encoder configuration
> + */
> +struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_config);
> +
> +int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_config_plane,
> +					       struct vkms_config_crtc *vkms_config_crtc);
> +int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkms_config_encoder,
> +						 struct vkms_config_crtc *vkms_config_crtc);
> +
>  /**
>   * vkms_config_delete_plane() - Remove a plane configuration and frees its memory
>   *
>   * This will delete a plane configuration from the parent configuration. This will NOT
> - * cleanup and frees the vkms_plane that can be stored in @vkms_config_plane.
> + * cleanup and frees the vkms_plane that can be stored in @vkms_config_plane. It will also remove
> + * any reference to this plane in @vkms_config.
> + *
>   * @vkms_config_plane: Plane configuration to cleanup
> + * @vkms_config: Parent configuration
> + */
> +void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
> +			      struct vkms_config *vkms_config);
> +/**
> + * vkms_config_delete_crtc() - Remove a CRTC configuration and frees its memory
> + *
> + * This will delete a CRTC configuration from the parent configuration. This will NOT
> + * cleanup and frees the vkms_crtc that can be stored in @vkms_config_crtc. It will also remove
> + * any reference to this CRTC in @vkms_config.
> + *
> + * @vkms_config_crtc: Plane configuration to cleanup
> + * @vkms_config: Parent configuration
> + */
> +void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
> +			     struct vkms_config *vkms_config);
> +/**
> + * vkms_config_delete_encoder() - Remove an encoder configuration and frees its memory
> + *
> + * This will delete an encoder configuration from the parent configuration. This will NOT
> + * cleanup and frees the vkms_encoder that can be stored in @vkms_config_encoder. It will also
> + * remove any reference to this CRTC in @vkms_config.
> + *
> + * @vkms_config_encoder: Plane configuration to cleanup
> + * @vkms_config: Parent configuration
>   */
> -void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane);
> +void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
> +				struct vkms_config *vkms_config);
>  
>  /**
>   * vkms_config_alloc_default() - Allocate the configuration for the default device
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 6f6d3118b2f2..654238dbba7f 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -281,9 +281,17 @@ static void vkms_crtc_destroy_workqueue(struct drm_device *dev, void *raw_vkms_c
>  	destroy_workqueue(vkms_crtc->composer_workq);
>  }
>  
> +static void vkms_crtc_cleanup_writeback_connector(struct drm_device *dev, void *data)
> +{
> +	struct vkms_crtc *vkms_crtc = data;
> +
> +	drm_writeback_connector_cleanup(&vkms_crtc->wb_connector);
> +}
> +
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor)
> +				 struct drm_plane *cursor,
> +				 struct vkms_config_crtc *config)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_crtc *vkms_crtc;
> @@ -317,5 +325,15 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	if (config->writeback) {
> +		ret = vkms_enable_writeback_connector(vkmsdev, vkms_crtc);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		ret = drmm_add_action_or_reset(&vkmsdev->drm, vkms_crtc_cleanup_writeback_connector,
> +					       vkms_crtc);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
>  	return vkms_crtc;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.h b/drivers/gpu/drm/vkms/vkms_crtc.h
> index dde28884a0a5..a271e95f1cfe 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.h
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.h
> @@ -86,5 +86,6 @@ struct vkms_crtc {
>   */
>  struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
> -				 struct drm_plane *cursor);
> +				 struct drm_plane *cursor,
> +				 struct vkms_config_crtc *config);
>  #endif //_VKMS_CRTC_H
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 403006a0bb61..6deff5099322 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -153,13 +153,12 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  
>  static int vkms_output_init(struct vkms_device *vkmsdev)
>  {
> -	struct vkms_config_plane *config_plane;
> +	struct vkms_config_encoder *config_encoder;
>  	struct drm_device *dev = &vkmsdev->drm;
> +	struct vkms_config_plane *config_plane;
> +	struct vkms_config_crtc *config_crtc;
>  	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
> -	struct vkms_crtc *crtc;
> -	struct drm_plane *plane;
> -	struct vkms_plane *primary, *cursor = NULL;
> +	unsigned long idx;
>  	int ret;
>  	int writeback;
>  
> @@ -169,22 +168,30 @@ static int vkms_output_init(struct vkms_device *vkmsdev)
>  			ret = PTR_ERR(config_plane->plane);
>  			return ret;
>  		}
> -
> -		if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
> -			primary = config_plane->plane;
> -		else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
> -			cursor = config_plane->plane;
>  	}
>  
> -	/* [1]: Initialize the crtc component */
> -	crtc = vkms_crtc_init(vkmsdev, &primary->base,
> -			      cursor ? &cursor->base : NULL);
> -	if (IS_ERR(crtc))
> -		return PTR_ERR(crtc);
> +	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
> +		struct drm_plane *primary = NULL, *cursor = NULL;
> +
> +		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
> +			if (config_plane->type == DRM_PLANE_TYPE_PRIMARY)
> +				primary = &config_plane->plane->base;
> +			else if (config_plane->type == DRM_PLANE_TYPE_CURSOR)
> +				cursor = &config_plane->plane->base;
> +		}
> +
> +		config_crtc->crtc = vkms_crtc_init(vkmsdev, primary, cursor, config_crtc);
>  
> -	/* Enable the output's CRTC for all the planes */
> -	drm_for_each_plane(plane, &vkmsdev->drm) {
> -		plane->possible_crtcs |= drm_crtc_mask(&crtc->base);
> +		if (IS_ERR(config_crtc->crtc)) {
> +			ret = PTR_ERR(config_crtc->crtc);
> +			return ret;
> +		}
> +	}
> +
> +	list_for_each_entry(config_crtc, &vkmsdev->config->crtcs, link) {
> +		xa_for_each(&config_crtc->possible_planes, idx, config_plane) {
> +			config_plane->plane->base.possible_crtcs |= drm_crtc_mask(&config_crtc->crtc->base);
> +		}
>  	}
>  
>  	/* Initialize the connector component */
> @@ -201,32 +208,28 @@ static int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>  
> -	/* Initialize the encoder component */
> -	encoder = drmm_kzalloc(&vkmsdev->drm, sizeof(*encoder), GFP_KERNEL);
> -	if (!encoder)
> -		return -ENOMEM;
> -
> -	ret = drmm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -				DRM_MODE_ENCODER_VIRTUAL, NULL);
> -	if (ret) {
> -		DRM_ERROR("Failed to init encoder\n");
> -		return ret;
> -	}
> -
> -	encoder->possible_crtcs = drm_crtc_mask(&crtc->base);
>  
> -	/* Attach the encoder and the connector */
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret) {
> -		DRM_ERROR("Failed to attach connector to encoder\n");
> -		return ret;
> -	}
> +	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
> +		config_encoder->encoder = drmm_kzalloc(&vkmsdev->drm,
> +						       sizeof(*config_encoder->encoder),
> +						       GFP_KERNEL);
> +		if (!config_encoder->encoder)
> +			return -ENOMEM;
> +		ret = drmm_encoder_init(dev, config_encoder->encoder, &vkms_encoder_funcs,
> +					DRM_MODE_ENCODER_VIRTUAL, NULL);
> +		if (ret) {
> +			DRM_ERROR("Failed to init encoder\n");
> +			return ret;
> +		}
>  
> -	/* Initialize the writeback component */
> -	if (vkmsdev->config->writeback) {
> -		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
> -		if (writeback)
> -			DRM_ERROR("Failed to init writeback connector\n");
> +		xa_for_each(&config_encoder->possible_crtcs, idx, config_crtc) {
> +			config_encoder->encoder->possible_crtcs |= drm_crtc_mask(&config_crtc->crtc->base);
> +		}
> +		if (IS_ERR(config_encoder->encoder))
> +			return PTR_ERR(config_encoder->encoder);
> +		ret = drm_connector_attach_encoder(connector, config_encoder->encoder);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	drm_mode_config_reset(dev);
> 
