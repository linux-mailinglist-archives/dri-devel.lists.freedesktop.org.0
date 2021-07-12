Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F53C5B45
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 13:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085E589AA2;
	Mon, 12 Jul 2021 11:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9635F89AA2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 11:43:27 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id f4so6348907vsh.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 04:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4gVdUzsvCBO+uy38/AuYXBfTD6da6FYmfmBT+VVRDgs=;
 b=RH7G2U8CtzUpQpUO567INqDEHJxrmm8RzeKbEo81rgHc8sJD48tchMNL/y496FBpD1
 qFFaq9jR1Z+8zl5PQRCOJnKv9qtDaBtoguu0+CiC11LG75l8brtHXTRg+pUPiK1xXYJS
 ZyEUFF1MEGxxNF9DOoZlt2WH3NGa1XkYooWIUDx46EuUwi8m+KBmxCn/Lr6obEMZafom
 dqLJUsG6wJCQXszZ1AMmtJn70jr5vDnyTax+EXOzChVEmlVUuLvlW28Lwqe1zt8Rx8tQ
 SgwDwUy05SKqG5kjsFwHdO2xnT5s6aXOH7AePwRY9QbnxcdpvWZKX7NopDvRpRM0k/Yl
 sCdw==
X-Gm-Message-State: AOAM531TsHCsjVpFEjfpn3WssdxsCbfwO5KgFOy6E3EKPM5BlmFQ1BWV
 /Hn8aBZ2aYfcGOTXr8IiWzQiKkoc9QmflnPIweE=
X-Google-Smtp-Source: ABdhPJwJQAPTAIJQf4G2QW+cJxL5bTSdWGqIsTGkTTheH6TLEQ70SPVAYofFH6maGhMdK36QCwx17SkJ2OywBchdzEI=
X-Received: by 2002:a67:f98c:: with SMTP id b12mr47467736vsq.40.1626090207058; 
 Mon, 12 Jul 2021 04:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210706074900.8928-1-tzimmermann@suse.de>
In-Reply-To: <20210706074900.8928-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Jul 2021 13:43:15 +0200
Message-ID: <CAMuHMdUkq8dwhmdaV-MZM23T5XepAdDE4CFUs3Mk0LBQPpQpBA@mail.gmail.com>
Subject: Re: [PATCH] drm/shmobile: Convert to Linux IRQ interfaces
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 6, 2021 at 9:49 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for your patch!

> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -258,7 +256,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>                 goto err_modeset_cleanup;
>         }
>
> -       ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +       ret = request_irq(platform_get_irq(pdev, 0), shmob_drm_irq, 0, ddev->driver->name, ddev);

platform_get_irq() can return a negative error code.
While drm_irq_install() took a signed irq parameter (and only
considered zero an error, oops), request_irq() takes an unsigned irq.
So you better check for errors before calling request_irq().

>         if (ret < 0) {
>                 dev_err(&pdev->dev, "failed to install IRQ handler\n");
>                 goto err_modeset_cleanup;
> @@ -275,7 +273,7 @@ static int shmob_drm_probe(struct platform_device *pdev)
>         return 0;
>
>  err_irq_uninstall:
> -       drm_irq_uninstall(ddev);
> +       free_irq(platform_get_irq(pdev, 0), ddev);

Similar issue here.

>  err_modeset_cleanup:
>         drm_kms_helper_poll_fini(ddev);
>  err_free_drm_dev:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
