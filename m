Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E676F827
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 05:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009B310E22C;
	Fri,  4 Aug 2023 03:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118C310E22C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gDKP5i31iXcB7XY3CqXxxapdhR7Wmw4nqvFeijbaPqw=; b=sYB4qL2oR+AXtSDWIhmnLdhQjI
 4TYGWK4XIRcf98vrdd5qZv8odaIHu3wmVZ2jFLZMkpIOyoDy99B/amCBWB/Cg+T+v4pHhdMNeq18/
 8QOU3oge6sBZPSIWZFvLzUopywaD2sMYm2w1Kaq4gU92fQ21ynEV670ZDnWHkyM4y4DHTQlqAbBUR
 WTfKFONe8Se45AYl0fjrkytU+87PXmuGv8HK7p7SmcSWIlPlhBqJ8iyQo/CSixYZDw1U6vnjrRFg1
 b5Bmr6v+Ba2F/a2lGTDdcLaLuJIJ/Gj+VNZxBZoqw98SEV6LdgHAsjHdPJINrn15GlGK/KysTKpZD
 uVsUbXqQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRl4P-00BQPu-1e; Fri, 04 Aug 2023 03:01:41 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: bridge: for GENERIC_PHY_MIPI_DPHY also select GENERIC_PHY
Date: Thu,  3 Aug 2023 20:01:37 -0700
Message-ID: <20230804030140.21395-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Aleksandr Nogikh <nogikh@google.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Chiras <robert.chiras@nxp.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Three DRM bridge drivers select GENERIC_PHY_MIPI_DPHY when GENERIC_PHY
might not be set.  This causes Kconfig warnings and a build error.

WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
  Depends on [n]: GENERIC_PHY [=n]
  Selected by [y]:
  - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
  - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]

(drm/bridge/cadence/Kconfig was found by inspection.)

aarch64-linux-ld: drivers/gpu/drm/bridge/samsung-dsim.o: in function `samsung_dsim_set_phy_ctrl':
drivers/gpu/drm/bridge/samsung-dsim.c:731: undefined reference to `phy_mipi_dphy_get_default_config_for_hsclk'

Prevent these warnings and build error by also selecting GENERIC_PHY
whenever selecting GENERIC_PHY_MIPI_DPHY.

Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
Fixes: 171b3b1e0f8b ("drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Aleksandr Nogikh <nogikh@google.com>
Link: lore.kernel.org/r/20230803144227.2187749-1-nogikh@google.com
Cc: Adam Ford <aford173@gmail.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Robert Foss <rfoss@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig         |    2 ++
 drivers/gpu/drm/bridge/cadence/Kconfig |    1 +
 2 files changed, 3 insertions(+)

diff -- a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -4,6 +4,7 @@ config DRM_CDNS_DSI
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
 	depends on OF
 	help
diff -- a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -181,6 +181,7 @@ config DRM_NWL_MIPI_DSI
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
 	select MFD_SYSCON
 	select MULTIPLEXER
@@ -227,6 +228,7 @@ config DRM_SAMSUNG_DSIM
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select GENERIC_PHY
 	select GENERIC_PHY_MIPI_DPHY
 	help
 	  The Samsung MIPI DSIM bridge controller driver.
