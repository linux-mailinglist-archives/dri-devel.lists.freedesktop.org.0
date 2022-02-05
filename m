Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E04AA55B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 02:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046A10E152;
	Sat,  5 Feb 2022 01:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E5D10E152
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 01:38:52 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id c3so6596056pls.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Feb 2022 17:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MA7V18Af7JMkGZ9oe2f8NpWbpf5Pf2CxDZqgZ+912es=;
 b=VRGyRIeP41YIWE2ETD0nG8Sw+b2e0xAgt7GcNjENvS7PgAwz3xlzFS14IOhcRUnAa1
 Vt6MEnMcWP9RvefkEIGyZ99MIj5L5TJia0SKt2BjZzycoBy+xxpynQHrn+v+BY59MhL0
 Dk5hwEWSRfFUGjy+UbF5CKgwd/b3H2XrGa4M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MA7V18Af7JMkGZ9oe2f8NpWbpf5Pf2CxDZqgZ+912es=;
 b=hk2kFvhlymPx8Hxq9MV49EnKrF5P9dy3HWKklaS9+ffdoTWu62bpJRwK1jtq5o260S
 TeUXWbLBkt4O4tPj5VKnhvSVTqJrLHT9absqdLMzWaZR0ey9YqxwIY1mnz/pXsWf2bxW
 +p5DxIqRMIyTwS4YpiiTARhU2NlXAEA0qiO6itstHu0MwK/asq+DpEIOZk+HvseQX1ur
 lli1e7g1IvxPhKgqqpHecmU2kF604B2Jt/Dq++GBNUo4OSvAQN9+ItAM7QDLyuRRkXQ4
 BEJ/rBx7kUGaTe9ZG8gqdCxhU2cQtgc3ppOFCXHfJMrAq3Te8B/MOOJpHgn138rmE+v7
 4QJg==
X-Gm-Message-State: AOAM533N4elwDbYUZk81+EvdQz4DDmD+Dn+/WVn1CTWq/kXalTrqqqRb
 4sWTkOq7CSYu3zM3uVer9sjaeQ==
X-Google-Smtp-Source: ABdhPJxKoRxYw29M3XV8L9Ky8wDWUNlkXyJpF0Q1bH1Rb+NMN3smndw5L50QOjq4XIdijw+bpkdNbA==
X-Received: by 2002:a17:902:8a91:: with SMTP id
 p17mr5893133plo.74.1644025131907; 
 Fri, 04 Feb 2022 17:38:51 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 16sm13931560pje.34.2022.02.04.17.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:38:51 -0800 (PST)
Date: Fri, 4 Feb 2022 17:38:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/dp: Fix off-by-one in register cache size
Message-ID: <202202041738.9C2835B@keescook>
References: <20220105173310.2420598-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105173310.2420598-1-keescook@chromium.org>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Uma Shankar <uma.shankar@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping. This is a OOB read fix. Can something send this to Linus please?

-Kees

On Wed, Jan 05, 2022 at 09:33:10AM -0800, Kees Cook wrote:
> The pcon_dsc_dpcd array holds 13 registers (0x92 through 0x9E). Fix the
> math to calculate the max size. Found from a -Warray-bounds build:
> 
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
> drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
>  3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
>       |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
>  3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
>       |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Fixes: e2e16da398d9 ("drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon")
> Cc: stable@vger.kernel.org
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Link: https://lore.kernel.org/lkml/20211214001849.GA62559@embeddedor/
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v1: https://lore.kernel.org/lkml/20211203084333.3105038-1-keescook@chromium.org/
> v2:
>  - add reviewed-by
>  - add cc:stable
> ---
>  include/drm/drm_dp_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 30359e434c3f..472dac376284 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -456,7 +456,7 @@ struct drm_panel;
>  #define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
>  
>  /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
> -#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
> +#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xD	/* 0x92 through 0x9E */
>  #define DP_PCON_DSC_ENCODER                 0x092
>  # define DP_PCON_DSC_ENCODER_SUPPORTED      (1 << 0)
>  # define DP_PCON_DSC_PPS_ENC_OVERRIDE       (1 << 1)
> -- 
> 2.30.2
> 

-- 
Kees Cook
