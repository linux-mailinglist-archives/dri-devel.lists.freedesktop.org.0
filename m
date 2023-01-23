Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A8677ABA
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F21F10E34F;
	Mon, 23 Jan 2023 12:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A858D10E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:23:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id z13so11193406plg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aIEL5P6p2AgUUtZFiRe5g0PuF0Ki6dnU36M7iQ78QJo=;
 b=dHvjQk4fZccAWq195lGXzY+sGlK8ijb+kUXPtUAQyDLduf9h2ELuGdd+eLJRCV/WvQ
 huC0xXCrcaX092cyTm9vCmSNdPTD8Obr72vUm2qmk0BCWpG0zVF6djhRluop36aiwUke
 gEahZG/2O8VtbvHQ8I2SzmSdvN26xIkqtiomo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aIEL5P6p2AgUUtZFiRe5g0PuF0Ki6dnU36M7iQ78QJo=;
 b=g4YHHSu8r+hfApssgdP94QHUMEC4LUNGswnAvK5g5Glp9mZT466w+JJWycs2RR94YY
 DlzC7F2RVEMvqvG/e874Spq0O2JeMXydJXO6r5xal9spvP7z7k2rEVSbATME1zTMNvqO
 L+tuGPpVs73lfY/vBCgOmNRQhvC2hTd5gB5UHhrgZK2FWERM+AGAYw3h2KWlsrxH3fqu
 NBByhO9DK0hHVqoa1EaXR0VjLvO5XD22Oazk4NZk9ufusOpno0DYezUQ03yjLkGhBJk6
 kleH/JMADPg1pm29JvAgTRyZ+QMUgNA3k9gXz5HgRCKcnPtUXzpCUYX9ko7KrbqViync
 s1rg==
X-Gm-Message-State: AFqh2kpCXkaQfE0Cbp4kz7UWv/vv78DBw0n9xwVOUyIhWfYu/A3FUjcC
 afQKUUic9U66oiQLNR5XuwpezQ==
X-Google-Smtp-Source: AMrXdXveIkHkD/fQ5P3u2SJOkve1VXA+Lvybo5Wx4KBxfNIXMhG84UybnrksjDTPH8WX3IjvBnV5pQ==
X-Received: by 2002:a17:902:b083:b0:194:d057:46e5 with SMTP id
 p3-20020a170902b08300b00194d05746e5mr14536604plr.62.1674476615077; 
 Mon, 23 Jan 2023 04:23:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:23:34 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v11 00/18] drm: Add Samsung MIPI DSIM bridge
Date: Mon, 23 Jan 2023 17:53:01 +0530
Message-Id: <20230123122319.261341-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Patch 0001 - 0004: adding devm_drm_of_dsi_get_bridge

Patch 0005 - 0006: optional PHY, PMS_P offset

Patch 0007       : introduce hw_type

Patch 0008	 : fixing host init

Patch 0009	 : atomic_check

Patch 0010	 : input_bus_flags

Patch 0011	 : atomic_get_input_bus_fmts

Patch 0012 - 0013: component vs bridge

Patch 0014	 : DSIM bridge

Patch 0015 - 0016: i.MX8M Mini/Nano

Patch 0017 - 0018: i.MX8M Plus

Changes for v11:
- collect RB from Frieder Schrempf
- collect ACK from Rob
- collect ACK from Robert
- fix BIT macro replacements
- fix checkpatch --strict warnings
- fix unneeded commit text
- drop extra lines

Changes for v10:
- rebase on drm-misc-next
- add drm_of_dsi_find_panel_or_bridge
- add devm_drm_of_dsi_get_bridge
- fix host initialization (Thanks to Marek Szyprowski)
- rearrange the tiny patches for easy to review
- update simple names for enum hw_type
- add is_hw_exynos macro
- rework on commit messages

Changes for v9:
- rebase on drm-misc-next
- drop drm bridge attach fix for Exynos
- added prepare_prev_first flag
- added pre_enable_prev_first flag
- fix bridge chain order for exynos
- added fix for Exynos host init for first DSI transfer
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20
- added MEDIA_BUS_FMT_YUYV12_1X24

Changes for v8:
* fixed comment lines
* fixed commit messages
* fixed video mode bits
* collect Marek Ack
* fixed video mode bit names
* update input formats logic
* added imx8mplus support

Changes for v7:
* fix the drm bridge attach chain for exynos drm dsi driver
* fix the hw_type checking logic

Changes for v6:
* handle previous bridge for exynos dsi while attaching bridge 

Changes for v5:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next

Changes for v4:
* include Inki Dae in MAINTAINERS
* remove dsi_driver probe in exynos_drm_drv to support multi-arch build
* update init handling to ensure host init done on first cmd transfer

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://github.com/openedev/kernel/tree/imx8mm-dsi-v11

v10:
https://lore.kernel.org/all/20221214125907.376148-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (16):
  drm: of: Lookup if child node has DSI panel or bridge
  drm: bridge: panel: Add devm_drm_of_dsi_get_bridge helper
  drm: exynos: dsi: Drop explicit call to bridge detach
  drm: exynos: dsi: Switch to devm_drm_of_dsi_get_bridge
  drm: exynos: dsi: Mark PHY as optional
  drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
  drm: exynos: dsi: Introduce hw_type platform data
  drm: exynos: dsi: Add atomic check
  drm: exynos: dsi: Add input_bus_flags
  drm: exynos: dsi: Add atomic_get_input_bus_fmts
  drm: exynos: dsi: Consolidate component and bridge
  drm: exynos: dsi: Add Exynos based host irq hooks
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
  drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/panel.c                |   34 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1884 +++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  112 +-
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1793 +---------------
 include/drm/bridge/samsung-dsim.h             |  118 ++
 include/drm/drm_bridge.h                      |    2 +
 include/drm/drm_of.h                          |   12 +
 12 files changed, 2284 insertions(+), 1696 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

