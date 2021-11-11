Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF444D69B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 13:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976016EA20;
	Thu, 11 Nov 2021 12:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4A76EA20
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 12:23:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id w1so23468672edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 04:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V5ILNs4YSePRyMbOT/U8nVhbxuOpdMS+fF2ZT1tClsc=;
 b=o/KdlzJXqQMQBtcRAFR+OZeqeRSVwUUcUif8Eh/REjHIZss51B4RzjSpxCqTuiWnII
 Z2cWZryXVBykSXQPDMDgElY0UEo0ZOgZc65/rWMjmvd62WmI6td6tZlYHdzJSCbo8zb2
 GqyS0Qxcp2JdSPF7avFMQJjL+Lpq3gyn9NQJyudciUVvvsnn4AVhA9yVB9eQtVsvnyIH
 ha/HF5GdjdCdcGGXAgw563D8ZyBNd65qgqOlsjLNZeYuWyHteFaGvmg0jZMH+VOF6Vnx
 FzBPzxEfuBEASh9zpD0WXIXpjHEPyEcamafAoWM+Y183XO7uF31o9re2tiMiLA5UCczg
 HNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V5ILNs4YSePRyMbOT/U8nVhbxuOpdMS+fF2ZT1tClsc=;
 b=GoDWwgSRcP5E8Zju7BvY/FcsPAAwgJ4VCZfxBvgyyCgfkz3X+kdqdTclmU4R2JRB7q
 iPHB+1rEqhlAL+CN5yYV8wc918RYGgI80g976ybepcEZkHQRBJ1+O+oQ9IHvlb5tNaVh
 Xlg3lpV4Cy/E+8udOIu/z6Q+ER1C0OLrITMh+n9rud7st+06y+woxD7pqls2kDT8B/MX
 v2hE3MC0fHh9afB4JtPKLMjkLM0GZCGUUfyeHJZtd8/C0ZQfvcasJ/uPigzSDYNiLto8
 4XcuNjZYKwYM0hMTKJgFh3yQmalW8HtYGGYFqXvBNdFqD99ECUBxogHWdH9QY0Pdi/9/
 ay3w==
X-Gm-Message-State: AOAM532O0R2/mL797dcxUZucAeY9E6mRWpjb0zGRgeNsWHFLtPpCFV7y
 4fwoIDlRNw+eltm0pGZy/ac=
X-Google-Smtp-Source: ABdhPJy78PgXjX0plP/9AJRh16PL94apb0nSMaaeo7JemOUI4nA1+ey0TYPlrULLB/v0HWwzmACTUg==
X-Received: by 2002:a17:906:c041:: with SMTP id
 bm1mr9068477ejb.280.1636633396429; 
 Thu, 11 Nov 2021 04:23:16 -0800 (PST)
Received: from lahvuun (93-76-191-141.kha.volia.net. [93.76.191.141])
 by smtp.gmail.com with ESMTPSA id e13sm1239611eje.95.2021.11.11.04.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 04:23:16 -0800 (PST)
Date: Thu, 11 Nov 2021 14:23:14 +0200
From: Ilya Trukhanov <lahvuun@gmail.com>
To: Javier Martinez Canillas <fmartine@redhat.com>
Subject: Re: [PATCH v3] fbdev: Prevent probing generic drivers if a FB is
 already registered
Message-ID: <20211111122314.fd4atj3zbiro73t3@lahvuun>
References: <20211111115757.1351045-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211111115757.1351045-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 12:57:57PM +0100, Javier Martinez Canillas wrote:
> The efifb and simplefb drivers just render to a pre-allocated frame buffer
> and rely on the display hardware being initialized before the kernel boots.
> 
> But if another driver already probed correctly and registered a fbdev, the
> generic drivers shouldn't be probed since an actual driver for the display
> hardware is already present.
> 
> This is more likely to occur after commit d391c5827107 ("drivers/firmware:
> move x86 Generic System Framebuffers support") since the "efi-framebuffer"
> and "simple-framebuffer" platform devices are registered at a later time.
> 
> Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
> Cc: <stable@vger.kernel.org> # 5.15.x
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
> 
> Changes in v3:
> - Cc <stable@vger.kernel.org> since a Fixes: tag is not enough (gregkh).
> 
> Changes in v2:
> - Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
> - Add a comment explaining why the probe fails earlier (Daniel Vetter).
> - Add a Fixes: tag for stable to pick the fix (Daniel Vetter).
> - Add Daniel Vetter's Reviewed-by: tag.
> - Improve the commit message and mention the culprit commit
> 
>  drivers/video/fbdev/efifb.c    | 11 +++++++++++
>  drivers/video/fbdev/simplefb.c | 11 +++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git drivers/video/fbdev/efifb.c drivers/video/fbdev/efifb.c
> index edca3703b964..ea42ba6445b2 100644
> --- drivers/video/fbdev/efifb.c
> +++ drivers/video/fbdev/efifb.c
> @@ -351,6 +351,17 @@ static int efifb_probe(struct platform_device *dev)
>  	char *option = NULL;
>  	efi_memory_desc_t md;
>  
> +	/*
> +	 * Generic drivers must not be registered if a framebuffer exists.
> +	 * If a native driver was probed, the display hardware was already
> +	 * taken and attempting to use the system framebuffer is dangerous.
> +	 */
> +	if (num_registered_fb > 0) {
> +		dev_err(&dev->dev,
> +			"efifb: a framebuffer is already registered\n");
> +		return -EINVAL;
> +	}
> +
>  	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
>  		return -ENODEV;
>  
> diff --git drivers/video/fbdev/simplefb.c drivers/video/fbdev/simplefb.c
> index 62f0ded70681..b63074fd892e 100644
> --- drivers/video/fbdev/simplefb.c
> +++ drivers/video/fbdev/simplefb.c
> @@ -407,6 +407,17 @@ static int simplefb_probe(struct platform_device *pdev)
>  	struct simplefb_par *par;
>  	struct resource *mem;
>  
> +	/*
> +	 * Generic drivers must not be registered if a framebuffer exists.
> +	 * If a native driver was probed, the display hardware was already
> +	 * taken and attempting to use the system framebuffer is dangerous.
> +	 */
> +	if (num_registered_fb > 0) {
> +		dev_err(&pdev->dev,
> +			"simplefb: a framebuffer is already registered\n");
> +		return -EINVAL;
> +	}
> +
>  	if (fb_get_options("simplefb", NULL))
>  		return -ENODEV;
>  
> -- 
> 2.33.1
> 

This patch fixes the suspend issue I was experiencing. Thank you.

Tested-by: Ilya Trukhanov <lahvuun@gmail.com> 
