Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07EF4BC4C8
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A3910E1CC;
	Sat, 19 Feb 2022 02:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91610E1CC
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:22:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2DA6B81EF8;
 Sat, 19 Feb 2022 02:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663F3C340E9;
 Sat, 19 Feb 2022 02:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645237369;
 bh=JIfWwGj3h2C8+NH7ZVy3Yj2COJfABgpuMBYI5MHOeRk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=pIPQQjvmmVk+z0YSJQU/SzWwz2SXL+EIoKCkxZML82yNw1JKjQKy6mU2Ce8JyhbOt
 Y9QIHCnXyf92nEeJSOSudUtnKhKk8UQrS7NLUuwuzxX6xTMcgIPjnWKmLn0fOJ8TbB
 9vZ1LMNiieru9Uh4O+JcBFQSPPOhFe/S8/ErFDDbFQEVVfsdFdNBG6vuWHMa/bZzIb
 KcIGBNIQyZDQZGNJ0nbn9QblB5+KcAAe7V/ANCWGex0tOGSGSokMhFPno8UQuboJVh
 VoCKf92UoG+u8NZf/buaqrnUecgsDJQVmH4Vun6CmlVytmZRsv1eGVa/MrOqTlW1KL
 cAtN6DcmT1KdA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125141549.747889-6-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-6-maxime@cerno.tech>
Subject: Re: [PATCH v4 05/10] clk: Add clk_drop_range
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 18 Feb 2022 18:22:47 -0800
User-Agent: alot/0.10
Message-Id: <20220219022249.663F3C340E9@smtp.kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-01-25 06:15:44)
> index 266e8de3cb51..f365dac7be17 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -1005,6 +1005,17 @@ static inline struct clk *clk_get_optional(struct =
device *dev, const char *id)
>         return clk;
>  }
> =20
> +/**
> + * clk_drop_range - Reset any range set on that clock
> + * @clk: clock source
> + *
> + * Returns success (0) or negative errno.
> + */
> +static inline int clk_drop_range(struct clk *clk)
> +{
> +       return clk_set_rate_range(clk, 0, ULONG_MAX);
> +}

Please move this above clk_get_optional() as this is the "clk_get" zone
of this file.

> +
>  #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
>  struct clk *of_clk_get(struct device_node *np, int index);
