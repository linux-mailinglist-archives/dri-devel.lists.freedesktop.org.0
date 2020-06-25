Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60520A006
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 15:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4416E1B9;
	Thu, 25 Jun 2020 13:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728B06E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 13:34:20 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 72so5253120otc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 06:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TRchS3u19fiIS7C0UK/+ytBsjjoblV6gX2Npu5INAM4=;
 b=ZjPSXBh0Heou547AjT0Hd/0/TZFJAOFL4eq46W7z2DD1BX9ZoFwRhX8cS1BJcqQC3c
 IrnFM72dtxUrBcKNP01LAhOW/Tq7zmbZZZ+bOkNF3Hd2wyQpnNOTfVYLCYVR8YHLPsAz
 5lOC6YwrxX8rTBN2Svtdgs9SGbGh50alckAjVJBZRNRvoXAKI4kWQhE57ZmQHjBY9gyB
 sp9mOaJZwQ3a4Lia8XXUqPZajQtwq8GXP4McwsUXT7IEhe8sMnJzg0HMRW3gHIrD6uw0
 JS+bDBhshz0fBTaR7YCfUAFQD8f9GfA3g5XOrGqGOARIRmowY1089Taq/wr01z1eWFi+
 2N+g==
X-Gm-Message-State: AOAM533QlVRTyyaFoLbDR8p7ACXdWUNaPjYls92L/Dg9tSg+uIQs/QjM
 h4ML+E7L26llC5CppdYCs2OGQ2xNnqYNnkjNOEY=
X-Google-Smtp-Source: ABdhPJyfZs5wkrSbKwnWnBwMiohr7YRapQqDrIV04olBcp+FF+AgnfXQu95DtWEricaRj/rfIg0LDIgDkjjgL35xt9c=
X-Received: by 2002:a05:6830:10d6:: with SMTP id
 z22mr6642778oto.250.1593092059705; 
 Thu, 25 Jun 2020 06:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-7-tzimmermann@suse.de>
In-Reply-To: <20200625120011.16168-7-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jun 2020 15:34:05 +0200
Message-ID: <CAMuHMdUfO5QmUHwkTXqgtr+zEsz=29og33E3wuYC7qqGE+ES4g@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/simplekms: Acquire clocks from DT device node
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jun 25, 2020 at 2:00 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Make sure required hardware clocks are enabled while the firmware
> framebuffer is in use.
>
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Clocks are released automatically via devres helpers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simplekms.c
> +++ b/drivers/gpu/drm/tiny/simplekms.c

> @@ -210,6 +218,103 @@ static struct simplekms_device *simplekms_device_of_dev(struct drm_device *dev)
>         return container_of(dev, struct simplekms_device, dev);
>  }
>
> +/*
> + * Hardware
> + */
> +
> +#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
> +/*
> + * Clock handling code.
> + *
> + * Here we handle the clocks property of our "simple-framebuffer" dt node.
> + * This is necessary so that we can make sure that any clocks needed by
> + * the display engine that the bootloader set up for us (and for which it
> + * provided a simplefb dt node), stay up, for the life of the simplefb
> + * driver.
> + *
> + * When the driver unloads, we cleanly disable, and then release the clocks.
> + *
> + * We only complain about errors here, no action is taken as the most likely
> + * error can only happen due to a mismatch between the bootloader which set
> + * up simplefb, and the clock definitions in the device tree. Chances are
> + * that there are no adverse effects, and if there are, a clean teardown of
> + * the fb probe will not help us much either. So just complain and carry on,
> + * and hope that the user actually gets a working fb at the end of things.
> + */
> +
> +static void simplekms_device_release_clocks(void *res)
> +{
> +       struct simplekms_device *sdev = simplekms_device_of_dev(res);
> +       unsigned int i;
> +
> +       for (i = 0; i < sdev->clk_count; ++i) {
> +               if (sdev->clks[i]) {
> +                       clk_disable_unprepare(sdev->clks[i]);
> +                       clk_put(sdev->clks[i]);
> +               }
> +       }
> +}
> +
> +static int simplekms_device_init_clocks(struct simplekms_device *sdev)
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

clk_bulk_get_all()?

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
