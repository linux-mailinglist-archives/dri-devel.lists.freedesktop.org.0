Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9757CE0D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126BE10EC80;
	Thu, 21 Jul 2022 14:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4840410EC80
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:46:32 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id b25so1417371qka.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uRb/kpCM2Tp3RADIUm8HgY748KiyFCtoEV6JEoibXAk=;
 b=dnjcdtGrCSQZSVe59Fr8WsiTwpHtbsDpQeFIYkrQcxHqBAbFeP11ivJKUdGsu32p8c
 urbrQrF0LvOsQyJzDWVhKTkL9bjTM8IdPeeygRu+LVxQN6OH3h5PFR9RGcfT26vJRAdW
 43jcdLiZ12OcTl1i0Qh4GfLDI4I15xOnSEcrkynR2cfScGSdTkYpGLVDyX1j0Bl+ae/M
 yhVjH5JK5Oe6mnFUn+qj38BrqEq+GyVBUYcsOm1INYXu9/NoF50RJN4qjgkrUIop2wwf
 T1uf/mSdRekh/6jfHD70ENID+dngpp0Z6Li5Zy+wU1EJRgIq37iAUfouMTjVdYVL50D4
 SABA==
X-Gm-Message-State: AJIora9p9kepmnPKyW8wc55ispmC+x9Udl+7KvPWpbTdf1JzC3wJYGwx
 +YHPDL8PpA70qbFI7oLXTjj/Vd6YGCX51g==
X-Google-Smtp-Source: AGRyM1tPbExPHvGR2f88ty0LYny7aoFNX6xfmN8TtDtke7UxP0V3DOpPAjrsHmxf5qOyF8k9vaOtaw==
X-Received: by 2002:a37:dc46:0:b0:6af:59e6:cd72 with SMTP id
 v67-20020a37dc46000000b006af59e6cd72mr28499528qki.78.1658414791091; 
 Thu, 21 Jul 2022 07:46:31 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 i67-20020a375446000000b006a6a6f148e6sm1573013qkb.17.2022.07.21.07.46.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:46:30 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 64so3097686ybt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:46:29 -0700 (PDT)
X-Received: by 2002:a05:6902:154f:b0:66e:e2d3:ce1 with SMTP id
 r15-20020a056902154f00b0066ee2d30ce1mr38429480ybu.365.1658414789102; Thu, 21
 Jul 2022 07:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
In-Reply-To: <20220720142732.32041-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Jul 2022 16:46:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
Message-ID: <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
To: Thomas Zimmermann <tzimmermann@suse.de>
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
 David Airlie <airlied@linux.ie>, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>, Maxime Ripard <maxime@cerno.tech>,
 Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Jul 20, 2022 at 4:27 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Compute the framebuffer's scanline stride length if not given by
> the simplefb data.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -743,6 +743,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>                 drm_err(dev, "no simplefb configuration found\n");
>                 return ERR_PTR(-ENODEV);
>         }
> +       if (!stride)
> +               stride = format->cpp[0] * width;

DIV_ROUND_UP(drm_format_info_bpp(format) * width, 8)

> +
>         sdev->mode = simpledrm_mode(width, height);
>         sdev->format = format;
>         sdev->pitch = stride;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
