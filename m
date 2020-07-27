Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326E22E8BB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 11:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB6689CAA;
	Mon, 27 Jul 2020 09:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7599289CAA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 09:20:25 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k4so13770660oik.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ze/MoCbETUHY1tIm6rqksHcbC6SBzkrtiAzmLadrn00=;
 b=NL0OFsBHhGWGcd1mNRfTBckhsvps42NPsLimof6GLXN3uBLkNeFgQgTvrvX0uHM0vR
 SPzRiywLVTS81mOB+3v3wZijqaLk8MR7WZ5BDq+FOl7eWvqHA4yRpnK5QWGNhk7eFBhd
 x0HICk4mVpooQw2NIkjjjIDUdfzrjjM5fsX8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ze/MoCbETUHY1tIm6rqksHcbC6SBzkrtiAzmLadrn00=;
 b=A/qkUEJeRZjob2M+iVPmwC9OrSSukB+qtKAB80V6sNm+7Mw1vCy7Heyf2G5dagwH63
 JUhTNNWukgxv9rtAQ/PcLU+vglkP1CwAQXa0YpOcIxvCrJQt8LeT6r2X8KzXxWo5RgVL
 XZ0ehW/hV3djgGyA8GQ1RfgN7OzP+T0Za+d9b38soWN9S6jtnEk8fw56NX95/7OBaJUh
 ZVgRCoybMnwFgokBkQ8DyAPdx1eoqR86XMAqQMkWbeiHCpm8kNf5DKgqo2P8w/0kiM31
 M7n0ubNl5/6Tm3Vo1LFeLUOCkW/xTO7gx9n9pD55ohNENv/wNcYP2wxHOBLrfPSvGw96
 HjUw==
X-Gm-Message-State: AOAM530MTYHcqH96DBcU8VOUIf513ScG0HV5ZYWfr9Zvb5b2oyMd3FMc
 JN4Y/lh3DR+Ly9D1pYiZ8BehW+I26LSh/grez4fJjQ==
X-Google-Smtp-Source: ABdhPJx9Y9EOWgEPPXW368Y6gvOu5Mphnv5mkiMrULaBWzKQxDRttrw+Pnu75WzI8852epdshcOd/hF5Hiz/2MkGIfk=
X-Received: by 2002:aca:ab87:: with SMTP id u129mr526426oie.128.1595841624572; 
 Mon, 27 Jul 2020 02:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200725191012.GA434957@ravnborg.org>
In-Reply-To: <20200725191012.GA434957@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 27 Jul 2020 11:20:13 +0200
Message-ID: <CAKMK7uFAjUTmsPJY7YW5_N34DS8XMvboDcxo6EwiQ2XRSqK_hQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/drm_fb_helper: fix fbdev with sparc64
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 25, 2020 at 9:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> From 1323a7433691aee112a9b2df8041b5024895a77e Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Thu, 9 Jul 2020 21:30:16 +0200
> Subject: [PATCH v2 1/1] drm/drm_fb_helper: fix fbdev with sparc64
>
> Recent kernels have been reported to panic using the bochs_drm framebuffer under
> qemu-system-sparc64 which was bisected to commit 7a0483ac4ffc "drm/bochs: switch to
> generic drm fbdev emulation". The backtrace indicates that the shadow framebuffer
> copy in drm_fb_helper_dirty_blit_real() is trying to access the real framebuffer
> using a virtual address rather than use an IO access typically implemented using a
> physical (ASI_PHYS) access on SPARC.
>
> The fix is to replace the memcpy with memcpy_toio() from io.h.
>
> memcpy_toio() uses writeb() where the original fbdev code
> used sbus_memcpy_toio(). The latter uses sbus_writeb().
>
> The difference between writeb() and sbus_memcpy_toio() is
> that writeb() writes bytes in little-endian, where sbus_writeb() writes
> bytes in big-endian. As endian does not matter for byte writes they are
> the same. So we can safely use memcpy_toio() here.
>
> For many architectures memcpy_toio() is a simple memcpy().
> One side-effect that is unknown is if this has any impact on other
> architectures.
> So far the analysis tells that this change is OK for other arch's.
> but testing would be good.

The rules are that officially we have to use the io functions for
__mmio pointers. We just drop these sparse annotations on the floor.
I'd replace this with something like:

"Note that this only fixes bochs, in general fbdev helpers still have
issues with mixing up system memory and mmio space. Fixing that will
require a lot more work."

> v2:
>   - Added missing __iomem cast (kernel test robot)
>   - Made changelog readable and fix typos (Mark)
>   - Add flag to select iomem - and set it in the bochs driver
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reported-by: kernel test robot <lkp@intel.com>
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Link: https://patchwork.freedesktop.org/patch/msgid/20200709193016.291267-1-sam@ravnborg.org
> ---
>
> This fix introducing a flag in mode_config is at best a band-aid
> solution until we have a proper fix.
> We need to propagate the info about iomem so it is not a driver flag
> thing.
>
> There is also the issue with sys* versus cfb* functions, where cfb*
> functions are used for iomem.
> I did not manage to make the bochs driver work with the cfb* functions,
> for some unknown reason booting would be stuck waiting for the console
> mutex when usign the cfb* functions.
>
> I consider this fix OK to get the kernel working for sparc64 with the
> bochs driver for now. And with the fbdev_uses_iomem flag no other
> drivers will see any changes.
>
>         Sam
>
>  drivers/gpu/drm/bochs/bochs_kms.c | 1 +
>  drivers/gpu/drm/drm_fb_helper.c   | 6 +++++-
>  include/drm/drm_mode_config.h     | 9 +++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 05d8373888e8..079f46f5cdb6 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -146,6 +146,7 @@ int bochs_kms_init(struct bochs_device *bochs)
>         bochs->dev->mode_config.preferred_depth = 24;
>         bochs->dev->mode_config.prefer_shadow = 0;
>         bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> +       bochs->dev->mode_config.fbdev_use_iomem = true;
>         bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>
>         bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 5609e164805f..89cfd68ef400 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -399,7 +399,11 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>         unsigned int y;
>
>         for (y = clip->y1; y < clip->y2; y++) {
> -               memcpy(dst, src, len);
> +               if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> +                       memcpy(dst, src, len);
> +               else
> +                       memcpy_toio((void __iomem *)dst, src, len);
> +
>                 src += fb->pitches[0];
>                 dst += fb->pitches[0];
>         }
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 6c3ef49b46b3..c24c066bdd9c 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -865,6 +865,15 @@ struct drm_mode_config {
>          */
>         bool prefer_shadow_fbdev;
>
> +       /**
> +        * @fbdev_use_iomem:
> +        *
> +        * Set to true if framebuffer reside in iomem.
> +        * When set to true memcpy_toio() is used when copying the framebuffer in
> +        * drm_fb_helper.drm_fb_helper_dirty_blit_real()

I'd add a "FIXME: This should be replaced with a per-mapping is_iomem
flag (like ttm does), and then used everywhere in fbdev code."

With those two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +        */
> +       bool fbdev_use_iomem;
> +
>         /**
>          * @quirk_addfb_prefer_xbgr_30bpp:
>          *
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
