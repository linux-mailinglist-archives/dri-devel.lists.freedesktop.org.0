Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05525519C3E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A601120A9;
	Wed,  4 May 2022 09:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECA21120A8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:48:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j6so1780068ejc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=YZq9atGlvwHL4dEwvj0CopnhgDQAd2ZXRzQtho9D+5A=;
 b=WFGXkkMXffbA0qaSs2B1o7KhHe69J7OK8AO7HEqxqma2bxjtuy7uFumM7kW0j8qb6f
 YCqSmuDHJ3DBZ/x1l5suMvMcBLzdFlDMru7ZL4S85Pftc04ka3blyXccxtWM/P4MaanM
 5W3KFYRc/7w5EsXKQiEz49k7ou2n3UlIBD61A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=YZq9atGlvwHL4dEwvj0CopnhgDQAd2ZXRzQtho9D+5A=;
 b=3R9Cb3ZkL8oBr/TRigSf1pazkEGWD3677rzMk7on3vHodsfnAu2H6AB/kMchAHFGNC
 oNLIJ8fZi4CX/YD7clMsGyQhoIN9UZa01h4KrCuDszIAMVAyYB4MX9L4DB7+nl4tbKnS
 1Q9ulOEqQRwHOdYkYB96eFuLXBiZLODEfLlIIqAyujUdxQyPrNmMElzDGHl6OjhQ552J
 qpPQz7sT/Vhcy7+58Gts5VcMg5z7JYudxfifqKJ2hcECDkP9LFWRdDgg2wymrrHyznoo
 BLVr29kRTYRKUUgF2S8SfKr6LWbbKqZ10VBFNC171SDRTiphUMZAPYViy+sJ1v1We7dQ
 LN/Q==
X-Gm-Message-State: AOAM530Lkuq5I/TCArCp5yB7bV7ngPElXiRmh9Flr73o6nGpWOJTZa9o
 akl7I5doLnaZw7ezCSIeHprFhg==
X-Google-Smtp-Source: ABdhPJzqAWkhy8NRWylyo9UZc1cM9O+xCPSTXudw+0/AIIaP29QmmUWuYV9rEXWaQnyQMurfR+nxZA==
X-Received: by 2002:a17:907:97c9:b0:6db:ab53:1fdf with SMTP id
 js9-20020a17090797c900b006dbab531fdfmr20024148ejc.406.1651657680230; 
 Wed, 04 May 2022 02:48:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0042617ba63a7sm9006631edv.49.2022.05.04.02.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 02:47:59 -0700 (PDT)
Date: Wed, 4 May 2022 11:47:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 2/2] fbdev: Make fb_release() return -ENODEV if fbdev was
 unregistered
Message-ID: <YnJLzY7Yiax/AwMx@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>,
 Guenter Roeck <linux@roeck-us.net>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Zheyu Ma <zheyuma97@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502130944.363776-3-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Zheyu Ma <zheyuma97@gmail.com>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 03:09:44PM +0200, Javier Martinez Canillas wrote:
> A reference to the framebuffer device struct fb_info is stored in the file
> private data, but this reference could no longer be valid and must not be
> accessed directly. Instead, the file_fb_info() accessor function must be
> used since it does sanity checking to make sure that the fb_info is valid.
> 
> This can happen for example if the fbdev driver was one that is using a
> framebuffer provided by the system firmware. In that case, the fbdev core
> could unregister the framebuffer device if a real video driver is probed.
> 
> Reported-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Doesn't this mean we just leak the references? Also anything the driver
might refcount in fb_open would be leaked too.

I'm not sure what exactly you're trying to fix here, but this looks a bit
wrong.

Maybe stepping back what fbdev would need, but doesn't have (see the
commit reference I dropped on the previous version) is drm_dev_enter/exit
around hw access. the file_fb_info check essentially provides that, but
with races and everything.

But drm_dev_enter/exit should not disable sw side code, especially not
refcount cleanup like fb_release does here.
-Daniel

> ---
> 
>  drivers/video/fbdev/core/fbmem.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 20d8929df79f..d68097105f93 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1439,7 +1439,10 @@ fb_release(struct inode *inode, struct file *file)
>  __acquires(&info->lock)
>  __releases(&info->lock)
>  {
> -	struct fb_info * const info = file->private_data;
> +	struct fb_info * const info = file_fb_info(file);
> +
> +	if (!info)
> +		return -ENODEV;
>  
>  	lock_fb_info(info);
>  	if (info->fbops->fb_release)
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
