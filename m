Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9C1211C2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00586E848;
	Mon, 16 Dec 2019 17:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9F6E848
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:30:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDC6A206E0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576517455;
 bh=ViaRiASFlXAKGrnbbLyOCa7KtrFISMAdMgIMFrewFMg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VTnMkI6d4CSm1M4khYwHX12SJoKwWDo1M4CjxMzdaoTScppKZD8cLAESUhvkR7UhH
 ibf/k2VUrcnIYA/YuDt82pxZ+FxDFqwxRHfKTFmT+eGZBZV8qBsDuq8vMpTxFcxzDl
 6EPYBMqLrlzSYOropPcyBc9rAUzcQRZBjm5XNCZ4=
Received: by mail-lj1-f177.google.com with SMTP id p8so1068682ljg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 09:30:54 -0800 (PST)
X-Gm-Message-State: APjAAAV3gSyIYRGfkxC/W7oDii1oL1FAk9RgvvlBVyRtNgxJU2rvXCr3
 maIesPzt/Tdaapx8O6cHdc5ILVwrD4M6CklXHFE=
X-Google-Smtp-Source: APXvYqw9AgFV+5c2fYpFMs+NKHTw5GvvT7NZqyvUqKHTzYvY6yPWjMU7ki0P7z3jL9MiSWzX5BrN+utIN2V0/lCrNQw=
X-Received: by 2002:a2e:b0db:: with SMTP id g27mr197360ljl.74.1576517452980;
 Mon, 16 Dec 2019 09:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20191213102346.9577-1-linus.walleij@linaro.org>
In-Reply-To: <20191213102346.9577-1-linus.walleij@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 16 Dec 2019 18:30:41 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdD01W8u1Pjtk0w8WTh3uU=PXqwT73UKVANmLqmDWJtCA@mail.gmail.com>
Message-ID: <CAJKOXPdD01W8u1Pjtk0w8WTh3uU=PXqwT73UKVANmLqmDWJtCA@mail.gmail.com>
Subject: Re: [PATCH v2] backlight: pwm_bl: Switch to full GPIO descriptor
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Lee Jones <lee.jones@linaro.org>, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2019 at 11:23, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The PWM backlight still supports passing a enable GPIO line as
> platform data using the legacy <linux/gpio.h> API.
>
> It turns out that ever board using this mechanism except one
> is pass .enable_gpio = -1. So we drop all these cargo-culted -1's
> from all instances of this platform data in the kernel.
>
> The remaning board, Palm TC, is converted to pass a machine
> descriptior table with the "enable" GPIO instead, and delete the
> platform data entry for enable_gpio and the code handling it
> and things should work smoothly with the new API.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Located a missing removal of .enable_gpio in the Palm TC
>   board file, pointed out by Daniel.
> - Grepped to ascertain there is not a single instance of
>   the string "enable_gpio" in the affected board files.
> ---
>  arch/arm/mach-pxa/cm-x300.c               |  1 -
>  arch/arm/mach-pxa/colibri-pxa270-income.c |  1 -
>  arch/arm/mach-pxa/ezx.c                   |  1 -
>  arch/arm/mach-pxa/hx4700.c                |  1 -
>  arch/arm/mach-pxa/lpd270.c                |  1 -
>  arch/arm/mach-pxa/magician.c              |  1 -
>  arch/arm/mach-pxa/mainstone.c             |  1 -
>  arch/arm/mach-pxa/mioa701.c               |  1 -
>  arch/arm/mach-pxa/palm27x.c               |  1 -
>  arch/arm/mach-pxa/palmtc.c                | 11 ++++++++++-
>  arch/arm/mach-pxa/palmte2.c               |  1 -
>  arch/arm/mach-pxa/pcm990-baseboard.c      |  1 -
>  arch/arm/mach-pxa/tavorevb.c              |  2 --
>  arch/arm/mach-pxa/viper.c                 |  1 -
>  arch/arm/mach-pxa/z2.c                    |  2 --
>  arch/arm/mach-pxa/zylonite.c              |  1 -
>  arch/arm/mach-s3c24xx/mach-h1940.c        |  1 -
>  arch/arm/mach-s3c24xx/mach-rx1950.c       |  1 -
>  arch/arm/mach-s3c64xx/dev-backlight.c     |  3 ---
>  arch/arm/mach-s3c64xx/mach-crag6410.c     |  1 -
>  arch/arm/mach-s3c64xx/mach-hmt.c          |  1 -
>  arch/arm/mach-s3c64xx/mach-smartq.c       |  1 -
>  arch/arm/mach-s3c64xx/mach-smdk6410.c     |  2 +-

For s3c:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
