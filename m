Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAE4C2F9E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 16:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7734810EAE6;
	Thu, 24 Feb 2022 15:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4112510EADF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 15:27:37 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id E077523B79;
 Thu, 24 Feb 2022 16:27:33 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/5] drm/tiny: Add MIPI DBI compatible SPI driver
Date: Thu, 24 Feb 2022 16:27:03 +0100
Message-Id: <20220224152708.14459-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=KbX8TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8
 a=XqjdhIIK1VNfZnpq3w4A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset adds a driver that will work with most MIPI DBI compatible
SPI panels out there.

It can replace the SPI interface support in these drivers:

$ grep -lr MIPI_DCS drivers/staging/fbtft/ | grep -v "-" | uniq | sort
drivers/staging/fbtft/fb_hx8340bn.c
drivers/staging/fbtft/fb_hx8353d.c
drivers/staging/fbtft/fb_hx8357d.c
drivers/staging/fbtft/fb_ili9163.c
drivers/staging/fbtft/fb_ili9340.c
drivers/staging/fbtft/fb_ili9341.c
drivers/staging/fbtft/fb_ili9481.c
drivers/staging/fbtft/fb_ili9486.c
drivers/staging/fbtft/fb_s6d02a1.c
drivers/staging/fbtft/fb_st7735r.c
drivers/staging/fbtft/fb_st7789v.c
drivers/staging/fbtft/fb_tinylcd.c

Note that the MIPI DBI parallel interface supported by fbtft does not
yet exist in DRM.

Maxime gave[1] a good overview of the situation with these displays and
proposed to make a driver that works with all MIPI DBI compatible
controllers and use a firmware file to provide the controller setup for
a particular panel.

Changes since version 4:
- Add sainsmart18 to compatible items (Rob)
- Expand write-only description (Sam)
- kconfig: s/DRM_KMS_CMA_HELPER/DRM_GEM_CMA_HELPER/ (Sam)
- kconfig: Add select VIDEOMODE_HELPERS (Sam)
- kconfig: Add wiki url in the description (Sam)
- Split out and use of_get_drm_panel_display_mode()(Sam)
- Only use the first compatible to look for a firmware file since the
  binding mandates 2 compatibles.
- Make having a firmware file mandatory so we can print an error
  message if it's missing to improve the user experience. It's very
  unlikely that a controller doesn't need to be initialized and if
  it doesn't, it's possible to have a firmware file containing only
  a DCS NOP.

See wiki[2] for a script to make command firmware files.

Noralf.

[1] https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@houat/
[2] https://github.com/notro/panel-mipi-dbi/wiki


Noralf Trønnes (5):
  dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
  drm/modes: Remove trailing whitespace
  drm/modes: Add of_get_drm_panel_display_mode()
  drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
  drm/tiny: Add MIPI DBI compatible SPI driver

 .../display/panel/panel-mipi-dbi-spi.yaml     | 127 ++++++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/drm_modes.c                   |  51 ++-
 drivers/gpu/drm/tiny/Kconfig                  |  15 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         | 398 ++++++++++++++++++
 include/drm/drm_mipi_dbi.h                    |   8 +
 include/drm/drm_modes.h                       |   8 +
 8 files changed, 615 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 create mode 100644 drivers/gpu/drm/tiny/panel-mipi-dbi.c

-- 
2.33.0

