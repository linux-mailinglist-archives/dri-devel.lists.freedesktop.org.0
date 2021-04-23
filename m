Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279B36978B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10436E0EE;
	Fri, 23 Apr 2021 16:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95416E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:40 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id e2so21196870plh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oEt1nC1vtPHTBUlkjSuaqYfP7TnDgwA9fiSeTkMzEbo=;
 b=nJ25OmwHK0xgV1Yxcn7eERlrsniQVgjXEf/PXzbmZ4hNjQxGmYoMBzE7vpEjM/P1aM
 H4tx549SAeAci0184uTjbd1jYMvy10KRUu9HUcAlXwPCpafmx5hL9heqj5cHAoNjkEc2
 LljEjrYGSMHPz1P2WLeLC7UVr3tWGxV1yiwMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oEt1nC1vtPHTBUlkjSuaqYfP7TnDgwA9fiSeTkMzEbo=;
 b=elkBcjUAQWIxBZMXFz48qgyKC5CMZivXvfZtpgis9tn7cEsusurXGkOosj5Xvn+Ucn
 MLR6VgMddU5Iq1uU437UpexBwj18D3LQlQFaEUbQGNSk5UAKf2B4gfAMwzzDJsyR/7By
 uBPmqahGf6tHPLLvIZLBKqIMpiH15J6OfXrP/hKvIeDFC0FLhhtUXmkJIWoL7UFoh9jC
 lGPGwkCq+RdHB7V63vr2KlI8Uo0Jm2Y1WJpXHHRE4R2mQxaXAWBsaHSzOO+TiuNGXgAK
 oYE/qJfb3qN3eHYX0erCuuVYtb7yaYICv0qaeWpy9ikTE/2vGZQImzPEKQzZZpnkbKEc
 lbzg==
X-Gm-Message-State: AOAM531Vfnb4tH3rOADfK3yKxhfgNQaJRVstr8kFSEXu+hHksLRniejY
 MqE/tut4Jv7Y4Zo/+ZeaVeQ04g==
X-Google-Smtp-Source: ABdhPJx85Ux+CSi1e6wXxw8pebL9hhRFRe1hYA9OAx2AyjKiBCbjO3/fAm4QG7Nvv0ABtNa5huquMg==
X-Received: by 2002:a17:90b:3656:: with SMTP id
 nh22mr6435855pjb.112.1619197180259; 
 Fri, 23 Apr 2021 09:59:40 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 00/20] drm: Fix EDID reading on ti-sn65dsi86;
 solve some chicken-and-egg problems
Date: Fri, 23 Apr 2021 09:58:46 -0700
Message-Id: <20210423165906.2504169-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1] though only one actual patch is the same between the
two.

This series starts out with some general / obvious fixes and moves on
to some more specific and maybe controversial ones. I wouldn't object
to some of the earlier ones landing if they look ready.

This patch was developed agains linuxnext (next-20210416) with
drm-misc-next (as of 20210423) merged in on a sc7180-trogdor-lazor
device. To get things booting for me, I had to use Stephen's patch [2]
to keep from crashing but otherwise all the patches I needed were
here.

Primary change between v2 and v3 is to stop doing the EDID caching in
the core. I also added Andrzej's review tags.

Between v3 and v4 this series grew a whole lot. I changed it so that
the EDID reading is actually driven by the panel driver now as was
suggested by Andrzej. While I still believe that the old approach
wasn't too bad I'm still switching. Why?

The main reason is that I think it's useful in general for the panel
code to have access to the DDC bus and to be able to read the
EDID. This may allow us to more easily have the panel code support
multiple sources of panels--it can read the EDID and possibly adjust
timings based on the model ID. It also allows the panel code (or
perhaps backlight code?) to send DDC commands if they are need for a
particular panel.

At the moment, once the panel is provided the DDC bus then existing
code will assume that it should be in charge of reading the
EDID. While it doesn't have to work that way, it seems sane to build
on what's already there.

In order to expose the DDC bus to the panel, I had to solve a bunch of
chicken-and-egg problems in terms of probe ordering between the bridge
and the panel. I've broken the bridge driver into several sub drivers
to make this happen. At the moment the sub-drivers are just there to
solve the probe problem, but conceivably someone could use them to
break the driver up in the future if need be.

Between v4 and v5, high-level view of changes.
- Some of the early patches landed, so dropped from series.
- New pm_runtime_disable() fix (fixed a patch that already landed).
- Added Bjorn's tags to most patches
- Fixed problems when building as a module.
- Reordered debugfs patch and fixed error handling there.
- Dropped last patch. I'm not convinced it's safe w/out more work.

I apologize in advance for the length of this series. Hopefully you
can see that there are only so many because they're broken up into
nice and reviewable bite-sized-chunks. :-)

*** NOTE ***: my hope is to actually land patches that have been
reviewed sometime mid-to-late next week. Please shout if you think
this is too much of a rush and you know of someone who is planning to
review that needs more time.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/

Changes in v5:
- Missing pm_runtime_disable() patch new for v5.
- Reordered to debugfs change to avoid transient issue
- Don't print debugfs creation errors.
- Handle NULL from debugfs_create_dir() which is documented possible.
- Rebased atop the pm_runtime patch, which got reordered.
- Fix module compile problems (Bjorn + kbuild bot)
- Remove useless MODULE_DEVICE_TABLE (Bjorn).
- Fix module compile problems (Bjorn + kbuild bot)
- Remove useless MODULE_DEVICE_TABLE (Bjorn).

Douglas Anderson (20):
  drm/panel: panel-simple: Add missing pm_runtime_disable() calls
  drm/bridge: ti-sn65dsi86: Rename the main driver data structure
  drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
  drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
  drm/bridge: ti-sn65dsi86: Clean debugfs code
  drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
  drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
  drm/bridge: ti-sn65dsi86: Move all the chip-related init to the start
  drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into
    sub-drivers
  drm/panel: panel-simple: Get rid of hacky HPD chicken-and-egg code
  drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
  drm/bridge: ti-sn65dsi86: Code motion of refclk management functions
  drm/bridge: ti-sn65dsi86: If refclk, DP AUX can happen w/out
    pre-enable
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  i2c: i2c-core-of: Fix corner case of finding adapter by node
  drm/panel: panel-simple: Remove extra call:
    drm_connector_update_edid_property()
  drm/panel: panel-simple: Power the panel when reading the EDID
  drm/panel: panel-simple: Cache the EDID as long as we retain power
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: Link the panel to the bridge's DDC bus

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |   1 +
 drivers/gpu/drm/bridge/Kconfig               |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 767 ++++++++++++-------
 drivers/gpu/drm/panel/panel-simple.c         |  49 +-
 drivers/i2c/i2c-core-of.c                    |  17 +-
 5 files changed, 538 insertions(+), 297 deletions(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
