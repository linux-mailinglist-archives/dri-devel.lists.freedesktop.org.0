Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D734B20728F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 13:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0146EB0F;
	Wed, 24 Jun 2020 11:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1386EB0F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 11:53:11 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a21so1559582oic.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 04:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MNOHpEt45vEJASrLn5J9px3ygRO0JRQDAke9QELkVn8=;
 b=hOBULgUN+BkpbP7wZnMJAeGtImaZDVM2Bw3nAem76MMwXHzUaXgWNhgxx9aMW93Zhi
 qFruj8EBr6NRynT7Fi3coWdH0xE6t2jwQmQekbDNmAkjtL0k/sMwwl64Ji7ncuR3HQT8
 NX0Lf3/XgFgJS66R6SXtuCireqB+c9y9vMlmWF+AlXVIMa5p9Pe1ifpj0pBHvRwViUfd
 PHnms/QUVQoxp2b5z3Y/xKm20Tn+2po8yAtu9rx7OPo6YWPWQpOYcOYMFg0graJ+aXYS
 g6OVO/sR2ImVGD/uCnQk4BzYFy4XIb3N0zgocoxig/2bHtMjKYqhKGK22wipErktymmJ
 UQYw==
X-Gm-Message-State: AOAM5332drXrnN0m+Uc4xvOywJ8+OC1VeANQrmdh38k7eA6g+u9Z2xBF
 uCf0oYNcjefIQG9SEKC4kgV0UK7Z2E9rAGmRgyA=
X-Google-Smtp-Source: ABdhPJw9eddIszcs6PWjGbc/pFF08ar5iUhFqSypqdZ+Wn1a80hW5gYdrDvdok5pF67jxVAZIVpQC78HX0EEkrL/CTU=
X-Received: by 2002:a54:4585:: with SMTP id z5mr1960621oib.110.1592999590943; 
 Wed, 24 Jun 2020 04:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200624114135eucas1p26e2e4683d60cebdce7acd55177013992@eucas1p2.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-2-a.hajda@samsung.com>
In-Reply-To: <20200624114127.3016-2-a.hajda@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2020 13:52:58 +0200
Message-ID: <CAJZ5v0iZ_1o8nuGoRGuv++v81ZtDBxfPf-=U_+ZZdv1dgvrY2Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 1/5] driver core: add probe_err log helper
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 24, 2020 at 1:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> During probe every time driver gets resource it should usually check for error
> printk some message if it is not -EPROBE_DEFER and return the error. This
> pattern is simple but requires adding few lines after any resource acquisition
> code, as a result it is often omited or implemented only partially.
> probe_err helps to replace such code sequences with simple call, so code:
>         if (err != -EPROBE_DEFER)
>                 dev_err(dev, ...);
>         return err;
> becomes:
>         return probe_err(dev, err, ...);
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/base/core.c    | 39 +++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h |  3 +++
>  2 files changed, 42 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 67d39a90b45c..ee9da66bff1b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3953,6 +3953,45 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>
>  #endif
>
> +/**
> + * probe_err - probe error check and log helper
> + * @dev: the pointer to the struct device
> + * @err: error value to test
> + * @fmt: printf-style format string
> + * @...: arguments as specified in the format string
> + *
> + * This helper implements common pattern present in probe functions for error
> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> + * It replaces code sequence:
> + *     if (err != -EPROBE_DEFER)
> + *             dev_err(dev, ...);
> + *     return err;
> + * with
> + *     return probe_err(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +int probe_err(const struct device *dev, int err, const char *fmt, ...)
> +{
> +       struct va_format vaf;
> +       va_list args;
> +
> +       if (err == -EPROBE_DEFER)
> +               return err;
> +
> +       va_start(args, fmt);
> +       vaf.fmt = fmt;
> +       vaf.va = &args;
> +
> +       dev_err(dev, "error %d: %pV", err, &vaf);
> +
> +       va_end(args);
> +
> +       return err;
> +}
> +EXPORT_SYMBOL_GPL(probe_err);
> +
>  static inline bool fwnode_is_primary(struct fwnode_handle *fwnode)
>  {
>         return fwnode && !IS_ERR(fwnode->secondary);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 15460a5ac024..40a90d9bf799 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -964,6 +964,9 @@ void device_link_remove(void *consumer, struct device *supplier);
>  void device_links_supplier_sync_state_pause(void);
>  void device_links_supplier_sync_state_resume(void);
>
> +extern __printf(3, 4)
> +int probe_err(const struct device *dev, int err, const char *fmt, ...);
> +
>  /* Create alias, so I can be autoloaded. */
>  #define MODULE_ALIAS_CHARDEV(major,minor) \
>         MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
