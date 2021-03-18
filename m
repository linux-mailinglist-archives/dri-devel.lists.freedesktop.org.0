Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C3340380
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 11:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C5F6E0E3;
	Thu, 18 Mar 2021 10:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC16E0E3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 10:39:19 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id b5so1259221vsl.9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 03:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tAvzu8nz5iln6WgpiSW86z6S3Eft+tfyr3DeEjUUSh8=;
 b=mIFU5MhJr86++Lw6Wg+CIPBE+y+M1AukvCu0nZDVw3rtY1V1HycaGQtyKbtDMkVUWr
 zS8Al3IpoW6wc9VwbJ5Ja+Hv5AgYsC3WkrlWprhn+8l527ZEi6DWRzbdYjsupfJbmBUd
 IxO6H49dDvUedU0cEeNzAueKJHLKiEr6WROYsVn+QO8mWwN6YuxciYWI1OLE2G6dxP4Z
 RI+KACXWNpWlsZCNdDwvIVVeosoev/5YXv2RqLMBfg58gqmgp1PJUZTj7izjefqFunzZ
 lK48sFTpUbmtY4N1bBmtAW6A875g19vm9ZOWM4sB5Oin0WxffDhi2qFPcWgZGbc8MzAL
 pJ/g==
X-Gm-Message-State: AOAM531KVteZiqLchd2yYIcLntLZDHSphGDPMqhlUUzxuxiK+IAqjAG5
 k3DYhJQDVsv74mDOO2wCvJPhjhXhYsCOPU7apag=
X-Google-Smtp-Source: ABdhPJyLRkuI65bcr5OT1r++d1vw1tuL9YMffz3SQ5rZYOlZEhaTfC7OjKL8YtBiPs1j+K6eLMB172cH0IogWEpFT0k=
X-Received: by 2002:a67:ef0e:: with SMTP id j14mr5704768vsr.40.1616063958823; 
 Thu, 18 Mar 2021 03:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
In-Reply-To: <20210318102921.21536-9-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Mar 2021 11:39:07 +0100
Message-ID: <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Mar 18, 2021 at 11:29 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Make sure required hardware clocks are enabled while the firmware
> framebuffer is in use.
>
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Clocks are released automatically via devres helpers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c

> +static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
> +{
> +       struct drm_device *dev = &sdev->dev;
> +       struct platform_device *pdev = sdev->pdev;
> +       struct device_node *of_node = pdev->dev.of_node;
> +       struct clk *clock;
> +       unsigned int i;
> +       int ret;
> +
> +       if (dev_get_platdata(&pdev->dev) || !of_node)
> +               return 0;
> +
> +       sdev->clk_count = of_clk_get_parent_count(of_node);
> +       if (!sdev->clk_count)
> +               return 0;
> +
> +       sdev->clks = drmm_kzalloc(dev, sdev->clk_count * sizeof(sdev->clks[0]),
> +                                 GFP_KERNEL);
> +       if (!sdev->clks)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < sdev->clk_count; ++i) {
> +               clock = of_clk_get(of_node, i);
> +               if (IS_ERR(clock)) {
> +                       ret = PTR_ERR(clock);
> +                       if (ret == -EPROBE_DEFER)
> +                               goto err;
> +                       drm_err(dev, "clock %u not found: %d\n", i, ret);
> +                       continue;
> +               }
> +               ret = clk_prepare_enable(clock);
> +               if (ret) {
> +                       drm_err(dev, "failed to enable clock %u: %d\n",
> +                               i, ret);
> +                       clk_put(clock);
> +               }
> +               sdev->clks[i] = clock;
> +       }

of_clk_bulk_get_all() + clk_bulk_prepare_enable()?

There's also devm_clk_bulk_get_all(), but not for the OF variant.

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
