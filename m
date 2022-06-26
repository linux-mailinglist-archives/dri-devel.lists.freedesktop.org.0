Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082E55B068
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 10:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CF410FD90;
	Sun, 26 Jun 2022 08:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48D410FD83
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 08:50:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id u12so13026682eja.8
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 01:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SFCEfpaDlOL9hYml7KkA/FOqx9Sb54eiS155GWVwklM=;
 b=MnWD6z0LPe34WH9gWk0zAiiztfYEz9A65uau3VeI5LtTrqAcQZraMuJMlqpb6gl64/
 11JQ6GCkiCalO4Zoc4ASTm1txitASCcYx9jjzVmuF3WXfGJnMloVIsOlrsHCjb1z2DVJ
 cOGaFkjFnDN9kFluKqkKpkuEgNdqHkYD5jbwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SFCEfpaDlOL9hYml7KkA/FOqx9Sb54eiS155GWVwklM=;
 b=Ak/bREeh5u2ADhFV4YwJKIodvQ1fQTr/DNj8xre1MgRGDvuMlg103FngA8C5P5GZR6
 q6Guc/A/f6g+YkM0O7nQOsc7nOA0muVRabBT69iJ415JgBQ0x82WQQsrpxUFiweym84D
 JS1ORsohIPx59stxVrRpuANmg4/Zq7wWEw3ll7gHn+4qEdZEHGZz/zyzrucFSihYE0Z7
 GMBOc9ndLCLSMP5TJ+E+9hhSaO9Z90ZZe7xbEUXHloybMNAP91TIT9jutzbXp4y2aJnn
 ZnKTCUzdLn0AqmThnEajh/Ev6lMfNS8GADrIjEjrJCHvQA/HtJ04ABQVLSOJPmFtimxM
 CLbg==
X-Gm-Message-State: AJIora9HRo4V3i96R09/lub7A+MAOudRlTp6K7xNqAA7wyy0bYyBX+tz
 WCkhK5txYCU8MGrC/8ISTZqJEw==
X-Google-Smtp-Source: AGRyM1vELRzz0C9nDQlgjLFs2MvjZPAik8xdHUmKO6PMy3pgJPjIGZlWyN8EOdnZ+vFlJwec2qFneg==
X-Received: by 2002:a17:907:94ce:b0:726:449e:73cc with SMTP id
 dn14-20020a17090794ce00b00726449e73ccmr6040264ejc.270.1656233423330; 
 Sun, 26 Jun 2022 01:50:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170906698a00b0071cbc7487e0sm3556304ejr.71.2022.06.26.01.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 01:50:22 -0700 (PDT)
Date: Sun, 26 Jun 2022 10:50:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v4 2/3] fbcon: Prevent that screen size is smaller than
 font size
Message-ID: <YrgdzT7LwoCv6Vok@phenom.ffwll.local>
References: <20220625232703.401821-1-deller@gmx.de>
 <20220625232703.401821-3-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625232703.401821-3-deller@gmx.de>
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 01:27:02AM +0200, Helge Deller wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
> 
> This patch adds a new function fbcon_modechange_possible() which
> implements this check and which later may be extended with other checks
> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> for a too small screen size.
> 
> This patch depends on commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup"),
> so it needs to be backported as well.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbcon.c | 27 +++++++++++++++++++++++++++
>  drivers/video/fbdev/core/fbmem.c |  4 +++-
>  include/linux/fbcon.h            |  4 ++++
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index e162d5e753e5..2ab7515ac842 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2736,6 +2736,33 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
>  }
>  EXPORT_SYMBOL(fbcon_update_vcs);
> 
> +/* let fbcon check if it supports a new screen resolution */
> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> +{
> +	struct fbcon_ops *ops = info->fbcon_par;
> +	struct vc_data *vc;
> +	int i;
> +
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	if (!ops || ops->currcon < 0)
> +		return -EINVAL;
> +
> +	/* prevent setting a screen size which is smaller than font size */
> +	for (i = first_fb_vc; i <= last_fb_vc; i++) {
> +		vc = vc_cons[i].d;
> +		if (!vc || fbcon_info_from_console(i) != info)
> +			continue;
> +
> +		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||
> +		    vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xres))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(fbcon_modechange_possible);
> +
>  int fbcon_mode_deleted(struct fb_info *info,
>  		       struct fb_videomode *mode)
>  {
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index afa2863670f3..160389365a36 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			return -EFAULT;
>  		console_lock();
>  		lock_fb_info(info);
> -		ret = fb_set_var(info, &var);
> +		ret = fbcon_modechange_possible(info, &var);
> +		if (!ret)
> +			ret = fb_set_var(info, &var);
>  		if (!ret)
>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  		unlock_fb_info(info);
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index ff5596dd30f8..2382dec6d6ab 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -15,6 +15,8 @@ void fbcon_new_modelist(struct fb_info *info);
>  void fbcon_get_requirement(struct fb_info *info,
>  			   struct fb_blit_caps *caps);
>  void fbcon_fb_blanked(struct fb_info *info, int blank);
> +int  fbcon_modechange_possible(struct fb_info *info,
> +			       struct fb_var_screeninfo *var);
>  void fbcon_update_vcs(struct fb_info *info, bool all);
>  void fbcon_remap_all(struct fb_info *info);
>  int fbcon_set_con2fb_map_ioctl(void __user *argp);
> @@ -33,6 +35,8 @@ static inline void fbcon_new_modelist(struct fb_info *info) {}
>  static inline void fbcon_get_requirement(struct fb_info *info,
>  					 struct fb_blit_caps *caps) {}
>  static inline void fbcon_fb_blanked(struct fb_info *info, int blank) {}
> +static inline int  fbcon_modechange_possible(struct fb_info *info,
> +				struct fb_var_screeninfo *var) { return 0; }
>  static inline void fbcon_update_vcs(struct fb_info *info, bool all) {}
>  static inline void fbcon_remap_all(struct fb_info *info) {}
>  static inline int fbcon_set_con2fb_map_ioctl(void __user *argp) { return 0; }
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
