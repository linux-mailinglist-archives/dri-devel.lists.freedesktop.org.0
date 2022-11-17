Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B713562DFDC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B2910E631;
	Thu, 17 Nov 2022 15:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FCF10E631
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:30:44 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j15so3889957wrq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NmTc8N4Shr092u5q5ZzMYQiK1Tct2nUI1iNfzKh4nMY=;
 b=A318zzSk1BBUdlkn8Dy/PMD9F4JHekHV2V+qkQuFEswyxWxyDUA8yHBCkp4HKz9wXq
 C3xiGOQ0YDoT6rDIPecYmVYrh7pS65pFb5wZ2rnsiEcHazYKHNgwAPV2609ovHpvunHo
 BpPhNT2lZxiMhQ+rd3koUxuAr5wrYnWO3Gkzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmTc8N4Shr092u5q5ZzMYQiK1Tct2nUI1iNfzKh4nMY=;
 b=heAGqLaNB9TDO7PCATDJYjITvEDa2xMTw8WVEBFzOXuTMK7DIUS2Un0O2f38QLwVge
 Ti7sBGW+CB6fITpvZuNor9rmwKo5FCRDIKEw7RLDUyrBH6Ir7NaMrygkUfeQ/fy7rKO8
 uEQFFe0fFBAiqOlrhpn5UQza2fTEpK1PDBs+H59vpEuIpArWqvUo7DYh21a+Jbx4thml
 2HMwe0LTFhx8hR+sf3Xxo29xo29slP+jpfDeIm/87u5DSTFYpm6d3TYA1dpNeGZsDMyu
 7jZagUVHdiyZXHk1JybFrEdw0VlEoGxt1ebiDTndgcr2RFsMbz3mTzmaHzZPArqA6ZpB
 auVQ==
X-Gm-Message-State: ANoB5plpF00hpsHBMzhNRKlhaASy9J4IGE8uJuLLAaI5pp0buBeuDBvO
 H3XGuB/BN9ANPCpRFlnhZ2+jMw==
X-Google-Smtp-Source: AA0mqf4w/Z5ktLFjNKV4YqK14v6dPGVMM0iwtA6cWCaaNwgP3b8MkYrqy2yxiya5oeEUGCWz/s+w+w==
X-Received: by 2002:a5d:698c:0:b0:236:4930:2465 with SMTP id
 g12-20020a5d698c000000b0023649302465mr1828158wru.235.1668699043111; 
 Thu, 17 Nov 2022 07:30:43 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b00236488f62d6sm1193827wru.79.2022.11.17.07.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 07:30:42 -0800 (PST)
Date: Thu, 17 Nov 2022 16:30:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
Message-ID: <Y3ZTofhl0TYXvlDa@phenom.ffwll.local>
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: DRI <dri-devel@lists.freedesktop.org>, Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 18, 2022 at 12:27:58AM +0900, Tetsuo Handa wrote:
> A kernel built with syzbot's config file reported that
> 
>   scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2))
> 
> causes uninitialized "save" to be copied.
> 
>   ----------
>   [drm] Initialized vgem 1.0.0 20120112 for vgem on minor 0
>   [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 1
>   Console: switching to colour frame buffer device 128x48
>   =====================================================
>   BUG: KMSAN: uninit-value in do_update_region+0x4b8/0xba0
>    do_update_region+0x4b8/0xba0
>    update_region+0x40d/0x840
>    fbcon_switch+0x3364/0x35e0
>    redraw_screen+0xae3/0x18a0
>    do_bind_con_driver+0x1cb3/0x1df0
>    do_take_over_console+0x11cb/0x13f0
>    fbcon_fb_registered+0xacc/0xfd0
>    register_framebuffer+0x1179/0x1320
>    __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
>    drm_fbdev_client_hotplug+0xbea/0xda0
>    drm_fbdev_generic_setup+0x65e/0x9d0
>    vkms_init+0x9f3/0xc76
>    (...snipped...)
>   
>   Uninit was stored to memory at:
>    fbcon_prepare_logo+0x143b/0x1940
>    fbcon_init+0x2c1b/0x31c0
>    visual_init+0x3e7/0x820
>    do_bind_con_driver+0x14a4/0x1df0
>    do_take_over_console+0x11cb/0x13f0
>    fbcon_fb_registered+0xacc/0xfd0
>    register_framebuffer+0x1179/0x1320
>    __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
>    drm_fbdev_client_hotplug+0xbea/0xda0
>    drm_fbdev_generic_setup+0x65e/0x9d0
>    vkms_init+0x9f3/0xc76
>    (...snipped...)
>   
>   Uninit was created at:
>    __kmem_cache_alloc_node+0xb69/0x1020
>    __kmalloc+0x379/0x680
>    fbcon_prepare_logo+0x704/0x1940
>    fbcon_init+0x2c1b/0x31c0
>    visual_init+0x3e7/0x820
>    do_bind_con_driver+0x14a4/0x1df0
>    do_take_over_console+0x11cb/0x13f0
>    fbcon_fb_registered+0xacc/0xfd0
>    register_framebuffer+0x1179/0x1320
>    __drm_fb_helper_initial_config_and_unlock+0x23ad/0x2b40
>    drm_fbdev_client_hotplug+0xbea/0xda0
>    drm_fbdev_generic_setup+0x65e/0x9d0
>    vkms_init+0x9f3/0xc76
>    (...snipped...)
>   
>   CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.1.0-rc4-00356-g8f2975c2bb4c #924
>   Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
>   ----------
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Thanks for your patch, pushed to drm-misc-fixes.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 098b62f7b701..c0143d38df83 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -577,7 +577,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
>  		if (scr_readw(r) != vc->vc_video_erase_char)
>  			break;
>  	if (r != q && new_rows >= rows + logo_lines) {
> -		save = kmalloc(array3_size(logo_lines, new_cols, 2),
> +		save = kzalloc(array3_size(logo_lines, new_cols, 2),
>  			       GFP_KERNEL);
>  		if (save) {
>  			int i = min(cols, new_cols);
> -- 
> 2.34.1

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
