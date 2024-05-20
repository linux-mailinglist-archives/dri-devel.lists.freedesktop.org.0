Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E348C9B73
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C189310E4A8;
	Mon, 20 May 2024 10:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cGMT8rEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B7A10E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:39:04 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so3422304e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716201542; x=1716806342; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=X7YUSAc+LOzoG/Uj+4jePwXS6oAh9sQZFNTURx+UZxU=;
 b=cGMT8rEW/otNX5ZpFaLlhbJZPeWpjrY22J7wfdEjCOKlUCBZBKw7KR2zXPf5cnKuFd
 7nSkvF4vtlNeMzMsAWi/9gqnqSsYAZqLMnBPYZM12as6rxTd1bBDJeA03n5P2ua8wZTq
 LFAX+MpicoJyhyR3+IX0Qx7AAviBJJ6jDDhp/NTKHmosF3VKQZDo5YhsB7hf+E4Mkkos
 9oc6wcL8KpzEXsYDmKZeGh/7z3qVMnbcrKRmUqnoLdOrRMrXawc76mbNMC+72QoSPTk6
 3mQgXXHDdbrwuFHnCGxL3oOrsQNUGm4jlk790cMLikf0U+xRKG3+N0XpVQu0A+ZL3t/s
 nSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716201542; x=1716806342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7YUSAc+LOzoG/Uj+4jePwXS6oAh9sQZFNTURx+UZxU=;
 b=O18R7zDVftNT9l9wIe57YoAQ/dyt9njqzf4sS2ZoCv75nwZpEpysGE0ABTe2hOiKUd
 5USYbsfgkAUt3drpG9QBIzHfUxkaCGTWTT/Zfpq0CCTGJYRngtnL/TxzJbC/mwC4AenW
 8wToHLsck0sQTDA2LTDLMeQlOHxR3w1dMGnO5cixtGm4LbSNAbhjMm2p1L/IGJ60+QlA
 +O/ee+1QgS4S5JqDrQT+HxD4oK6j0xdlXSdgVbzMjbGe59ih9IooNWtHFcxcxrw5mlxt
 1da5/eo00B/lVDqSvIvGTx/L2L5VDDFWtbHdkVBqKJmr8J56pfhRKdQ98gizQ05MNMq4
 iKEA==
X-Gm-Message-State: AOJu0Yz8ZfWvmcXPn/xOHvvd6m1jz9ysqb4NG/iT4YNkJT1yM8viX2YQ
 zZO40C+AUgTziOH63DRkupOrsshu5QmO8KYoSEU6XtzJBH2KU9cUHANMymhX798=
X-Google-Smtp-Source: AGHT+IET9mcARgCPJyUUI5rF7iYtw+p49D3cQjF3f5fr3cjzbt1MxBoizYS5tmlZiC27H3ErlVRAMA==
X-Received: by 2002:a2e:9959:0:b0:2d2:dac3:90f with SMTP id
 38308e7fff4ca-2e5204aef5emr184766061fa.52.1716201542463; 
 Mon, 20 May 2024 03:39:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbcc3esm34054531fa.9.2024.05.20.03.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:39:01 -0700 (PDT)
Date: Mon, 20 May 2024 13:39:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mode: fix all kernel-doc warnings
Message-ID: <lxwelnavt5cbrqyasdl4jlzig4ib34pf6retwwxxpzyy5l3bap@l5gp2ydqrudy>
References: <20240516002652.6674-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516002652.6674-1-rdunlap@infradead.org>
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

