Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D650976D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 08:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B29A10F33C;
	Thu, 21 Apr 2022 06:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87A5610E370
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 06:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 53E33811B;
 Thu, 21 Apr 2022 06:21:49 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:24:39 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 40/41] [TO BE REBASED] ARM: OMAP1: clock: Convert to CCF
Message-ID: <YmD4p+09B/dq54XL@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-41-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419133723.1394715-41-arnd@kernel.org>
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
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Arnd Bergmann <arnd@kernel.org> [220419 13:39]:
> From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> +	/* protect clk->enable_reg from concurrent access via clk_set_rate() */
> +	if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_CKCTL))
> +		spin_lock_irqsave(&arm_ckctl_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(ARM_IDLECT2))
> +		spin_lock_irqsave(&arm_idlect2_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_0))
> +		spin_lock_irqsave(&mod_conf_ctrl_0_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(MOD_CONF_CTRL_1))
> +		spin_lock_irqsave(&mod_conf_ctrl_1_lock, flags);
> +	else if (clk->enable_reg == OMAP1_IO_ADDRESS(SWD_CLK_DIV_CTRL_SEL))
> +		spin_lock_irqsave(&swd_clk_div_ctrl_sel_lock, flags);
> +

Eventually there should be just separate clock controller instances for
the clock registers banks, and then this should all disappear as the
lock is instance specific. Anyways, that's probably best done as a separate
changes later on.

Regards,

Tony
