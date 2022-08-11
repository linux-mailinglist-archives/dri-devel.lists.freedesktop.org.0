Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D358FB9D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 13:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51617AD7E1;
	Thu, 11 Aug 2022 11:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28B1AD78F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:49:49 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id h22so7790961qtu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 04:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=v7hLfcMomteQMGYnnnGVzBU2y9bVfdrurSUN+5SjKM8=;
 b=qK27SGUTKSuft3TZUjPr5k0c9XIlJAQiR8F9AQMrjHlGIil9Y7nOrzSlZrTvXdNtme
 W8dufO7XKP7umFeHa0svydJKgYPL/fe8sLPlSdthfE/kVfqklq/Nva1TO+KvrBJwH6AS
 z+9CsSy48L/5nFmopYxNiVfAzQyNfBVIvN5SY0tIZNXIQZbY5D8roLiWCQ3f7FqMd3ZH
 XKUxt/WuMKQz0fn2bNE13gSlZTLfkyif8e2ZMB+iaBp8V3kF3mcsWUru4JvBwvTN28dE
 6AD4JTseM9RwtWt2Qr5ttmSjJ/LLbszCuGNO5652JXKXthSNsHkUgQtxaVyqh7DFvaXY
 o54w==
X-Gm-Message-State: ACgBeo2jSLEX1j4JyFE4Cq+ucsNqNki+rG8HOTXGKazqfLn63+dMZkOr
 YGFzWtXN20O2YRFNopDQGXzqu//t29GZpPud
X-Google-Smtp-Source: AA6agR5UhMwr94G4+j/0Ej7FRCpycdHmelLyBptRSpOZRpXaQoeTgqXARjV1slOcCDQSzFbGgWjwjQ==
X-Received: by 2002:a05:622a:1707:b0:343:645e:333d with SMTP id
 h7-20020a05622a170700b00343645e333dmr2947041qtk.497.1660218588387; 
 Thu, 11 Aug 2022 04:49:48 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 bi34-20020a05620a31a200b006b9c9b7db8bsm953681qkb.82.2022.08.11.04.49.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 04:49:47 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-328303afa6eso169549107b3.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 04:49:46 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr31521818ywe.502.1660218586534; Thu, 11
 Aug 2022 04:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220811102304.70769-1-strochuk@ispras.ru>
In-Reply-To: <20220811102304.70769-1-strochuk@ispras.ru>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 13:49:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXRVHiBZj=MQ3jLy2AEnwrvMXt6KXbZXr10ZJMhJDAmsw@mail.gmail.com>
Message-ID: <CAMuHMdXRVHiBZj=MQ3jLy2AEnwrvMXt6KXbZXr10ZJMhJDAmsw@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: add virtual screen size check to
 drm_fb_helper_check_var()
To: Andrey Strachuk <strochuk@ispras.ru>
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
Cc: ldv-project@linuxtesting.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

On Thu, Aug 11, 2022 at 12:23 PM Andrey Strachuk <strochuk@ispras.ru> wrote:
> Add virtual screen size check to drm_fb_helper_check_var() in
> order to validate userspace input.
>
> Found by Linux Verification Center (linuxtesting.org) with syzkaller.
>
> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>

Thanks for your patch!

> Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")

This Fixes tag is misleading: the bug has existed since basically
forever.

> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1355,6 +1355,16 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
>             (drm_format_info_block_height(fb->format, 0) > 1))
>                 return -EINVAL;
>
> +       /* verify that virtual resolution >= physical resolution */
> +       if (var->xres_virtual < var->xres ||
> +           var->yres_virtual < var->yres) {
> +               drm_dbg_kms(dev, "requested virtual screen size that is "
> +                               "below the physical size(%ux%u vs. %ux%u)\n",
> +                       var->xres_virtual, var->yres_virtual,
> +                       var->xres, var->yres);
> +               return -EINVAL;

According to the fbdev rounding rules, invalid values should be rounded
up, if possible.  Hence it is better to not return an error, but round up:

    if (var->xres_virtual < var->xres)
            var->xres_virtual = var->xres;
    if (var->yres_virtual < var->yres)
            var->yres_virtual = var->yres;

> +       }
> +
>         /*
>          * Changes struct fb_var_screeninfo are currently not pushed back
>          * to KMS, hence fail if different settings are requested.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
