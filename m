Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0434F7AFD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FD810E0F2;
	Thu,  7 Apr 2022 09:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4BC10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:06:31 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id qh7so9387700ejb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qH1ao1Sv89tAmypsC25LX+raBksixuJK/BXtSJIZNVY=;
 b=fAbafEwVVzZIPTmi+s1aa1APtfjN/g7TFqYJJOZzKrvIEQeu6qOJhnNCJqurVwYJ06
 8EcvXB9YHcuxOvzk0cFHZ151BJTEG1CYB6t0HmQa/H+LavWbcpGkc76P2b4bYgUT0BPA
 daFv05Ohzp/OQ5GvBvBjz9mY3r7//Lt/9Bl6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qH1ao1Sv89tAmypsC25LX+raBksixuJK/BXtSJIZNVY=;
 b=ZmgDuVooC7KRgtbeGWWd0UNo5HN9ZuvsiXz6Bu/JAtjkioT2JGJXw5NgcHtiHmg4sk
 kCJ14Dva8TtFB/e4Pg+lrxV5qqp4APuMXEQrCD5YKmCOonrhwseeEbwBtKXfh/qa3No0
 Byjo1uvLAs35nw3zYYZgm0aax//0lmtTIICmJy5nRrFdgfZxEazCq/eRkpMaUeeyQrun
 Co5GWIG+xByTPl/jjZKrJHtkfZMyDW1LChE6wUY4Yzsp726JlhgFW3/O2JM+bewPnJDH
 Ehzr1BVR2DfArzCItUoo8++pAH5l4voofOYrSmdp7lv+l5WWAfKZaX7FbvD7QHIs/0Bm
 QNcw==
X-Gm-Message-State: AOAM53118E+ICyC5V7UISG7CAFjqJ39JLliLy1w1XXPLQbYKfcett1wZ
 2R8FO+GdiJZP4wmbOsK0z/C4kQ==
X-Google-Smtp-Source: ABdhPJwrbTfjUAtCuRc4DBgoGgdXi1Z5uzcM1p+RofsjaThjZCGK7xpqEG5zTyD1TduyzO2Z+Butew==
X-Received: by 2002:a17:907:94c6:b0:6da:9561:ce0 with SMTP id
 dn6-20020a17090794c600b006da95610ce0mr12001579ejc.342.1649322390205; 
 Thu, 07 Apr 2022 02:06:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a170906b10500b006ce6fa4f510sm7415695ejy.165.2022.04.07.02.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:06:29 -0700 (PDT)
Date: Thu, 7 Apr 2022 11:06:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RESEND RFC PATCH 2/5] firmware: sysfb: Add helpers to
 unregister a pdev and disable registration
Message-ID: <Yk6plGLa+uOb0ZyJ@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406213919.600294-3-javierm@redhat.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 11:39:16PM +0200, Javier Martinez Canillas wrote:
> These can be used by subsystems to unregister a platform device registered
> by sysfb and also to disable future platform device registration in sysfb.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/firmware/sysfb.c | 47 +++++++++++++++++++++++++++++++++++-----
>  include/linux/sysfb.h    | 19 ++++++++++++++++
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index b032f40a92de..08ae78c083f1 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -34,21 +34,52 @@
>  #include <linux/screen_info.h>
>  #include <linux/sysfb.h>
>  
> +static struct platform_device *pd;
> +static DEFINE_MUTEX(load_lock);
> +static bool disabled;
> +
> +void sysfb_disable(void)
> +{
> +	mutex_lock(&load_lock);
> +	disabled = true;
> +	mutex_unlock(&load_lock);
> +}
> +EXPORT_SYMBOL_GPL(sysfb_disable);
> +
> +bool sysfb_try_unregister(struct device *dev)
> +{
> +	bool ret = true;
> +
> +	mutex_lock(&load_lock);
> +	if (!pd || pd != to_platform_device(dev))
> +		return false;
> +
> +	platform_device_unregister(to_platform_device(dev));
> +	pd = NULL;
> +	mutex_unlock(&load_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(sysfb_try_unregister);

Kerneldoc for these plus adding that to
Documentation/firmware/other_interfaces.rst would be really neat.

With that added Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> +
>  static __init int sysfb_init(void)
>  {
>  	struct screen_info *si = &screen_info;
>  	struct simplefb_platform_data mode;
> -	struct platform_device *pd;
>  	const char *name;
>  	bool compatible;
> -	int ret;
> +	int ret = 0;
> +
> +	mutex_lock(&load_lock);
> +	if (disabled)
> +		goto unlock_mutex;
>  
>  	/* try to create a simple-framebuffer device */
>  	compatible = sysfb_parse_mode(si, &mode);
>  	if (compatible) {
>  		pd = sysfb_create_simplefb(si, &mode);
>  		if (!IS_ERR(pd))
> -			return 0;
> +			goto unlock_mutex;
>  	}
>  
>  	/* if the FB is incompatible, create a legacy framebuffer device */
> @@ -60,8 +91,10 @@ static __init int sysfb_init(void)
>  		name = "platform-framebuffer";
>  
>  	pd = platform_device_alloc(name, 0);
> -	if (!pd)
> -		return -ENOMEM;
> +	if (!pd) {
> +		ret = -ENOMEM;
> +		goto unlock_mutex;
> +	}
>  
>  	sysfb_apply_efi_quirks(pd);
>  
> @@ -73,9 +106,11 @@ static __init int sysfb_init(void)
>  	if (ret)
>  		goto err;
>  
> -	return 0;
> +	goto unlock_mutex;
>  err:
>  	platform_device_put(pd);
> +unlock_mutex:
> +	mutex_unlock(&load_lock);
>  	return ret;
>  }
>  
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 708152e9037b..e8c0313fac8f 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -55,6 +55,25 @@ struct efifb_dmi_info {
>  	int flags;
>  };
>  
> +#ifdef CONFIG_SYSFB
> +
> +void sysfb_disable(void);
> +bool sysfb_try_unregister(struct device *dev);
> +
> +#else /* CONFIG_SYSFB */
> +
> +static inline void sysfb_disable(void)
> +{
> +
> +}
> +
> +static inline bool sysfb_try_unregister(struct device *dev)
> +{
> +	return false;
> +}
> +
> +#endif /* CONFIG_SYSFB */
> +
>  #ifdef CONFIG_EFI
>  
>  extern struct efifb_dmi_info efifb_dmi_list[];
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
