Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC7F403DF0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7796E20C;
	Wed,  8 Sep 2021 16:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CAC6E20C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:52:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so2165742wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WUrWUsCwsJeXj2HGWN2oRj2bIozmPlXXGJLRAj3wdHo=;
 b=bI/RCaj5vZWxCKuvJjSWmzTp40epENOYQvkwpY7c0wfvKJoPAKhXkjEDHKDDDSJkHy
 PV52xTwQTVP8nbVcyn7Glr/LEWAwiVctVXNqbR6LMnPsxzZgKB/tIS6R4EC5JOyZvKDz
 SCGkC12OmgAjKNFkGh+83O3n0XHPSc/jlujT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WUrWUsCwsJeXj2HGWN2oRj2bIozmPlXXGJLRAj3wdHo=;
 b=N3NoKZVvFrVgcwj/NeuEd0qar9qxDZAG9jUng9CWDUjm9Wjklmx+qbtCU06aQV0cuz
 DU2MRtx/G7meYz1RDfqU0N1vpg5YF61CI8cfByfoST8TJwmK3BuY1KqUfoLCCXWcBK63
 9wPix/yP7k8H+fYW0xvCYIjo1yhnu3oEU793uSfFcPcRQHwBsSfkYYZXfIj8UbhKKZKh
 4pVpdpk4xk3Krt1o8aFXEkKmkl8dS1LB0rNm6g/iUz1CEOI451Fqu48X8/P2y+6ad7JH
 uCg8G5jAJo6SqXhmMV31s/i1G1ZoBphoQ7/xhowWEKFKBT4m2gzb4Okf7OkLnYVvUM6O
 ijZA==
X-Gm-Message-State: AOAM531Z2gCWwWJ0SeD4o6Z0VdHQ/EgqADlfKLafDxaA8FHgRr11qnd6
 rWYD+aSCL5/0qLT3fH9YU/Is/Q==
X-Google-Smtp-Source: ABdhPJxbutniDXTQRAyP+pWdNR/LfIRpD074ohDAAtk5CKaqUqk4pODE98e3Ze+6Mlsaav2RRiDtgA==
X-Received: by 2002:a05:600c:ac7:: with SMTP id
 c7mr4591135wmr.40.1631119923692; 
 Wed, 08 Sep 2021 09:52:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm2449294wmi.12.2021.09.08.09.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:52:03 -0700 (PDT)
Date: Wed, 8 Sep 2021 18:52:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v2 (repost)] fbmem: don't allow too huge resolutions
Message-ID: <YTjqMXq3nA6uY3lU@phenom.ffwll.local>
References: <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
 <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
 <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
 <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
 <750ed1ae-de80-b232-4aea-79d60c212fab@i-love.sakura.ne.jp>
 <185175d6-227a-7b55-433d-b070929b262c@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <185175d6-227a-7b55-433d-b070929b262c@i-love.sakura.ne.jp>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 07:27:49PM +0900, Tetsuo Handa wrote:
> syzbot is reporting page fault at vga16fb_fillrect() [1], for
> vga16fb_check_var() is failing to detect multiplication overflow.
> 
>   if (vxres * vyres > maxmem) {
>     vyres = maxmem / vxres;
>     if (vyres < yres)
>       return -ENOMEM;
>   }
> 
> Since no module would accept too huge resolutions where multiplication
> overflow happens, let's reject in the common path.
> 
> Link: https://syzkaller.appspot.com/bug?extid=04168c8063cfdde1db5e [1]
> Reported-by: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>
> Debugged-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes in v2:
>   Use check_mul_overflow(), suggested by Geert Uytterhoeven <geert@linux-m68k.org>.

Pushed to drm-misc-next-fixes so it should get into current merge window.

I also added a cc: stable here, I htink it's needed.

Thanks a lot to both you&Geert for handling this!
-Daniel

> 
>  drivers/video/fbdev/core/fbmem.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 71fb710f1ce3..7420d2c16e47 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -962,6 +962,7 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  	struct fb_var_screeninfo old_var;
>  	struct fb_videomode mode;
>  	struct fb_event event;
> +	u32 unused;
>  
>  	if (var->activate & FB_ACTIVATE_INV_MODE) {
>  		struct fb_videomode mode1, mode2;
> @@ -1008,6 +1009,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>  	if (var->xres < 8 || var->yres < 8)
>  		return -EINVAL;
>  
> +	/* Too huge resolution causes multiplication overflow. */
> +	if (check_mul_overflow(var->xres, var->yres, &unused) ||
> +	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
> +		return -EINVAL;
> +
>  	ret = info->fbops->fb_check_var(var, info);
>  
>  	if (ret)
> -- 
> 2.18.4
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
