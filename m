Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE2F1E3C19
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 10:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116C86E2A9;
	Wed, 27 May 2020 08:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370096E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 08:35:09 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0503E2084C;
 Wed, 27 May 2020 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590568509;
 bh=ExRWKKtWjwjMfUMo3XFsagCD3+PJwFwlQH9y9gF24co=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oIUSl5eMOR1MZzMDvtFWB0YQE3IPL/ZM/1HMr0RMhTmwYvrsKFVWiQAh4G6mHvd+Q
 3H28kUP+38zAqybb2CWyvvgwuV3h90u5Tfnvz/c4lyACL6RqPaJ15NHoJ0zHzmZxK2
 qYZPvrf1QmWw+rQ4Uy7yVLf9PFu9DpYQJomN8HPg=
MIME-Version: 1.0
In-Reply-To: <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-7-git-send-email-dillon.minfei@gmail.com>
Subject: Re: [PATCH v6 6/9] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
From: Stephen Boyd <sboyd@kernel.org>
To: airlied@linux.ie, alexandre.torgue@st.com, andy.shevchenko@gmail.com,
 broonie@kernel.org, daniel@ffwll.ch, dillon.minfei@gmail.com,
 linus.walleij@linaro.org, mcoquelin.stm32@gmail.com, mturquette@baylibre.com,
 noralf@tronnes.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
 sam@ravnborg.org, thierry.reding@gmail.com
Date: Wed, 27 May 2020 01:35:08 -0700
Message-ID: <159056850835.88029.9264848839121822798@swboyd.mtv.corp.google.com>
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

Quoting dillon.minfei@gmail.com (2020-05-27 00:27:30)
> From: dillon min <dillon.minfei@gmail.com>
> 
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
> 
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> 
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
