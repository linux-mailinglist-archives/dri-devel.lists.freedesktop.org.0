Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FAC57E88
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0229110E82A;
	Thu, 13 Nov 2025 14:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bp13NsD1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657210E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:23:19 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b3ad51fecso744182f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763043797; x=1763648597; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uhYQOOtjjyjB/jgUZ1+VwE5sf09BZ6WsEiD3C3pc0mU=;
 b=bp13NsD1V6iFWxgsHRuf+SZz2/BELIT3GLRhHwFpHqYFaaqTrvlTLYN+CQ4F7Sq2fP
 mgoRymExFnbyf6RnxngocSbbHkauBs2VIHnRqt+Zno3oRvU8wy2FdgxB3u5HR5Zdfd/4
 Ui4n2tBl/Se53rrD81EWwQTaQr98GHHFyLpy2YJme1DNvme2e1LvbO/JLhgkJnED5HbR
 7Dp95ucH9GcDGjy1Ab0bmz+3AsCRV3vkdm7TclkSJh/GkvM+kKXdbNBDhA/lpRhX6oRO
 XcJaK0Yv1OS85KgmBGOPYgo8YokqA7HjT7tW3wZAqIdk7dcuG+Xw01BRFuEeEKOmoAo2
 WD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763043797; x=1763648597;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uhYQOOtjjyjB/jgUZ1+VwE5sf09BZ6WsEiD3C3pc0mU=;
 b=nWHhk697wW6Rzfvt3d5D8iSzVtkKsrep2OGWoXJc8yLH7vtz4n1b9t0Yz3JA0+3YUm
 4BEgmITssA8kSQxDnmukRK5FTRIVwnSR430SGI4Lp483oVK/aHWUSGWLFidLMddSXecN
 eFACaIpmr7vzAk3zeNY/tD3lj/D8NdWZZtlSyz6UN2sBcYZfg4zBEWu2Fz4GFZLRB06K
 RaGdqo3VNPSQXx+5usfua+lMifLwbe611+jR9jvAVqCiksbA3ho2wtdP1YYidb1n2PeX
 CXdTr9aFW7G8OGcangIg+LkoRLGJUPOusUoBz2e42LS60Kjhl7jEwKL0QtJ2FxvzKdog
 2ZZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlmzmfskuHmZcQyQgpNX7JhSKd+8De3rluv3qBnmY6MY2bvmD1wnnsMNws5mYGP0OXRULGu86eROQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe8QGRJY4SUnrx/GQhsDhwiQ4gWhF5k0yEB0L4yx5Rw8evad8Z
 Kd/WuiVnURTeB85ynX7Lsn3tl3c3tDqR2YxBA9Kk0IieLchIpeE/aOmk
X-Gm-Gg: ASbGncvDVEWsXbrx866TceR2hS/xrRS05jU/JP4d20STxTf2LhR9XuEE4bPx2+aEoFg
 Iut1azRl5nb02dCukkttYTthfDEtV2pq9+T+5hqUHYtrTLpvaOQo3RgIHDq9hAxdddEzxSSMZre
 lNRTU4NRbGFCEayXlprktyJffqLDF9QzmnIC4DFFdJUc5nq+iStJ4v5SpwoocToTMkA91kubxXX
 Z1t00F7AhZWQ6xrJzJpZy9AukHFF20cVv2ZMSLTbWKFmDdabxRz5aIsPZD5RGcw2/B9Nn2Eh2Z8
 AP2SbMKMMt4jnGraop1s0Hg5ZOagixx1U755N5rkJRNmVTeH+11GJAdlj2LNUdh8I4ZEhTIF5F6
 mERgONYe7uMjoKfwGaMNKeuREbN0ERWCGRIIe+wwCxReUxQUt2OGnQ0O3HWZo5mgooWMu5noUjQ
 ==
X-Google-Smtp-Source: AGHT+IE//V7nbtwXC5oFFlsMj1/yL13x4ZMxszjS+8enQRa1LEBFN0JNqsEJq8K17yBdpD+Niv3ZaQ==
X-Received: by 2002:a05:6000:400b:b0:429:b958:218a with SMTP id
 ffacd0b85a97d-42b4bd9106bmr6183342f8f.28.1763043797368; 
 Thu, 13 Nov 2025 06:23:17 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e91f2dsm4433060f8f.19.2025.11.13.06.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:23:16 -0800 (PST)
Date: Thu, 13 Nov 2025 15:23:14 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 07/32] drm/blend: Get a rotation name from it's
 bitfield
Message-ID: <aRXp0rfAoXxJ8PEh@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>
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

On Wed, Oct 29, 2025 at 03:36:44PM +0100, Louis Chauvet wrote:
> Having the rotation/reflection name from its value can be useful for
> debugging purpose. Extract the rotation property table and implement
> drm_get_rotation_name.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
>  include/drm/drm_blend.h     |  2 ++
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6852d73c931c..bc7c05e20242 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -241,6 +241,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_plane_create_alpha_property);
>  
> +static const struct drm_prop_enum_list rotation_props[] = {
> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> +};
> +
> +/**
> + * drm_get_rotation_name - Return the name of a rotation
> + * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Returns: the name of the rotation type (unknown) if rotation is not
> + * a known rotation/reflection
> + */
> +const char *drm_get_rotation_name(unsigned int rotation)
> +{
> +	if (rotation < ARRAY_SIZE(rotation_props))
> +		return rotation_props[rotation].name;
> +
> +	return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_rotation_name);
> +
>  /**
>   * drm_plane_create_rotation_property - create a new rotation property
>   * @plane: drm plane
> @@ -279,14 +304,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
>  				       unsigned int supported_rotations)
>  {
> -	static const struct drm_prop_enum_list props[] = {
> -		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> -	};
>  	struct drm_property *prop;
>  
>  	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
> @@ -294,7 +311,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> -					   props, ARRAY_SIZE(props),
> +					   rotation_props, ARRAY_SIZE(rotation_props),
>  					   supported_rotations);
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..381d1f8d815b 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -42,6 +42,8 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  
>  #define DRM_BLEND_ALPHA_OPAQUE		0xffff
>  
> +const char *drm_get_rotation_name(unsigned int rotation);
> +
>  int drm_plane_create_alpha_property(struct drm_plane *plane);
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
> 
> -- 
> 2.51.0
> 
