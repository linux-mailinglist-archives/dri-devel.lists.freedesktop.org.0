Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3320A01A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 15:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13CF6E27C;
	Thu, 25 Jun 2020 13:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC836E27C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 13:36:24 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w17so4259891oie.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 06:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QeCtp++xxPCZRBvlYZrASZvj7xdKLbOl2rvnced1sLM=;
 b=eYDiQl2P7MPjUAKXhSyUSytUSKJBpmlIHpWf0WmUwcTLRq44zqkirCzd/Q+xzi5XEb
 hr7BtcRIZdxQaWHvrjv5skwxugPZJdTvcCKjC8VHPyX3pPDOe2Izp/ut/V0Y1rJ2KRNx
 Ecgyiq5Z+5la8S0XrbCWk0GYXhobA37tieZKEYTkSvK8XGgYNzXvjiThIGbf4VtuoxCc
 9EVYp0wt5dHzj/GE68xaFHTD89gp8OS1LidDpeZVisdOuKFcnsmt5ZST0C9srqq/ItA0
 UL9u9bTHVx/Op1UAgzBZphsHUpC/kqMZMJFaN9X6VCL0JFLIS1AvsntCMcMWr/gkN/cQ
 9LoA==
X-Gm-Message-State: AOAM5318uuRcDNNKXX4yemBRIZU7uwpM/sPeXnssvpf3rC/xjJLR4ipZ
 HSQkapoFyMPPN82NZRR9b3NyMq/fkkPJuGCJhWI=
X-Google-Smtp-Source: ABdhPJz/e1bJcF5m5wILBXZ9/eGsnTS3LKqZ0+cNl/UdWI4IxGukvTRoaJ/B+f6OwGV1hbSB2tKpqyPBg+dpOqks/mI=
X-Received: by 2002:aca:849:: with SMTP id 70mr2067473oii.153.1593092184238;
 Thu, 25 Jun 2020 06:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-8-tzimmermann@suse.de>
In-Reply-To: <20200625120011.16168-8-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jun 2020 15:36:12 +0200
Message-ID: <CAMuHMdXgJu__Pph1ba2d8erqvT1gbLDwnM8X6QW1w4RzXteaiw@mail.gmail.com>
Subject: Re: [PATCH 7/9] drm/simplekms: Acquire regulators from DT device node
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
Cc: David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
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
> Make sure required hardware regulators are enabled while the firmware
> framebuffer is in use.
>
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Regulators are released automatically via devres helpers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/tiny/simplekms.c
> +++ b/drivers/gpu/drm/tiny/simplekms.c
> @@ -4,6 +4,7 @@
>  #include <linux/of_clk.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_connector.h>
> @@ -198,6 +199,11 @@ struct simplekms_device {
>         unsigned int clk_count;
>         struct clk **clks;
>  #endif
> +       /* regulators */
> +#if defined CONFIG_OF && defined CONFIG_REGULATOR
> +       unsigned int regulator_count;
> +       struct regulator **regulators;
> +#endif
>
>         /* simplefb settings */
>         struct drm_display_mode mode;
> @@ -315,6 +321,125 @@ static int simplekms_device_init_clocks(struct simplekms_device *sdev)
>  }
>  #endif
>
> +#if defined CONFIG_OF && defined CONFIG_REGULATOR
> +
> +#define SUPPLY_SUFFIX "-supply"
> +
> +/*
> + * Regulator handling code.
> + *
> + * Here we handle the num-supplies and vin*-supply properties of our
> + * "simple-framebuffer" dt node. This is necessary so that we can make sure
> + * that any regulators needed by the display hardware that the bootloader
> + * set up for us (and for which it provided a simplefb dt node), stay up,
> + * for the life of the simplefb driver.

Looks like there's a bulk regulator API, too?

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