On Wed, May 15, 2024 at 05:26:52PM -0700, Randy Dunlap wrote:
> Add @width and @height descriptions for &struct drm_plane_size_hint
> along with a reference to more info.
> 
> Add a short description for &struct drm_mode_closefb.
> 
> Change 7 macros not to be marked as kernel-doc notation to prevent
> warnings.
> 
> Fixes these kernel-doc warnings:
> 
> drm_mode.h:877: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
> drm_mode.h:877: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'
> drm_mode.h:969: warning: missing initial short description on line:
>  * DRM_MODE_PAGE_FLIP_EVENT
> drm_mode.h:977: warning: missing initial short description on line:
>  * DRM_MODE_PAGE_FLIP_ASYNC
> drm_mode.h:998: warning: missing initial short description on line:
>  * DRM_MODE_PAGE_FLIP_FLAGS
> drm_mode.h:1108: warning: missing initial short description on line:
>  * DRM_MODE_ATOMIC_TEST_ONLY
> drm_mode.h:1118: warning: missing initial short description on line:
>  * DRM_MODE_ATOMIC_NONBLOCK
> drm_mode.h:1127: warning: missing initial short description on line:
>  * DRM_MODE_ATOMIC_ALLOW_MODESET
> drm_mode.h:1149: warning: missing initial short description on line:
>  * DRM_MODE_ATOMIC_FLAGS
> drm_mode.h:1358: warning: missing initial short description on line:
>  * struct drm_mode_closefb
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> 
>  include/uapi/drm/drm_mode.h |   21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff -- a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -867,9 +867,12 @@ struct drm_color_lut {
>  
>  /**
>   * struct drm_plane_size_hint - Plane size hints
> + * @width: recommended plane width (no scaling)
> + * @height: recommended plane height (no scaling)
>   *
>   * The plane SIZE_HINTS property blob contains an
> - * array of struct drm_plane_size_hint.
> + * array of struct drm_plane_size_hint as described in
> + * "DOC: standard plane properties".
>   */
>  struct drm_plane_size_hint {
>  	__u16 width;
> @@ -962,7 +965,7 @@ struct hdr_output_metadata {
>  	};
>  };
>  
> -/**
> +/*
>   * DRM_MODE_PAGE_FLIP_EVENT

What about convering to the proper kerneldoc instead of dropping the
kerneldoc part?

>   *
>   * Request that the kernel sends back a vblank event (see
> @@ -970,7 +973,7 @@ struct hdr_output_metadata {
>   * page-flip is done.
>   */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> -/**
> +/*
>   * DRM_MODE_PAGE_FLIP_ASYNC
>   *
>   * Request that the page-flip is performed as soon as possible, ie. with no
> @@ -991,7 +994,7 @@ struct hdr_output_metadata {
>  #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
>  #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
>  				   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
> -/**
> +/*
>   * DRM_MODE_PAGE_FLIP_FLAGS
>   *
>   * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
> @@ -1101,7 +1104,7 @@ struct drm_mode_destroy_dumb {
>  	__u32 handle;
>  };
>  
> -/**
> +/*
>   * DRM_MODE_ATOMIC_TEST_ONLY
>   *
>   * Do not apply the atomic commit, instead check whether the hardware supports
> @@ -1111,7 +1114,7 @@ struct drm_mode_destroy_dumb {
>   * commits.
>   */
>  #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
> -/**
> +/*
>   * DRM_MODE_ATOMIC_NONBLOCK
>   *
>   * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_ATOMIC
> @@ -1120,7 +1123,7 @@ struct drm_mode_destroy_dumb {
>   * applied before retuning.
>   */
>  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> -/**
> +/*
>   * DRM_MODE_ATOMIC_ALLOW_MODESET
>   *
>   * Allow the update to result in temporary or transient visible artifacts while
> @@ -1142,7 +1145,7 @@ struct drm_mode_destroy_dumb {
>   */
>  #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
>  
> -/**
> +/*
>   * DRM_MODE_ATOMIC_FLAGS
>   *
>   * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
> @@ -1352,7 +1355,7 @@ struct drm_mode_rect {
>  };
>  
>  /**
> - * struct drm_mode_closefb
> + * struct drm_mode_closefb - ioctl struct to close a framebuffer
>   * @fb_id: Framebuffer ID.
>   * @pad: Must be zero.
>   */

-- 
With best wishes
Dmitry
