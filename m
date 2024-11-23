Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3539D6B6F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 21:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D89510E171;
	Sat, 23 Nov 2024 20:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Sat, 23 Nov 2024 20:27:11 UTC
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi
 [62.142.5.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7310E171
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 20:27:11 +0000 (UTC)
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
 by fgw21.mail.saunalahti.fi (Halon) with ESMTP
 id 10a0d7d4-a9d7-11ef-8881-005056bdd08f;
 Sat, 23 Nov 2024 22:11:04 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 22:11:03 +0200
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 20/28] fbdev: clps711x-fb: Replace check_fb in favor
 of struct fb_info.lcd_dev
Message-ID: <Z0I211pFIHS_ajoX@surfacebook.localdomain>
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20240906075439.98476-21-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906075439.98476-21-tzimmermann@suse.de>
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

Fri, Sep 06, 2024 at 09:52:34AM +0200, Thomas Zimmermann kirjoitti:
> Store the lcd device in struct fb_info.lcd_dev. The lcd subsystem can
> now detect the lcd's fbdev device from this field.
> 
> This makes the implementation of check_fb in clps711x_lcd_ops obsolete.
> Remove it.

...

> +	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> +				       &clps711x_lcd_ops);
> +	if (IS_ERR(lcd)) {
> +		ret = PTR_ERR(lcd);
> +		goto out_fb_dealloc_cmap;
> +	}
> +
> +	info->lcd_dev = lcd;
> +
>  	ret = register_framebuffer(info);
>  	if (ret)
>  		goto out_fb_dealloc_cmap;
>  
> -	lcd = devm_lcd_device_register(dev, "clps711x-lcd", dev, cfb,
> -				       &clps711x_lcd_ops);
> -	if (!IS_ERR(lcd))
> -		return 0;
> +	return 0;
>  
> -	ret = PTR_ERR(lcd);
>  	unregister_framebuffer(info);

Haven't you got a dead code warning here?

>  
>  out_fb_dealloc_cmap:

-- 
With Best Regards,
Andy Shevchenko


