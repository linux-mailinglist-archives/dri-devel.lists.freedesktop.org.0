Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703764023BC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 09:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1683C89BB0;
	Tue,  7 Sep 2021 07:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0839189BB0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 07:03:05 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a14so5038558uao.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 00:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RnzOQ0rKdquIXLN6HTpR8yt5pLvPfBFYXKRIuAB1ab0=;
 b=pgJJib18WLZnKiHqHzGDL1yGas/st/xppfVVDA8GUY68Gn67ULUbii6RTXxkwwfIQh
 2b61o7lX0/vRZ9r0KgKxQ2iEnXlleEv94vQd6IrxIWLsBch+p6tOw2kJLLA5Ehdgm4i7
 dZG+YvHoqCr46R+bkNpSvUxrqdxJVe47zS/yiFg4J1EY+CbT6vB0MCzrW++lH1Av6svh
 KSDCP5FCkY2kAgSR4slbPQAc4Fa16yBelRzY8z3yta/exeJUFUnrvIbTrPA0gBgHGi4K
 xVICyUlrUM7E3f5grJJII3KQyBfJ7Eqv67BZKrsvFcxtIceHF/n319VcINyw0ziUqcKW
 XXZQ==
X-Gm-Message-State: AOAM532fS5O6+P8EgbobtwsZUVlHPELd4SKRd7f7rsLzG9vcioyYg0yr
 vBAAjXIPGv4MqFqfcXzaE6DDji8LaEuS8/JUy1o=
X-Google-Smtp-Source: ABdhPJw7bE6+/3En0eoolnWevATWF39/p5nYQ/eGyl8MjEBtehFgXksrlK6Bp+Q+vuDVQFYZfg/6LgZg/grUFjA7IxE=
X-Received: by 2002:a9f:35aa:: with SMTP id t39mr7415384uad.89.1630998185101; 
 Tue, 07 Sep 2021 00:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210906194917.376116-1-palmer@dabbelt.com>
In-Reply-To: <20210906194917.376116-1-palmer@dabbelt.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Sep 2021 09:02:53 +0200
Message-ID: <CAMuHMdUtg1qA7hx-QGGwd6nfe_vDEzoH95732T736FPH0Jb5dA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/rockchip: cdn-dp-core: Fix cdn_dp_resume
 unused warning
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Android Kernel Team <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 6, 2021 at 9:58 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
>
> cdn_dp_resume is only used under PM_SLEEP, and now that it's static an
> unused function warning is triggered undner !PM_SLEEP.  This
> conditionally enables the function to avoid the warning.
>
> Fixes: 7c49abb4c2f8 ("drm/rockchip: cdn-dp-core: Make cdn_dp_core_suspend/resume static")
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> I sent this one out in January, but it looks like it got lost in the shuffle.
> I'm getting this on a RISC-V allmodconfig now.
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index 8ab3247dbc4a..bee0f2d2a9be 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -1123,6 +1123,7 @@ static int cdn_dp_suspend(struct device *dev)
>         return ret;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
>  static int cdn_dp_resume(struct device *dev)

An alternative solution would be to tag the function with
__maybe_unused.

>  {
>         struct cdn_dp_device *dp = dev_get_drvdata(dev);
> @@ -1135,6 +1136,7 @@ static int cdn_dp_resume(struct device *dev)
>
>         return 0;
>  }
> +#endif
>
>  static int cdn_dp_probe(struct platform_device *pdev)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
