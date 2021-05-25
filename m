Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F4C38F694
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42C6E2C7;
	Tue, 25 May 2021 00:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B31D6E2C7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:36 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c12so10582411pfl.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZZtU9dVu5puRH5oLIfFE0isXl8M5+meYFhexng2s2o=;
 b=ddG+CLvUu1WyzOvrFJexnmlwcjhxHSdEsN/hrUOrlFnUrq3byfAjFPHI3kqCSL9V5D
 TjfyhRf6RO+ie1VDvPnX0H6RE+k0JHN0lqoWEtZEy6Dt3PAsVxdzYVquzOTQjIBCoU9a
 p27CtFP0uBp3jexmm8uW2T3hU01I3VlBz4hKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SZZtU9dVu5puRH5oLIfFE0isXl8M5+meYFhexng2s2o=;
 b=nktWtY9Ma99PA0L6dwjqvQtNfeLNyNY5SKMrZ3cbBNzkwnU0kMwNA68tF+9TDcG3mp
 38ZvDKvxxLRTW7TFZYM8ruiQPdKRfuxJeYS8AP+hLkta/c5fNxLHZVSabHkISHz2XuYO
 7AuLhbz/v2zqxVp/fMpVZWORGo1yfBHSlG8k3UwbfrzlqzB47SwkATk2gvedCHjahwTV
 5HXl04d72xHTOKLX+vUpMU3vbjbo1DNz5CHeFOr9AsUGku5233UQZ9ms5jyyfg5k7d/N
 VnSAhYXsOhdG8agR6obBCzdPgSknrAy6eb8AVNG1CzPfiHra0Jf6V1fD0pDHO7rUPG+Y
 2ldQ==
X-Gm-Message-State: AOAM5332Z77z4wzSqcOABvcSqbDtTM+GBgke7nkALFmtbZTU8g1s+eij
 lK+UEftzo3qXxvuZuOSzWviSDw==
X-Google-Smtp-Source: ABdhPJyAgOT5KBFkSm0/GBtDPgE5IVjzH1GtKl0zd0Jod0ViUISmoFNv0kJ+3X2C8eIteVLYZlQBHw==
X-Received: by 2002:a05:6a00:cd4:b029:2e1:b937:77e8 with SMTP id
 b20-20020a056a000cd4b02902e1b93777e8mr26184746pfv.43.1621900956106; 
 Mon, 24 May 2021 17:02:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:35 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 00/11] drm: Fix EDID reading on ti-sn65dsi86 by introducing
 the DP AUX bus
Date: Mon, 24 May 2021 17:01:48 -0700
Message-Id: <20210525000159.3384921-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
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
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robdclark@chromium.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org
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

This patch was tested against drm-misc-next commit a596fcd9cbc7
("drm/panel: panel-simple: Add missing
pm_runtime_dont_use_autosuspend() calls") on a sc7180-trogdor-lazor
device.

At v8 now, the bindings patches have been beefed up from v7 and
review/ack tags were added. Also allmodconfig was fixed.

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

Between v7 and v8, high-level view of changes:
- More bindings work.
- Fixed allmodconfig.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/

Changes in v8:
- Allow dp-aux-bus to be a module to fix allmodconfig builds
- Explain better why HPD needs to be in panel-simple in commit msg.
- Separate DP AUX bus binding is new for v8.
- ti-sn65dsi86 references the new aux bus bindings.

Changes in v7:
- Adjusted commit message to talk about DP AUX bus.
- Beefed up commit message in context of the DP AUX bus.
- List hpd properties bindings patch new for v7.
- Panel now under bridge chip instead of getting a link to ddc-i2c
- Patch introducing the DP AUX bus is new for v7.
- Patch to allow panel-simple to be DP AUX EP new for v7.
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.
- Patch using the DP AUX for DDC new for v7.
- Remove use of now-dropped drm_dp_aux_register_ddc() call.
- Set the proper sub-device "dev" pointer in the AUX structure.
- ti-sn65dsi86: Add aux-bus child patch new for v7.

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (11):
  dt-bindings: display: simple: List hpd properties in panel-simple
  dt-bindings: drm: Introduce the DP AUX bus
  dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus child
  dt-bindings: drm/aux-bus: Add an example
  drm: Introduce the DP AUX bus
  drm/panel: panel-simple: Allow panel-simple be a DP AUX endpoint
    device
  drm/panel: panel-simple: Stash DP AUX bus; allow using it for DDC
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: sc7180-trogdor: Move panel under the bridge chip

 .../bindings/display/bridge/ti,sn65dsi86.yaml |  20 +-
 .../bindings/display/dp-aux-bus.yaml          | 102 ++++++
 .../bindings/display/panel/panel-simple.yaml  |   2 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  30 +-
 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 111 ++++--
 drivers/gpu/drm/drm_dp_aux_bus.c              | 326 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   1 +
 drivers/gpu/drm/panel/panel-simple.c          |  64 +++-
 include/drm/drm_dp_aux_bus.h                  |  57 +++
 12 files changed, 665 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 include/drm/drm_dp_aux_bus.h

-- 
2.31.1.818.g46aad6cb9e-goog

