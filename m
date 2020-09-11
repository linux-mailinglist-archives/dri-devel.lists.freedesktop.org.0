Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0122660AF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956FE6EA26;
	Fri, 11 Sep 2020 13:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58A76E34C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:54:20 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kGjVK-0007wN-46; Fri, 11 Sep 2020 15:54:18 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kGjVH-00FKnN-G9; Fri, 11 Sep 2020 15:54:15 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Fri, 11 Sep 2020 15:53:57 +0200
Message-Id: <20200911135413.3654800-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH v2 00/16]  drm/exynos: Convert driver to drm bridge
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, narmstrong@baylibre.com,
 sw0312.kim@samsung.com, Michael Tretter <m.tretter@pengutronix.de>,
 krzk@kernel.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v2 of the series to convert the Exynos MIPI DSI driver into a drm
bridge and make it usable with other drivers. Although the driver is
converted, it still supports the component framework API to stay compliant
with the Exynos DRM driver.

The Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
the Exynos Decon. The driver for the LCDIF does not use the component
framework, but uses drm bridges.

I don't have any Exynos SoC to actually test the series. I build a dummy to
test the bridge with a component driver, to make sure that at least the
initialization is working. Furthermore, tested the driver as a bridge with a
few additional unfinished patches on the i.MX8M Mini EVK. However, somebody
should verify that the driver is still working on Exynos hardware.

I also changed the order of the patches to first make the driver more platform
independent (patches 2 to 8), then convert to a drm bridge driver (patches 10
to 13) and finally expose the API, split the code and move the platform
independent driver to the bridges (patches 14 - 16). Hopefully this simplifies
testing/bisecting and helps me to understand potential error reports.

Also I added host_ops for attach/detach and the tearing effect handler to make
the calls into the platform code more visible.

Furthermore, the series should now apply to linux-next and correctly build the
exynos_defconfig.

Thanks,

Michael

Changelog:

v2:
- rebase on linux-next
- verify with exynos_defconfig
- fix crashes reported by Marek Szyprowski Exynos3250-based Rinato
- reorder patches
- add host_ops for platform specific code
- roughly test component framework integration with dummy

Michael Tretter (16):
  drm/encoder: remove obsolete documentation of bridge
  drm/exynos: remove in_bridge_node from exynos_dsi
  drm/exynos: use exynos_dsi as drvdata
  drm/exynos: extract helper functions for probe
  drm/exynos: move dsi host registration to probe
  drm/exynos: shift register values to fields on write
  drm/exynos: use identifier instead of register offsets
  drm/exynos: add host_ops callback for platform drivers
  drm/exynos: add callback for tearing effect handler
  drm/exynos: implement a drm bridge
  drm/exynos: convert encoder functions to bridge function
  drm/exynos: configure mode on drm bridge
  drm/exynos: get encoder from bridge whenever possible
  drm/exynos: add API functions for platform drivers
  drm/exynos: split out platform specific code
  drm/exynos: move bridge driver to bridges

 drivers/gpu/drm/bridge/Kconfig          |    9 +
 drivers/gpu/drm/bridge/Makefile         |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c   | 1790 +++++++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig          |    5 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1927 ++---------------------
 include/drm/bridge/samsung-dsim.h       |   64 +
 include/drm/drm_encoder.h               |    1 -
 7 files changed, 2027 insertions(+), 1770 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
