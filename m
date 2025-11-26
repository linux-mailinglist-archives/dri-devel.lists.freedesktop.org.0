Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BAC8B37E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71F610E6A9;
	Wed, 26 Nov 2025 17:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PhkSyYww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1EDE10E6A9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:36:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E9F50C16A0B;
 Wed, 26 Nov 2025 17:36:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A50D560721;
 Wed, 26 Nov 2025 17:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B67A102F1D8D; Wed, 26 Nov 2025 18:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764178605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=zFZ6kGeHeLZM9HVH30FgdiT3F0hPdtYLxyJtGV/89KA=;
 b=PhkSyYwwwVzNX9HFnIrE0j0EJKkw4WvjPWIzre6oNKlUCAH9A3ZzgjI1eDMMIb4RmqBmxE
 SHnXV504VW4nzNTy95G6yA9LKWJO93g8ERbr1KBrrzKx5ctLr8VCG3HGnXut/cj3mmZ96i
 RwCz6wIMQX10e4A2Zv5l6CC7sXh31vT5qTuv06VfGmG/yFsf+JdAAUoraoOTjrzoBsDYQj
 LMhhj00xVPInK1SF2AAAJiCn6KJhnfzjbrWGc2I8g5PJpJ3tCrWAjL0MWcTRziW/9Bh3WP
 LnJpo/Cx/SSOAJHIRGCXTTSEX9OZQfMdKSGK57thek7lPcTNlLuTaPMZy0cmFA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Subject: [PATCH 00/21] Clean and update tilcdc driver to support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Wed, 26 Nov 2025 18:35:42 +0100
Message-Id: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG46J2kC/x3MQQqAIBBA0avErBNUrLCrRETpWANRoRaBePek5
 Vv8nyCgJwzQVwk8PhToPApEXYHZ5mNFRrYYJJeN4EIxh3O8PU6RdmMN67SxSmPbLU5DiS6Pjt5
 /OIw5f92TcylgAAAA
X-Change-ID: 20251014-feature_tilcdc-79cd49e67bf9
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
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

The starting point for this work was adding support for the HDMI cape:
https://www.seeedstudio.com/Seeed-Studio-BeagleBone-Green-HDMI-Cape.html
This will be sent in a later series.

Initially, Miguel proposed modifying the ite-it66121 bridge to support
the legacy behavior without the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag:
https://lore.kernel.org/lkml/20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com/
This patch was NAK'd as we don't want to add more legacy code. Maxime
requested that the tilcdc driver be updated to use
DRM_BRIDGE_ATTACH_NO_CONNECTOR instead.

While working on this update, I discovered that the tilcdc driver
contained significant amounts of legacy code that needed cleaning.
Since this driver was developed alongside the tda998x driver for
several AM335x boards, the tda998x driver also required cleanup and
support for the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

This series is based on the tilcdc fix sent to mainline:
https://lore.kernel.org/lkml/20251125090546.137193-1-kory.maincent@bootlin.com/

Patch 1-7: Convert tilcdc binding to YAML and remove the ti,tilcdc,panel
	   sub-binding and driver
Patch 8-16: Clean up tilcdc driver
Patch 17-19: Clean up tda998x driver
Patch 20: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tda998x
Patch 21: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR support to tilcdc

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
Kory Maincent (TI.com) (21):
      dt-bindings: display: tilcdc: Convert to DT schema
      dt-bindings: display: tilcdc: Add fifo-threshold property
      drm/tilcdc: Remove simulate_vesa_sync flag
      drm/tilcdc: Add support for DRM bus flags and simplify panel config
      ARM: dts: omap: Bind panel to panel-dpi instead of ti,tilcdc,panel driver
      dt-bindings: display: tilcdc: Remove panel binding
      drm/tilcdc: Remove tilcdc panel driver
      drm/tilcdc: Remove component framework support
      drm/tilcdc: Remove tilcdc_panel_info structure
      drm/tilcdc: Remove redundant #endif/#ifdef in debugfs code
      drm/tilcdc: Remove unused encoder and connector tracking arrays
      drm/tilcdc: Rename external_encoder and external_connector to encoder and connector
      drm/tilcdc: Rename tilcdc_external to tilcdc_encoder
      drm/tilcdc: Remove the useless module list support
      drm/tilcdc: Modernize driver initialization and cleanup paths
      drm/tilcdc: Remove the use of drm_device private_data
      drm/bridge: tda998x: Remove component support
      drm/bridge: tda998x: Move tda998x_create/destroy into probe and remove
      drm/bridge: tda998x: Remove useless tda998x_connector_destroy wrapper
      drm/bridge: tda998x: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR
      drm/tilcdc: Add support for DRM_BRIDGE_ATTACH_NO_CONNECTOR

 .../devicetree/bindings/display/tilcdc/panel.txt   |  66 ---
 .../devicetree/bindings/display/tilcdc/tilcdc.txt  |  82 ----
 .../devicetree/bindings/display/tilcdc/tilcdc.yaml | 103 +++++
 arch/arm/boot/dts/ti/davinci/da850-evm.dts         |  26 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts      |  25 +-
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  21 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |  22 +-
 arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dts      |  25 +-
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts          |  25 +-
 drivers/gpu/drm/bridge/tda998x_drv.c               | 251 ++++++------
 drivers/gpu/drm/tilcdc/Makefile                    |   3 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c               | 117 ++----
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 456 +++++++--------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h                |  88 +---
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c            |  93 +++++
 .../tilcdc/{tilcdc_external.h => tilcdc_encoder.h} |   5 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c           | 179 --------
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 408 ------------------
 drivers/gpu/drm/tilcdc/tilcdc_panel.h              |  15 -
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h               |   8 +-
 21 files changed, 589 insertions(+), 1431 deletions(-)
---
base-commit: 670bacfc7579bdd79a3069cfb5ab60a6a7923003
change-id: 20251014-feature_tilcdc-79cd49e67bf9

Best regards,
-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

