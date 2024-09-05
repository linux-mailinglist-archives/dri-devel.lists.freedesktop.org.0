Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E897096D8A6
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C31010E129;
	Thu,  5 Sep 2024 12:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FXSJSBCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114DC10E129
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:34:16 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374bd0da617so412224f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539654; x=1726144454; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LIKjSMnoIEZ+JdjBN7NIEbFh4V1B/fbiD4x6A1IuZlA=;
 b=FXSJSBCExhrzFvm9ySnaH+i53UzDCLQ3j2OSnqnCyzAM7lyfNhlvh2ayyTa2CnJtXV
 +hTR8EJVtEzHWYEjsYB83yilLmp4bLLIGg9D6dT7DrseD2nJJtZr33E4BZjuk36zAZBp
 ImZFLDI39EXL3nDoC37BPrEbYABz04IE1s7+RWUFlLquAOqh6x3vFKPakNdQs2JVw3kD
 tE2rBfnyhbWCHPUDDkgZRaoBSCocH/UkdP7Nn01PKlzkueJTPd4hS/c2C0jf+IepFZ97
 4WC02fMg5/ZOO00lh9oE2lypv1TrrA+m0gScAMI7JCbthAM916JAjHLe9iIRYPfCZ+KA
 DKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539654; x=1726144454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LIKjSMnoIEZ+JdjBN7NIEbFh4V1B/fbiD4x6A1IuZlA=;
 b=Df6K9rn1cP3uR5tFm/uXHiJ4VKknbicxVxEbPpbEcayXroucX28QoEcLbMJ9dX6d2m
 cPpj9vYvqzkzdhA5L8z8aYktpRcX97gXjHbTQppDyh3Qm6QbEB8ONhzHorWdI6UoQEB4
 l8D3YXv0wQPOCgfMDTkOtJduYmEbZhmYV2jZ9rev2Jt89CsHxwZVkeBtQE7fJgmx/Hcg
 3fYU/VE1XrniNDWEXViL8uWjghvBBa3S0k/EIw0vpaxF8dYI9hfKogF/fVaBA/qm5JBE
 QKhLuudwXW22PdZ7y9jOsE8KUAnfcrkudOFQdnQkwsK4aLy1gGFwXeAFwG+wXVsrOPI6
 jZxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVB9+ZQD2ZqoOVP7UJtbMEUuQPKdvg4tQhgRrbhksPXWxMe5v226frcEXBfAcN55XU0jzfndr9gPs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8Rm4fB7ZV0LcYZi8C5hqYDLidxjjs/IbWkO5OpnqvO5KQ0hJl
 3cCAORTr/TeDRw7hU+PGkTJM9VvSotkCEne0h6qboSH1xtKj5pPawbnOnDVd
X-Google-Smtp-Source: AGHT+IG/8WTsUW/MtfWTYrIUmNChxLVEzL1QgtDa+4f6zEa5cMKnDhe03yUYc+34XbJ8WGyYLk8wKw==
X-Received: by 2002:a5d:6192:0:b0:374:ba2c:3028 with SMTP id
 ffacd0b85a97d-374bcfb8071mr11456610f8f.36.1725539654300; 
 Thu, 05 Sep 2024 05:34:14 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bacaac810sm252388875e9.33.2024.09.05.05.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:34:13 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 07/15] drm/vkms: Introduce plane name configuration
Date: Thu,  5 Sep 2024 14:34:13 +0200
Message-ID: <20240905123413.3127-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-7-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-7-6e179abf9fd4@bootlin.com>
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

> As a plane will be a folder in ConfigFS, add name configuration for plane
> so it will reflect the folder name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 14 ++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h |  2 ++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  2 +-
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index b1c6160d350f..b8e235a22e90 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -34,6 +34,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  		goto err_alloc;
>  
>  	plane->type = DRM_PLANE_TYPE_PRIMARY;
> +	plane->name = kzalloc(sizeof("primary"), GFP_KERNEL);
> +	if (!plane->name)
> +		goto err_alloc;
> +	sprintf(plane->name, "primary");

I think that, since all planes will have a name, you could make the
name a function param and kmemdup() it in vkms_config_create_plane().

The same could apply for CRTCs and encoders in patches 13 and 14.
>  
>  	if (enable_overlay) {
>  		for (int i = 0; i < NUM_OVERLAY_PLANES; i++) {
> @@ -41,6 +45,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  			if (!plane)
>  				goto err_alloc;
>  			plane->type = DRM_PLANE_TYPE_OVERLAY;
> +			plane->name = kzalloc(10, GFP_KERNEL);
> +			if (!plane->name)
> +				goto err_alloc;
> +			snprintf(plane->name, 10, "plane-%d", i);
>  		}
>  	}
>  	if (enable_cursor) {
> @@ -48,6 +56,10 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
>  		if (!plane)
>  			goto err_alloc;
>  		plane->type = DRM_PLANE_TYPE_CURSOR;
> +		plane->name = kzalloc(sizeof("cursor"), GFP_KERNEL);
> +		if (!plane->name)
> +			goto err_alloc;
> +		sprintf(plane->name, "cursor");
>  	}
>  
>  	return vkms_config;
> @@ -79,6 +91,7 @@ void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_overlay)
>  	if (!vkms_config_overlay)
>  		return;
>  	list_del(&vkms_config_overlay->link);
> +	kfree(vkms_config_overlay->name);
>  	kfree(vkms_config_overlay);
>  }
>  
> @@ -131,6 +144,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
>  	list_for_each_entry(config_plane, &vkmsdev->config->planes, link) {
>  		seq_puts(m, "plane:\n");
> +		seq_printf(m, "\tname: %s\n", config_plane->name);
>  		seq_printf(m, "\ttype: %d\n", config_plane->type);
>  	}
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 77c1c3934189..792c5e904aa1 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -25,6 +25,7 @@ struct vkms_config {
>   * struct vkms_config_plane
>   *
>   * @link: Link to the others planes
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that at least one
>   *        plane is primary.
>   * @plane: Internal usage. This pointer should never be considered as valid. It can be used to
> @@ -34,6 +35,7 @@ struct vkms_config {
>  struct vkms_config_plane {
>  	struct list_head link;
>  
> +	char *name;
>  	enum drm_plane_type type;
>  
>  	/* Internal usage */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index dc9bccf60071..d2b1b524499f 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -231,7 +231,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
> -					   NULL, config->type, NULL);
> +					   NULL, config->type, config->name);
>  	if (IS_ERR(plane))
>  		return plane;
>  
> 
