Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C515F1AC4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DEE10E36F;
	Sat,  1 Oct 2022 08:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9D210E36F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:07:15 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id w2so6145734pfb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=f2/sunB1LnJ5LmZFp20lgms1Dr4ed7SwWpkE0LxREhs=;
 b=eYE9fxG/g4fN3hv1Xsn4GWm0owQ1/xJHmjy2kVEJaeCobw9OD4Zb1hAcXfBG1uHR0f
 RWzUnNhi1jMP6L3FxYy0bzfeW/hHBrW+jDbVsuWpmRElnAm3QJIk6sonaTDLOTIMPqbi
 KVJWAHGiGg5gfY4npA4G+8jIuwM5n3t/o2vmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=f2/sunB1LnJ5LmZFp20lgms1Dr4ed7SwWpkE0LxREhs=;
 b=IracUMwp+xVwCZozGzYIKvz/1fQApZsdLCs5+FgAr4R84pPPIkUrB5lPRDzAtnfCzR
 vuhtBaFmQYEZJYrGK8DSehSEPDzfT/28EPCsk3pn7UvgEIljUKWbO96kGjiajwvI1OTn
 djIfIWWUa6BoDDhMm8szJZI0dOzr8mgWPaZajBIXzMYIC5YC+Fs+RhfYI5YJDdSLqzdC
 yFGcrIvteKezjlP36ZfSA+Vxo5i4273QFHT8cs/Qfpp9qmCADxu+bd4o4ExEMDCCO3P6
 leuhuzRhxTV1C7QsASCNH3t0MStglrLIstSkJlDJyCwkXSd+9N331fZTnJ2KW8Z5A5zV
 YMxw==
X-Gm-Message-State: ACrzQf0zeYnUXnDcIrD/fxw6dUVAUxXPnk+pA1ccPqluew/bekUAOrKM
 Z1eGWGC97dz9ZuyJEAlmfI+L2A==
X-Google-Smtp-Source: AMsMyM7JKh6uflQudzYdb0q2EMBIAzFGt0PglXp9ph2b8jjHveHvi3EIGRF0AvVL+Y2Tz6t/KcFuVA==
X-Received: by 2002:a65:4bc1:0:b0:439:e6a5:122a with SMTP id
 p1-20020a654bc1000000b00439e6a5122amr10666688pgr.443.1664611634883; 
 Sat, 01 Oct 2022 01:07:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:07:14 -0700 (PDT)
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
Subject: [PATCH v6 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Sat,  1 Oct 2022 13:36:40 +0530
Message-Id: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

The final bridge supports both the Exynos and i.MX8MM DSI devices.

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

Patch 0001: 	Samsung DSIM bridge

Patch 0002:	PHY optional

Patch 0003:	OF-graph or Child node lookup

Patch 0004: 	DSI host initialization 

Patch 0005:	atomic check

Patch 0006:	PMS_P offset via plat data

Patch 0007:	atomic_get_input_bus_fmts

Patch 0008:	input_bus_flags

Patch 0009:	document fsl,imx8mm-mipi-dsim

Patch 0010:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v6

Any inputs?
Jagan.

Jagan Teki (10):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Handle proper DSI host initialization
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1856 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1769 ++--------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2111 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

