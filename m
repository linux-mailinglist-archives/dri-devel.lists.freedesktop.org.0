Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217C8C0F92
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2CA10E21E;
	Thu,  9 May 2024 12:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70010E21E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:22:01 +0000 (UTC)
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s52mU-0007xX-8U; Thu, 09 May 2024 14:21:50 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Alex Bee <knaerzche@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Alex Bee <knaerzche@gmail.com>, sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 0/7] Add DSI support for RK3128
Date: Thu, 09 May 2024 14:21:47 +0200
Message-ID: <38423821.XM6RcZxFsP@diego>
In-Reply-To: <20240509120715.86694-1-knaerzche@gmail.com>
References: <20240509120715.86694-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Alex,

Am Donnerstag, 9. Mai 2024, 14:07:08 CEST schrieb Alex Bee:
> This series aims to add support for the DesignWare MIPI DSI controller and
> the Innoslicon D-PHY found in RK3128 SoCs. The code additions are rather
> tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
> this SoC, add support for an additional clock and do some changes in the
> SoC's clock driver. Support for the phy was already added when the
> Innosilicon D-PHY driver was initially submitted. I tested it with a
> 800x1280 DSI panel where all 4 lanes that are supported are used.
> 
> changes in v2:
>   To improve power-efficiency when the DSI controller is not in use, I
>   dropped the patch which made hclk_vio_h2p a critical clock and instead
>   added support for an AHB clock to the DSI controller driver and updated
>   the bindings and the addition to the SoC DT accordingly.

The naming already suggests that hclk_vio_h2p is not a clock-part of
the actual dsi controller, but more an internal thing inside the clock
controller.

At least naming and perceived functionality would suggest a chain of
	hclk_vio -> hclk_vio_h2p -> pclk_mipi

In any case, I really don't see hclk_vio_h2p to be in the realm of the
actual DSI controller, but more a part of clock-controller / interconnect.
Similar to the NIU clocks for the interconnect.

rk3588 actually tries to implement this already and while the
gate-link clocks are described as "recent", I think this definitly the same
concept used a most/all older Rockchip SoCs, just nobody cared about that
till now ;-) [0] .

So TL;DR I'd really prefer to not leak CRU-details into the DSI controller.


Heiko

[0] Which reminds me that I should look at Sebastian's make GATE-LINK
actually-work-patch.




