Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0065F5733
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31BE10E09E;
	Wed,  5 Oct 2022 15:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4263510E09E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:13:20 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id y189so11203336iof.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p1b/OkZVE0RzV7zia8rRogaQ7aQF3pfaZimR6lGLDog=;
 b=diIXyEYNda1xcH4QZUqkqsVHDjzHdPiYi9gt6Jmkp2mv7z+f8ZrI/b5LM0FluhspRk
 ub/ZRGjbZQKfROu3PD7L/YiJ9Y1vMLd3dkFzvGlbzcGouEVBNSHK0mDAf4vdONi9H7tw
 +v36EKHZyYYcQX/xQZYkrO13nqD6GB08UzEWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p1b/OkZVE0RzV7zia8rRogaQ7aQF3pfaZimR6lGLDog=;
 b=l/8q5Hi/7kZyqDOmZnMJNU2UOVz/v3nJX48k5l4P2T+HKWxvONm1qpyvJKrlC9Ompl
 FATrAZg/znxLEobk1zswYlsUIVvajj/nDUqEXFID/yTotcG08KzKn91D3TnI3Tuyg1VB
 n6dakpNr8q/fywphKOTRSFMVJabhzWZAnd9Q6ngPfOUoFRK6XGLQu0Kymi2xZoJO9Yrp
 ki6QvHmrHdHh+/WmAwPWvegBNLBStIxCliIkYhxy5+RNHX+oFoYRryXwCkQ9mPjdH2cy
 o4lqFsMNfBbN862+p3DveT9m86HsrzkPPPLvOE1VxR/Ahh1501J+UzxtPsAUjMP9VPZp
 NkSA==
X-Gm-Message-State: ACrzQf0cCEuWad9p7jl5EmHzLs7NN6ZfHvuNkfwBhdj+SDHbNhekTyHf
 xmcWEvJ0HILbwnCVa0/o5ZhQsg==
X-Google-Smtp-Source: AMsMyM7yCcF+7doyamms1Xy0nXKGpHXASuNpsqSYFXaX4PPlbtMRZNiDUYYHW+R3KkO1lPSxdNsMDA==
X-Received: by 2002:a05:6638:13ca:b0:35a:7ece:3c6a with SMTP id
 i10-20020a05663813ca00b0035a7ece3c6amr54330jaj.318.1664982799364; 
 Wed, 05 Oct 2022 08:13:19 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:13:18 -0700 (PDT)
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
Subject: [PATCH v7 00/10] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Wed,  5 Oct 2022 20:42:59 +0530
Message-Id: <20221005151309.7278-1-jagan@amarulasolutions.com>
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
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v7

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
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +---------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2108 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

