Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A290B1C0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317A210E3ED;
	Mon, 17 Jun 2024 14:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KA7SJk8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392FA10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:25:12 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4217fd95c78so2613955e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718634310; x=1719239110; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=37zGSaNNYOVV5h1FxAcCJXKdTZPd/vYhydvfcpv7d3c=;
 b=KA7SJk8mw0N8XGGzoq2MllcecGTmxPrfP/MPLEp7n7Lxafz2wOKNQRlUgqiuA9Jpax
 tnPQn1o5ASOVWi4+4dIzw3i3q8gPUBFvBIvBGrlrkEPqXsrMMsloVOYj8g/3qFob4ueS
 R+c2Q4BP1DPPabQTKCXduXmxeH3W4W4KfPnko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718634310; x=1719239110;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=37zGSaNNYOVV5h1FxAcCJXKdTZPd/vYhydvfcpv7d3c=;
 b=gNKVOVO11EOVODmZmMYI4ldgN6EW+PBG+QX7ITbupQcKf9JyjJreW15u/LlPk0ygpD
 GrAFMcg0A6aY+HdNFikHBmGInd2oQhFF/KSqs7BeWNwPwJFcOXRZ8QUwE/kJtaI6c4RX
 4NnUnGWRfrs9z8YCukzPf7IZ/0HwmkEXcc1hyqM+uoYATIRu5As3AZAOHcKzo/AhSHQH
 w3IkjU6iVsgKUdR3inlF20UpQ8Agr2O3eNSX2H6L0KUHdajl1xMTI1RuXTLLF1D/yIAG
 /U8J/RIQVhjZlcfaX7zbCoAyq0OgHWcOzo+zNIPlpKV+FJRZs8SClZPx98Mu1ANfA4vJ
 fp5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuXy3GPGjlabwKH41eLBZpW3YSp7ogGWPBx2KXfnGxrkcoeb29mmMYHAalqM0K4/1gxwZu+XoAlzKS20f2ypkp6CHjAR82L0ppw8LjBo5B
X-Gm-Message-State: AOJu0YybiDOyDWlhtQ5cvDy9jT1pXMUiD1UTp+pQwoGsOs5jQN5uIWxH
 lXY1cN454hF9pDraP6h+gyHoejpOx/qWcANdY9gb9o/LqIXhYQWkBmtb0a0rTw8=
X-Google-Smtp-Source: AGHT+IHYj24IzjJd5xigCzw+aNJVQiGAA0BL4zSL0PWE2WtnIOxUiZ5I1tLdrRyCJeXqVPbttUkyQg==
X-Received: by 2002:a05:600c:4ba5:b0:423:573:ab52 with SMTP id
 5b1f17b1804b1-4230573ae49mr72536085e9.0.1718634310329; 
 Mon, 17 Jun 2024 07:25:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-423072c21dbsm118444885e9.4.2024.06.17.07.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:25:09 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:25:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 2/9] drm: Export drm_plane_has_format()
Message-ID: <ZnBHRN2RV3kjruxo@phenom.ffwll.local>
References: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
 <20240612204712.31404-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612204712.31404-3-ville.syrjala@linux.intel.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 12, 2024 at 11:47:05PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Export drm_plane_has_format() so that drivers can use it.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 2 --
>  drivers/gpu/drm/drm_plane.c         | 1 +
>  include/drm/drm_plane.h             | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index cdd60f2a4052..1f73b8d6d750 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -272,8 +272,6 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  /* drm_plane.c */
>  int drm_plane_register_all(struct drm_device *dev);
>  void drm_plane_unregister_all(struct drm_device *dev);
> -bool drm_plane_has_format(struct drm_plane *plane,
> -			  u32 format, u64 modifier);
>  struct drm_mode_rect *
>  __drm_plane_get_damage_clips(const struct drm_plane_state *state);
>  
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 268aa2299df5..a51d4dd3f7de 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -906,6 +906,7 @@ bool drm_plane_has_format(struct drm_plane *plane,
>  
>  	return true;
>  }
> +EXPORT_SYMBOL(drm_plane_has_format);

Kerneldoc please, since this is now part of the driver api. With that on
the first two patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>  
>  static int __setplane_check(struct drm_plane *plane,
>  			    struct drm_crtc *crtc,
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 9507542121fa..dd718c62ac31 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -972,6 +972,8 @@ static inline struct drm_plane *drm_plane_find(struct drm_device *dev,
>  #define drm_for_each_plane(plane, dev) \
>  	list_for_each_entry(plane, &(dev)->mode_config.plane_list, head)
>  
> +bool drm_plane_has_format(struct drm_plane *plane,
> +			  u32 format, u64 modifier);
>  bool drm_any_plane_has_format(struct drm_device *dev,
>  			      u32 format, u64 modifier);
>  
> -- 
> 2.44.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
