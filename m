Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221848D36D5
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 14:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0BB113471;
	Wed, 29 May 2024 12:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX//w0VW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C511135DD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716987374; x=1748523374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gz8z8N5bHTtjf1WXKP3VLR7zy+2ou75tSdQdUmX2Vx4=;
 b=DX//w0VWaxrNsKYr2M2lopKmf0Sv7vaVdQ+HhvtbIJ1XJstoa3SFuzqJ
 CuCLhG0V5CloWChvrG8xnWY+eMhX1TaVQ4orI/1AArB34VfglxRD/D+zb
 1cWZo19Dae2e5KMZvKfihnZHb78io+LT79v5rV2ZQKqAhx5noun+x0WgO
 K20tm322b3SJyvsgzFel58veIcFvAhmbt+QJfzqWvCX0fLPrByD8aV3cy
 IGiXedQdSw0RIwPhBu+dG6BcavlILIRQMQVTl3KL7UW8LqLC1v6ViiOOl
 AaTDwEY/W9aV38eHf0uIEQbR8vDsH8TfmHKVvdFUdtcoWKbWR7wimr8Da A==;
X-CSE-ConnectionGUID: F84x8TOFR6q53PtM+MY/dw==
X-CSE-MsgGUID: QELSMZGnTGyvrvcnNR3n1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13618482"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="13618482"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:56:13 -0700
X-CSE-ConnectionGUID: H5QcdFF9TbONM172UGdoGg==
X-CSE-MsgGUID: zqE6bIAkQpSvlFOcfBHkJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35963852"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 05:56:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sCIqP-0000000BnVT-2SiK; Wed, 29 May 2024 15:55:53 +0300
Date: Wed, 29 May 2024 15:55:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [DO NOT MERGE v8 08/36] clocksource: sh_tmu: CLOCKSOURCE support.
Message-ID: <Zlcl2QxRDDrGh7Ru@smile.fi.intel.com>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <f40e91e3f010880b0cf7a1c3a18d0c57bb55d93a.1716965617.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f40e91e3f010880b0cf7a1c3a18d0c57bb55d93a.1716965617.git.ysato@users.sourceforge.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, May 29, 2024 at 05:00:54PM +0900, Yoshinori Sato wrote:
> Allows initialization as CLOCKSOURCE.

...

> -	dev_info(&ch->tmu->pdev->dev, "ch%u: used for %s clock events\n",
> -		 ch->index, periodic ? "periodic" : "oneshot");
> +	pr_info("%s ch%u: used for %s clock events\n",
> +		ch->tmu->name, ch->index, periodic ? "periodic" : "oneshot");

This is a step back change. We should use dev_*() if we have a device
available. And I believe this is the case (at least for the previous boards),
no?

...

> -	ch->irq = platform_get_irq(tmu->pdev, index);
> +	if (tmu->np)
> +		ch->irq = of_irq_get(tmu->np, index);
> +	else if (tmu->pdev)
> +		ch->irq = platform_get_irq(tmu->pdev, index);

I found these changes counterproductive. Instead better to have up to three
files to cover:
- the common code (library)
- the platform device support
- the pure OF support.

...

> -	res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(&tmu->pdev->dev, "failed to get I/O memory\n");
> -		return -ENXIO;
> +	if (tmu->pdev) {
> +		res = platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
> +		if (!res) {
> +			pr_err("sh_tmu failed to get I/O memory\n");
> +			return -ENXIO;
> +		}
> +
> +		tmu->mapbase = ioremap(res->start, resource_size(res));

devm_platform_ioremap_resource() should be good to have.
Again, consider proper splitting.

>  	}
> +	if (tmu->np)
> +		tmu->mapbase = of_iomap(tmu->np, 0);

So, how many boards are non-OF compatible? Maybe makes sense to move them to OF
and drop these platform code entirely from everywhere?

...

> +	tmu->name = dev_name(&pdev->dev);
> +	tmu->clk = clk_get(&tmu->pdev->dev, "fck");

devm_ approach can help a lot in case of platform device code.

> +	if (IS_ERR(tmu->clk)) {
> +		dev_err(&tmu->pdev->dev, "cannot get clock\n");
> +		return PTR_ERR(tmu->clk);

		return dev_err_probe() ?

> +	}

-- 
With Best Regards,
Andy Shevchenko


