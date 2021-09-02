Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAC3FEB00
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 11:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B68B6E499;
	Thu,  2 Sep 2021 09:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A1406E499
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 09:15:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso908139wmb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vg7ZILCVm0WdsNJvBlIPNdvE0ye3V6BoSn4aucYNsYo=;
 b=qx6i39KsnL1YOrTEyVFio/UqtD2QgLh0GGQl23rNMuoI5Nj6C1yPFhcvoaWilGSKrk
 kWGuXFYR4HWCLk7XlVd6jKK/NancaLBRWmjJKJXgrILY9e3UPSQE/qUEwibGRpGtPuzH
 7SoYYh65Yy2VbeX7+WXONmwTLfGnE/K1Ua/SrTILgEI8aWhQ8T8Mh17rvcumgSpb4Gr3
 t/uS4RLZ5/KeWRsYGCG+fOOU8PxIoN6k5nNVE2q9fcedrd3XGfqEi/s6T6gpmxY/6YYi
 0Vj3rS/kGH0AbAy3d7nqNhvKbDLyWg+MZIQr8FREbYKBUwlpg8TL8cGtjAcCn5Y4i6mD
 qWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vg7ZILCVm0WdsNJvBlIPNdvE0ye3V6BoSn4aucYNsYo=;
 b=fkvoBH+/AQr8QO4/aZZmxzFdiz0caaG3wOlJx56ZnWu3a4Exz2Raq9dluSSy/vJs5J
 rgQBf07LvubiYJSmJLxC7UVdoc/cNtNKHze0TB21ogAdvYWtlyO9cDqgWIA2Oo8fjSik
 zJJs0/ky7vYHVGdlhzHJJFUuWeCtFhyAJ4M1zXtCQsCu5XSej0+F/f0KCYAdRGz/W3of
 Zp6SEiVOEYYF2c6rHr3qtmjyd88KmKusd3NowMlKoCYfXIUZ5ywss+fQB7hJcqzWa1xU
 lp+zuupO5NDbRTgNX0n/qq0WY7k9ErI9TEZajOOgHKvXMWJ213ahYbBDu+OPB32GRouZ
 pbPw==
X-Gm-Message-State: AOAM533lz5IIj9BdckknS1PLLBp/ul2WfgDVFVOYTFuCyZTdDx/nxFoQ
 aay+ihgCqe3ywH9hCvARdnpeZg==
X-Google-Smtp-Source: ABdhPJwfmc55TO0xRjie2C+BXLjFqLlXdgClBA9xOJkgqfYhXJeBZbLjk+pZkXtVtnHwraRH2m/78Q==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr2113921wma.87.1630574135690;
 Thu, 02 Sep 2021 02:15:35 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id o12sm1112263wmr.2.2021.09.02.02.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:15:35 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/meson: Use common drm_fixed_16_16 helper
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
 <20210901175431.14060-2-alyssa@rosenzweig.io>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <32207beb-3d28-c858-4997-74725729e5a1@baylibre.com>
Date: Thu, 2 Sep 2021 11:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901175431.14060-2-alyssa@rosenzweig.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 01/09/2021 19:54, Alyssa Rosenzweig wrote:
> Replace our open-coded FRAC_16_16 with the common drm_fixed_16_16
> helper to reduce code duplication between drivers.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: linux-amlogic@lists.infradead.org
> ---
>  drivers/gpu/drm/meson/meson_overlay.c | 7 +++----
>  drivers/gpu/drm/meson/meson_plane.c   | 5 ++---
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index dfef8afcc245..d8fc6bbb332f 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fixed.h>
>  
>  #include "meson_overlay.h"
>  #include "meson_registers.h"
> @@ -162,8 +163,6 @@ struct meson_overlay {
>  };
>  #define to_meson_overlay(x) container_of(x, struct meson_overlay, base)
>  
> -#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
> -
>  static int meson_overlay_atomic_check(struct drm_plane *plane,
>  				      struct drm_atomic_state *state)
>  {
> @@ -181,8 +180,8 @@ static int meson_overlay_atomic_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(new_plane_state,
>  						   crtc_state,
> -						   FRAC_16_16(1, 5),
> -						   FRAC_16_16(5, 1),
> +						   drm_fixed_16_16(1, 5),
> +						   drm_fixed_16_16(5, 1),
>  						   true, true);
>  }
>  
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 8640a8a8a469..4fae9ebbf178 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fixed.h>
>  
>  #include "meson_plane.h"
>  #include "meson_registers.h"
> @@ -68,8 +69,6 @@ struct meson_plane {
>  };
>  #define to_meson_plane(x) container_of(x, struct meson_plane, base)
>  
> -#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
> -
>  static int meson_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_atomic_state *state)
>  {
> @@ -92,7 +91,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  	 */
>  	return drm_atomic_helper_check_plane_state(new_plane_state,
>  						   crtc_state,
> -						   FRAC_16_16(1, 5),
> +						   drm_fixed_16_16(1, 5),
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   false, true);
>  }
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
