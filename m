Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C70AD758E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A433010E890;
	Thu, 12 Jun 2025 15:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="gJ3mGo/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EC410E415
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:18:32 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 65C2523069;
 Thu, 12 Jun 2025 17:18:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzGFH5v5AW84; Thu, 12 Jun 2025 17:18:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1749741509; bh=bNelyn9B2iPBX/xAeabKNOJ/SJ1fiqXUANtY4YCvtYU=;
 h=From:Subject:Date:To:Cc;
 b=gJ3mGo/knt129fwJhT7FvJnW7pL9kFut0rfePWssCSW3xRlsqZ8Kx3L7C072KKnKw
 NhireUBkSezKH9Ak1s/934vY79k0EY6Ym6iQKx1HQLAHhOr3VjvXWz/KyQHxjFcV5S
 671nK5LP98DKb5LsnBeUEMGB8Vx3429AOtwmvHyft7QNuKJACZBVgq/ywbKXzHSPMe
 tiu+wsudXihicsDjIL0D2c5l70aXGfpJuUyOkFstsaKP39yJpB5X0TkdbjN9MlU1pN
 klcfwPKV/vTQw2FiqwuKgkH/ovYv4JKllwRon0gl4Vgx4JfuRi1ovzliidJ0/cZzem
 HPOt4uAicGnUg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 00/12] Support for Exynos7870 DSIM bridge
Date: Thu, 12 Jun 2025 20:48:04 +0530
Message-Id: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzvSmgC/x3MQQqAIBBA0avErBNswqyuEi0kx5pFGg5EEd09a
 fkW/z8glJkExuqBTCcLp1jQ1BUsm4srKfbFgBqNNtgquu6YxPZWKy+8q4CD78iFxRmEUh2ZAl/
 /cZrf9wPSE1h9YQAAAA==
X-Change-ID: 20250523-exynos7870-dsim-f29d6eafca52
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=1998;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=bNelyn9B2iPBX/xAeabKNOJ/SJ1fiqXUANtY4YCvtYU=;
 b=7YAvpcOOIIkM5ooW+kuxBu//qdWk0BjK6t32Rhv9PQ4kmvlYPZBWr96Nl3TYXg0HBfMF0GQ96
 GYG/S1yQ12QCyobP8Cgo3Tjcc6aRElD3TsokY+ksfNMF1FKQ+8hxmUk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

This patch series introduces a lot of changes to the existing DSIM
bridge driver, by introdcing new registers and making register offsets
configurable for different SoCs. These preliminary changes are followed
by the introduction of support for Exynos7870's DSIM IP block.

Work is heavily inspired and only possible due to Samsung's vendor
kernel sources. Testing has been done with Samsung Galaxy J7 Prime
(samsung-on7xelte), Samsung Galaxy A2 Core (samsung-a2corelte), and
Samsung Galaxy J6 (samsung-j6lte), all with DSI video mode panels.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (12):
      drm/bridge: samsung-dsim: separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
      drm/exynos: dsi: add support for exynos7870

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  26 +++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 250 +++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
 include/drm/bridge/samsung-dsim.h                  |  13 ++
 4 files changed, 254 insertions(+), 44 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-dsim-f29d6eafca52

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

