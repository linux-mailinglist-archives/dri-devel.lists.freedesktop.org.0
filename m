Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8C96D89E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 938D210E11D;
	Thu,  5 Sep 2024 12:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JyI3fuMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17E610E11D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:33:30 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-374bd0da617so411682f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725539609; x=1726144409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RfvHzjH+Eqg9aQgCo3Cz3Zipw1g+SvWwFvncM0vKisg=;
 b=JyI3fuMjK5amj9BreSiywFsZNItxl6bcxz4mGMbLNv0ztuJw+itZwDT21xM/1FlCJD
 LuknhudoVZdCQims/LO2wEqECgDDopnfpfvd44DOkQaxnOAVTjAlIbIs0kK6toGtzHFR
 yiRu59n6fPO4JFduE+P4B6Smb1Oj0u9bPbkeYIokThJg6z0ZB7tTDWAB7GghZ+gSbnS8
 8wLHcx09BEcPWQIeqUrUeGi7gqQ0evr0Dzz5Ot+El1xbPN9XYwQMnNZxHvWtptixnqKt
 SNV/5xt91iSH/I/ZXUM3+HNfJU8MjEMB/cO+LNnXlPeLK4Fr9OVK+pqWPPID3b3T5DAL
 kJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725539609; x=1726144409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RfvHzjH+Eqg9aQgCo3Cz3Zipw1g+SvWwFvncM0vKisg=;
 b=vMPC9cAeN8dZsdTKdJl3hOTI6BAkoDeXEjHtcCvugtteE2H3a5IygSUp94lL4hjbO8
 ay9xnfX0FkCZUMDLr6CJPo6jS9o/6MB0X4PhIMGVVDZ9WEUJkypMQCtBTQQg+5YfwVk1
 pmZCGtwTZMBplXbAAwIk113rpcC0brg20nwYQuLJLzXszLFbZwNcpMyoMEhOvgNMEWp0
 VEQ47OHP7pVBBJXKtmvfHYua++qduAWPPFzFdD19v5v37H4oGurpUQauYTkWbvvmxQLn
 bSDNA7wiwLmu4lSZCWDaFgUk8oHkHzDtdbqK9saaQDweE4ihYIq1+MXBvHwGw9TOiGQC
 gQxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1zaw/EFlZqca/WWNTW/5B4GEMP/Of1Je/JfaRjp4VNy/XKIvczFPniClC1cI+IOvkIb8HHAl2S+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0jL2a2yppuCrh8Ea8SzVF23CadHqEJK1xUF9djJhg+Db4u+68
 QkouDWx9cz9wLXIVMnxuZDiBS4FbTNWsJOMkl4FP9w0ZKj59FF/x
X-Google-Smtp-Source: AGHT+IGqrk9RY9ZJQQELiCa/NbcnoDGQ9qLtISyCVkOLNXfV5KOJMUSOzjSblaz8VUnoVwNemlMXzw==
X-Received: by 2002:a5d:4c82:0:b0:374:b31e:3b3b with SMTP id
 ffacd0b85a97d-374bce97b23mr10572502f8f.1.1725539608840; 
 Thu, 05 Sep 2024 05:33:28 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c9c3944cesm15467855e9.30.2024.09.05.05.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:33:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH RFC 02/15] drm/vkms: remove possible crtc from parameters
Date: Thu,  5 Sep 2024 14:33:27 +0200
Message-ID: <20240905123327.3049-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-2-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-2-6e179abf9fd4@bootlin.com>
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

> As the crtc mask is dynamic, avoid hardcoding it. It is already computed
> once all the planes are created, so it should be a no-op
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c   | 10 +++++-----
>  drivers/gpu/drm/vkms/vkms_plane.c |  5 +++--
>  drivers/gpu/drm/vkms/vkms_plane.h |  4 +---
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 7ac3ab7e16e5..e71b45fcb9b8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -166,7 +166,7 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.get_modes = vkms_conn_get_modes,
>  };
>  
> -static int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc)
> +static int vkms_output_init(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
> @@ -184,20 +184,20 @@ static int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc)
>  	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
>  	 * composition.
>  	 */
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
>  	if (IS_ERR(primary))
>  		return PTR_ERR(primary);
>  
>  	if (vkmsdev->config->overlay) {
>  		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc);
> +			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
>  			if (IS_ERR(overlay))
>  				return PTR_ERR(overlay);
>  		}
>  	}
>  
>  	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc);
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
>  		if (IS_ERR(cursor))
>  			return PTR_ERR(cursor);
>  	}
> @@ -284,7 +284,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkms_output_init(vkmsdev);
>  }
>  
>  static int vkms_create(struct vkms_config *config)
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e549c9523a34..b5740c27180b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_plane.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> @@ -222,12 +223,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int possible_crtc_index)
> +				   enum drm_plane_type type)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
>  
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << possible_crtc_index,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,

Shouldn't the index be BIT(0)? I see in the commit message that
possible_crtcs is computed once all planes are added, but I
couldn't find where. It'd be nice if you could point to the
function that sets the correct CRTC mask in the commit message.

>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
>  					   NULL, type, NULL);
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
> index 90554c9fe250..95b2428331b8 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.h
> +++ b/drivers/gpu/drm/vkms/vkms_plane.h
> @@ -52,11 +52,9 @@ struct vkms_frame_info {
>   *
>   * @vkmsdev: vkms device containing the plane
>   * @type: type of plane to initialize
> - * @possible_crtc_index: Crtc which can be attached to the plane. The caller must ensure that
> - * possible_crtc_index is positive and less or equals to 31.
>   */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int possible_crtc_index);
> +				   enum drm_plane_type type);
>  
>  #define drm_plane_state_to_vkms_plane_state(target) \
>  	container_of(target, struct vkms_plane_state, base.base)
> 
