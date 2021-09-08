Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8458403F09
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 20:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F46E284;
	Wed,  8 Sep 2021 18:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CA66E245
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 18:24:24 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id i21so6039232ejd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6YQf0LzMzDwl0thE2OxrIFBFcIVXolCjmteViOUvIHc=;
 b=I/8KFcpmBq8BBO9BUUnbV+EL5LBAw9r8Q5pidzYGWtVv5EKvGGvXiY/ly4ZN04B4Xg
 99RgSP3S9XBtIqiEe7QX1g9lpyDNSQkGB3SOtC5wbE6PCMvpz0z2dAHZRgWcELHrRPyz
 VoVwZdG84PnGR91PcdyecufLiMeCsKw4ZATEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6YQf0LzMzDwl0thE2OxrIFBFcIVXolCjmteViOUvIHc=;
 b=sTC+T3YKYiyg9pr6yo3NfgmCB1JUJDI1eI04XJRAt7sA6d2ZnChgRUPkjxiEPzJoR6
 ZynDcR+7/7UxY6UuzIWGX+h3e9pTratyd9DyW6oV8dH91g8zVXNbEYIvRtZ4KFoXWRk2
 aQd1s4D3zJe6eh4CeFck8IogZlO9KmZ1/Por09hxfyUJ8jB3gifFV9akPx9xBUA3Kysg
 zoUACieRhrfp3hX9XskWxcyxzKaGNaD6E/0jFsvUqQ21g5REajrt/Lq8svYO+/YlKMR1
 /W8MbKa2RcIlVnIBUdlKuh8jIfJpC5vpUaEL7BbuyHbHa+VXrfeWwrOjPxRK+uSWYsjk
 WwUQ==
X-Gm-Message-State: AOAM531Lz/pQouJNA1YwingyB9zvgwGofpuWjCMW7cw/hkfChgRQTvr+
 T/IOkQ/cgI36k6ivnDNPuy/o9Q==
X-Google-Smtp-Source: ABdhPJzMe5dIhBSqG+GqeTC5omIWPqACEQMQH1kGeaqosqC3rds020HoIYe89zQl8y7HybugGN7VlQ==
X-Received: by 2002:a17:906:c05a:: with SMTP id
 bm26mr1263139ejb.498.1631125463325; 
 Wed, 08 Sep 2021 11:24:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h25sm1416596eji.108.2021.09.08.11.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 11:24:22 -0700 (PDT)
Date: Wed, 8 Sep 2021 20:24:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
Message-ID: <YTj/1EIdhQ3245VW@phenom.ffwll.local>
References: <20210907024900.873850-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907024900.873850-1-marex@denx.de>
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

On Tue, Sep 07, 2021 at 04:49:00AM +0200, Marek Vasut wrote:
> The mxsfb->crtc.funcs may already be NULL when unloading the driver,
> in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
> mxsfb_unload() leads to NULL pointer dereference.
> 
> Since all we care about is masking the IRQ and mxsfb->base is still
> valid, just use that to clear and mask the IRQ.
> 
> Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Abrecht <public@danielabrecht.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

You probably want a drm_atomic_helper_shutdown instead of trying to do all
that manually. We've also added a bunch more devm and drmm_ functions to
automate the cleanup a lot more here, e.g. your drm_mode_config_cleanup is
in the wrong place.

Also I'm confused because I'm not even seeing this function anywhere in
upstream.
-Daniel

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index ec0432fe1bdf8..86d78634a9799 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -173,7 +173,11 @@ static void mxsfb_irq_disable(struct drm_device *drm)
>  	struct mxsfb_drm_private *mxsfb = drm->dev_private;
>  
>  	mxsfb_enable_axi_clk(mxsfb);
> -	mxsfb->crtc.funcs->disable_vblank(&mxsfb->crtc);
> +
> +	/* Disable and clear VBLANK IRQ */
> +	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> +	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
> +
>  	mxsfb_disable_axi_clk(mxsfb);
>  }
>  
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
