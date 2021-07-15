Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F33C9C8A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBD46E804;
	Thu, 15 Jul 2021 10:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110276E804
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 10:16:39 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id n61so1883114uan.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 03:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57u7P8v+u127RtK4lZDe0W51lZfZfemDqVdEqGuF7Vg=;
 b=ecJa8jPbAmX2wupkcxWtj+Z3AQMxXniKUdMuZmpcKU/otASb64wISgZ8DH71l5coEU
 3b4IFkq49Ge+YPn0yQW5TOgAttefNIuOIJbsIesY4SuICq3geQb/vikNqutn/I7TeAR7
 6yvEIJTAdU2ueN1e4XX33yoR3kDc4zojHmhGRUTqwxsqAGwPu4j6l5QUturixlMdNIj3
 8OVP319UQxhXZ6hp0ZPdzJm5xNyEDG4iwWK2VJcbqF7sEDxHJXhqRI4n4OqidAJoiWOo
 Hr5ch0bMxpM61VDqQNgQhO1TAIYmHYkFl/2CazoSfvgpntBmlR6nz0Jx3Adm5ryX8Snx
 ss3Q==
X-Gm-Message-State: AOAM532yknOuC+8eDJDuIwHAoqfcNukqpX6cKminv8TYL8TZVl2JvkI+
 KrbGFe8AYV7VMibnk6fPK5jYUvyJt/79k1hgH0k=
X-Google-Smtp-Source: ABdhPJxjTV1yUegSkNBAVPxuxkmpSjdkXYvDWabQOQAYXTeQC3b3UTa4Z5nrk0TOCVB5wW0rcD0twd/Gd7cnAvejqaw=
X-Received: by 2002:ab0:2554:: with SMTP id l20mr5831250uan.58.1626344198292; 
 Thu, 15 Jul 2021 03:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210715095729.6510-1-tzimmermann@suse.de>
In-Reply-To: <20210715095729.6510-1-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jul 2021 12:16:27 +0200
Message-ID: <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/shmobile: Convert to Linux IRQ interfaces
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jul 15, 2021 at 11:57 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
>
> v2:
>         * handle errors in platform_get_irq() (Geert, Sergei)
>         * store IRQ number in struct shmob_drm_device (Laurent)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the update!

> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -258,7 +256,15 @@ static int shmob_drm_probe(struct platform_device *pdev)
>                 goto err_modeset_cleanup;
>         }
>
> -       ret = drm_irq_install(ddev, platform_get_irq(pdev, 0));
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret) {

if (ret < 0) {

> +               dev_err(&pdev->dev, "failed to get IRQ number\n");

platform_get_irq() already prints an error message, so no need to
repeat it.

> +               goto err_modeset_cleanup;
> +       }
> +       sdev->irq = ret;
> +
> +       ret = request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver->name,
> +                         ddev);
>         if (ret < 0) {
>                 dev_err(&pdev->dev, "failed to install IRQ handler\n");
>                 goto err_modeset_cleanup;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
