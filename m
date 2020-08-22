Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B24C24F2C9
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11626EC6C;
	Mon, 24 Aug 2020 06:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05436E49B
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1598113985; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=OIRMU6Ka9KILmiWMpJ82zUDUAbNEms5l+b/pAns9p+U=;
 b=CIuiNhR4acJvQf8g1SBNCBqP+7oAcdtNnEiOIAF7hF+32te+Fa9PzaZNnULfFRTRrwZgJG
 D39CKS12nr9nLegsUNGNshEZ6Nii4fAcUM0xnYBlIC0hdL2bKFl3vtSQozJV9wO0F0V7ad
 J9hQjz2qZXqUzb6TJ1VxrBe/V72IqS4=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Noralf Tronnes <noralf@tronnes.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/6] DSI/DBI, panel drivers, & tinyDRM v2
Date: Sat, 22 Aug 2020 18:32:44 +0200
Message-Id: <20200822163250.63664-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a V2 of my patchset that attempts to clean up the current
situation with DSI/DBI panels drivers, and tinyDRM.

For the record, here is a small sum-up of the current situation:

- the current MIPI DBI code (drivers/gpu/drm/drm_mipi_dbi.c) is lagging
  way behind the MIPI DSI code (drivers/gpu/drm/drm_mipi_dsi.c). While
  the DSI code adds a proper bus support, with support for host drivers
  and client devices, there is no such thing with the DBI code. As such,
  it is currently impossible to write a standard DRM panel driver for a
  DBI panel.

- Even if the MIPI DBI code was updated with a proper bus, many panels
  and MIPI controllers support both DSI and DBI, so it would be a pain
  to support them without resolving to duplicating each driver.

- The panel drivers written against the DBI code are all "tinyDRM"
  drivers, which means that they will register a full yet simple DRM
  driver, and cannot be used as regular DRM panels for a different DRM
  driver.

- These "tinyDRM" drivers all use SPI directly, even though the panels
  they're driving can work on other interfaces (e.g. i8080 bus). Which
  means that one driver written for e.g. a ILI9341 would not work if
  the control interface is not SPI.

- The "tinyDRM" common code is entangled with DBI and there is no clear
  separation between the two. It could very well be moved to a single
  "tinyDRM" driver that works with a DRM panel obtained from devicetree,
  because the only requirement is that the panel supports a few given
  DCS commands.

Noteworthy changes since V1:

* The DT binding document for the NV3052C panel has been updated with
  the feedback I got from V1. It now supports multiple power supplies.

* Instead of using macros to define bus types, we now have an enum
  mipi_dcs_bus_type.

* The WARN_ONE_ONCE() that were in place to check that the host and
  client drivers provided the DCS bus bitmask is gone, we just default
  to DSI instead.

* DBI/SPI driver code was moved out of drivers/gpu/drm/bridge/.

* The DBI/SPI driver is registered as a driver by each client if needed,
  they just call module_mpi_dbi_spi_driver(). This addresses the issue
  in V1 that compatible strings had to be added to two different places.

* NV3052C and ILI9341 panel drivers were updated to remove custom
  backlight handling, call drm_panel_{disable,unprepare} on module exit,
  and various small fixes.

For a more detailed changelog, see the header of each individual patch.

Paul Cercueil (6):
  dt-bindings: display: Document NewVision NV3052C DT node
  drm: dsi: Let host and device specify supported bus
  drm: Add SPI DBI host driver
  drm/tiny: Add TinyDRM for DSI/DBI panels
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/panel: Add Ilitek ILI9341 DBI panel driver

 .../display/panel/newvision,nv3052c.yaml      | 100 ++++
 drivers/gpu/drm/Kconfig                       |   8 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_mipi_dbi_spi.c            | 247 +++++++++
 drivers/gpu/drm/drm_mipi_dsi.c                |   9 +
 drivers/gpu/drm/panel/Kconfig                 |  18 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  | 318 +++++++++++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 510 ++++++++++++++++++
 drivers/gpu/drm/tiny/Kconfig                  |   8 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/tiny-dsi.c               | 266 +++++++++
 include/drm/drm_mipi_dbi_spi.h                |  42 ++
 include/drm/drm_mipi_dsi.h                    |  44 ++
 14 files changed, 1574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3052c.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_spi.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c
 create mode 100644 drivers/gpu/drm/tiny/tiny-dsi.c
 create mode 100644 include/drm/drm_mipi_dbi_spi.h

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
