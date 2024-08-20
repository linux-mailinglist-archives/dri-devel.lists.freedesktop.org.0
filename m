Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33B9581A8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1020410E53A;
	Tue, 20 Aug 2024 09:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EXiaFMGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B256510E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:09:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-371a6fcd863so1984651f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724144974; x=1724749774; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krCYSxdDpTQrVUrzWiIkCh5CYHoHUCK7xs+My+FCoPs=;
 b=EXiaFMGF/OqrZ9ulkd77k8B5FP0uuImh+5aRpDURzxUG3LeaQ8P2iluNyuJD4VgWrz
 cVqO+NMqN2cITig3K7osB+adGImIVHuyZXr0Y7fsOAHW5KNx9pA0Igyyi4m6UH7GV7UU
 YGMP1kKet+DeLTS+2rXURNVdkPpqFBzq2W8ft+DpyjmdnNsAxeya0n6fI/8QM2X2TMf+
 AmkEtMQVEfxFLVzul69IZGpfBqlY6HrQCGZv3KnXDUknNAv6YkIP7Gg9lyU5Igg9U9Y6
 w+Wcl3gQpIzaQsoEIpF5uYmCjsZmYXAXp3PKGcJYMN6WgMqGIUxF4HFzHIAsHODfYe7J
 +44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724144974; x=1724749774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=krCYSxdDpTQrVUrzWiIkCh5CYHoHUCK7xs+My+FCoPs=;
 b=UUatWiHW+7eFYdtcqdb6Hr4ZIhP+A50ZbE84LiLzBGf3DutHGbe4WwXg2zoViL7w4f
 RWXBbtU/MVkISEkCbWrAjneUI67tWYLz5Yqp6M+KRIwKdLbGXyH1jIgsC7PxtAlFCByS
 jBgjjvSIKU9+n6yuMj50nc0DApWs3bBuOKHxV+LdQCNJhqzNz/9W6a2wNNFZnoYCTp0i
 GSs5jb3CdoFbM2YJlG9ZnBPwz/OrSYpLDW2VnPE9EuX5W6LWzVOfQcqkkc870o1rH/AY
 DykMWdJ8B3DMofNvMQUz5QxATPeIpEPjhtb9B+4PL0qQfwQVv4gJArXNECWiMB6bNpZk
 aRTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZAyOhXYGJVGwGhvqZ1RUxKtwS7w0sHmna0nmWSnwIYLv7koXX9dqz6JKixk7G9hCp+WeP55/xzxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFfwfLvJ6TvK6CU/boMw+w75u+mUIJZm37ckHQYsvszR6ZtOcP
 BdtoQVHd5Id9SXNFJJZkfZu6jVshFwQNtEU2U1Q7mgW3O0QWPxKX
X-Google-Smtp-Source: AGHT+IGSlYSQWy5PrGTd8Jc5PKw3jaHd5f4fetH8Kiozuh65q2Zh7ztB+yLnmScukC/b+W02t6l4kw==
X-Received: by 2002:adf:e78d:0:b0:368:460d:d942 with SMTP id
 ffacd0b85a97d-37194646be4mr7681089f8f.24.1724144973344; 
 Tue, 20 Aug 2024 02:09:33 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898ac074sm12557067f8f.106.2024.08.20.02.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:09:33 -0700 (PDT)
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
Subject: [PATCH RFC 2/4] drm/vkms: Switch to managed for encoder
Date: Tue, 20 Aug 2024 11:09:27 +0200
Message-ID: <20240820090930.2869-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-vkms-managed-v1-2-7ab8b8921103@bootlin.com>
References: <20240814-google-vkms-managed-v1-2-7ab8b8921103@bootlin.com>
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

> The current VKMS driver uses non-managed function to create encoders. It
> is not an issue yet, but in order to support multiple devices easly,

s/easly/easily

> convert this code to use drm and device managed helpers.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
>  drivers/gpu/drm/vkms/vkms_output.c | 21 +++++++++------------
>  2 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index cea7b2640c5d..2c9d1f20ce84 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -42,7 +42,6 @@
>   */
>  struct vkms_output {
>  	struct drm_crtc crtc;
> -	struct drm_encoder encoder;
>  	struct drm_writeback_connector wb_connector;
>  	struct hrtimer vblank_hrtimer;
>  	ktime_t period_ns;
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 4767838c3a73..cb8507917b5f 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -16,9 +16,7 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static const struct drm_encoder_funcs vkms_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> +static const struct drm_encoder_funcs vkms_encoder_funcs = {};

This struct is not required, drmm_encoder_init() can take a NULL value.

>  
>  static int vkms_conn_get_modes(struct drm_connector *connector)
>  {
> @@ -55,7 +53,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct drm_connector *connector;
> -	struct drm_encoder *encoder = &output->encoder;
> +	struct drm_encoder *encoder;
>  	struct drm_crtc *crtc = &output->crtc;
>  	struct vkms_plane *primary, *cursor = NULL;
>  	int ret;
> @@ -103,8 +101,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  
>  	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
>  
> -	ret = drm_encoder_init(dev, encoder, &vkms_encoder_funcs,
> -			       DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	encoder = drmm_kzalloc(&vkmsdev->drm, sizeof(*encoder), GFP_KERNEL);

&vkmsdev->drm => dev

> +	if (!encoder)

The same here, we could log this error:
		DRM_ERROR("Failed to allocate encoder\n");

> +		return -ENOMEM;
> +
> +	ret = drmm_encoder_init(dev, encoder, &vkms_encoder_funcs,

vkms_encoder_funcs can be NULL.

> +				DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
>  		return ret;
> @@ -118,7 +120,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret) {
>  		DRM_ERROR("Failed to attach connector to encoder\n");
> -		goto err_attach;
> +		return ret;
>  	}
>  
>  	if (vkmsdev->config->writeback) {
> @@ -130,9 +132,4 @@ int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>  	drm_mode_config_reset(dev);
>  
>  	return 0;
> -
> -err_attach:
> -	drm_encoder_cleanup(encoder);
> -
> -	return ret;
>  }
