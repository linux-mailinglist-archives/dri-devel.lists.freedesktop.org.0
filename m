Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF61E3C17
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB2F6E040;
	Wed, 27 May 2020 08:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51056E040
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:35:04 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7453D20723;
 Wed, 27 May 2020 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590568504;
 bh=4P6drQSHi9/fWQsr/Ga8r0JMRYT3l59WI9ynWwuCi20=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OjqOTc1g6ZzEGZuUAXSx989Y9yhyWypaASH76M03vrBHEMdC2kKDvUqSFrGWTrFmH
 1HPFcNZTtVVMVJUpFSVbdN9ObGVTdQznRmcwESXxXFFL1NCa3d9/N9vuwCqVXrJ7bO
 igkQZANuQEZyBwRcwAGYW/38P863/fZt08cACyao=
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-6-git-send-email-dillon.minfei@gmail.com>
Subject: Re: [PATCH v6 5/9] clk: stm32: Fix stm32f429's ltdc driver hang in
 set clock rate
From: Stephen Boyd <sboyd@kernel.org>
To: airlied@linux.ie, alexandre.torgue@st.com, andy.shevchenko@gmail.com,
 broonie@kernel.org, daniel@ffwll.ch, dillon.minfei@gmail.com,
 linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, mturquette@baylibre.com,
 noralf@tronnes.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
 sam@ravnborg.org, thierry.reding@gmail.com
Date: Wed, 27 May 2020 01:35:03 -0700
Message-ID: <159056850384.88029.10852284922297394339@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: devicetree@vger.kernel.org, dillonhua@gmail.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting dillon.minfei@gmail.com (2020-05-27 00:27:29)
> From: dillon min <dillon.minfei@gmail.com>
> 
> This is due to misuse \u2018PLL_VCO_SAI' and'PLL_SAI' in clk-stm32f4.c
> 'PLL_SAI' is 2, 'PLL_VCO_SAI' is 7(defined in
> include/dt-bindings/clock/stm32fx-clock.h).
> 
> 'post_div' point to 'post_div_data[]', 'post_div->pll_num'
> is PLL_I2S or PLL_SAI.
> 
> 'clks[PLL_VCO_SAI]' has valid 'struct clk_hw* ' return
> from stm32f4_rcc_register_pll() but, at line 1777 of
> driver/clk/clk-stm32f4.c, use the 'clks[post_div->pll_num]',
> equal to 'clks[PLL_SAI]', this is invalid array member at that time.
> 
> Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
