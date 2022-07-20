Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF657BACE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:52:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBCE8AF9D;
	Wed, 20 Jul 2022 15:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C788B01A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:52:29 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id r24so4216891plg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYWZwhb1ZSYMdId0x3rlbXi6AM1i5QxI3S7xvaz7eF8=;
 b=oJwEosghuEyW84bAjoYVaYX4vS8LQabWRNbFU/6Q9EmovdXw/CKLRqjMqEn/crpQAO
 cWcVXjz3iR98DiJV7aNuoka9yeY1GS9XD4rZEUEomDcWFqYDUdQjYFuP1WHark2/KjJc
 iZZfWdmpQfZmNl2fc8ujSCdtVbnLIp2QPT958=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYWZwhb1ZSYMdId0x3rlbXi6AM1i5QxI3S7xvaz7eF8=;
 b=ludWbHCCI3zc0l896RnznN5C7opUM8lgk3Fk18+4iD5PfYY/gTzV84bwgpbQtXHBKT
 ejTmI0QS7iyBAgEdhGU0CLoQsGzgGq3snuqx/TGdd7ZVj0TJ+htIv5Wp67jRi92g2iyO
 cZxC61bKA2hYZTQNHklJkpHto1tZE7x0RfsZsGE2ZruO20f3mkdad6kVf0P7QinU2TNW
 gQLetJopWpe/dCcCAPyZXQUMGyl0XIpthIDo/1f7h8pKn4Wy5Wufd5oB+EnKMEvPNyT3
 8lGT8YNS49RVWtcXfz7TerGnGxM8c8NHp0SZxL+tMCy1rl/bad+VjN1klMzr73X4O3WG
 AF7g==
X-Gm-Message-State: AJIora86dZQFaKAd0akoLLHjEk2+h5uBMBj7aG/WPjrARPjXlAVDEm7y
 p5FwBW+hISVpcZ0sIxtFaE3dAQ==
X-Google-Smtp-Source: AGRyM1vIlPt6mZ1DC9Q8SplUz9lA4D9c/ORKQb71HYgrzZMeOpaX7fVkWmaxn+AuVF+Vhv4zcJTvSg==
X-Received: by 2002:a17:90b:3890:b0:1f0:2abb:e7d1 with SMTP id
 mu16-20020a17090b389000b001f02abbe7d1mr6270480pjb.158.1658332349528; 
 Wed, 20 Jul 2022 08:52:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:52:29 -0700 (PDT)
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
Subject: [PATCH v3 00/13] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Wed, 20 Jul 2022 21:21:57 +0530
Message-Id: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

Patch 0001:	Restore proper bridge chain in exynos_dsi

Patch 0002: 	Samsung DSIM bridge

Patch 0003:	Common lookup code for OF-graph or child

Patch 0004: 	plat_data quirk flag via driver_data

Patch 0005/11:  bridge fixes, atomic API's

Patch 0012:	document fsl,imx8mm-mipi-dsim

Patch 0013:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interested, please have a look on this repo [2]

[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2 
[1] https://patchwork.kernel.org/project/dri-devel/cover/20220504114021.33265-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (12):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Lookup OF-graph or Child node devices
  drm: bridge: samsung-dsim: Handle platform init via driver_data
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
  drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

Marek Szyprowski (1):
  drm: exynos: dsi: Restore proper bridge chain order

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |    8 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1850 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1717 +--------------
 include/drm/bridge/samsung-dsim.h             |  106 +
 8 files changed, 2042 insertions(+), 1654 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

