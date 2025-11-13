Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634AEC57D70
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB87010E08D;
	Thu, 13 Nov 2025 14:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frbo/UrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4CF10E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:06:15 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so6289185e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763042774; x=1763647574; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+fBsOlwKGvCQ9PsGreXfd2z/e8NXAroPl/lCt9m4U78=;
 b=frbo/UrWV6/Mehi5YC8O/O9g7lH/v9TQxvk7Nmc1eZPUn+bZI/6mRqNR4vpUAH1Rpx
 bOAjzop465dIglsDSpUVQpxSMAflFv9muas4VGEs/KnKSiTW7Zmb7ZuuEtXLECwIi4RH
 fpu2YCzOHRpuWeV0mRGJfCyS4+jX021QHfpDojJTNWdyqksuHlxwfeDlflmOzZ0XSCp6
 VHULqcLMKnV0ED/Ovn2jtzTsJ32+OIhqKH3NpixMrC+3kahEkWZy06sZn+mo8cDEv+96
 W19sSol0gpQ2vb+EgWOPtRIZEmdokqgmjcLIJbEnRZvUXS/jzuYHiBrhBLzzbzeQHqSr
 EDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763042774; x=1763647574;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+fBsOlwKGvCQ9PsGreXfd2z/e8NXAroPl/lCt9m4U78=;
 b=K1YENow5b4y4WPHXsKblI2uQH7RbkQMZk8D9KkWN2bpQpygpaRe1ITfQqCvcTQsMIs
 tcVsLWs41pYR0PQJQ/+tirIYLz+RF3CQs2E9v3dwrpADyifYQEIL1e5hI3vVOq0UBsqq
 h5ysrSxWcS2gB73/gcMcFuSF1nTlpF/LE26ISx7woWhGRLXyQeSqGw4/1uYtbOZJKig/
 aAQRe6rdfKW9GcKHfYzoPf9++4mfaM9PB9mzC8NJDQ8/E3sYn8BtBu0p6Hls44uhUbSz
 u9Gi4bdd2+ldzFSM3QWHH1mCAyVooQ8m07mO+CHYALut7KDNS6yZsIm5kKW6iLMrFzOi
 sHVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd0q1mFKJJ35SNoZMuK1mOKE8szxBF/aTUU7M+tKEZFji55NxlKkbCl2cJcZMGZHB4/T0oZre7B6o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCvLJN3T+cG6mihLIyZyIKAeSh3a4HBOqGvFftswZDt8nZeeu3
 tAqM7TEUke+49LokkGA9431+XlAEz150SUDcbTLly1viRjBi1Bzv2/rK
X-Gm-Gg: ASbGnctZkTtI64hvVibnrODoGdwVxMfryq3l2tM4UE7YI0/aa+3BQw5AbPXXOQZs+oZ
 5FVhOPBa+TeZ6dTwY6d/jOU2iYOfklWXf1DReKuIqmH3NUePIKqqM5n+GhQ/W9pImT3XGtPvx6N
 JZ1Ds1DVcYnHJRVvfwHIGy6IYhihQfMldR1e3P6dncooe0o0Y3592ITX3peRaMiRpcosDbGw0mo
 PpJZ4KfzIVLKFcUPNxfIPdsmlyvhjAUHskpu9u2PZUbJ8h/pF8CuxAHltaAHhpMkBiSI9u6SeJu
 VxQeG5VP/jbtqa+5zSidZziDdlj+/j8PP/4IMP1qHLpRYuQTwdrB2LgNZUbFi7BoBTmA04uR3ew
 9cV6Az9tN+xtzbPPRSL15+Y+NjiWZdWxjiuIayDyWgI4Wv7ijuClM1cTbPD8lPFo9zRnyzDh30D
 KwQP/3zF+A
X-Google-Smtp-Source: AGHT+IGUZx82/rO7Dbnk+No1GqhvJ0gfmQBea08lRQxmlKlDUu75KygUGkRVhWdZ43wtSDUahYjtnA==
X-Received: by 2002:a05:600c:4f91:b0:477:54cd:202f with SMTP id
 5b1f17b1804b1-4778707095emr70617955e9.3.1763042773366; 
 Thu, 13 Nov 2025 06:06:13 -0800 (PST)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bcf051dsm21104525e9.3.2025.11.13.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:06:12 -0800 (PST)
Date: Thu, 13 Nov 2025 15:06:10 +0100
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
Subject: Re: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
Message-ID: <aRXl0jt2_rmXFRUW@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
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

Hey Louis,

On Wed, Oct 29, 2025 at 03:36:38PM +0100, Louis Chauvet wrote:
> Create and export an helper to display plane type using the
> property string. This could be used to display debug
> information in VKMS.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 25f376869b3a..1a1a3f43db4d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  
> +/**
> + * drm_get_plane_type_name - return a string for plane name
> + * @type: plane type to compute name of

Maybe we could document here what happens when the plane type is
not valid.

Returns: The name of the plane type. "(unknown)" if type is not a
known plane type.

Other than that:
Reviewed-by: José Expósito <jose.exposito@redhat.com>

> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
> +		return drm_plane_type_enum_list[type].name;
> +	else
> +		return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_plane_type_name);
> +
>  static int drm_mode_create_standard_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 2e848b816218..89f3dd46178d 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -30,6 +30,7 @@
>  #include <linux/llist.h>
>  
>  #include <drm/drm_modeset_lock.h>
> +#include <drm/drm_plane.h>
>  
>  struct drm_file;
>  struct drm_device;
> @@ -983,4 +984,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  
> +const char *drm_get_plane_type_name(enum drm_plane_type type);
> +
>  #endif
> 
> -- 
> 2.51.0
> 
