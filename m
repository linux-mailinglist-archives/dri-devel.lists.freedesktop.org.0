Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C609021E2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FEA10E075;
	Mon, 10 Jun 2024 12:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7F10E075
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:47:56 +0000 (UTC)
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sGeQw-0005xB-GD; Mon, 10 Jun 2024 14:47:34 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: Re: [PATCH 00/14] improve Analogix DP AUX channel handling
Date: Mon, 10 Jun 2024 14:47:33 +0200
Message-ID: <3604253.eFTFzoEnKi@diego>
In-Reply-To: <20240503151129.3901815-1-l.stach@pengutronix.de>
References: <20240503151129.3901815-1-l.stach@pengutronix.de>
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

Am Freitag, 3. Mai 2024, 17:11:15 CEST schrieb Lucas Stach:
> Currently the AUX channel support in the Analogix DP driver is severely
> limited as the AUX block of the bridge is only initialized when the video
> link is to be enabled. This is okay for the purposes of link training,
> but does not allow to detect displays by probing for EDID. This series
> reworks the driver to allow AUX transactions before the video link is
> active.
> 
> As this requires to rework some of the controller initialization and
> also handling of both internal and external clocks, the series includes
> quite a few changes to add better runtime PM handling.
> 
> Lucas Stach (14):
>   drm/bridge: analogix_dp: remove unused platform power_on_end callback
>   drm/rockchip: analogix_dp: add runtime PM handling
>   drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
>   drm/bridge: analogix_dp: handle clock via runtime PM
>   drm/bridge: analogix_dp: remove unused analogix_dp_remove
>   drm/bridge: analogix_dp: remove clk handling from
>     analogix_dp_set_bridge
>   drm/bridge: analogix_dp: move platform and PHY power handling into
>     runtime PM
>   drm/bridge: analogix_dp: move basic controller init into runtime PM
>   drm/bridge: analogix_dp: remove PLL lock check from
>     analogix_dp_config_video
>   drm/bridge: analogix_dp: move macro reset after link bandwidth setting
>   drm/bridge: analogix_dp: don't wait for PLL lock too early
>   drm/bridge: analogix_dp: simplify and correct PLL lock checks
>   drm/bridge: analogix_dp: only read AUX status when an error occured
>   drm/bridge: analogix_dp: handle AUX transfer timeouts

my knowledge of Analgix-dp internals is limited, but at least both
rk3288-veyron and rk3399 gru still had working displays with this series
applied and both device classes using the analogix-dp for their main
display.

So on rk3288-veyron and rk3399-gru
Tested-by: Heiko Stuebner <heiko@sntech.de>


