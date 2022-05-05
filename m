Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AEB51C020
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166FC10FBAB;
	Thu,  5 May 2022 13:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0375C10FBAB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:02:25 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bv19so8593427ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BOm9C+H5cCzRKeEZrFMRYiRqzZ6UOwUcjZY2tv0sRpc=;
 b=Kxw8nwKJ8DvGjh9azZysybfe83qaqPbJNMBImiHRRShDE9cAQIVUPwpNRzMYyqJDWn
 dsRQVs0f6iLibcVuVSZkqpqhNIFiDlD3wJgApXaHgV2OLHQUNm6UMFbpquj9a984Ath2
 YYzt5AvkVS0kW+QS7oh5lGjcn6amGHjvw2cFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BOm9C+H5cCzRKeEZrFMRYiRqzZ6UOwUcjZY2tv0sRpc=;
 b=XgiIEQ3755Ek4yY3QJaZRws8FIqnJKQVx9NmSGUzOp17lbvhjP3dvJ7P701ZZI/6RB
 fqu9e5UlFuymIAhu2LxvrvyWC4l+seV2kBQHv2nhZqIf2rXotdFGvMjEvdYMwn0MOCbi
 RqgHvp+PFfUgmGnGS0ItAX13VCvDJ0wYZIxhXQSEWI7EWWc+TW4/efzvVY8koMhMoPwz
 XZZLeRv6M/vEukRF40Eu1OJDOM+egdwxSscxLR0tuguCul36t5MxqX64kGpegXSuKvP6
 X8sgWpq7fED673lg4w7h8hFvPmhYC0uOhoxN4vYUzJ63pAqLFlJ9ywVqoYgLmcFIzwc7
 8pZQ==
X-Gm-Message-State: AOAM532IguPUPHbYpCwovUVyt+JcA/GA40GMTbwevHYVGXS8yOrYsice
 9vAuBtgyu7/yCv+9BoAJnHLvhw==
X-Google-Smtp-Source: ABdhPJztrJUrelAEmEd/ZSyj3JbJlOid+Hsdae80sL28sjz9o0jSUsQ4xsro3xCtUCPLNWG8pnxaUA==
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr25395823ejc.610.1651755744294; 
 Thu, 05 May 2022 06:02:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170907272300b006f3ef214da4sm767144ejl.10.2022.05.05.06.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 06:02:23 -0700 (PDT)
Date: Thu, 5 May 2022 15:02:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 4/4] fbdev: vesafb: Cleanup fb_info in .fb_destroy
 rather than .remove
Message-ID: <YnPK3RLPdtvFze+8@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220505113128.264963-1-javierm@redhat.com>
 <20220505113128.264963-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505113128.264963-5-javierm@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 01:31:27PM +0200, Javier Martinez Canillas wrote:
> The driver is calling framebuffer_release() in its .remove callback, but
> this will cause the struct fb_info to be freed too early. Since it could
> be that a reference is still hold to it if user-space opened the fbdev.
> 
> This would lead to a use-after-free error if the framebuffer device was
> unregistered but later a user-space process tries to close the fbdev fd.
> 
> The correct thing to do is to only unregister the framebuffer in the
> driver's .remove callback, but do any cleanup in the fb_ops.fb_destroy.
> 
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> Changes in v2:
> - Also do the change for vesafb (Thomas Zimmermann).
> 
>  drivers/video/fbdev/vesafb.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index df6de5a9dd4c..1f03a449e505 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -179,6 +179,10 @@ static int vesafb_setcolreg(unsigned regno, unsigned red, unsigned green,
>  	return err;
>  }
>  
> +/*
> + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> + * of unregister_framebuffer() or fb_release(). Do any cleanup here.
> + */
>  static void vesafb_destroy(struct fb_info *info)
>  {
>  	struct vesafb_par *par = info->par;
> @@ -187,7 +191,13 @@ static void vesafb_destroy(struct fb_info *info)
>  	arch_phys_wc_del(par->wc_cookie);
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
> +
> +	if (((struct vesafb_par *)(info->par))->region)
> +		release_region(0x3c0, 32);

This move seems rather iffy, so maybe justify it with "makes the code
exactly as busted before 27599aacbaef ("fbdev: Hot-unplug firmware fb
devices on forced removal")"

Also same comments as on v1 about adding more details about what/how this
fixes, with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	release_mem_region(info->apertures->ranges[0].base, info->apertures->ranges[0].size);
> +
> +	framebuffer_release(info);
>  }
>  
>  static struct fb_ops vesafb_ops = {
> @@ -484,10 +494,8 @@ static int vesafb_remove(struct platform_device *pdev)
>  {
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  
> +	/* vesafb_destroy takes care of info cleanup */
>  	unregister_framebuffer(info);
> -	if (((struct vesafb_par *)(info->par))->region)
> -		release_region(0x3c0, 32);
> -	framebuffer_release(info);
>  
>  	return 0;
>  }
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
