Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B835B3A72
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B47410EDC5;
	Fri,  9 Sep 2022 14:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641010EDC5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:12:53 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oWekR-0005nv-Fv; Fri, 09 Sep 2022 16:12:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH v2 4/5] phy/rockchip: inno-dsidphy: Add support for rk3568
Date: Fri, 09 Sep 2022 16:12:46 +0200
Message-ID: <42364235.doPnVEEUbh@diego>
In-Reply-To: <20220906174823.28561-5-macroalpha82@gmail.com>
References: <20220906174823.28561-1-macroalpha82@gmail.com>
 <20220906174823.28561-5-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 6. September 2022, 19:48:22 CEST schrieb Chris Morgan:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Rockchip RK3568 DSI-DPHY. Registers were taken from
> the BSP kernel driver and wherever possible cross referenced with the
> TRM.

With the amount of refactoring done below, I'd expect a bit more
introductory text here ;-)

I.e. about older variants of the phy only supporting 1GHz rates and
newer ones supporting up to 2.5GHz and that you refactor some things
to make both variants work.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
>  1 file changed, 158 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> index 630e01b5c19b..2c5847faff63 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -84,9 +84,25 @@
>  #define DATA_LANE_0_SKEW_PHASE_MASK		GENMASK(2, 0)
>  #define DATA_LANE_0_SKEW_PHASE(x)		UPDATE(x, 2, 0)
>  /* Analog Register Part: reg08 */
> +#define PLL_POST_DIV_ENABLE_MASK		BIT(5)
> +#define PLL_POST_DIV_ENABLE			BIT(5)
>  #define SAMPLE_CLOCK_DIRECTION_MASK		BIT(4)
>  #define SAMPLE_CLOCK_DIRECTION_REVERSE		BIT(4)
>  #define SAMPLE_CLOCK_DIRECTION_FORWARD		0
> +#define LOWFRE_EN_MASK				BIT(5)

PLL_POST_DIR_ENABLE above also is BIT(5) ... is this correct?


otherwise the changes look great.

Heiko


