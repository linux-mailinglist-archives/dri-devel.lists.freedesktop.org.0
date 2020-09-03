Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAAF25C7A5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB8F6EA13;
	Thu,  3 Sep 2020 16:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4886EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:25 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY5-0003Y5-GI; Thu, 03 Sep 2020 18:57:24 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L33-GY; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:01 +0200
Message-Id: <20200903165717.1272492-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
the Exynos Decon. The driver for the LCDIF does not use the component
framework, but uses drm bridges.

This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
with such drivers. Although the driver is converted, it still supports the
component framework API to stay compliant with the Exynos DRM driver.

Unfortunately, I don't have any Exynos SoC to actually test the series.  I
tested the driver with a few additional unfinished patches on the i.MX8M Mini
EVK, but somebody should definitely verify that the driver is still working on
Exynos hardware.

Patch 1 is a quick documentation fix.

Patches 2 to 6 implement the drm bridge interface.

Patches 7 to 12 rework the driver to make it easier to split platform specific
from common code.

Patches 13 and 14 add callbacks to handle the tearing effect interrupt and to
tell the Exynos DRM driver, if the MIPI DSI bridge is using command or video
mode. I am not too happy with these callbacks and any suggestion for a better
solution is very welcome.

Patches 15 and 16 finally split and move the drm bridge driver out of the
Exynos DRM driver.

Michael


Michael Tretter (16):
  drm/encoder: remove obsolete documentation of bridge
  drm/exynos: extract helper functions for probe
  drm/exynos: remove in_bridge_node from exynos_dsi
  drm/exynos: implement a drm bridge
  drm/exynos: convert encoder functions to bridge function
  drm/exynos: configure mode on drm bridge
  drm/exynos: get encoder from bridge whenever possible
  drm/exynos: use exynos_dsi as drvdata
  drm/exynos: call probe helper from bind
  drm/exynos: move dsi host registration to probe helper
  drm/exynos: shift register values to fields on write
  drm/exynos: use identifier instead of register offsets
  drm/exynos: add callback for tearing effect handler
  drm/exynos: add callback for enabling i80 mode
  drm/exynos: split out platform specific code
  drm/exynos: move bridge driver to bridges

 drivers/gpu/drm/bridge/Kconfig          |    7 +
 drivers/gpu/drm/bridge/Makefile         |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c   | 1797 ++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1843 ++---------------------
 include/drm/bridge/samsung-dsim.h       |   57 +
 include/drm/drm_encoder.h               |    1 -
 6 files changed, 1967 insertions(+), 1739 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
