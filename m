Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E651BFDF
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD3810E373;
	Thu,  5 May 2022 12:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1A910E373
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:52:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gh6so8583988ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=dMhPbH8YYksNDQWsYUNKHz6CMEzpio+MpfpxpHsuHBY=;
 b=Q+F4YMFKbmp2KsE3LUay5GdA+juEREvkYz6rogZdVlySBdtrsWZokkOwvR/UIRqOuf
 yWO64v1ha0Z1AqNjZsZtdxtJOE2l/Oz7sraJ1HMqAcocYPuyupTzDLhXt4k31YAymA9X
 8rofUAYUyJM7LOh9REyEUWZxt9/v8D8wr/XDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=dMhPbH8YYksNDQWsYUNKHz6CMEzpio+MpfpxpHsuHBY=;
 b=ZP7jQhn1BCqwjo8IVmtDR209L+VwVKpPpd4QTTCW4a3/vekOu8JoeuMHeMCJuPHzNK
 J3UMJVYtEJkKtE1TwvC5W0u4/LMwvYvDTgLDf8/Zdv5vcoiaV3VD1gE5Tg0GoTMElMrg
 6aKpd4cYNdcSuN84PPXqyiVgqI3lJfA35SAH0Abt4uGuX7odH/nt4v30kvXpvf0oBbWf
 RijuX73zVVXP52MYgAO5LpJA8GpDMbJJowhtd/9Ew2+m+qvnLAEmfJPtCX+UJMEPNPKX
 TXFpHLVGQWIHOpNyQ4nZwF7q5Enlliel3L7njA+AnlgESYrsDJs+YK0WNAtO3Aw+wLFQ
 hi0g==
X-Gm-Message-State: AOAM530Ucd8eKbu3gqLzD3jmDk7+PWkiRX5OjbOzZeJOvxeaGh73axuq
 d28WtPwuPffCX7krJ1g6mkuXpg==
X-Google-Smtp-Source: ABdhPJwn4NiXRceP/yXAlHkWOcazdmg0trdBH+p11tn6Cs2WzVeV2J0TUG+/2PB6a2r4UskM+PDLhw==
X-Received: by 2002:a17:907:94c5:b0:6f4:6de1:399c with SMTP id
 dn5-20020a17090794c500b006f46de1399cmr16128031ejc.336.1651755169715; 
 Thu, 05 May 2022 05:52:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a17090612cf00b006f3ef214df9sm722670ejb.95.2022.05.05.05.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:52:48 -0700 (PDT)
Date: Thu, 5 May 2022 14:52:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy
 rather than .remove
Message-ID: <YnPInuayAYQa1jmz@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Hans de Goede <hdegoede@redhat.com>
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504215722.56970-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 11:57:22PM +0200, Javier Martinez Canillas wrote:
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

I think this should have a Fixes: line for the patch from Thomas which
changed the remove_conflicting_fb code:

27599aacbaef ("fbdev: Hot-unplug firmware fb devices on forced removal")

I think we should also mention that strictly speaking the code flow is now
wrong, because hw cleanup (like iounmap) should be done from ->remove
while sw cleanup (like calling framebuffer_release()) is the only thing
that should be done from ->fb_destroy. But the current code matches what
was happening before 27599aacbaef so more minimal "fix"

With those details added Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Same for the next patch.
-Daniel

> ---
> 
>  drivers/video/fbdev/simplefb.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 94fc9c6d0411..2c198561c338 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -84,6 +84,10 @@ struct simplefb_par {
>  static void simplefb_clocks_destroy(struct simplefb_par *par);
>  static void simplefb_regulators_destroy(struct simplefb_par *par);
>  
> +/*
> + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> + * of unregister_framebuffer() or fb_release(). Do any cleanup here.
> + */
>  static void simplefb_destroy(struct fb_info *info)
>  {
>  	struct simplefb_par *par = info->par;
> @@ -94,6 +98,8 @@ static void simplefb_destroy(struct fb_info *info)
>  	if (info->screen_base)
>  		iounmap(info->screen_base);
>  
> +	framebuffer_release(info);
> +
>  	if (mem)
>  		release_mem_region(mem->start, resource_size(mem));
>  }
> @@ -545,8 +551,8 @@ static int simplefb_remove(struct platform_device *pdev)
>  {
>  	struct fb_info *info = platform_get_drvdata(pdev);
>  
> +	/* simplefb_destroy takes care of info cleanup */
>  	unregister_framebuffer(info);
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
