Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9CB7269B7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B0010E0E1;
	Wed,  7 Jun 2023 19:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16AE10E0E1
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 19:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kSzGrhZeHHFA6vfrZ2LR8W+Xuz6bQ2NOc+2ymmMNnM0=;
 b=h76YaDkQ9KEY86SkBJIK7Zu4Enw0wNpHBcVhmUgBpVjydT2hAS48Fnof+OaILkoaBDq1/iv2MvciJ
 zFCHwPg6zxBLmjCVK1BOiWPQVAvcYJ1j2+T+aKRUj1xG8LbcxWtzm/CWEskimaYbT6ZDM5BH2jkIH7
 lTx51IzydhS8dOzNDsY42jQSYhHtemMvMZiA2KUS3Bqg3P+WgHnX4Hk0pEbysfuGF4JkfCrO5TMz50
 s7n8laMYfpl3dbdP2H3sV1/u76Zan9yUfQ1bJACzSxpks406V0+UvNp2GZnvf3RAlLlyxVyo5SBxO7
 fbuBjGDL7jRpFlpn29TGdyQNE+2YITA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kSzGrhZeHHFA6vfrZ2LR8W+Xuz6bQ2NOc+2ymmMNnM0=;
 b=vboEswhlVEDQlrEBHy9SKyPCu7hxQ/FQGvK2EVLt3AfPI8xQHLCiCGcuYD0YlmIxPuNcTUIsJMfSB
 1ypYZxqAg==
X-HalOne-ID: 0f4d33df-0569-11ee-8726-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 0f4d33df-0569-11ee-8726-b90637070a9d;
 Wed, 07 Jun 2023 19:25:29 +0000 (UTC)
Date: Wed, 7 Jun 2023 21:25:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 24/30] fbdev/core: Pass Linux device to pm_vt_switch_*()
 functions
Message-ID: <20230607192528.GA670717@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-25-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-25-tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, linux-staging@lists.linux.dev,
 Pavel Machek <pavel@ucw.cz>, geert+renesas@glider.be, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 04:48:06PM +0200, Thomas Zimmermann wrote:
> Pass the Linux device to pm_vt_switch_*() instead of the virtual
> fbdev device. Prepares fbdev for making struct fb_info.dev optional.
> 
> The type of device that is passed to the PM functions does not matter
> much. It is only a token within the internal list of known devices.
> The PM functions do not refer to any of the device's properties or its
> type.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-pm@vger.kernel.org
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/core/fbmem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 329d16e49a90..f91ae7d4c94d 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1478,9 +1478,9 @@ static int do_register_framebuffer(struct fb_info *fb_info)
>  		INIT_LIST_HEAD(&fb_info->modelist);
>  
>  	if (fb_info->skip_vt_switch)
> -		pm_vt_switch_required(fb_info->dev, false);
> +		pm_vt_switch_required(fb_info->device, false);
>  	else
> -		pm_vt_switch_required(fb_info->dev, true);
> +		pm_vt_switch_required(fb_info->device, true);
>  
>  	fb_var_to_videomode(&mode, &fb_info->var);
>  	fb_add_videomode(&mode, &fb_info->modelist);
> @@ -1520,7 +1520,7 @@ static void unlink_framebuffer(struct fb_info *fb_info)
>  
>  	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
>  
> -	pm_vt_switch_unregister(fb_info->dev);
> +	pm_vt_switch_unregister(fb_info->device);
>  
>  	unbind_console(fb_info);
>  
> -- 
> 2.40.1
