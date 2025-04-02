Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2E4A78E73
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404810E777;
	Wed,  2 Apr 2025 12:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="chYKSqCm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD15910E775
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=oGUkH
 84hkPBzmx/lS7RDwXwqM5OPP1Xjz5Ep4c4bpzw=; b=chYKSqCmtnnZUjyAf+UAH
 mCRrVrrJ1FXKyjopzqe2GmeDC4k6D66qgOhLl38eXGUEtktVV9Iz6Bkjo03O6+pG
 Z/Qn4NbF+1ZcT4eP23UZMRAHjaySKHWDP0yAPA4sBForiDS3BJJOpuxtwb1lX8nL
 L8gXDcUdHq2W8kZuEpHIJM=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S2;
 Wed, 02 Apr 2025 20:31:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 0/7] Convert inno hdmi to drm bridge
Date: Wed,  2 Apr 2025 20:31:34 +0800
Message-ID: <20250402123150.238234-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgDnd405Lu1nJwOJBA--.36321S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47WFy5uF1rJF4fGr48JFb_yoW5JF15pa
 98Ary5ZF1xC3WIqrs7AF48ArWayayDJa1FkryxJw1fZr4F9F1jyr9xuFs0vrnxAr17AFsF
 yr4xGa4UKFW7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7b18UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4jXmftK+o5IQAAsi
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

From: Andy Yan <andy.yan@rock-chips.com>

When preparing to convert the current inno hdmi driver into a
bridge driver, I found that there are several issues currently
existing with it:

1. When the system starts up, the first time it reads the EDID, it
   will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
   reference clock to be enabled first before normal DDC communication
   can be carried out.

2. The signal is unstable. When running the glmark2 test on the screen,
   there is a small probability of seeing some screen flickering.
   This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
   by GRF. This part is missing in the current driver.

PATCH 1~6 are try to Fix Document in the dt-binding, then add the
missing part in driver and dts.
PATCH 7 converts the curren driver to drm bridge mode.

Changes in v3:
- Convert to drm bridge driver
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Changes in v2:
- Included the HSYNC/VSYNC polarity fix
- Link to V1: https://lore.kernel.org/linux-rockchip/20250324103332.159682-1-andyshrk@163.com/

Andy Yan (7):
  dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036
    compatible
  dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
  drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
  drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting
    for rk3036
  ARM: dts: rockchip: Add ref clk for hdmi
  Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
  drm/rockchip: inno-hdmi: Convert to drm bridge

 .../display/rockchip/rockchip,inno-hdmi.yaml  |  20 +-
 arch/arm/boot/dts/rockchip/rk3036.dtsi        |   5 +-
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 907 ++++++++++--------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
 drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
 include/drm/bridge/inno_hdmi.h                |  33 +
 10 files changed, 760 insertions(+), 752 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0

