Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446208B767D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 14:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1128A10E5D2;
	Tue, 30 Apr 2024 12:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AIWiHiai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5E410E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 12:58:44 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34cba0d9a3eso138865f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 05:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714481922; x=1715086722; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pK7jmZXxRZeTb+AiO8D/UYyBdofUQEfkt6S+4jnJTKQ=;
 b=AIWiHiaiSUhoS26JlgQ/qrAMEZa3sIZYR6ah00jc5TWSfDB7mxCgOVPkFVDuhFnhfZ
 39ONTj5REi3I6ySjZrqbUbztKjXLIdkfYKYcdxonFo9xCFEgC3Y+L0VbVZudLO/03PWL
 e6auN58OLKy21ssv8una0naIu3DNjQ0fNh+NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714481922; x=1715086722;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pK7jmZXxRZeTb+AiO8D/UYyBdofUQEfkt6S+4jnJTKQ=;
 b=mpvTJXct93vJN54KUX+lQfhWpaynueCNtBni9gMJQe0FIV+r2LVwbf5KAYfyfkEogL
 pZjrdRObbhLz4lJSFzzh+vMOYuwde5ql6rKe0DreEvM8Ng9Lqur4QiRtcUjnv/f3elrx
 5mB4qQGeg0oIxa1ibIPGlHjTIwk0l8f/cYtLZc86p/OFI3CZi0nK0a1hjolBApMOBppm
 pAtcbIkM5Z282A8HMwI9PWQ+knAIIAMpTt4usA+3o/E1pCDasnCic0yOV3ITezDNwjWb
 +0Ik8Rw6yCNLtogsJZnryjRUT+adaypIYBA005y2wdjcvvKtJ4nE3m0Lrn5cnYm0n6CK
 itLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY2OWf8C+rlVxvWWdniqT4hEcesVHuc2s0WtOGKYsSOWhu5Pu2J3lSu2zKoE/D45nhYkvZSOCvMy1gqzKNRKagI2y7tIBvRtz3PFTYk0TU
X-Gm-Message-State: AOJu0YwXskWi1/qi/jneI5zyJ8CItKVJCVW39/HKJ4Gkz+JZdNW76fDN
 iK0dgn3q10QRorbM5w/wZlV6M7dUFPeGPuuLmIfL9YDiX0kWuZbJM/z/Q8L+zkI=
X-Google-Smtp-Source: AGHT+IGzObgQhOrn5Cn9hPdb+5X//u9rqtohoWnLNXTakga6PCKYPoCjKQwOZZ22G6y8vztfVi4+nA==
X-Received: by 2002:a5d:5692:0:b0:34d:7d77:36fa with SMTP id
 f18-20020a5d5692000000b0034d7d7736famr1189021wrv.5.1714481922347; 
 Tue, 30 Apr 2024 05:58:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b0034d8c60c10bsm1359080wrj.92.2024.04.30.05.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:58:41 -0700 (PDT)
Date: Tue, 30 Apr 2024 14:58:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: daniel@ffwll.ch, tzimmermann@suse.de, airlied@redhat.com, deller@gmx.de,
 geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] lib/fonts: Allow to select fonts for drm_panic
Message-ID: <ZjDq_1t8iRf40dRa@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 tzimmermann@suse.de, airlied@redhat.com, deller@gmx.de,
 geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20240419132243.154466-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419132243.154466-1-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Fri, Apr 19, 2024 at 03:20:19PM +0200, Jocelyn Falempe wrote:
> drm_panic has been introduced recently, and uses the same fonts as
> FRAMEBUFFER_CONSOLE.
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

lib/fonts/ doesn't seem to have a designated maintainer, so please push
this through drm-misc.

Thanks, Sima
> ---
>  lib/fonts/Kconfig | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
> index 7e945fdcbf11..befcb463f738 100644
> --- a/lib/fonts/Kconfig
> +++ b/lib/fonts/Kconfig
> @@ -10,7 +10,7 @@ if FONT_SUPPORT
>  
>  config FONTS
>  	bool "Select compiled-in fonts"
> -	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
>  	help
>  	  Say Y here if you would like to use fonts other than the default
>  	  your frame buffer console usually use.
> @@ -23,7 +23,7 @@ config FONTS
>  
>  config FONT_8x8
>  	bool "VGA 8x8 font" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
>  	default y if !SPARC && !FONTS
>  	help
>  	  This is the "high resolution" font for the VGA frame buffer (the one
> @@ -46,7 +46,7 @@ config FONT_8x16
>  
>  config FONT_6x11
>  	bool "Mac console 6x11 font (not supported by all drivers)" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
>  	default y if !SPARC && !FONTS && MAC
>  	help
>  	  Small console font with Macintosh-style high-half glyphs.  Some Mac
> @@ -54,7 +54,7 @@ config FONT_6x11
>  
>  config FONT_7x14
>  	bool "console 7x14 font (not supported by all drivers)" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
>  	help
>  	  Console font with characters just a bit smaller than the default.
>  	  If the standard 8x16 font is a little too big for you, say Y.
> @@ -62,7 +62,7 @@ config FONT_7x14
>  
>  config FONT_PEARL_8x8
>  	bool "Pearl (old m68k) console 8x8 font" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
>  	default y if !SPARC && !FONTS && AMIGA
>  	help
>  	  Small console font with PC-style control-character and high-half
> @@ -70,7 +70,7 @@ config FONT_PEARL_8x8
>  
>  config FONT_ACORN_8x8
>  	bool "Acorn console 8x8 font" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
>  	default y if !SPARC && !FONTS && ARM && ARCH_ACORN
>  	help
>  	  Small console font with PC-style control characters and high-half
> @@ -90,7 +90,7 @@ config FONT_6x10
>  
>  config FONT_10x18
>  	bool "console 10x18 font (not supported by all drivers)" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
>  	help
>  	  This is a high resolution console font for machines with very
>  	  big letters. It fits between the sun 12x22 and the normal 8x16 font.
> @@ -105,7 +105,7 @@ config FONT_SUN8x16
>  
>  config FONT_SUN12x22
>  	bool "Sparc console 12x22 font (not supported by all drivers)"
> -	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
> +	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
>  	help
>  	  This is the high resolution console font for Sun machines with very
>  	  big letters (like the letters used in the SPARC PROM). If the
> @@ -113,7 +113,7 @@ config FONT_SUN12x22
>  
>  config FONT_TER16x32
>  	bool "Terminus 16x32 font (not supported by all drivers)"
> -	depends on FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)
> +	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
>  	help
>  	  Terminus Font is a clean, fixed width bitmap font, designed
>  	  for long (8 and more hours per day) work with computers.
> @@ -122,7 +122,7 @@ config FONT_TER16x32
>  
>  config FONT_6x8
>  	bool "OLED 6x8 font" if FONTS
> -	depends on FRAMEBUFFER_CONSOLE
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
>  	help
>  	  This font is useful for small displays (OLED).
>  
> 
> base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
> -- 
> 2.44.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
