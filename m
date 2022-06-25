Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74EF55ACF3
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FC010E0FD;
	Sat, 25 Jun 2022 22:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96C110E0FD
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:34:13 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e2so8131990edv.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L4B2P55ZFiYVCJ5DZUrHpNuoCg7yfMFjsA7dxqf94Ng=;
 b=CqNHYBzkAe+4uRJq+tgr9R+4iN85PvgiXpvwNIYaGcGIXorRGxtHVNIGaK99IVdvHT
 pUVMoPtPZq21KAi119Y47YaNA7tifutRngx+CWoVeN99hg/akvJEXvPC0wNJ41pEdVG9
 0ynPpYCeziouXY4GdLbb6tymzQXgUcd37bbyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L4B2P55ZFiYVCJ5DZUrHpNuoCg7yfMFjsA7dxqf94Ng=;
 b=uuhOQX3lxg1QFrHKlrEOYo1hB3gEcTqAJPs90fkfw8jqQu0P7cgkgVg6VEWYIIqRwH
 qHqIhJ7GeylGOVZHSLICTKcWvxEL472qZy1L7siKYv7ZFQO8uMJz447nBi+g8UWzZm1Q
 f51UPk/KnSHKUJjjxAQeWVeyKyxxuGWtZHHoFpcyDIS0vk4ap8R1YYvR6cZOHnPNUT/R
 R5nmAkfcLSah3sniG/iUtVbKwBdQ57YYiGWT93XjKxePBBRQVt1jzDUGMbq710X8K8Sd
 l5YGBUGmsF5f//byJIyVzbo4D3jwqn25BqRPQYLczgzvguV5P/TPmJLAedYcY/7Wvcl2
 PCng==
X-Gm-Message-State: AJIora+M1e7gG3mcnXotjYadALToK6WyyN80bQyY87pKshMlrZIvjTCp
 EP2/FUu21ep0Ro2THjfEVWdBbw==
X-Google-Smtp-Source: AGRyM1vFAMaVxrejgeHUVQtzbSf/+IsHavPxXruTBVbtBZT+dYhiGU9cCoDUlUW+zQyF/K8weo8tQA==
X-Received: by 2002:a05:6402:50f:b0:435:7996:e90f with SMTP id
 m15-20020a056402050f00b004357996e90fmr7436475edv.110.1656196452357; 
 Sat, 25 Jun 2022 15:34:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906860700b00722d5f07864sm3004263ejx.225.2022.06.25.15.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:34:11 -0700 (PDT)
Date: Sun, 26 Jun 2022 00:34:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 4/4] fbmem: Prevent invalid virtual screen sizes
Message-ID: <YreNYlP17bJGx6NV@phenom.ffwll.local>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-5-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625220630.333705-5-deller@gmx.de>
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 12:06:30AM +0200, Helge Deller wrote:
> Prevent that drivers or the user sets the virtual screen resolution
> smaller than the physical screen resolution.  This is important, because
> otherwise we may get accesses outside of the graphics memory area.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 160389365a36..b6e1d0f2b974 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  	if (var->xres < 8 || var->yres < 8)
>  		return -EINVAL;
> 
> +	/* make sure virtual resolution >= physical resolution */
> +	if (var->xres_virtual < var->xres)
> +		return -EINVAL;
> +	if (var->yres_virtual < var->yres)
> +		return -EINVAL;
> +
>  	/* Too huge resolution causes multiplication overflow. */
>  	if (check_mul_overflow(var->xres, var->yres, &unused) ||
>  	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
