Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7505074CEB1
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B319710E1FF;
	Mon, 10 Jul 2023 07:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521DE10E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:41:26 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-c5f98fc4237so3950686276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688974885; x=1691566885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CaG+dxGLhC0WVqrix8l2g6lvQOz/XURDuBAw1AOu2T0=;
 b=bPosFawnW641/4TT+s0xh1bUYY2Y9BCL9RS8wUHEbWzIa3J4eOUg5wLPffijVs3Bvg
 3zfnxsB3ehejMKnDErgV3EpUFTg1nOoTyrI8r0T13i4klUM+KPtavu+8+x9ytmxNvYDq
 vTEIYF3iaQLR2DRCVcJJ29oUS+sbcb9Y8sePvr41+02L5zHNLUbxuscjJqT6WPXC93zL
 1OFXA4PWp3W1NEhj5okg5cmCQQqCgxjlJ2FLQCvKz3KD9NvadyutIyobzDVw8Akpbal1
 46aGmoWhrHmkMrC4NU7eFt/27l0az/EoyD8OKyyLn/jL2DbVNCiQG8Hkdbw5bYOx8UWu
 3big==
X-Gm-Message-State: ABy/qLaYev33VAEYZ+BbMdNiuT3oQ3UCOpU+5wNwTK29wXmcHS27VYYh
 RqzWVvEJnl1zA3NUT8zogvXCTF9iOJ0Iyw==
X-Google-Smtp-Source: APBJJlGS2Cogw2BswkpCg436rOZKwk/VgocfOsmLfKhxxmSRatB7mAUsuwdOvW6CuBPij4QxbpYnwQ==
X-Received: by 2002:a25:e7d2:0:b0:c42:2b05:17a6 with SMTP id
 e201-20020a25e7d2000000b00c422b0517a6mr11310766ybh.5.1688974884964; 
 Mon, 10 Jul 2023 00:41:24 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 u91-20020a25ab64000000b00be8e8772025sm2525631ybi.45.2023.07.10.00.41.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 00:41:24 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-c5cf26e9669so3968038276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:41:24 -0700 (PDT)
X-Received: by 2002:a25:4c07:0:b0:bc6:5d71:f820 with SMTP id
 z7-20020a254c07000000b00bc65d71f820mr10395845yba.55.1688974884151; Mon, 10
 Jul 2023 00:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230704093652.18191-1-frank.li@vivo.com>
 <CAMuHMdWrBY1+JDuwODyqLrwJJivt=ewCOKfK41xq+0Hpaf8akQ@mail.gmail.com>
 <da543602-f88e-45ee-d7fd-8fddd0b0ac56@vivo.com>
In-Reply-To: <da543602-f88e-45ee-d7fd-8fddd0b0ac56@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 09:41:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVa3RmtFouTYk_rPoxO1EswGzTtt855-eFcvtTYObgUCA@mail.gmail.com>
Message-ID: <CAMuHMdVa3RmtFouTYk_rPoxO1EswGzTtt855-eFcvtTYObgUCA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: imxfb: Convert to devm_platform_ioremap_resource()
To: Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Helge Deller <deller@gmx.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yangtao,

On Mon, Jul 10, 2023 at 9:25=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:
> On 2023/7/10 15:10, Geert Uytterhoeven wrote:
> > [=E4=BD=A0=E9=80=9A=E5=B8=B8=E4=B8=8D=E4=BC=9A=E6=94=B6=E5=88=B0=E6=9D=
=A5=E8=87=AA geert@linux-m68k.org =E7=9A=84=E7=94=B5=E5=AD=90=E9=82=AE=E4=
=BB=B6=E3=80=82=E8=AF=B7=E8=AE=BF=E9=97=AE https://aka.ms/LearnAboutSenderI=
dentification=EF=BC=8C=E4=BB=A5=E4=BA=86=E8=A7=A3=E8=BF=99=E4=B8=80=E7=82=
=B9=E4=B8=BA=E4=BB=80=E4=B9=88=E5=BE=88=E9=87=8D=E8=A6=81]
> > On Tue, Jul 4, 2023 at 11:38=E2=80=AFAM Yangtao Li <frank.li@vivo.com> =
wrote:
> >> Use devm_platform_ioremap_resource() to simplify code.
> >>
> >> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > Thanks for your patch, which is now commit c1cd7a7a231a26c6 ("fbdev:
> > imxfb: Convert to devm_platform_ioremap_resource()") in fbdev/for-next
> >
> >> --- a/drivers/video/fbdev/imxfb.c
> >> +++ b/drivers/video/fbdev/imxfb.c
> >> @@ -868,7 +868,6 @@ static int imxfb_probe(struct platform_device *pde=
v)
> >>          struct imxfb_info *fbi;
> >>          struct lcd_device *lcd;
> >>          struct fb_info *info;
> >> -       struct resource *res;
> >>          struct imx_fb_videomode *m;
> >>          const struct of_device_id *of_id;
> >>          struct device_node *display_np;
> >> @@ -885,10 +884,6 @@ static int imxfb_probe(struct platform_device *pd=
ev)
> >>          if (of_id)
> >>                  pdev->id_entry =3D of_id->data;
> >>
> >> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >> -       if (!res)
> >> -               return -ENODEV;
> >> -
> >>          info =3D framebuffer_alloc(sizeof(struct imxfb_info), &pdev->=
dev);
> >>          if (!info)
> >>                  return -ENOMEM;
> >> @@ -970,7 +965,7 @@ static int imxfb_probe(struct platform_device *pde=
v)
> >>                  goto failed_getclock;
> >>          }
> >>
> >> -       fbi->regs =3D devm_ioremap_resource(&pdev->dev, res);
> >> +       fbi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> >>          if (IS_ERR(fbi->regs)) {
> >>                  ret =3D PTR_ERR(fbi->regs);
> >>                  goto failed_ioremap;
> >> @@ -1043,7 +1038,6 @@ static int imxfb_probe(struct platform_device *p=
dev)
> >>   failed_map:
> >>   failed_ioremap:
> >>   failed_getclock:
> >> -       release_mem_region(res->start, resource_size(res));
> > This part is not directly related, but a bug fix for commit
> > b083c22d51148f3d ("video: fbdev: imxfb: Convert request_mem_region +
> > ioremap to devm_ioremap_resource") in v6.0.
>
>
> IIUC, split this patch into two, remove release_mem_region in one and
>
> mark it as Fixes: b083c22d51148f3d ("video: fbdev: imxfb: Convert
> request_mem_region +
>
> ioremap to devm_ioremap_resource")?

Exactly.  But as Helge has already applied this patch to his tree, we have
to check with him if this is still feasible...

> > Please do not mix bug fixes with other changes.
> > The stable teams want to backport only bugfixes .
> >
> >>   failed_of_parse:
> >>          kfree(info->pseudo_palette);
> >>   failed_init:

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
