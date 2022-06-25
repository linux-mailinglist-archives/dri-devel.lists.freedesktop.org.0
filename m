Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523E55AA23
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADED110FB34;
	Sat, 25 Jun 2022 12:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CC110FB12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:55:13 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id o9so6908521edt.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lliJXY1bIhf6tNh9k0MSZsr/P3hPS0gmh3V8TeTr4J0=;
 b=LFMs/2iwzzVJLkMm4/bXiJcSz9g54zFvYPSIbjJsjaDuwKjALwxScV+hXUasPQafXT
 hKy4TzEu3ZCIEbSEvgkWP+bNep4yLmiTWOOEe0SH1HDDWO7JcRD7/tXvMyIyjsCP60Ux
 ZEcP/msI4hHxm/IA/3ZB8neVmeDXx195WDA5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lliJXY1bIhf6tNh9k0MSZsr/P3hPS0gmh3V8TeTr4J0=;
 b=KM68J0cOj3RzF0GirgB5mblbR3raOEn6tcdvG7Iy4mTe8U7brjo+LK3w7h5o6s0QEN
 xrChPUmKgmkeGr+Xvnhtyzh29xma8JtuT9yrU/Wf33gZVG7EKcBaDwA7yhTIFdJr05Ax
 KPADA7LPyA/TmyBTSwLd7Xp8lFw9JTPyszUlI93LEy81rwVHO0mLgD13t3UlRWQi0TWc
 EKS0FHx5eMGliTVW+HzEJpB/3ks8Eua0eDaBIjao7wUCXIO30dUd9ZNCyaluMzzxylm0
 RGWLF9JZ8fyKRSdCCZmU6JTN4hzx57pt9tzEvIgYt7sYOlbwOOStbM/sqxGM+fBz5lPX
 u70w==
X-Gm-Message-State: AJIora+frwdMbAAKnHhcbJJufpOafi95qPXlZ3LOsryvyZ0L8IMepIbJ
 fQhefZ7t0TM89m8nehwKV2p+GA==
X-Google-Smtp-Source: AGRyM1ttbi/Wo/rqL1dyB/uQVJT45o07CP6yDIY5JhqxrdiZZPQTQIxtcjSqgtaayWeMmyFttdSnkQ==
X-Received: by 2002:a05:6402:2750:b0:435:ab9f:1235 with SMTP id
 z16-20020a056402275000b00435ab9f1235mr5004882edd.188.1656161711503; 
 Sat, 25 Jun 2022 05:55:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 kg27-20020a17090776fb00b00721d8e5beeesm2536714ejc.60.2022.06.25.05.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 05:55:11 -0700 (PDT)
Date: Sat, 25 Jun 2022 14:55:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 2/4] fbcon: Add fbcon_modechange_possible() check
Message-ID: <YrcFrYfmOqT7WNyR@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-3-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625122502.68095-3-deller@gmx.de>
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

On Sat, Jun 25, 2022 at 02:25:00PM +0200, Helge Deller wrote:
> We need to prevent that users configure a screen size which is smaller than the
> currently selected font size. Otherwise rendering chars on the screen will
> access memory outside the graphics memory region.
> 
> This patch adds a new function fbcon_modechange_possible() which implements
> this check and which may be extended with other checks later if necessary.  The
> new function will be called from the FBIOPUT_VSCREENINFO ioctl handler in
> fbmem.c, which will then return -EINVAL to the user if the new screen size is
> too small.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+
> ---
>  drivers/video/fbdev/core/fbcon.c | 26 ++++++++++++++++++++++++++
>  include/linux/fbcon.h            |  4 ++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index e162d5e753e5..e4cc4841ed7f 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2736,6 +2736,32 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
>  }
>  EXPORT_SYMBOL(fbcon_update_vcs);
> 
> +/* let fbcon check if it supports a new screen resolution */
> +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> +{
> +	struct fbcon_ops *ops = info->fbcon_par;
> +	struct vc_data *vc;
> +	int i;

	WARN_CONSOLE_UNLOCKED();

here please.

> +
> +	if (!ops || ops->currcon < 0)
> +		return -EINVAL;
> +
> +	/* prevent setting a screen size which is smaller than font size */
> +	for (i = first_fb_vc; i <= last_fb_vc; i++) {

Maybe a follow up patch to make this an interator? Kinda like what I've
done for fbcon_for_each_registered_fb, maybe call it fbcon_for_each_fb_vc
or so.

> +		vc = vc_cons[i].d;
> +		if (!vc || vc->vc_mode != KD_TEXT ||

I don't think it's good to filter for !KD_TEXT here, because then we'd
need to recheck fonts when Xorg would try to switch back to text mode, and
if that then fails we kinda broke the system.

I can't think of a use-case where you'd want to upload a font which breaks
your console that Xorg is using right now, so best to just drop this
check.

> +		    fbcon_info_from_console(i) != info)

So I think, but not 100% sure, that with my recent rework for
fbcon_info_from_console this should be impossible, since the races are
gone. I guess it doesn't hurt to cargo-cult this, but a follow up patch to
roll out fbcon_for_each_fb_vc and then delete this check from all of the
loop iterations would be really good to make this clear.

If you're not sure this is safe we could add this consistency check in a
if (WARN_ON(fbcon_info_from_console(i))!= info) continue; into the loop
iterator itself.

> +			continue;
> +
> +		if (FBCON_SWAP(var->rotate, var->xres, var->yres) < vc->vc_font.width ||
> +		    FBCON_SWAP(var->rotate, var->yres, var->xres) < vc->vc_font.height)

Bit a bikeshed, but please do the check the same way around as in the
other place. Maybe even extract a helper that you pass the vc and the var
struct too and it checks that it fits, and then use it here and in the
previous patch.

Cheers, Daniel

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
