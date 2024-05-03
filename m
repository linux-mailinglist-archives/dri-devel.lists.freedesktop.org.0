Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B278BAF80
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 17:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A2A11309E;
	Fri,  3 May 2024 15:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4309113097
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 15:12:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2uZR-0004Br-K7; Fri, 03 May 2024 17:11:33 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s2uZN-00FjHY-C5; Fri, 03 May 2024 17:11:29 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH 00/14] improve Analogix DP AUX channel handling
Date: Fri,  3 May 2024 17:11:15 +0200
Message-Id: <20240503151129.3901815-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Currently the AUX channel support in the Analogix DP driver is severely
limited as the AUX block of the bridge is only initialized when the video
link is to be enabled. This is okay for the purposes of link training,
but does not allow to detect displays by probing for EDID. This series
reworks the driver to allow AUX transactions before the video link is
active.

As this requires to rework some of the controller initialization and
also handling of both internal and external clocks, the series includes
quite a few changes to add better runtime PM handling.

Lucas Stach (14):
  drm/bridge: analogix_dp: remove unused platform power_on_end callback
  drm/rockchip: analogix_dp: add runtime PM handling
  drm/bridge: analogix_dp: register AUX bus after enabling runtime PM
  drm/bridge: analogix_dp: handle clock via runtime PM
  drm/bridge: analogix_dp: remove unused analogix_dp_remove
  drm/bridge: analogix_dp: remove clk handling from
    analogix_dp_set_bridge
  drm/bridge: analogix_dp: move platform and PHY power handling into
    runtime PM
  drm/bridge: analogix_dp: move basic controller init into runtime PM
  drm/bridge: analogix_dp: remove PLL lock check from
    analogix_dp_config_video
  drm/bridge: analogix_dp: move macro reset after link bandwidth setting
  drm/bridge: analogix_dp: don't wait for PLL lock too early
  drm/bridge: analogix_dp: simplify and correct PLL lock checks
  drm/bridge: analogix_dp: only read AUX status when an error occured
  drm/bridge: analogix_dp: handle AUX transfer timeouts

 .../drm/bridge/analogix/analogix_dp_core.c    | 196 ++++++++----------
 .../drm/bridge/analogix/analogix_dp_core.h    |   7 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  38 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.h |   9 +
 drivers/gpu/drm/exynos/exynos_dp.c            |   5 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  26 +--
 include/drm/bridge/analogix_dp.h              |   4 +-
 7 files changed, 120 insertions(+), 165 deletions(-)

-- 
2.39.2

