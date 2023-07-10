Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD38374CDFC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF110E1B0;
	Mon, 10 Jul 2023 07:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9981710E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 07:10:41 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-765a4ff26cdso378624285a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688973040; x=1691565040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NvmjpSWvN0CjEUDELfk+DsRk9SKm69LdatvFeM24C8=;
 b=W4qXgxGzPeMVsLKsYyIsalehqQfACzlkQK2njLNJGQa4oVm6kwVc+A5kwzl7EYcqZB
 qFOAf84jstlSm3WtHvYEPP6bgUqwuPDdy2iS/Gze1zKhdCxD94JrK1NyB9NW+x6zTdSa
 G/dVkWQYU5Nt+VhqDgOkp2jWjRaiul9hGYD9ho00fCqBPn9ih3x+RLTXYAttuoeqCIvd
 gu39WzGviQVAnLonva/zs8MsqfsqB+G/zvksp0BSQ1VHc2YSRn8RuF+Yo+XB+1thxrl3
 QDyleujblmOakA0dBepQU7KrG0tDZnCPBH42fbL2ZKUPdUNhy9mA04u24GRFhs22dGVq
 IDLQ==
X-Gm-Message-State: ABy/qLbRNhxhqoq3e8gl23MVPtVNQD2mFsB7px3Ug2JGyLbsWRo2hE7B
 44eTW0nXWD1SH64ptphsiAc2RCOHEZqc0A==
X-Google-Smtp-Source: APBJJlEWk4+PeLVTxmVgxyjLmmg0DiEy4QJZavySsMFajb1ujBoBOTJ2rqvelYStmcrOuOHW6NYbow==
X-Received: by 2002:a05:620a:2b05:b0:765:51a0:2df7 with SMTP id
 do5-20020a05620a2b0500b0076551a02df7mr10876461qkb.42.1688973039806; 
 Mon, 10 Jul 2023 00:10:39 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 s3-20020a05620a16a300b00767cbb11524sm1995614qkj.135.2023.07.10.00.10.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 00:10:39 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-40339da998eso33939621cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 00:10:39 -0700 (PDT)
X-Received: by 2002:ac8:7dc8:0:b0:403:aa35:ef8c with SMTP id
 c8-20020ac87dc8000000b00403aa35ef8cmr4637283qte.34.1688973039444; Mon, 10 Jul
 2023 00:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230704093652.18191-1-frank.li@vivo.com>
In-Reply-To: <20230704093652.18191-1-frank.li@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jul 2023 09:10:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrBY1+JDuwODyqLrwJJivt=ewCOKfK41xq+0Hpaf8akQ@mail.gmail.com>
Message-ID: <CAMuHMdWrBY1+JDuwODyqLrwJJivt=ewCOKfK41xq+0Hpaf8akQ@mail.gmail.com>
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

On Tue, Jul 4, 2023 at 11:38=E2=80=AFAM Yangtao Li <frank.li@vivo.com> wrot=
e:
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Thanks for your patch, which is now commit c1cd7a7a231a26c6 ("fbdev:
imxfb: Convert to devm_platform_ioremap_resource()") in fbdev/for-next

> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -868,7 +868,6 @@ static int imxfb_probe(struct platform_device *pdev)
>         struct imxfb_info *fbi;
>         struct lcd_device *lcd;
>         struct fb_info *info;
> -       struct resource *res;
>         struct imx_fb_videomode *m;
>         const struct of_device_id *of_id;
>         struct device_node *display_np;
> @@ -885,10 +884,6 @@ static int imxfb_probe(struct platform_device *pdev)
>         if (of_id)
>                 pdev->id_entry =3D of_id->data;
>
> -       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res)
> -               return -ENODEV;
> -
>         info =3D framebuffer_alloc(sizeof(struct imxfb_info), &pdev->dev)=
;
>         if (!info)
>                 return -ENOMEM;
> @@ -970,7 +965,7 @@ static int imxfb_probe(struct platform_device *pdev)
>                 goto failed_getclock;
>         }
>
> -       fbi->regs =3D devm_ioremap_resource(&pdev->dev, res);
> +       fbi->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(fbi->regs)) {
>                 ret =3D PTR_ERR(fbi->regs);
>                 goto failed_ioremap;
> @@ -1043,7 +1038,6 @@ static int imxfb_probe(struct platform_device *pdev=
)
>  failed_map:
>  failed_ioremap:
>  failed_getclock:
> -       release_mem_region(res->start, resource_size(res));

This part is not directly related, but a bug fix for commit
b083c22d51148f3d ("video: fbdev: imxfb: Convert request_mem_region +
ioremap to devm_ioremap_resource") in v6.0.

Please do not mix bug fixes with other changes.
The stable teams want to backport only bugfixes .

>  failed_of_parse:
>         kfree(info->pseudo_palette);
>  failed_init:
> --
> 2.39.0

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
