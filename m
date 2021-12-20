Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4F47A60A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 09:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23A111217E;
	Mon, 20 Dec 2021 08:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F58111217A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 08:30:09 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id o63so4019944uao.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 00:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMAO1VGZAlbtYZ79yXzZbE6uNLUuolj3od2YVWnGiLQ=;
 b=N7ppuP2XwSN+0t2RazVcAEYF90C/S/+lkm//isOJNbmZP8fO+mEiTUnE3Y5ge2jmRV
 a2fB0iaantAplGIhp6LRZfmYlT5rOjt0JZmLcfXEzvGnsTSFtYqIttTJnMTauC5Y2KQJ
 uzgBxJJPZn6XozBdZFLkczUHGUFSsFi2sd2sGMSYzogGNiN5HmB5YGVXzHDzGoX3H53k
 G3DcksBR6w/6n8dxtBZz2csUJwvNtlo/14HpoY1q81sWX0NohdINwWERQ55YtFRQAUE1
 GfLUlI1F2RkkLOZhMisioNtGXMVmhhgCtEqJUDNQuXffW2yHu2aLEj5NPO5Dzlo6g3v9
 740A==
X-Gm-Message-State: AOAM533J2snnyaFvoXMb+IHbwaZ0vGQbGKD4VmZtj4bBoHYtJva/9DHK
 7DPFZPzij5JcTBjJkLxrEl7esiAec+vxIw==
X-Google-Smtp-Source: ABdhPJwMMhhuq1WB3tExHPDR41zKpXSdJk+AHW27CbWrqCwLWM4vvHMWqkaGvezOx4n3Vr8cg6OPvw==
X-Received: by 2002:a67:f8ca:: with SMTP id c10mr874209vsp.43.1639989008236;
 Mon, 20 Dec 2021 00:30:08 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id i123sm2099749vkb.20.2021.12.20.00.30.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 00:30:07 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id i6so16307719uae.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 00:30:07 -0800 (PST)
X-Received: by 2002:a05:6102:2155:: with SMTP id
 h21mr2504985vsg.68.1639989007492; 
 Mon, 20 Dec 2021 00:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20211220081132.883709-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20211220081132.883709-1-jiasheng@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Dec 2021 09:29:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhs-wTcZNq2VrAZXrxeSNa88GR49j2rn5zSryxF4peOw@mail.gmail.com>
Message-ID: <CAMuHMdWhs-wTcZNq2VrAZXrxeSNa88GR49j2rn5zSryxF4peOw@mail.gmail.com>
Subject: Re: [PATCH v2] video: fbdev: Check for null res pointer
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: linux-fbdev@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiasheng,

On Mon, Dec 20, 2021 at 9:19 AM Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
> The return value of platform_get_resource() needs to be checked.
> To avoid use of error pointer in case that there is no suitable resource.

Thanks for your patch!

> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")

That can't be the real introducer of the "bug"...

> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

> --- a/drivers/video/fbdev/imxfb.c
> +++ b/drivers/video/fbdev/imxfb.c
> @@ -1083,6 +1083,8 @@ static int imxfb_remove(struct platform_device *pdev)
>         struct resource *res;
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;

This cannot happen, as imxfb_remove() can only be called if
imxfb_probe() succeeded.  imxfb_probe() does check the result of
platform_get_resource(), and fails if the resource was not found.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
