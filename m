Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C32C362B38
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251C36E102;
	Fri, 16 Apr 2021 22:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDA86E102
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:40:53 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id a12so19258037pfc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViswrO4sNM/Xqi4udoIc8TV1g5Dhwym3dG9TOSi7ivs=;
 b=TMpqd+SZZNmTBRTV6uWewh2kSXCh2ZpBo6CN20Dp1CF52eaoP14/KHfKKwODaGwtt5
 xl0iLUpo8safOBqsFCvyhS5LCcuKLHRmVOjaOrgrg9NYd9R1G99pU2Ryy6JuC3vJBP5U
 5TgykYHu6b4idrMShUykAgXxtyU1Zhne4XTJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ViswrO4sNM/Xqi4udoIc8TV1g5Dhwym3dG9TOSi7ivs=;
 b=J3LPowflFnq5GCwmo6Ylv0g64b2z6xFDz/nrQsIzwZg9CufwrleJcAHT/83YavZZwL
 rTHTqk+lHjwG3M8+cmrLAXIXoS8sZb1SfzTRPcu63k7Nfl8OLsCvdVH3sj/dl3BmKCld
 jCeMer5m+yPpj733opat/aDVshzmjdFA9F58NUA0Wg4Sd4PTlKiqBXoEgOJdKoW3jfvr
 NxdQEOlgUKbttCxTnt73V5OvjP+pPWv9QeRd8QHzZ80Lt1NDhui/avAtFOC+lYWLzoB/
 eM1KkfMYnyi6ELfL+yhoq/NswuTZZTPUfOA+KVR1Yi4gyWA2rl7k02PWceLN39iT2gdo
 X7LQ==
X-Gm-Message-State: AOAM5324Jm+5Qe3YgztULtJRIzKSK5tbv/N5LevbxGUzaoaUvneCacMU
 5yAWS5J1t8LB9qIDAtNiSRhVdw==
X-Google-Smtp-Source: ABdhPJx6lCORDd6OQS0dzEmoduf0wcmDKI4UY+j+Y/gi2+7rXDlEFFzUVrPJJjly2rZhsMrKa7vSlw==
X-Received: by 2002:a63:c446:: with SMTP id m6mr1059717pgg.71.1618612853290;
 Fri, 16 Apr 2021 15:40:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:40:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 00/27] drm: Fix EDID reading on ti-sn65dsi86;
 solve some chicken-and-egg problems
Date: Fri, 16 Apr 2021 15:39:23 -0700
Message-Id: <20210416223950.3586967-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
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
Cc: David Airlie <airlied@linux.ie>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robdclark@chromium.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-i2c@vger.kernel.org
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

This patch was developed agains linuxnext (next-20210416) on a
sc7180-trogdor-lazor device. To get things booting for me, I had to
use Stephen's patch [2] to keep from crashing but otherwise all the
patches I needed were here.

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

I apologize in advance for the length of this series. I'm currently
working through getting commit access to drm-misc [3] so I can land
the first several patches which are already reviewed. There are still
a lot of patches even after the first few, but hopefully you can see
that there are only so many because they're broken up into nice and
reviewable bite-sized-chunks. :-)

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/
[3] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/348

Changes in v4:
- Reword commit mesage slightly.

Changes in v3:
- Removed "NOTES" from commit message.

Changes in v2:
- Removed 2nd paragraph in commit message.

Douglas Anderson (27):
  drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
  drm/bridge: ti-sn65dsi86: Simplify refclk handling
  drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
  drm/bridge: ti-sn65dsi86: Reorder remove()
  drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
  drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
  drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare /
    prepare
  drm/bridge: ti-sn65dsi86: Rename the main driver data structure
  drm/bridge: ti-sn65dsi86: More renames in prep for sub-devices
  drm/bridge: ti-sn65dsi86: Clean debugfs code
  drm/bridge: ti-sn65dsi86: Add local var for "dev" to simplify probe
  drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
  drm/bridge: ti-sn65dsi86: Use devm to do our runtime_disable
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
  drm/panel: panel-simple: Prepare/unprepare are refcounted, not forced

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |   1 +
 drivers/gpu/drm/bridge/Kconfig               |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 748 ++++++++++++-------
 drivers/gpu/drm/drm_bridge.c                 |   3 +
 drivers/gpu/drm/panel/Kconfig                |   1 +
 drivers/gpu/drm/panel/panel-simple.c         | 123 +--
 drivers/i2c/i2c-core-of.c                    |  17 +-
 7 files changed, 555 insertions(+), 339 deletions(-)

-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
