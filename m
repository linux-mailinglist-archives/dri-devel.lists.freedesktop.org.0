Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBA5305E1D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CC26E117;
	Wed, 27 Jan 2021 14:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01A36E117
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 14:22:00 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id v1so1783438ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 06:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=587D5sQwzOQpISnpuw/zLfl/khiQsRKiyrXe7742FuI=;
 b=LnbxkLs+ugnRC8YNbsaBIpzZWHREWNAkM4OGZRBCVBNoIVFCURP18NfxhObk8fOvzB
 qEz2hy2Llqi8KFdKGXcEqV5HwQKHC9JeIqndLInuTSSVpqqNNoERXBGSn+Fy6hEY+N6j
 Kd3Xb6J7R5cmQvu6IqMdInsJMBQcQ815+Blr2cpTn94rSUTIvVVfYRl3zh/+j9ZaTwZY
 /BJEi5H3MmCGkGj/ALtppUyGHXZWpHcNHCwJPX4X0EXF/8xyOeYIhDUHTXnAvDlPQzWa
 VaBCRYxAIXJv9ER0mDCjuJoE1JONuBabgwsFZ3pIc5tDKL6tLQ1KyhgPSQpGV9obYRq2
 cikw==
X-Gm-Message-State: AOAM531kgGguVq9tBtE4RccPXeKk9VIONqLztYfZuYXF6spAtADrdfp6
 MHIE6LvjtA0hA0CnMh0kAeYc/jc8ewA/Hqzb5wI=
X-Google-Smtp-Source: ABdhPJwldt+lZlYPhu/osH7yMBd55aPChuGJkaBrux0jWPyiIyO2mGqr+Ap0Sk51b3A5BrSya3weIUzfrYMlEzvbK80=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr7855321otr.145.1611757320011; 
 Wed, 27 Jan 2021 06:22:00 -0800 (PST)
MIME-Version: 1.0
References: <1611756149-165287-1-git-send-email-zhangxuezhi3@gmail.com>
In-Reply-To: <1611756149-165287-1-git-send-email-zhangxuezhi3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 15:21:48 +0100
Message-ID: <CAMuHMdV81xSOBkw9Rfeuc8U4g3vRcucXMvVv1_1hoMexX62s7A@mail.gmail.com>
Subject: Re: [PATCH v11] staging: fbtft: add tearing signal detect
To: Carlis <zhangxuezhi3@gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlis,

On Wed, Jan 27, 2021 at 3:07 PM Carlis <zhangxuezhi3@gmail.com> wrote:
> From: zhangxuezhi <zhangxuezhi1@yulong.com>
>
> For st7789v ic,when we need continuous full screen refresh, it is best to
> wait for the TE signal arrive to avoid screen tearing
>
> Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
> ---
> v11: remove devm_gpio_put and change a dev_err to dev_info

> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c

> @@ -82,6 +111,32 @@ enum st7789v_command {
>   */
>  static int init_display(struct fbtft_par *par)
>  {
> +       int rc;
> +       struct device *dev = par->info->device;
> +
> +       par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
> +       if (IS_ERR(par->gpio.te)) {
> +               rc = PTR_ERR(par->gpio.te);
> +               dev_info(par->info->device, "Failed to request te gpio: %d\n", rc);

Please slow down and read the feedback.
I said "dev_err_probe()", not "dev_info()".

> +               return rc;
> +       }
> +       if (par->gpio.te) {
> +               init_completion(&spi_panel_te);
> +               mutex_init(&te_mutex);
> +               rc = devm_request_irq(dev,
> +                                     gpiod_to_irq(par->gpio.te),
> +                                    spi_panel_te_handler, IRQF_TRIGGER_RISING,
> +                                    "TE_GPIO", par);
> +               if (rc) {
> +                       dev_err(par->info->device, "TE request_irq failed.\n");

Same here.

> +                       return rc;
> +               }
> +
> +               disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> +       } else {
> +               dev_info(par->info->device, "%s:%d, TE gpio not specified\n",
> +                        __func__, __LINE__);
> +       }
>         /* turn off sleep mode */
>         write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>         mdelay(120);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
