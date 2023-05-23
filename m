Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9C70D477
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 09:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4795510E3DF;
	Tue, 23 May 2023 07:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B56E10E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 07:00:44 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f3a166f8e9so5537496e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 00:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684825240; x=1687417240;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tiyNLo+d4YDYjgJA1qKT1sKUVcXrVEedkG2NvH0H6oU=;
 b=UNKL+vlYlsbAgzG3ryBvBItjt9KSbwrv3aQrxPMkVwilXT4N4xEdnyjOBSROkVE4/e
 Qf4MQUBUqLqZ9oaQMomd2gPQmv/QQJxeMovWSfXXjHNQKbMUENhKtptBPVZ/tzICaBSj
 VeF324dhOezxc2w800PxrbJXGWD/BNhUzJ3iMW9WDqo2wEWrFuHgvZiCR3lBt+d+bVrE
 MK99F9xuNrlyae4RSYvkAWwKEsJlGESOj72/6/tvXVbf4Q0mAB79VR0dDQ38L4kUtWmm
 EkbwUJUfPfv6SEyPdwDYxKvmV/HjaLWlOJsNkhNjMYXD6yaPVDBzrITr/bTpm1JjQUUP
 G8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684825240; x=1687417240;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tiyNLo+d4YDYjgJA1qKT1sKUVcXrVEedkG2NvH0H6oU=;
 b=Y0WO4OURstYt19gL27lx3Mq2+zcxyL81tho5Z5fvwFBrOm6pFHA4YYHjCiXaBu13Il
 axULWEh5/FQGn+R0ddrQTKv/4DoptFZqb2wh/S03hDKCDNskLM2pEig5MVozbEnYTQvN
 QwJKNfhK3W36j+4WW8Mat2CZvrAVrDwl6LQtwLaekWtYUjITMlugUJZNTUunq19TqECA
 S2SrV59w9CtSekuMBOELmRcUgbSdBk4X3f01f4g8+P/faEBhEFm6do7loXclxRbgjeMa
 DT2Xhi0WO41/4Y5a1m66HrqyQ9xbDi65uRAHmsM0SAp9PUUppRPBU1qVuWR1UtKZhMkA
 Imgw==
X-Gm-Message-State: AC+VfDy7mRvKVErfPnzTVDnoLg02H0OQowK0NPNu/BXyaG0JTlBKqmbW
 7pdME677QmH1hX62G/qhlmA=
X-Google-Smtp-Source: ACHHUZ60bBl3tj9MIcPwcYY7w3BHq55/2la2GKTYR+VI2PwlIe4rmV/o2Zu13PASfFNhIuF5s/d0eA==
X-Received: by 2002:a05:6512:b84:b0:4f3:b736:720f with SMTP id
 b4-20020a0565120b8400b004f3b736720fmr2988526lfv.12.1684825239871; 
 Tue, 23 May 2023 00:00:39 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 w26-20020ac254ba000000b004f3a1033078sm1248096lfk.52.2023.05.23.00.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:00:39 -0700 (PDT)
Date: Tue, 23 May 2023 09:00:37 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gma500: Clear fbdev framebuffer with fb_memset_io()
Message-ID: <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20230522190637.7039-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522190637.7039-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 09:06:37PM +0200, Thomas Zimmermann wrote:
> The fbdev framebuffer is I/O memory, so clear it with fb_memset_io().
> Fixes the following sparse warning:
> 
> ../drivers/gpu/drm/gma500/fbdev.c:234:20: warning: incorrect type in argument 1 (different address spaces)
> ../drivers/gpu/drm/gma500/fbdev.c:234:20:    expected void *s
> ../drivers/gpu/drm/gma500/fbdev.c:234:20:    got char [noderef] __iomem *screen_base
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Looks good but I don't see the fb_mem*() helper change being merged yet.
Or am I looking in the wrong place?

> ---
>  drivers/gpu/drm/gma500/fbdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
> index 62287407e717..4f0309548b2b 100644
> --- a/drivers/gpu/drm/gma500/fbdev.c
> +++ b/drivers/gpu/drm/gma500/fbdev.c
> @@ -231,7 +231,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
>  	info->fix.mmio_start = pci_resource_start(pdev, 0);
>  	info->fix.mmio_len = pci_resource_len(pdev, 0);
>  
> -	memset(info->screen_base, 0, info->screen_size);
> +	fb_memset_io(info->screen_base, 0, info->screen_size);
>  
>  	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
>  
> -- 
> 2.40.1
> 
