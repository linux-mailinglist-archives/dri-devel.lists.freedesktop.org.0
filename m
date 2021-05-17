Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB93865D0
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0216E1E6;
	Mon, 17 May 2021 20:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8296E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:47 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id gm21so4274336pjb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rCGEEwwwRGKD1oMDJbEPaJuXUMyc6FPUtNPA7l9y81o=;
 b=iwVQ4Y/uu3y3K160d47Xbb0z1F+EyQFQLfmkL66fXDaXo4r5PyawAg+Uq6mkotYAj3
 hVNW95HY7wvcTT58I+7Pupa+orb2LxOcGP93Yize1SpSmimlYxp5fR1RUq7w2wwPIAol
 z/PIrf+h4gxCuMubj6BjMmffuxSjkhRv9fi4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rCGEEwwwRGKD1oMDJbEPaJuXUMyc6FPUtNPA7l9y81o=;
 b=LiejhubhmT11N2p5YvX4j4Lc+fdCCozbbP2Ay3JU3HXHZVTstv5EEQVRBt+lSAkMEO
 WL7nAYC3HF0jB7TemdHgTFCtztKx44zkw+UN8v2rjg90dWrzImpxNnVUhp9WfjPDWO9W
 46GPtMhIlwMa6DshrCopq0xkLtRmfTZ2xqEwR2oSrst77/8EriiEiMlI5r9Fd/EgJ8Sd
 Ts8FZ9C50QuNuRCiX5fJG37UE3t2kOpm9HppPm8H0mGqR7F47CoQFoMunBavhVS0hgN0
 ahSDlXVim8cwEX0y4vmDSnHFptosyun73+6KH68SoHvZznGHUdc2Vgx7Cmi5CGubHEgX
 WR/A==
X-Gm-Message-State: AOAM530Uq2Dbq1/qUmpaGwG6x1dnMbzBWWo/ZyLsA/yx6zFaFJVxOl0J
 sdRjYfEgG2tdErqqEa8thTxvZQ==
X-Google-Smtp-Source: ABdhPJzGJfCkJeK4TET+/0o4NbufssT9iOPSlLD7v+MwbNWHa2NMCrFnNscDFpQl9cxD6dEmN5BF9Q==
X-Received: by 2002:a17:902:b101:b029:ed:56c1:e01d with SMTP id
 q1-20020a170902b101b02900ed56c1e01dmr227482plr.54.1621282186567; 
 Mon, 17 May 2021 13:09:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:46 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 00/10] drm: Fix EDID reading on ti-sn65dsi86 by introducing
 the DP AUX bus
Date: Mon, 17 May 2021 13:08:57 -0700
Message-Id: <20210517200907.1459182-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
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
Cc: David Airlie <airlied@linux.ie>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robdclark@chromium.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The primary goal of this series is to try to properly fix EDID reading
for eDP panels using the ti-sn65dsi86 bridge.

Previously we had a patch that added EDID reading but it turned out
not to work at bootup. This caused some extra churn at bootup as we
tried (and failed) to read the EDID several times and also ended up
forcing us to use the hardcoded mode at boot. With this patch series I
believe EDID reading is reliable at boot now and we never use the
hardcoded mode.

High level note: in this series the EDID reading is driven by the
panel driver, not by the bridge chip driver. I believe this makes a
reasonable amount of sense since the panel driver already _could_
drive reading the EDID if provided with the DDC bus and in future
planned work we'll want to give the panel driver the DDC bus (to make
decisions based on EDID) and the AUX bus (to control the
backlight). There are also planned patches from Laurent to make
ti-sn65dsi86 able to drive full DP monitors. In that case the bridge
chip will still be in charge of reading the EDID, but it's not hard to
make this dynamic.

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1].

This patch was tested against drm-misc-next commit 60a6b73dd821
("drm/ingenic: Fix pixclock rate for 24-bit serial panels") on a
sc7180-trogdor-lazor device.

At v7 now, this patch series grew a bit from v6 because it introduces
the DP AUX bus.

Between v2 and v3, high-level view of changes:
- stop doing the EDID caching in the core.

Between v3 and v4, high-level view of changes:
- EDID reading is actually driven by the panel driver now. See above.
- Lots of chicken-and-egg problems solved w/ sub-devices.

Between v4 and v5, high-level view of changes.
- Some of the early patches landed, so dropped from series.
- New pm_runtime_disable() fix (fixed a patch that already landed).
- Added Bjorn's tags to most patches
- Fixed problems when building as a module.
- Reordered debugfs patch and fixed error handling there.
- Dropped last patch. I'm not convinced it's safe w/out more work.

Between v5 and v6, high-level view of changes:
- Added the patch ("drm/dp: Allow an early call to register DDC i2c
  bus")
- Many patches had been landed, so only a few "controversial" ones
  left.

Between v6 and v7, high-level view of changes:
- New AUX DP bus!

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

Changes in v7:
- pm_runtime_dont_use_autosuspend() fix new for v7.
- List hpd properties bindings patch new for v7.
- ti-sn65dsi86: Add aux-bus child patch new for v7.
- Patch introducing the DP AUX bus is new for v7.
- Patch to allow panel-simple to be DP AUX EP new for v7.
- Patch using the DP AUX for DDC new for v7.
- Remove use of now-dropped drm_dp_aux_register_ddc() call.
- Beefed up commit message in context of the DP AUX bus.
- Set the proper sub-device "dev" pointer in the AUX structure.
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
- Adjusted commit message to talk about DP AUX bus.
- Panel now under bridge chip instead of getting a link to ddc-i2c

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (10):
  drm/panel: panel-simple: Add missing pm_runtime_dont_use_autosuspend()
    calls
  dt-bindings: display: simple: List hpd properties in panel-simple
  dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
  drm: Introduce the DP AUX bus
  drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
    device
  drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

 .../bindings/display/bridge/ti,sn65dsi86.yaml |  22 +-
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 111 ++++--
 drivers/gpu/drm/drm_dp_aux_bus.c              | 322 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 drivers/gpu/drm/panel/panel-simple.c          |  66 +++-
 include/drm/drm_dp_aux_bus.h                  |  57 ++++
 11 files changed, 563 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 include/drm/drm_dp_aux_bus.h

-- 
2.31.1.751.gd2f1c929bd-goog

