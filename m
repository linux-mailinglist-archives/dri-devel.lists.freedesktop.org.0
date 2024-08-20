Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3CF9581A4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2F910E535;
	Tue, 20 Aug 2024 09:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iEXySnoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAFC10E535
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:09:20 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso42978655e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724144959; x=1724749759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39nNL2+o4oHw4rNBNcBPdzYRJpF6VA3Ac0WKvhXecWg=;
 b=iEXySnojEot1vk7orjhGmaoIOYZScGXulcA79zXaVHfAwXuvJm5HZFujkA2uC8EQLe
 GsQOH149J+P0ziYF6lY1ovJirHkma1K9/aP2KJADOANz0UcHI6aOwgdTcsxgNdj9IN7H
 SnaRAjDQcVLtS5MUkYHPHMzy4lLOX3ueYiUodhQhpxeljd5D1lPDUp8poLUGuS+5hNGs
 aU5oS8cSUb2eMvCW/w1Jv7l0t91bFA+6Pnfl7DsMRoalaczcYzpZrkYUm+IicWZdQwR3
 bZSp1lz/xDTad31EtbMKeTDWIl0RO7W8ojtFCIUittwxKcPxD0kA7lcf+xTb70c8ruUk
 ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724144959; x=1724749759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=39nNL2+o4oHw4rNBNcBPdzYRJpF6VA3Ac0WKvhXecWg=;
 b=tUl4ppe6tm4zgRFn+LHFJ/m4KffqCxyMSI0nDfLFapp2lOgcbEB4ApAgwsXmfzkHb0
 WLcG5GqvRLymF1xSmLfJzc3ViDpTQrL/96mUF1I9TTX1YCES3dvIFk3G6EheeaPlPFen
 bqlMHWto0yrdDJT8UXlTAb/u/tuFYuP0SlfMrZthhjbswBwTxMFN5jM8SbyrE4Mx5C67
 xjxX9ePsFpiWrpMcukYb0o3BIN1N5Xdf3/UPjcrXXJMgquaeAMUEQH77xFYi5uwjv3zU
 h52O8SwWRbixb6Nko4a2Rdchjflb4fLRk9MlSsVLPEWJU5JfYhNlcjcNQC3AdR00OnMD
 dk3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6PK63GG5FpsHSOCmnXwRlDy2r4Qt74mLpjoEmMbQADjIo1qlbmOX8KxkTcG4MY6TEwBmq7asvFCQN2Hx8YJWvPt0m1QR8CN7f+72FAdno
X-Gm-Message-State: AOJu0YzzBtxXsIoF9fYvH039pVv+AeAbEUsUBosgD2AlOnTb8ED0asBA
 H0lO48MbnBr4+JROkSirl9dNxRjd9qCGDbh3xWqQ3biwqtrR5Eup
X-Google-Smtp-Source: AGHT+IESSlGS/R12Dy0bo/M5WH+m6NeXa45/mLfj0RMkSqzA9SSFkWXBhmym40DC1+pINyonhRv6Iw==
X-Received: by 2002:adf:9bc3:0:b0:367:35d7:bf11 with SMTP id
 ffacd0b85a97d-37194455af1mr8074427f8f.25.1724144958748; 
 Tue, 20 Aug 2024 02:09:18 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a311sm12650575f8f.23.2024.08.20.02.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:09:18 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 melissa.srw@gmail.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RFC 1/4] drm/vkms: Switch to managed for connector
Date: Tue, 20 Aug 2024 11:09:11 +0200
Message-ID: <20240820090912.2854-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-vkms-managed-v1-1-7ab8b8921103@bootlin.com>
References: <20240814-google-vkms-managed-v1-1-7ab8b8921103@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Thanks for these patches. Easy review as my configfs series included similar
patches :) I think that this series could be easily rebased on drm-misc-next,
but I don't know if that'd add a lot of work rebasing other series. I'd be nice
to get these 4 merged.

> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
>  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++------------
>  2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index f74a5c2045f9..cea7b2640c5d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -43,7 +43,6 @@
>  struct vkms_output {
>  	struct drm_crtc crtc;
>  	struct drm_encoder encoder;
> -	struct drm_connector connector;
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 20073a00b200..4767838c3a73 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,6 +3,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_managed.h>

Nit: Keep includes sorted alphabetically if possible

>  
>  #include "vkms_writeback.h"
>  #include "vkms_plane.h"
> @@ -10,7 +11,6 @@
>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -54,7 +54,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  {
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
> -	struct drm_connector *connector = &output->connector;
> +	struct drm_connector *connector;
>  	struct drm_encoder *encoder = &output->encoder;
>  	struct drm_crtc *crtc = &output->crtc;
>  	struct vkms_plane *primary, *cursor = NULL;
> @@ -90,11 +90,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  	if (ret)
>  		return ret;
>  
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);

"&vkmsdev->drm" can be replaced with "dev".

> +	if (!connector)

For consistency with the init function, it'd be nice to log this error as well:

		DRM_ERROR("Failed to allocate connector\n");

> +		return -ENOMEM;
> +
> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init connector\n");
> -		goto err_connector;
> +		return ret;
>  	}
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
> @@ -103,7 +107,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
> -		goto err_encoder;
> +		return ret;
>  	}
>  	/*
>  	 * This is an hardcoded value to select crtc for the encoder.
> @@ -130,11 +134,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  err_attach:
>  	drm_encoder_cleanup(encoder);
>  
> -err_encoder:
> -	drm_connector_cleanup(connector);
> -
> -err_connector:
> -	drm_crtc_cleanup(crtc);
> -

I think that, technically, err_encoder should call drm_crtc_cleanup() in this
patch. However, since a future patch will remove this code I don't find it that
relevant.

>  	return ret;
>  }
