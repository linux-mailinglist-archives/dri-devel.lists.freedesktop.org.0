Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66355450985
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 17:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC96E110;
	Mon, 15 Nov 2021 16:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFEC6E110
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:20:50 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id d130so9476267vke.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHbFsAYOPumvboD3uCH/py8mrfSZqewFYFUyg3SH2X4=;
 b=IjYP7YhjFkSsowZQ1QkM3ibaBr0R4b6AmU2DPgyh9W1AqMQt4TIngv8gbedYmHGFb3
 sCdVOf4aUl944Koqr7BeO5cFMYBG0jY7gUul08xiG8KbZgFyf2w9HWrWcIiwaQ4rf0wS
 BUi4gGJgfecR4GEhf+v2wmW3xdZ1E9mHexNmoYLtV7STPzyFJtwkM+Leb3bkq2yJ8dBi
 5AUYL9DCMK6bisiV5IM+pFsKBxWTV1t1rW4JPseWOTqmV3xPNBgQbMQT60TMwYVeUEvS
 tb947N+xrFsnbywWhH34Wtn2tfXlv3Vi0Y0JhGM5CXVuSC9hHfS9cUI7fzbb+r/8RBv7
 dayA==
X-Gm-Message-State: AOAM532gPJiIK+qH4awjZSBFbbkHCeeeghhgJIthCSsmAmnGliv0mAEX
 q92Plb1fIoF/Nsu4XOq5+MJHB+LVfqkfrg==
X-Google-Smtp-Source: ABdhPJyBqYofwX2i6YnYZ7nZoMSdo8ey8J/ssT8VHO9xpUaxVZfwKEi6atX5UMN8fYaDBwCz3kxypQ==
X-Received: by 2002:a1f:18cb:: with SMTP id 194mr61018746vky.16.1636993247452; 
 Mon, 15 Nov 2021 08:20:47 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id y22sm9275995vsy.33.2021.11.15.08.20.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:20:47 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id o1so3171379uap.4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 08:20:46 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id
 l2mr44043532vst.37.1636993246647; 
 Mon, 15 Nov 2021 08:20:46 -0800 (PST)
MIME-Version: 1.0
References: <20211111111120.1344613-1-javierm@redhat.com>
In-Reply-To: <20211111111120.1344613-1-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Nov 2021 17:20:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
Message-ID: <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
To: Javier Martinez Canillas <javierm@redhat.com>
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
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Ilya Trukhanov <lahvuun@gmail.com>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Nov 11, 2021 at 12:13 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The efifb and simplefb drivers just render to a pre-allocated frame buffer
> and rely on the display hardware being initialized before the kernel boots.
>
> But if another driver already probed correctly and registered a fbdev, the
> generic drivers shouldn't be probed since an actual driver for the display
> hardware is already present.
>
> This is more likely to occur after commit d391c5827107 ("drivers/firmware:
> move x86 Generic System Framebuffers support") since the "efi-framebuffer"
> and "simple-framebuffer" platform devices are registered at a later time.
>
> Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
> Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
> Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>
> Changes in v2:
> - Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
> - Add a comment explaining why the probe fails earlier (Daniel Vetter).
> - Add a Fixes: tag for stable to pick the fix (Daniel Vetter).
> - Add Daniel Vetter's Reviewed-by: tag.
> - Improve the commit message and mention the culprit commit
>
>  drivers/video/fbdev/efifb.c    | 11 +++++++++++
>  drivers/video/fbdev/simplefb.c | 11 +++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git drivers/video/fbdev/efifb.c drivers/video/fbdev/efifb.c
> index edca3703b964..ea42ba6445b2 100644
> --- drivers/video/fbdev/efifb.c
> +++ drivers/video/fbdev/efifb.c
> @@ -351,6 +351,17 @@ static int efifb_probe(struct platform_device *dev)
>         char *option = NULL;
>         efi_memory_desc_t md;
>
> +       /*
> +        * Generic drivers must not be registered if a framebuffer exists.
> +        * If a native driver was probed, the display hardware was already
> +        * taken and attempting to use the system framebuffer is dangerous.
> +        */
> +       if (num_registered_fb > 0) {

Who says this registered fbdev is driving the same hardware as efifb?
This might be e.g. a small external display connected to i2c or spi.

> +               dev_err(&dev->dev,
> +                       "efifb: a framebuffer is already registered\n");
> +               return -EINVAL;
> +       }
> +
>         if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
>                 return -ENODEV;
>
> diff --git drivers/video/fbdev/simplefb.c drivers/video/fbdev/simplefb.c
> index 62f0ded70681..b63074fd892e 100644
> --- drivers/video/fbdev/simplefb.c
> +++ drivers/video/fbdev/simplefb.c
> @@ -407,6 +407,17 @@ static int simplefb_probe(struct platform_device *pdev)
>         struct simplefb_par *par;
>         struct resource *mem;
>
> +       /*
> +        * Generic drivers must not be registered if a framebuffer exists.
> +        * If a native driver was probed, the display hardware was already
> +        * taken and attempting to use the system framebuffer is dangerous.
> +        */
> +       if (num_registered_fb > 0) {

Likewise.

> +               dev_err(&pdev->dev,
> +                       "simplefb: a framebuffer is already registered\n");
> +               return -EINVAL;
> +       }
> +
>         if (fb_get_options("simplefb", NULL))
>                 return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
