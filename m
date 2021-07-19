Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C523CCF1D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 10:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A3689C6B;
	Mon, 19 Jul 2021 08:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D556A89C6B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 08:06:41 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id 109so6489361uar.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 01:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8I5GR8j5EB13OmhGDxaQ/eMHgskRO2Z8XPEh2y9oGGs=;
 b=QGShBcFAyJowtsWBb3OIEnJzB2xkeBcozH4Aj6Wh+9IVeyPiqIvlMTUUZFRIVBK4c6
 Vjn/XkE14fTjESX7S3IfKZ0BrFpBWf5Wtv0Y2ImsiM0IqprXqsro9bO0pYF/RfS25PW9
 lYHy3Yor32r/oBpk18lyJwDmYW8hx12PZTfpXM8xfS/P6sPIW1oFJGQfquya7AypEar7
 ua0T8jhfT96dztDHwZpkXxzvm4uUZxm2W0W1a1EXGDFZgLBDxCVm2IGD0kOYqIlGjpTG
 GpFuGItuewP+gkblldSpEgqRDfz5aJ9hVzisWxuAXFRD87XYx8Rtr7vdnREtOKql8g/p
 zQQA==
X-Gm-Message-State: AOAM533/ipWSXfHLYy1Nz6WPiOxKezJP9/egMVF+ueDcQp8rq/d2kFiN
 Q4bntjbYDPevSWOVBhmZ2E1dQ0sd/OU5BK0938U=
X-Google-Smtp-Source: ABdhPJxEfdNR8WTLBETJ8aBjqwssc4hSfq24N1pgWQfVOrc0KFFptPwJOXDTHaVHfXQK6vdKb7jXURZfe/QBqX3k8nc=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr1934879uam.106.1626682001086; 
 Mon, 19 Jul 2021 01:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210719023327.17039-1-rdunlap@infradead.org>
In-Reply-To: <20210719023327.17039-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jul 2021 10:06:29 +0200
Message-ID: <CAMuHMdUtTzgnP4GR5phFcVnFVCrU1J87sner-XN6Koc_eZ7Zhg@mail.gmail.com>
Subject: Re: [PATCH] fbdev: simplefb: limit its use to DRM_SIMPLEDRM=n
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kernel test robot <lkp@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Randy,

On Mon, Jul 19, 2021 at 4:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> When DRM_SIMPLEDRM=m, all of FB_CFB_{FILLRECT,COPYAREA,IMAGEBLIT} are =m,

Why does that happen?
FB_SIMPLE does select FB_CFB_*, so all of the latter should be builtin?
Do I need my morning coffee? I'm about to fetch it...

> causing undefined references in fbdev/simplefb.o.
>
> By restricting FB_SIMPLEFB to be set only when DRM_SIMPLEDRM is not set,
> the FB_CFB_* symbols are =y and the build completes without these
> undefined references.
>
> IOW, really "disable simplefb if simpledrm has been selected".

That does make sense, regardless of my question above ;-)

> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x2c): undefined reference to `cfb_fillrect'
> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x30): undefined reference to `cfb_copyarea'
> or1k-linux-ld: drivers/video/fbdev/simplefb.o:(.rodata+0x34): undefined reference to `cfb_imageblit'
>
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

> --- linux-next-20210716.orig/drivers/video/fbdev/Kconfig
> +++ linux-next-20210716/drivers/video/fbdev/Kconfig
> @@ -2192,7 +2192,7 @@ config FB_HYPERV
>
>  config FB_SIMPLE
>         bool "Simple framebuffer support"
> -       depends on (FB = y) && !DRM_SIMPLEDRM
> +       depends on (FB = y) && DRM_SIMPLEDRM=n
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
