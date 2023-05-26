Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9327711E3A
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808810E790;
	Fri, 26 May 2023 03:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041F10E790
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:08 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-331ad4cd4fdso600655ab.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070367; x=1687662367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WPaaHipQARIOZW/QNmBJmA5oVTnUyitGzcu78epvvrY=;
 b=Y6xemWKlVm9Rmvu96OpYzzaPlQCdQOvbHIaBt9BLz9ZJZ0+937asUtlo/OU/RzEQzU
 JtDT1mPTe3olKn219B4PaTxuV6cyw42NqRHeWso9K8Jkh3X3nYsSpdhZfVKDcewIy862
 5gpTWUbIsVNQHuhX77LgnleKP4O2bmyhrEF6k51iAPDVQZ1ByWA7GY2sEGeHuBtRXV5F
 whAS7TcD7mgjPIZ/P8cHSBhMOj4IeoM4Tffq3bVbm5ggz4Enbbz3npCDyFV22nHARjRS
 ajUCkHFqgzxlJ00d21fE4NGO8ybqQhli1Y9vkmBdHUZp9pg7xkD8vSeKaG8+DNRy5IMS
 t/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070367; x=1687662367;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WPaaHipQARIOZW/QNmBJmA5oVTnUyitGzcu78epvvrY=;
 b=lLDACZPIZA3lCY15e5Yk3hD0Tu+hpGkD3VZUqL3xqsv5sMZ6d14Ptve+OzBirtxBk7
 oOPDCvHKgJ3yKJAIqSoKJydkFB2oQDAtk5SwwEQqFXbTYEkLGvaNzFfF9sYOKxsZoMJS
 PFZCjoDr/rW1TW+vCZ75xNmJupxUufrKeogfCM/XUhkZTRwXcsgIK9Pqi9qt5fmPXc6N
 zImOsdLhChUTKfrG6kCg3alk5galHVt3vUnTNAzfYTlZpaXGEYvwSEii6rNMXybkL5+B
 lFeXPuFFz9tChC2Tn2tU86E900jZTLRf71+ugRppcUJ5SRY+2kkeZzWeSRmIQp9hWVwj
 +JjA==
X-Gm-Message-State: AC+VfDxoqQueMoJc20RBFRXLHtmgD9NjAyQggfNJG6OVloYnfyMmkTdU
 TMSY9jvkJ+dpTyXisOy4yIyMzy9Kzfw=
X-Google-Smtp-Source: ACHHUZ6ewdQBp5lRMYvc+bWSF/Fr8GNL3uy36rTyuxUcTfS3QIkCa+Pd0BUWvEhPHw2k2moNlfQ+nQ==
X-Received: by 2002:a5e:d614:0:b0:76c:65df:a118 with SMTP id
 w20-20020a5ed614000000b0076c65dfa118mr115419iom.6.1685070366981; 
 Thu, 25 May 2023 20:06:06 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:06 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable clocking
Date: Thu, 25 May 2023 22:05:52 -0500
Message-Id: <20230526030559.326566-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes the blanking pack size and the PMS calculation.  It then
adds support to allows the DSIM to dynamically DPHY clocks, and support
non-burst mode while allowing the removal of the hard-coded clock values
for the PLL for imx8m mini/nano/plus, and it allows the removal of the
burst-clock device tree entry when burst-mode isn't supported by connected
devices like an HDMI brige.  In that event, the HS clock is set to the
value requested by the bridge chip.

This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
Exynos boards.

Adam Ford (6):
  drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
  drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
  drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
  drm: bridge: samsung-dsim: Dynamically configure DPHY timing
  drm: bridge: samsung-dsim: Support non-burst mode
  dt-bindings: bridge: samsung-dsim: Make some flags optional

Lucas Stach (1):
  drm: bridge: samsung-dsim: fix blanking packet size calculation

V8:  Rebase.  Add dt-bindings to series as Patch 7/7

V7:  Move messages indicating the optional device tree items are going
     to be automatically read elsewhere was move to dev_dbg instead of
     dev_info.  Cleaned up some of the comments to be a bit more clear.
     Eliminated a double variable assignement accidentally introduced
     in V6 when some of the items were moved from patch 6 to patch 5.

V6:  Squash-in an additional error fix from Lucas Stach regarding the
     DPHY calcuations.  Remove the dynamic_dphy variable and let
     everyone use the new calculations.  Move the hs_clock caching
     from patch 6 to patch 5 to go along with the DPHY calcuations
     since they are now based on the recorded hs_clock rate.
     
