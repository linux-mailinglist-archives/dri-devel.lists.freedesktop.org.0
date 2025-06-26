Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0970AEA6C5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2ADC10E2E6;
	Thu, 26 Jun 2025 19:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="MVXt5OEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743F10E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:39:12 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A8CED25AFA;
 Thu, 26 Jun 2025 21:39:10 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3H0ggFo7uRMP; Thu, 26 Jun 2025 21:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750966749; bh=zxNeykMCVsQL9yo26mI9JxjmjAGRyfaJ2CumE34l/70=;
 h=From:Subject:Date:To:Cc;
 b=MVXt5OEnu7jbyXJ3UpjIBENx14KAqgtmQmaU+TamH36rvJpaIQiQo+8NFUqZi/p0f
 zE1r0VPdJwD2+sAA74H/GVjp/CuTh8BmToPYNEr/cH3i+Yyf/8wfiGKoLbRtaNmevL
 +sP79OfdAwHauQMsHcEvhHcExx+w/t5Olf3gXkOmBb8aDdVVD81dY08YyWpHvJ6RMh
 PEv3nQKCcqZA9QfLckI2WZZvIPtzrE8sRDWW28gFJegVzULInSl1GZQ3c1KLfFAySN
 zG8uLmJ03k6bBJQRhNIvoR6Odg19e8zSQE4fiteJ8p8SOhrWESP4wHcGcX8SVYmbZg
 74XdTDYil227g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v2 00/13] Support for Exynos7870 DSIM bridge
Date: Fri, 27 Jun 2025 01:08:49 +0530
Message-Id: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMmhXWgC/2WNOw6DMBAFr4K2jiN7Eb9UuUdE4eA1bBEceZEFQ
 tw9DilTzkhv3g5CkUngVuwQKbFwmDPgpYBhsvNIil1mQI2VrrBUtG5zkKZttHLCL+WxczVZP9g
 KIa/ekTyvZ/HRZ55YlhC38yCZr/21aoN/rWSUVsaWpX4Otu2cvzuWGMJyDXGE/jiODz2lotmwA
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=2348;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=zxNeykMCVsQL9yo26mI9JxjmjAGRyfaJ2CumE34l/70=;
 b=ZHhes87ocrYxF2VsFJm2KKHstyoR/9FavFvLc3C3qp3ZRWk5Rf7ws+ppeLl+J37J0O5IodIQi
 Mp5UnS9CbjBCyG2Nlt5Tp1a49gcp8WjjWQD52G+xbAUTj+m+GSOUKSA
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
Changes in v2:
- added commit to isolate clock names for each variant
- replaced clock names with generic ones
- added maxItems to clocks property in dtschema
- Link to v1: https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org

---
Kaustabh Chakraborty (13):
      drm/bridge: samsung-dsim: separate LINK and DPHY status registers
      drm/bridge: samsung-dsim: add SFRCTRL register
      drm/bridge: samsung-dsim: add flag to control header FIFO wait
      drm/bridge: samsung-dsim: allow configuring bits and offsets of CLKCTRL register
      drm/bridge: samsung-dsim: allow configuring the MAIN_VSA offset
      drm/bridge: samsung-dsim: allow configuring the VIDEO_MODE bit
      drm/bridge: samsung-dsim: allow configuring PLL_M and PLL_S offsets
      drm/bridge: samsung-dsim: allow configuring the PLL_STABLE bit
      drm/bridge: samsung-dsim: increase timeout value for PLL_STABLE
      drm/bridge: samsung-dsim: add ability to define clock names for every variant
      dt-bindings: samsung,mipi-dsim: document exynos7870 DSIM compatible
      drm/bridge: samsung-dsim: add driver support for exynos7870 DSIM bridge
      drm/exynos: dsi: add support for exynos7870

 .../bindings/display/bridge/samsung,mipi-dsim.yaml |  27 ++
 drivers/gpu/drm/bridge/samsung-dsim.c              | 346 +++++++++++++++------
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            |   9 +
 include/drm/bridge/samsung-dsim.h                  |  15 +-
 4 files changed, 307 insertions(+), 90 deletions(-)
---
base-commit: 1b152eeca84a02bdb648f16b82ef3394007a9dcf
change-id: 20250523-exynos7870-dsim-f29d6eafca52

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

