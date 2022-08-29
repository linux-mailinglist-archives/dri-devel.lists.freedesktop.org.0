Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F45A5410
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DBB10F6BB;
	Mon, 29 Aug 2022 18:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633310F6BA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:40:56 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 i7-20020a17090adc0700b001fd7ccbec3cso5438355pjv.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=r2ueqdJVQe5nRhoyvelkc5U678dyLyAoNcF7oP8d5SM=;
 b=ZdTmSG69OZys0Cigel6eI0coybhsjfDyTLxzlYzHdheI4Q5YBI8P43RZqdF2Crl7QD
 SADucQ/eu5ynbwYh6j83A7hdeNLT+9nxwQzy2uD0Dw+PUV/nPtn3y3AkoZP38sNmo/8l
 Tp5tI+wLi2nvzpwaXojifwjPjt3N59BeT2j+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=r2ueqdJVQe5nRhoyvelkc5U678dyLyAoNcF7oP8d5SM=;
 b=3k+8D0Ov7GpfclqdZy3ovmbfYpdS03oiq87HgVNGCOXyfvqsM2YeQPpg+oQILOExkQ
 IoAXWSZS5+1kJmxWMyPCBtB3FmH5RAUQDIo098rNLcKnzt0VJ1jpSVH6pwgNJlqG+BPT
 bOO3wvhRA76IrbPQVIO3RonQHbHBVh6Nt1xKFCgtwoZ1OOMn6NgQwX7/rLAh1gVCQrzr
 M0Ej//GoFpHm96XFa0Ji3Y4B7wi5gd9JAylatT0N+sroM4Uuqv6MEt0/K9K5EnL0elCi
 qR6XdaxscvpwfSFyvQijD9NX7mXY8rav8nnieN5fifNhnkmXkOnr6jLyLAq/O3wJJf5t
 JDPQ==
X-Gm-Message-State: ACgBeo1gHX2yMDKyztBJVQ2/R4nvxZ3NntFbr9mTjUyWDm3p2Fprf3Qq
 gHkWVk0gYf69bmMhwZUSFmif8Q==
X-Google-Smtp-Source: AA6agR4Rnu50nteKvKRqn1phIwvi7qbywtOxkzOElGFT/DGlbGjPsDmXkWCvGu5M6N1habN6KR8DxQ==
X-Received: by 2002:a17:902:74c9:b0:174:e7dc:1dfb with SMTP id
 f9-20020a17090274c900b00174e7dc1dfbmr3759059plt.1.1661798455977; 
 Mon, 29 Aug 2022 11:40:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:40:55 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v4 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Tue, 30 Aug 2022 00:10:19 +0530
Message-Id: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

Previous v2 can be available here [1].

The final bridge supports both the Exynos and i.MX8MM DSI devices.

On, summary this patch-set break the entire DSIM driver into
- platform specific glue code for platform ops, component_ops.
- common bridge driver which handle platform glue init and invoke.

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Patch 0001:	Restore proper bridge chain in exynos_dsi

Patch 0002: 	Samsung DSIM bridge

Patch 0003:	Common lookup code for OF-graph or child

Patch 0004: 	plat_data quirk flag via driver_data

Patch 0005/10:  bridge fixes, atomic API's

Patch 0011:	document fsl,imx8mm-mipi-dsim

Patch 0012:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interested, please have a look on this repo [2] and 
boot log [3].

[3] https://gist.github.com/openedev/22b2d63b30ade0ba55ab414a2f47aaf0
[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v4
[1] https://patchwork.kernel.org/project/dri-devel/cover/20220720155210.365977-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (11):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Handle platform init via driver_data
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Handle proper DSI host initialization
  drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

Marek Szyprowski (1):
  drm: exynos: dsi: Restore proper bridge chain order

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1833 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |    3 -
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |    1 -
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1717 +--------------
 include/drm/bridge/samsung-dsim.h             |  107 +
 10 files changed, 2027 insertions(+), 1658 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

