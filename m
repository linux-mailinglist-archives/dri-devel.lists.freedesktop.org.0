Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA330565AE8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5153310E6A4;
	Mon,  4 Jul 2022 16:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF8D10E02B
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 08:55:48 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id z12so4849255qki.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 01:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1CjjNvKlUa9yj4QK1c9nMHcGVsSqE36Ijq7FI5N7FU=;
 b=dz3QPAm35XMednS/gauXj7paVfzs6tQPUwTfS1jrZ9lB09P8nrxb94lLo3vxHLIDnt
 byI77r5J0Izp/aQKdro54oEnXzLAJIDJp8UA4Zec/zu5FSrmFLnjuyOoW6DtRa3XD7Yf
 c9CoiSLV4Z9NzJ1KDQHHmCItRVljfOuefgo5i+ykNcGF/LuMXoZeNafz+t50YLIYoiIG
 Sj25plvtrKu0sY2EuU819RclfHZy8tjBCApIhdxJeH4NxbrrYjmG8ZWxGd9oVlwlfTXM
 uIGwHfnEbywCYI2gjuE1Igqjh12HN908B9kwo4z1RBc/AG2YrMkLoreEjrfRL4KBDzFU
 5fZA==
X-Gm-Message-State: AJIora/i3Qpq/QqgdxTPqKv01LT9SRcyeXzWsBRo3P8/OJu5KPNK7C0t
 PIMP3VLs+vtG1C6GsF1rOlxzzF6mAGn9Ng==
X-Google-Smtp-Source: AGRyM1vm2dPRJluAOudA14XNZrL1HNvT2u9j0QUtdzKLczKim/xwxlUmcItPpg8cT3QrvIjVik2EZw==
X-Received: by 2002:a05:620a:800c:b0:6ae:f72b:cf2f with SMTP id
 ee12-20020a05620a800c00b006aef72bcf2fmr16551259qkb.102.1656838547666; 
 Sun, 03 Jul 2022 01:55:47 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 bz19-20020a05622a1e9300b0031bba2e05aesm11702468qtb.58.2022.07.03.01.55.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 01:55:47 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-317a66d62dfso57822267b3.7
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 01:55:47 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr26487626ywd.283.1656838547025; Sun, 03
 Jul 2022 01:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220701202352.559808-1-deller@gmx.de>
 <20220701202352.559808-4-deller@gmx.de>
In-Reply-To: <20220701202352.559808-4-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Jul 2022 10:55:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
Message-ID: <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
To: Helge Deller <deller@gmx.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Fri, Jul 1, 2022 at 10:23 PM Helge Deller <deller@gmx.de> wrote:
> Prevent that drivers configure a virtual screen resolution smaller than
> the physical screen resolution.  This is important, because otherwise we
> may access memory outside of the graphics memory area.
>
> Give a kernel WARNing and show the driver name to help locating the buggy
> driver.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (ret)
>                 return ret;
>
> +       /* make sure virtual resolution >= physical resolution */
> +       if (WARN_ON(var->xres_virtual < var->xres)) {

WARN_ON_ONCE()?
This does mean we would miss two or more buggy drivers in a single system.

> +               pr_warn("fbcon: Fix up invalid xres %d for %s\n",

xres_virtual?

> +                       var->xres_virtual, info->fix.id);
> +               var->xres_virtual = var->xres;

I think it's better to not fix this up, but return -EINVAL instead.
After all if we get here, we have a buggy driver that needs to be fixed.

> +       }
> +       if (WARN_ON(var->yres_virtual < var->yres)) {
> +               pr_warn("fbcon: Fix up invalid yres %d for %s\n",
> +                       var->yres_virtual, info->fix.id);
> +               var->yres_virtual = var->yres;
> +       }

Same for yres.

> +
>         if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
>                 return 0;
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