V5:  Update error message to dev_info and change them to indicate
     what is happening without sounding like an error when optional
     device tree entries are missing.

V4:  Undo some accidental whitespace changes, rename PS_TO_CYCLE
     variables to ps and hz from PS and MHz. Remove if check
     before the samsung_dsim_set_phy_ctrl call since it's
     unnecessary.
     Added additional tested-by and reviewed-by comments.
     Squash patches 6 and 7 together since the supporting
     non-burst (patch 6) mode doesn't really work until
     patch 7 was applied.

V3:  When checking if the bust-clock is present, only check for it
     in the device tree, and don't check the presence of the
     MIPI_DSI_MODE_VIDEO_BURST flag as it breaks an existing Exynos
     board.

     Add a new patch to the series to select GENERIC_PHY_MIPI_DPHY in
     Kconfig otherwise the build breaks on the 32-bit Exynos.

     Change vco_min variable name to min_freq

     Added tested-by from Chen-Yu Tsai

V2:  Instead of using my packet blanking calculation, this integrates
     on from Lucas Stach which gets modified later in the series to
     cache the value of the HS-clock instead of having to do the
     calucations again.

     Instead of completely eliminating the PLL clock frequency from
     the device tree, this makes it optional to avoid breaking some
     Samsung devices.  When the samsung,pll-clock-frequency is not
     found, it reads the value of the clock named "sclk_mipi"
     This also maintains backwards compatibility with older device
     trees.

     This also changes the DPHY calcuation from a Look-up table,
     a reverse engineered algorithm which uses
     phy_mipi_dphy_get_default_config to determine the standard
     nominal values and calculates the cycles necessary to update
     the DPHY timings accordingly.pu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 141 +++++++++++++++---
 include/drm/bridge/samsung-dsim.h             |   4 +
 4 files changed, 128 insertions(+), 27 deletions(-)

V8:  Rebase onto the current master branch.  Add dt-bindings to series.

V7:  Move messages indicating the optional device tree items are going
     to be automatically read elsewhere was move to dev_dbg instead of
     dev_info.  Cleaned up some of the comments to be a bit more clear.
     Eliminated a double variable assignement accidentally introduced
     in V6 when some of the items were moved from patch 6 to patch 5.

V6:  Squash-in an additional error fix from Lucas Stach regarding the
     DPHY calcuations.  Remove the dynamic_dphy variable and let
     everyone use the new calculations.  Move the hs_clock caching
     from patch 6 to patch 5 to go along with the DPHY calcuations
     since they are now based on the recorded hs_clock rate.
     
V5:  Update error message to dev_info and change them to indicate
     what is happening without sounding like an error when optional
     device tree entries are missing.

V4:  Undo some accidental whitespace changes, rename PS_TO_CYCLE
     variables to ps and hz from PS and MHz. Remove if check
     before the samsung_dsim_set_phy_ctrl call since it's
     unnecessary.
     Added additional tested-by and reviewed-by comments.
     Squash patches 6 and 7 together since the supporting
     non-burst (patch 6) mode doesn't really work until
     patch 7 was applied.

V3:  When checking if the bust-clock is present, only check for it
     in the device tree, and don't check the presence of the
     MIPI_DSI_MODE_VIDEO_BURST flag as it breaks an existing Exynos
     board.

     Add a new patch to the series to select GENERIC_PHY_MIPI_DPHY in
     Kconfig otherwise the build breaks on the 32-bit Exynos.

     Change vco_min variable name to min_freq

     Added tested-by from Chen-Yu Tsai

V2:  Instead of using my packet blanking calculation, this integrates
     on from Lucas Stach which gets modified later in the series to
     cache the value of the HS-clock instead of having to do the
     calucations again.

     Instead of completely eliminating the PLL clock frequency from
     the device tree, this makes it optional to avoid breaking some
     Samsung devices.  When the samsung,pll-clock-frequency is not
     found, it reads the value of the clock named "sclk_mipi"
     This also maintains backwards compatibility with older device
     trees.

     This also changes the DPHY calcuation from a Look-up table,
     a reverse engineered algorithm which uses
     phy_mipi_dphy_get_default_config to determine the standard
     nominal values and calculates the cycles necessary to update
     the DPHY timings accordingly.
-- 
2.39.2

