Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B150C262
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 00:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1E210E7BD;
	Fri, 22 Apr 2022 22:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E93910E79E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 22:56:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A247BB832FD;
 Fri, 22 Apr 2022 22:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DAFC385A0;
 Fri, 22 Apr 2022 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650668164;
 bh=g2fYQ8tm3COkkq2YncBk1OWp9JnooIBSRa7pFk6sT74=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=I5w/7jihsVIOHdNHdwHI9q6Q3q06D2FQZAe4ePmHlq8Cs0+yodwYMKr0jIsf2Vkmm
 Jf4ihxuZLcR98Mx65WT9JSPWYOglfKPe7ICt7L5stxHkxWZTFuYftbEYuDFQImqDQn
 1i+XE8YgLYBABhz4eBXxQEp/fhm0JhSPz7ZRey9SAM/nbzy1z3G9zjmZliTmlLW4/P
 nQfGdAYBmW4QdM8ISXR0CmEorTRBisnpTsTmczqmOwHvuhhteA92WCWnF10tTOY9Gq
 nieWy/cGf80AwQf/0pTtF9bdavrHtW13LpQ7tYJ83OLgJECQ5ZBy0rEYe1kJ6zbSf1
 GEx+tSzx5mnrA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419163810.2118169-37-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220419163810.2118169-37-arnd@kernel.org>
Subject: Re: [PATCH 36/48] cpufreq: pxa3: move clk register access to clk
 driver
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Date: Fri, 22 Apr 2022 15:56:02 -0700
User-Agent: alot/0.10
Message-Id: <20220422225604.52DAFC385A0@smtp.kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2022-04-19 09:37:58)
> diff --git a/include/linux/clk/pxa.h b/include/linux/clk/pxa.h
> new file mode 100644
> index 000000000000..e5516c608c99
> --- /dev/null
> +++ b/include/linux/clk/pxa.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifdef CONFIG_PXA3xx
> +extern unsigned        pxa3xx_get_clk_frequency_khz(int);

What is the spacing about here?

> +extern void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg,=
 u32 mask);
> +#else
> +#define pxa3xx_get_clk_frequency_khz(x)                (0)
> +#define pxa3xx_clk_update_accr(disable, enable, xclkcfg, mask) do { } wh=
ile (0)

Why not static inline with types?
