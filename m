Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1176249A2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5912710E0FE;
	Thu, 10 Nov 2022 18:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61EC10E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:39:59 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id io19so2186842plb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/ENiegKatEa49yjNORy5MxklDcwyC2/WB0nXjwNhQHE=;
 b=DRjRvbLqk7Md9E/fwhCV+NaMx8jh6SwebSkyHmHMt5RrLatuew7tLx1Mfzkb/N2QWf
 fG5v3UyXUVUjEbS6GyfoWhLZV1gnUw8r/w4NEvejqi9u+BaZVTkg3G2pS3i+FFLOj89E
 rMGoURtTmdxMgp+CmaK2wzUU6bUgsjhFD/AVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/ENiegKatEa49yjNORy5MxklDcwyC2/WB0nXjwNhQHE=;
 b=VqGDwkgbknWS/IrdxPNyh/71VywteSldcIbuVFrcMQpmVVHtGuK4tkCbpNrBwSs3NZ
 VqO3F09azrvqCoeZ3tqLkUwInS4ddIc3JkCZDqJf83eUPL28aPVTID9PrzagmkODEu6z
 GOiuIK7GDr4PDDU0jNHJa0UIaiJ06hM5lMW1xq/ImucbH5iee5Bf4rtURUEUHCzOngtC
 UyrSgFXuSpzY0ivnxsXnRO2/cOo8xrU6ob4DRVTwX87Y3VM5tB1ARXVvp+A6eoSoxfVc
 5ChU9BYTcU9FLCHklYNC7xC5U2kXtVmhdCuH539QrEU+IPVd7qn7sv8G653QpcXskld9
 GfsQ==
X-Gm-Message-State: ACrzQf0gq0xnVjIdRYAkOIBCBp3hdWCHXzdTvFHJPQ+1QdPJvdb6B6yg
 3in9ApnNH9USRTQxf3an58xd/w==
X-Google-Smtp-Source: AMsMyM6EoXwnrW0dDyRM3KLPMRLYkWlVwz2Zx7d0v+ZvtJa0rm5sA5GqlBQFKLxIRRnmcOmAAmt05w==
X-Received: by 2002:a17:902:c643:b0:186:9efc:67a1 with SMTP id
 s3-20020a170902c64300b001869efc67a1mr65112158pls.30.1668105599256; 
 Thu, 10 Nov 2022 10:39:59 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:39:58 -0800 (PST)
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
Subject: [PATCH v8 00/14] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Fri, 11 Nov 2022 00:08:39 +0530
Message-Id: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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

Patch 0001:	Fix MIPI_DSI*_NO_* mode bits

Patch 0002:	Properly name HSA/HBP/HFP/HSE bits

Patch 0003: 	Samsung DSIM bridge

Patch 0004:	PHY optional

Patch 0005:	OF-graph or Child node lookup

Patch 0006: 	DSI host initialization 

Patch 0007:	atomic check

Patch 0008:	PMS_P offset via plat data

Patch 0009:	atomic_get_input_bus_fmts

Patch 0010:	input_bus_flags

Patch 0011:	document fsl,imx8mm-mipi-dsim

Patch 0012:	add i.MX8M Mini/Nano DSIM support

Patch 0013:	document fsl,imx8mp-mipi-dsim

Patch 0014:	add i.MX8M Plus DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v8

Any inputs?
Jagan.

Jagan Teki (13):
  drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
  drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE bits
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Handle proper DSI host initialization
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add platform PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1908 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1766 +--------------
 include/drm/bridge/samsung-dsim.h             |  116 +
 8 files changed, 2162 insertions(+), 1653 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

