Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C843A958B46
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE9E10E1F2;
	Tue, 20 Aug 2024 15:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdDbbLZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD6810E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:29:25 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42812945633so49939965e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 08:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724167764; x=1724772564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QkWOPQjGLs4dsHLfoUaXJd6WQ78zM6/OqatLTFO3uUs=;
 b=mdDbbLZItBNzjWlnz4Um6UhgkoSrGZVQGg0oTMC7aMuT6727fvoOyI1ui0LIOwuX0W
 p4GaFzHFD35BXQngF5AZKhCrI9CcNU9CN/Aqxsqb9pzVE6naesSh3P9Joub4y1H+icju
 A77IywBZTOzNOvoZSCUshiFzDMCtfqGEfG5Nw+NBzKtBBm7nl4UK5JraYx54YK+N03fx
 WKkilpSL+R0J2CFI7OLbaOkubt3eXIbXgVy5SkKWdPcfaEYjl/zIJE+bUQJ3QB+LjV3q
 KXs3zX2xjS3w1/srklKOfcQH/KwwWxxD2nmE/ecpchaSOCKf23xq9crJzKe7v9qUvnXi
 cMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724167764; x=1724772564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QkWOPQjGLs4dsHLfoUaXJd6WQ78zM6/OqatLTFO3uUs=;
 b=Z22qhtbuXsokfGr459vgd58ZlDLGSidLqay+SspdC1EgHMyz3TZVzc/afw+e2SPxNP
 PtuQFzImao+0jKNRLaIMlT6Q4qlhQDnc5k6svsmbvW2yXtJteu/8YZAG0vWwU1kdED/3
 VPcVhtlwsbTRgqZdOVWFaAPC93EkvTiw+HYcojpztm+oQJDKo3C4C8N+QRUgLHpW1K1d
 b0Xw+sAkLKSLzdql/lCjCnlEmLalJATfVzk/qihwfUy7gvDa50Jv/TBOBzijLb5iz7lI
 4/AK4vJNBHrZOnw+Ecr5Rk74v6cSYyr2GHEyYLaf6pRUDqKVjF3f9J4Thb37E3pn4trt
 Symw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtipY0UJGTm4YqX3AJ+0e1wGbLvJVoDF+rkh3IOx3xaMoJ0PpUlsEWmp+VCMktvc/7xX25LCGMnfs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2qXPWpzR0U3Fvh+9IVga8bqnUVSGCxWexNiOWU3jdlqQ/s0U+
 Y5zMv/lKMG3aEIJbZleg9Vx7gjw+tq3qylxStd6l+mqj6Wq7Qql2
X-Google-Smtp-Source: AGHT+IFwLSLU9/bU1XD6r/0OdInxoAHXW7lfcJ9bdS4tiehk8P2PZwDqsfO42Eup8Igg4DO+ShZbGA==
X-Received: by 2002:adf:f80e:0:b0:371:82ec:206e with SMTP id
 ffacd0b85a97d-37194314e2cmr8907152f8f.5.1724167763735; 
 Tue, 20 Aug 2024 08:29:23 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189849933sm13475108f8f.36.2024.08.20.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 08:29:22 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 marcheu@google.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RFC 4/6] drm/vkms: Rename to_vkms_plane_state to avoid
 confusion
Date: Tue, 20 Aug 2024 17:29:18 +0200
Message-ID: <20240820152919.2863-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814-google-split-headers-v1-4-51712f088f5d@bootlin.com>
References: <20240814-google-split-headers-v1-4-51712f088f5d@bootlin.com>
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

> The macro to_vkms_plane_state was not explicit about its expected content.
> Rename it to drm_plane_state_to_vkms_plane_state to avoid confusion and
> help the reader.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c  | 2 +-
>  drivers/gpu/drm/vkms/vkms_plane.c | 4 ++--
>  drivers/gpu/drm/vkms/vkms_plane.h | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 6a4de8f7a678..08e5db07aca6 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -212,7 +212,7 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  			continue;
>  
>  		vkms_state->active_planes[i++] =
> -			to_vkms_plane_state(plane_state);
> +			drm_plane_state_to_vkms_plane_state(plane_state);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index de2c83e1b02c..e549c9523a34 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -80,7 +80,7 @@ vkms_plane_duplicate_state(struct drm_plane *plane)
>  static void vkms_plane_destroy_state(struct drm_plane *plane,
>  				     struct drm_plane_state *old_state)
>  {
> -	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
> +	struct vkms_plane_state *vkms_state = drm_plane_state_to_vkms_plane_state(old_state);
>  	struct drm_crtc *crtc = vkms_state->base.base.crtc;
>  
>  	if (crtc && vkms_state->frame_info->fb) {
> @@ -139,7 +139,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  		return;
>  
>  	fmt = fb->format->format;
> -	vkms_plane_state = to_vkms_plane_state(new_state);
> +	vkms_plane_state = drm_plane_state_to_vkms_plane_state(new_state);
>  	shadow_plane_state = &vkms_plane_state->base;
>  
>  	frame_info = vkms_plane_state->frame_info;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.h b/drivers/gpu/drm/vkms/vkms_plane.h
> index 161b44da0240..68170a75e9c9 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.h
> +++ b/drivers/gpu/drm/vkms/vkms_plane.h
> @@ -59,7 +59,7 @@ struct vkms_frame_info {
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  				   enum drm_plane_type type, int possible_crtc_index);
>  
> -#define to_vkms_plane_state(target)\
> +#define drm_plane_state_to_vkms_plane_state(target) \
>  	container_of(target, struct vkms_plane_state, base.base)
>  
>  #endif //_VKMS_PLANE_H
> 
