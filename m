Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB09F9208
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75C110E382;
	Fri, 20 Dec 2024 12:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Yq+tb1ps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793AE10E382
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:21:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBEE4A41B25;
 Fri, 20 Dec 2024 12:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B3BC4CECD;
 Fri, 20 Dec 2024 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734697316;
 bh=JduFaswRmxN5tGLStvzwUiaywMEIItZVTSmKsVx9nOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yq+tb1psbAD0EEaGVo62BeRkwh9Xj1zwGjU1RnX9bPc3zuKVZ+vFaKjzZirLF0O5Q
 cWqZTrj/8oUOashMDH0in9idt9Jf9pCN3xfKSbuna7zWsHJDYmyLi1Jgqy+04F5+b+
 WkFCtRLWZn13uCsuIFDP/5NAmVeHVQ3OLBfdEu0A=
Date: Fri, 20 Dec 2024 13:21:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Simon Xue <xxm@rock-chips.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Zhang Rui <rui.zhang@intel.com>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Andy Yan <andyshrk@163.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jose Abreu <joabreu@synopsys.com>, Jamie Iles <jamie@jamieiles.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Frank Wang <frank.wang@rock-chips.com>, linux-mmc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Finley Xiao <finley.xiao@rock-chips.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, David Wu <david.wu@rock-chips.com>,
 Shresth Prasad <shresthprasad7@gmail.com>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lukasz Luba <lukasz.luba@arm.com>, Jisheng Zhang <jszhang@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-phy@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-pwm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-serial@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Michael Turquette <mturquette@baylibre.com>, Tim Lunn <tim@feathertop.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH 00/38] rockchip: Add rk3562 support
Message-ID: <2024122018-groove-glitzy-f3bc@gregkh>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-1-kever.yang@rock-chips.com>
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

On Fri, Dec 20, 2024 at 06:37:46PM +0800, Kever Yang wrote:
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> The patch number is a little bit too big, some of them may need to split
> out for different maintainers, please let me know which patch need to
> split out.

I recommend you doing the split-apart as you know the dependencies here
the best, right?  Otherwise we all will just probably ignore them
assuming someone else is going to review/accept them...

thanks,

greg k-h
