Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F13C708C03
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785C210E56E;
	Thu, 18 May 2023 23:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618110E56E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 23:06:39 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-331430faba8so7079465ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684451198; x=1687043198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cDVLVchNwHu4gCB84Byfao8xXuzpMRrJqDwTNid2o6c=;
 b=k4Sctar4BOS9H7HreNrDWu+pg8VpPwD0C0ts51kplfqR5pLMjZyJU3c1cQydJQF2g4
 qXwAoEJPivjgQ+/TMwCEu2UJ9iu63UqOI/nTufUvgSjLdHd61ZadnOvnmzGbtFtMCy+g
 0A0WaQpeywz27Qfdic9dO7mMYWNdU6p6pLhOt2z3rFNo0VAKtkiDCJBQf/NEB1Yfls2D
 /SzEKoPcp229Czu9pvxTsCEDxCmoqlCldmyGf/4XQtGPuVjGCt4jE8PpzI9uWGUvnVYB
 v8LQ2x1pib/J5H1HW8ASNOjPgj8IrTfZSSfe+VfkX+EK0HTDDCYs5xOtHGV/7cOaFGxk
 OHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684451198; x=1687043198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDVLVchNwHu4gCB84Byfao8xXuzpMRrJqDwTNid2o6c=;
 b=Xzl+/YLl/g5gCO+n8CWuYGQPQ6uQEcwAihvcvyGhI82T8T6povfrpvwKd8shia4eGI
 hdiJIxhPHAXfXZmu7YAXJTDqGYQLsESJxpG4aoZyvaN1UopAPXe+AzDNhKGD9cBTapUh
 oEH/QmnopOxrFUH31Y4S41i9Au63FVI4vnqyZRPYXu/yh5fj1c+Z1CMBuVP71QiHdAmC
 y9/Nj/pVoBji2vhYpiwHyWCezSvmzGQ969nV5F73y0977YjxNZoTAENwfKAFoP+TPuX+
 bmQUtKjhrOcq2nRtKFPf4l2pPRsMwQYVS1n+d8tqqvkZIJhQ3EI6o1gDAxlloVOyvgIN
 TgCw==
X-Gm-Message-State: AC+VfDziwMi2Ox8zZoaS6EZsKKLzA8K9O0Kr91jPFk2gg88odQXX80kq
 Fg/gm7ud2jZ216Cdlw10BkZNMu9fByo=
X-Google-Smtp-Source: ACHHUZ4C1Nsf5w9tu6OrNRHCjmsqgbH4LOCTH9HuScT5RTOWd1FIrZzfFOKX6FDd6x8IdN+KZST0EA==
X-Received: by 2002:a92:c64e:0:b0:335:38b:e734 with SMTP id
 14-20020a92c64e000000b00335038be734mr4991370ill.28.1684451198014; 
 Thu, 18 May 2023 16:06:38 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:56b8:635c:4c7a:15b1])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92cd0c000000b003317ebbc426sm635897iln.47.2023.05.18.16.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 16:06:37 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable clocking
Date: Thu, 18 May 2023 18:06:20 -0500
Message-Id: <20230518230626.404068-1-aford173@gmail.com>
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
 drivers/gpu/drm/bridge/samsung-dsim.c | 142 +++++++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |   4 +
 3 files changed, 124 insertions(+), 23 deletions(-)

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

