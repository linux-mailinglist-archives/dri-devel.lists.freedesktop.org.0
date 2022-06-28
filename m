Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A2955BF79
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7513D12A80A;
	Tue, 28 Jun 2022 08:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FF412A804
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:36:33 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id i17so18903736qvo.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYku9rjKrdtonQ7P4m2anxgeztiebT4+0Jpg1WxM5fM=;
 b=tBEPlT32Or2wPspbMqs2yD7FavDEOSGRbudYZrJvjM5NUoM9sub5+oC4n7FzJYJWoy
 6mmmX85hnazGmMcK6fTckBEli3VR3/r27MYyNIHbfzn9VCDhQT1QtdDuqOEc1XDbLhdL
 skZ7ZXwFMTC77b4zw/Lw2pTglXzjabkGKT2X+zP3iGKjlM8iAEQk4vx3Woba+AsCMtid
 gmkI3y4cq2ts4YVkoNaBPItV5UgWCb3zdG4UFw7vgBbBiOItTok97Ar+yRD3AayYHvhe
 LAJnDl4ZBYhh9p2K4/LruMM0nvMmUCz0Or06P6W3wa4wEy0ewWvGkU7oFkZ/RjAnE2hr
 JE9A==
X-Gm-Message-State: AJIora8d7ypoapd1/C74u57kiUFC9cWoFT5/4GC39Wj06smSD1XwD8B/
 u0WfIIb0T33cru4a3DWA8zLX7r/ybfqK+Q==
X-Google-Smtp-Source: AGRyM1vKjkPlNHb+A8IwHvhJAmDxz2KLeNYAtxqxMOHWOyDe+tOxnB2Myz0riRsDBttVQaUXvfCcPw==
X-Received: by 2002:ac8:5b51:0:b0:317:3513:cf60 with SMTP id
 n17-20020ac85b51000000b003173513cf60mr12300349qtw.495.1656405392221; 
 Tue, 28 Jun 2022 01:36:32 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com.
 [209.85.128.174]) by smtp.gmail.com with ESMTPSA id
 hj5-20020a05622a620500b00304fe5247bfsm8341334qtb.36.2022.06.28.01.36.31
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 01:36:31 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-2ef5380669cso109071387b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:36:31 -0700 (PDT)
X-Received: by 2002:a81:9bcc:0:b0:317:9ff1:5a39 with SMTP id
 s195-20020a819bcc000000b003179ff15a39mr20769784ywg.384.1656405391417; Tue, 28
 Jun 2022 01:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220626102853.124108-1-deller@gmx.de>
 <20220626102853.124108-3-deller@gmx.de>
In-Reply-To: <20220626102853.124108-3-deller@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Jun 2022 10:36:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9atrvjFamenRY8UOVZSS2a+Gxsxxo+WfuCpBfuV+n2A@mail.gmail.com>
Message-ID: <CAMuHMdV9atrvjFamenRY8UOVZSS2a+Gxsxxo+WfuCpBfuV+n2A@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] fbmem: Prevent invalid virtual screen sizes
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

On Sun, Jun 26, 2022 at 12:32 PM Helge Deller <deller@gmx.de> wrote:
> Prevent that drivers or the user sets the virtual screen resolution
> smaller than the physical screen resolution.  This is important, because
> otherwise we may access memory outside of the graphics memory area.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: stable@vger.kernel.org # v5.4+

Thanks for your patch, which is now commit fe04405ce5de13a5 ("fbmem:
Prevent invalid virtual screen sizes") in fbdev/for-next.

> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (var->xres < 8 || var->yres < 8)
>                 return -EINVAL;
>
> +       /* make sure virtual resolution >= physical resolution */
> +       if (var->xres_virtual < var->xres)
> +               return -EINVAL;
> +       if (var->yres_virtual < var->yres)
> +               return -EINVAL;

This breaks valid use cases (e.g. "fbset -xres <larger-value-than-before>") ,
as the FBIOPUT_VSCREENINFO rule is to round up invalid values,
if possible.

Individual drivers may not follow that rule, so you could indeed end up
with a virtual resolution here if such a driver fails to sanitize var.
So either you have to move this after the call to fbops.fb_check_var()
below, and/or change the code to enlarge virtual resolution to match
physical resolution (at the risk of introducing another regression
with an obscure driver?).

So I'd go for moving it below.  And perhaps add a WARN(), as this
is a driver bug?

> +
>         /* Too huge resolution causes multiplication overflow. */
>         if (check_mul_overflow(var->xres, var->yres, &unused) ||
>             check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))

Note that doing the multiplication overflow check before calling
fbops.fb_check_var() is fine, as too large values can never be
rounded up to a valid value.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
