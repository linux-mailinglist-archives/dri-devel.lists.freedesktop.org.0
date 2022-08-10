Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538B58EFE4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 17:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944A78F330;
	Wed, 10 Aug 2022 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AD98F334
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 15:59:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v5so8035594wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=5J/+lzEP3tSd3WPCvbjczX9ZLB61OBoGBALKUmRBw5s=;
 b=ObbzQmaiZonvgZXM6vJSd38JNEFOl1Gu5gzz2JK4cCiW02dTTl9lARpq5+KEgkwx5t
 cZJhbJXz1x3QyfajbDqIBIK4mbujsEdG9ys1inAOUjcSj9Wthi41cGYBetIvCKmHUnmo
 XO09Qv92NvVrVC0xszkX26ZJeWoeHIRqb67s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=5J/+lzEP3tSd3WPCvbjczX9ZLB61OBoGBALKUmRBw5s=;
 b=6lJOt+vtZY2KsjtB8XvArCgdquOEFIrfKVyVaft3yvL4xU8uMH+jfQHc3mo5kQfvPp
 KRwhx5HMjEh5HFVU2WjgJ5QQi45uGAliaWSyY3xnzSCKTb6goYpCD+G6qjTxloGaYbjQ
 POE23GxqdmK6NYWx/vHcOmPlBb+X0Dqz/fN+u1Dk5WkZDm4tSQMsrIgFFgkwOCoWRDdb
 E4wpUhokWrmAkIr+j0vlMAoD5ZYH2ZZoQl0M5fKwzqAjX/U9DpfrOs/8A3TfeXfeo9jj
 JdBcouofoZznkS7/DvHNjxxQ56o8/2zss/CHu6GfBkeMI3iExiG2hqwQu2GG/FhOtR9Q
 CG4A==
X-Gm-Message-State: ACgBeo2f1H16vUMYouHIvbF4waXSjOt+KzwzAkLeLTjvhP9BDUhxtLf/
 3KSzxShKID5xign//qAV23o6ZQ==
X-Google-Smtp-Source: AA6agR7HY0wQU3y5yY6Kddj9MwzCY8wYP5mk/EVfoL8kIoQTc3N+5GNg+l+pO2qUm7O0zYD6sEsViQ==
X-Received: by 2002:a05:600c:4f44:b0:3a5:6de3:8375 with SMTP id
 m4-20020a05600c4f4400b003a56de38375mr2992173wmq.198.1660147146409; 
 Wed, 10 Aug 2022 08:59:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c4e4500b003a32251c3f9sm3033032wmq.5.2022.08.10.08.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 08:59:05 -0700 (PDT)
Date: Wed, 10 Aug 2022 17:59:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
Message-ID: <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 08:20:46PM +0200, Geert Uytterhoeven wrote:
> Add a helper to retrieve the actual number of bits per pixel for a
> plane, taking into account the number of characters and pixels per
> block for tiled formats.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> v3:
>   - Add Reviewed-by,
> 
> v2:
>   - Move up.
> ---
>  drivers/gpu/drm/drm_fourcc.c | 19 +++++++++++++++++++
>  include/drm/drm_fourcc.h     |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 07741b678798b0f1..cf48ea0b2cb70ba8 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -370,6 +370,25 @@ unsigned int drm_format_info_block_height(const struct drm_format_info *info,
>  }
>  EXPORT_SYMBOL(drm_format_info_block_height);
>  
> +/**
> + * drm_format_info_bpp - number of bits per pixel
> + * @info: pixel format info
> + * @plane: plane index
> + *
> + * Returns:
> + * The actual number of bits per pixel, depending on the plane index.
> + */
> +unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
> +{
> +	if (!info || plane < 0 || plane >= info->num_planes)
> +		return 0;
> +
> +	return info->char_per_block[plane] * 8 /
> +	       (drm_format_info_block_width(info, plane) *
> +		drm_format_info_block_height(info, plane));

Do we really needs this for blocky formats where this is potentially
ill-defined? I think if there's no need then this should also return 0
when block_width/height != 1, it doesn't make much sense to compute bpp
when it's not really bits per _pixel_.

Minimally this needs to check whether the division actually makes sense or
whether there's a reminder, and if there's  reminder, then fail. But that
feels like a bad hack and I think we should avoid it if it's not
absolutely necessary.

Otherwise lgtm.
-Daniel

> +}
> +EXPORT_SYMBOL(drm_format_info_bpp);
> +
>  /**
>   * drm_format_info_min_pitch - computes the minimum required pitch in bytes
>   * @info: pixel format info
> diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
> index 22aa64d07c7905e2..3800a7ad7f0cda7a 100644
> --- a/include/drm/drm_fourcc.h
> +++ b/include/drm/drm_fourcc.h
> @@ -313,6 +313,7 @@ unsigned int drm_format_info_block_width(const struct drm_format_info *info,
>  					 int plane);
>  unsigned int drm_format_info_block_height(const struct drm_format_info *info,
>  					  int plane);
> +unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane);
>  uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
>  				   int plane, unsigned int buffer_width);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
