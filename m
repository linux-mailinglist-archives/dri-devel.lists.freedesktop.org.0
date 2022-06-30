Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F55622B0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE71312A8B9;
	Thu, 30 Jun 2022 19:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFDC12A8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:11:52 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id b24so14415306qkn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=USQBZQ6SgoV5Ne4yk1LghTNS4+/aHcnJLY2+ToZRaBI=;
 b=WwCka/sr6xVBtTZSuWvDhUGPh8V3sVGlZZINW9dGS5FCgXZoHFxolwspYo4f9Nx8Y8
 njdelLWQpjlwyjPrQZc61YSE/B+mr47aDgIwEFFAcGD/Vz9Zf6t6EeMWNvS7jWM55aaN
 ptcf9ebsnU40l9WDqpt2JcW3iD5sXa8LcuOW0MyYBejCNLl8g3WzULm96Yy2mcwmRHRZ
 2TtzTXONiOpaIxruVhFUwro87cnmThDf1rWkaGGhK7vk33pUH7wjbpYR4F8EfhY/o4nK
 oDCjpp6G6WK/tPss2NfObrb7IJzoGvwJcXaYhIZaW7sloG89iVVTB7WByqqgZcAbOvMs
 x37Q==
X-Gm-Message-State: AJIora/skogfaldYE1P4GB9iKAxebLAdF81BIrROh4jc0953lAoKCSHj
 srUgC1kA3eegCRP6gak9+CHdFmgl+Uhcwg==
X-Google-Smtp-Source: AGRyM1uBJgwyJBb8S4ilaijEqw333aL+IkbVxDqj4aWB4zeIjECdSbRZFQSGOK2rBqNVMH6+5Zbysg==
X-Received: by 2002:a05:620a:8015:b0:6af:21a7:8aaf with SMTP id
 ee21-20020a05620a801500b006af21a78aafmr7941164qkb.333.1656616311778; 
 Thu, 30 Jun 2022 12:11:51 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05622a059300b00304edcfa109sm14247947qtb.33.2022.06.30.12.11.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:11:51 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3177f4ce3e2so2837887b3.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:11:51 -0700 (PDT)
X-Received: by 2002:a81:4fc9:0:b0:318:b0ca:4b13 with SMTP id
 d192-20020a814fc9000000b00318b0ca4b13mr12621013ywb.502.1656616310970; Thu, 30
 Jun 2022 12:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-5-deller@gmx.de>
In-Reply-To: <20220629200024.187187-5-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:11:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
Message-ID: <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
Subject: Re: [PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
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

On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> Prevent that drivers configure a virtual screen resolution smaller than
> the physical screen resolution.  This is important, because otherwise we
> may access memory outside of the graphics memory area.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch!

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (var->xres < 8 || var->yres < 8)
>                 return -EINVAL;
>
> +       /* make sure virtual resolution >= physical resolution */
> +       if (WARN_ON(var->xres_virtual < var->xres))
> +               var->xres_virtual = var->xres;
> +       if (WARN_ON(var->yres_virtual < var->yres))
> +               var->yres_virtual = var->yres;

This should be moved below the call to info->fbops->fb_check_var(),
so the WARN_ON() catches buggy fbdev drivers, not userspace fuzzers.

> +
>         /* Too huge resolution causes multiplication overflow. */
>         if (check_mul_overflow(var->xres, var->yres, &unused) ||
>             check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
