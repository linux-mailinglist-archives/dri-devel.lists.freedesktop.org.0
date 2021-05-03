Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20343722C2
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 23:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0F6E19A;
	Mon,  3 May 2021 21:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15566E19A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 21:59:15 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id v191so5342785pfc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7XeQvyBWVKf0skvGUDMoW46+5itY3Fyc7Jw/oYmvtIY=;
 b=H2ea2bGlnrHk4qW8bhoexRGleeKJrdwsxjY0tTeNoasXxX+IKlVRsmEalrXV+m7p8+
 aVHEygDDJi7N4xXnLTikV6Hw9H9SiJhyCTvm8v8ZSj03PJbvAiEp1vXbawBNW7ImJSFA
 be03HIV39CqugEOR2d6Eqgbsfb7QFX5OLns2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7XeQvyBWVKf0skvGUDMoW46+5itY3Fyc7Jw/oYmvtIY=;
 b=OXOkTZ+cUwEBJPKQWCLvdIMfvYXQfoKBP7iLEz/7LUADrCrFIJQZ2vX1Q26rrYaWRF
 8WwkOnDK3sTiegMDwOxO4LFAfr3wrQFuONQpaZBvytczDXHQdWALI0dAjkTEdTgD+duB
 5J8RsCBzQBZzSBQ6uR4rfUSQ73awyFFUD+aFt6kxOvzhCq16u0wWtvZ011PcIHgQ6A8e
 +C4SFJPaFUPRQIcHtcQOhiTNc8WrECp1un8wVoV1C2TBPM8A9C4HXptAHDFAWaiVNfEP
 EidqaU1nE38GXGjtHojn329YLjMiR4JhD2o+XAAJDaDuGBq9JMVawp/PuvFg88mX8x8/
 ChCA==
X-Gm-Message-State: AOAM533dYw3X2OQjKmnCcsLCJJONOWfgM4uQd2ll+TMaSRdIbczc6o7x
 W/6ZBnRen2veYkf6sxx1O1AYSA==
X-Google-Smtp-Source: ABdhPJwalh66tJUrM/p0Z5iQ0SbnYg85Q29PsA9CRlkQ2sJN+bz79V9/rdyANt1QbA7FDn4F6uZDqg==
X-Received: by 2002:a63:a62:: with SMTP id z34mr19857861pgk.189.1620079155125; 
 Mon, 03 May 2021 14:59:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a592:ac50:b17b:5c43])
 by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:59:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v6 0/5] drm: Fix EDID reading on ti-sn65dsi86;
 solve some chicken-and-egg problems
Date: Mon,  3 May 2021 14:58:39 -0700
Message-Id: <20210503215844.2996320-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-i2c@vger.kernel.org,
 robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andy Gross <agross@kernel.org>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
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
if refclk") [1].

At v6 now, this patch series is smaller as I have landed most of the
cleanup patches. I've previously sent out a summary [2]. Now it just
has the i2c fix and some of the more controversial parts.

This patch was developed agains linuxnext (next-20210416) with
drm-misc-next (as of 20210503) merged in on a sc7180-trogdor-lazor
device. To get things booting for me, I had to use Stephen's patch [3]
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

Between v5 and v6 this patch added the patch ("drm/dp: Allow an early
call to register DDC i2c bus") and only includes the patches that
haven't already landed.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/dri-devel/CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com/
[3] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/

Changes in v6:
- ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (5):
  i2c: i2c-core-of: Fix corner case of finding adapter by node
  drm/dp: Allow an early call to register DDC i2c bus
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: Link the panel to the bridge's DDC bus

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 99 +++++++++++++-------
 drivers/gpu/drm/drm_dp_helper.c              | 67 ++++++++++---
 drivers/i2c/i2c-core-of.c                    | 17 ++--
 include/drm/drm_dp_helper.h                  |  2 +
 5 files changed, 134 insertions(+), 52 deletions(-)

-- 
2.31.1.527.g47e6f16901-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
