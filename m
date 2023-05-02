Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314446F3BA8
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59F10E00C;
	Tue,  2 May 2023 01:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E313410E00C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:08 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-760f5070ccfso248397239f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989687; x=1685581687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JWHDFN7Ujs5msRXNgIZk9qHJ9Glg+BaYPkvMRLxbY7E=;
 b=lh0V+FG7uHRTs6DVgOJWfpgNz/OJGm/zRrYCEM8miEzWzfgNut+GnLjU/CESuAdZmv
 DU7zQO6fXNlyiiwRVkp7aq6cuKyUMx7m4VvwDkpiEs/wC7AhV6Bu7Isu1axKZSbeIPw3
 YEzZNuXxQyxj2Wkemem/+CB9Bxle3AGEBIFwwf+6X+0M3DiOxhp9Q2Ue+69dFgkB2rJC
 DhQ0hZAhxs12e6NoRCULOrrpAJfr0GSRzPcWWZBnSGNK7kePayZQ3vy9tHQ+FACj7Vzg
 tFHKTn5RKMHBvnSzleg7bWFO13DQ2sYTV9LPx8o4UpCCiUzJASoTOBCwxfSHKp69TD2b
 nJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989687; x=1685581687;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JWHDFN7Ujs5msRXNgIZk9qHJ9Glg+BaYPkvMRLxbY7E=;
 b=eKP9ov6tcrkENrSAX1T4fPq4I8V4H+fTQMDzrb/DH1sQJ4+lhbkAdu8dE/273L2olG
 /Wu77fTkqwUVC2aL0TvDMcjhlNRL1oDZ0NRo1BWUOs2gzGYTWLikiofl1qrIxIvbtTR0
 jVh3tkEsqNeZ/Tb0Cv0V0hH+UfmtnxTWaM5lR3xlZkLv5kPbOxrGQLgLhNkiSkA9awyq
 PSl9/+erS4PCfaexVfJCTikBVjR/tz3UWNEfOr7FKWv6StjrLb3VSzOx2RmaYzXkJxCv
 vNkTkP+IBXVlo7aoLQiR+wniTFOpbkeTgKpb/xNdDHKwzrxcaq7197cTTsMfX8Ynq0KE
 MtuQ==
X-Gm-Message-State: AC+VfDwjSI8JzyayBvYKdeB3D3PvOF2jbijLvbqflfizH8xsMD7alwtG
 5mTbAwxyu+TVgDwyVQsznYtjsxlfYgM=
X-Google-Smtp-Source: ACHHUZ7H5cd1a+PaC7TYOYVXFLm8Ds8lDPcMFxpaqZUET7b/kIVqMWFgkNZ+SOIAZEZ17OCb/bsGQQ==
X-Received: by 2002:a6b:5c0a:0:b0:760:ec21:a8af with SMTP id
 z10-20020a6b5c0a000000b00760ec21a8afmr12811865ioh.0.1682989687374; 
 Mon, 01 May 2023 18:08:07 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:06 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 0/7] drm: bridge: samsung-dsim: Support variable clocking
Date: Mon,  1 May 2023 20:07:52 -0500
Message-Id: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes the blanking pack size and the PMS calculation.  It then
adds support to allows the DSIM to dynamically DPHY clocks, and support
non-burst mode while allowing the removal of the hard-coded clock values
for the PLL for imx8m mini/nano/plus, and it allows the removal of the
burst-clock device tree entry when burst-mode isn't supported by connected
devices like an HDMI brige.  In that event, the HS clock is set to the value
requested by the bridge chip.

This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should work
on i.MX8M Mini as well.

Adam Ford (6):
  drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
  drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
  drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
  drm: bridge: samsung-dsim: Dynamically configure DPHY timing
  drm: bridge: samsung-dsim: Support non-burst mode
  drm: bridge: samsung-dsim: Let blanking calcuation work in non-burst
    mode

Lucas Stach (1):
  drm: bridge: samsung-dsim: fix blanking packet size calculation

 drivers/gpu/drm/bridge/Kconfig        |   1 +
 drivers/gpu/drm/bridge/samsung-dsim.c | 150 ++++++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |   5 +
 3 files changed, 136 insertions(+), 20 deletions(-)

---
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
     This also maintains backwords compatibility with older device
     trees.

     This also changes the DPHY calcuation from a Look-up table,
     a reverse engineered algorithm which uses
     phy_mipi_dphy_get_default_config to determine the standard
     nominal values and calculates the cycles necessary to update
     the DPHY timings accordingly.
     
-- 
2.39.2

