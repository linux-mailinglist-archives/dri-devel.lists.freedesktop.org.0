Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68F704183
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B6510E2AE;
	Mon, 15 May 2023 23:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884A910E2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:27 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3351745a27cso77815965ab.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195045; x=1686787045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g+O4/ssLgmztN5BM7M82vr66O6jkTSH4ZHyxDa1+Ug8=;
 b=B0ntmpLUk6eNh3OLIUA7OPQpY3picoLY5XUIesF0KsBU3nYzm6J2yYRc3xOuejaDc/
 S+W8BWKRAZ/kCmqXfGPxIXokvDQ4TxfEy4jTjbNipS13wQQTbEoTwjVxh6m2wRxj+syH
 UkGbWSW1zFWIapxkCXXypvndH4UqsX66RqqcaO4xH0NZOL+KNJvniFgYkrAoMJ4Y0IC2
 1+3202JXtPzxgJZZEcaqDXjcLXQFVVBebj40S3IBPkGuyW6XMeuWtlo2cHJyn60ktKw1
 S7qT7gNEXtup6ADfN4bi3bvLXbg14+R8Noaqv8NaZ1FEMg36Xnk9yhq3ALCtcWTPzjSP
 Hmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195045; x=1686787045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g+O4/ssLgmztN5BM7M82vr66O6jkTSH4ZHyxDa1+Ug8=;
 b=dHQekL0h6pKUAYpGOSzEU+lQ0tRb47V0f+8cU0QtlK+Pk1sDLWVUtUVkW1yLGXfcA1
 MqD4umvxfBh/ycssbSTkGbfAvDP8gOCa5GMDJfLIrbTl/j6wM4LvSpn/tggAhpgpm5ur
 F5Wa+++mDS3iZ8HN2rOBVd3ZDUNo86PekKqazFKab4MTySdqXxMoRJDVHk9n/UNz+Crc
 wq4CdOJhEl163ChLK8ZJtZO2mK2d0kOrzPUhWKboemGHONH9G990MZlj1SbLXME7f/np
 YVBRg5cSOenw/mVbIHJRajndR4uW4gNZRs5uA83lvk1ARwBglioLOf43uBqBC0b9RE/i
 Rq0w==
X-Gm-Message-State: AC+VfDyw0S2gQqvNAEAx8lRaN80MqfiRTx0M9eI2VQziFBiaZS3+Ce6x
 n8/aVlkYKf2mhOkDqEMmzSemv3P4ZuI=
X-Google-Smtp-Source: ACHHUZ49in19sRs1FqtjrAtNiP3pmQ/Qi2JvTtYVIDz2gKPvpzvDQ8OkDxV0kKIvFptWtbQfPXE5zw==
X-Received: by 2002:a05:6e02:6c1:b0:335:87f9:50e4 with SMTP id
 p1-20020a056e0206c100b0033587f950e4mr20972368ils.29.1684195045365; 
 Mon, 15 May 2023 16:57:25 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:24 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 0/6] drm: bridge: samsung-dsim: Support variable clocking
Date: Mon, 15 May 2023 18:57:07 -0500
Message-Id: <20230515235713.232939-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
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

Adam Ford (5):
  drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
  drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
  drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
  drm: bridge: samsung-dsim: Dynamically configure DPHY timing
  drm: bridge: samsung-dsim: Support non-burst mode

Lucas Stach (1):
  drm: bridge: samsung-dsim: fix blanking packet size calculation

 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/samsung-dsim.c | 143 +++++++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |   4 +
 3 files changed, 125 insertions(+), 23 deletions(-)


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

