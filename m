Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36232EBED3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 14:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89F689BF3;
	Wed,  6 Jan 2021 13:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF389BF3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 13:40:14 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id j20so2983799otq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jan 2021 05:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQj0RmesVA+Moy3dDr1aHFZDKWq7ktYXC/4kQJWYQPs=;
 b=TOq1M7vB9lXsdaXPtm6RJJmljBHG+/axnbwuPH7Lk+du2xAw/V+FrAhrIb3jcDlHqi
 ormyl6TcFRLygX8loWbEmK0q6lnDj9gkSh0B8cmqNPpsreyUPgeCcIcdDH/JB3ga8Zeg
 oqqp4pfzbyo4vv13VTXNKkcjVBVGgk3lWgTjd4NtDgBdWR7F3/bg+L0KCRHGH0/A1QaD
 /0ElApgnuTiEv5UvCYodWSVLen+BN22vLBuSHdFktmuIM6kiBeriHIfTUsw7FmXW5QC2
 GsyPacECdd4RT5movkOhTH1xoNf1cruCkXldde6yglVTcL8uXKmC0XALJMRLcqAoi6dU
 Mbkg==
X-Gm-Message-State: AOAM531ZEEN9RGJ+HZMSxy9bI76N+X5Eg6istaUvkIaj05Gt5T38Dgkw
 mcWktxE8wWGXWBmaleyjU6O4zeUrT1QSDORJ5Mc=
X-Google-Smtp-Source: ABdhPJyoRu6s85dm8efDsG2TclWauJNGZuYsx9uJ1FrbsXRVn/0PqVQWIBZEjDRbjsXny73i5dxZdofjxhlfwuGXyBA=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr3183283otr.107.1609940413871;
 Wed, 06 Jan 2021 05:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20210106132006.1036-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106132006.1036-1-zhengyongjun3@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jan 2021 14:40:02 +0100
Message-ID: <CAMuHMdUno=8mUQ6a=v-uJq6oOmVS7VM=y5bb2o-YhFn+QE2Qyg@mail.gmail.com>
Subject: Re: [PATCH -next] video: fbdev: pxa3xx_gcu: use resource_size
To: Zheng Yongjun <zhengyongjun3@huawei.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zheng,

On Wed, Jan 6, 2021 at 2:23 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Thanks for your patch!

But the one-line summary and patch description don't seem to match
with the actual change?

> --- a/drivers/video/fbdev/pxa3xx-gcu.c
> +++ b/drivers/video/fbdev/pxa3xx-gcu.c
> @@ -594,8 +594,8 @@ static int pxa3xx_gcu_probe(struct platform_device *pdev)
>          * container_of(). This isn't really necessary as we have a fixed minor
>          * number anyway, but this is to avoid statics. */
>
> -       priv->misc_dev.minor    = PXA3XX_GCU_MINOR,
> -       priv->misc_dev.name     = DRV_NAME,
> +       priv->misc_dev.minor    = PXA3XX_GCU_MINOR;
> +       priv->misc_dev.name     = DRV_NAME;
>         priv->misc_dev.fops     = &pxa3xx_gcu_miscdev_fops;
>
>         /* handle IO resources */

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
