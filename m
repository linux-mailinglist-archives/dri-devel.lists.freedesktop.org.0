Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC62642EE0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1563510E268;
	Mon,  5 Dec 2022 17:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A3510E268
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id m14so19725562wrh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gc+qmxBrHmrfiiuNmQ0BC3E0AW3zu+hCHo5EtkBW8E0=;
 b=NFWRfclqK0SdxUIVYP74bca0V/z8U2C/MrVDsr5ww8KdgqDRGw9irpgkIgCkNI04ER
 ccAqttapp5QBd7bwd7iDxxcI53HWFsFqNydeajbIRDj96AhnkyrMys8VrOUuzdqFFn38
 5qQswaQXc+66dph3K3EmPxTc+5luCPfWU/Xc4HgoZXrNqxUBueOdGF2fGZ96zH9nyF+f
 AkIxFytUYatx5dI6KETPTAj5T+7BAlq6eAGEL6FLWpo041iQY4wc12iP5dvJ9Dw7zDO5
 0nMpWafkubNeLq4iumvF9A0H8AdXSWP7C9HnoPCJuztfF+dTDJKIld/YHVn+0QpQjzBA
 nOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gc+qmxBrHmrfiiuNmQ0BC3E0AW3zu+hCHo5EtkBW8E0=;
 b=XyYJx/6Vt+Ei3ODmlpHprGj26BIQ0ktijsc0fd2yqUhq64QdzrrEZeT49HJSSjZ2FC
 SDDGS4Kx+vkYYmjlV8cmuUZvv/fCZPksIGsuAzyf28mdIsqWcmjAkp0py+G5v/yHfYSA
 k1+upRfZfKenNbYtDKTXmIbF0oygcZbep53GYOHHCd4BnpbHldg809HQPgrLo3LaoC5F
 iHBeC/MAZgJkm8+yvuKcGVuTUWIsTnfeXalP1vVOTYnlaBS8FTIJ1JjNKZ00vEKz62gO
 aKRB9KS5napXvtNJ3NnW7ZVYdCrPxTjNcVeyl4/CkA7w6v0b1wjZa0d4NMbU1y8Ldsnz
 HPdQ==
X-Gm-Message-State: ANoB5pnKC7Ec+vAniiYM/kL0b+ANhgQ2HjDXedj9SfSR4n63PrUHnGx0
 nrdmPmvNcLlFprDuSQwgWvRj+g==
X-Google-Smtp-Source: AA0mqf7CS5H8erioUb0JbeNmo4hO4qtaHav34AyD3UIvDDpj1+3uORAKMvVTDAAOKwJWZuAUP4GWYg==
X-Received: by 2002:a5d:678a:0:b0:242:6d60:faea with SMTP id
 v10-20020a5d678a000000b002426d60faeamr1974276wru.149.1670261625926; 
 Mon, 05 Dec 2022 09:33:45 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/6] DSI host and peripheral initialisation ordering
Date: Mon,  5 Dec 2022 17:33:22 +0000
Message-Id: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All

Changes from v3
- Add patch to remove use of drm_bridge_chain from the MTK DP driver, copying the
  same pattern as Sam used for ps8640.
- Add comment for why we update the bridge pointer in drm_atomic_bridge_chain_post_disable
- Add Frieder's tags

Changes from v2 (sorry it's taken me a while to get around to these):
- Added Sam's patches to drop drm_bridge_chain functions
- Renamed upstream to previously (Sam)
- Moved copying of panel->prepare_prev_first to bridge->pre_enable_prev_first
  from drm_panel_bridge_add_typed to devm_drm_panel_bridge_add_typed (Jagan)

Changes from v1:
- New patch to refactor drm_bridge_chain_post_disable and drm_bridge_chain_pre_enable
  to reuse drm_atomic_bridge_chain_post_disable / drm_atomic_bridge_chain_pre_enable
  but with a NULL state.
- New patch that adds a pre_enable_upstream_first to drm_panel.
- changed from an OPS flag to a bool "pre_enable_upstream_first" in drm_bridge.
- Followed Andrzej's suggestion of using continue in the main loop to avoid
  needing 2 additional loops (one forward to find the last bridge wanting
  upstream first, and the second backwards again).
- Actioned Laurent's review comments on docs patch.

Original cover letter:

Hopefully I've cc'ed all those that have bashed this problem around previously,
or are otherwise linked to DRM bridges.

There have been numerous discussions around how DSI support is currently broken
as it doesn't support initialising the PHY to LP-11 and potentially the clock
lane to HS prior to configuring the DSI peripheral. There is no op where the
interface is initialised but HS video isn't also being sent.
Currently you have:
- peripheral pre_enable (host not initialised yet)
- host pre_enable
- encoder enable
- host enable
- peripheral enable (video already running)

vc4 and exynos currently implement the DSI host as an encoder, and split the
bridge_chain. This fails if you want to switch to being a bridge and/or use
atomic calls as the state of all the elements split off are not added by
drm_atomic_add_encoder_bridges.

dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY, so
the bridge/panel pre_enable can send commands. In their post_disable they then
call the downstream bridge/panel post_disable op manually so that shutdown
commands can be sent before shutting down the PHY. Nothing handles that fact,
so the framework then continues down the bridge chain and calls the post_disable
again, so we get unbalanced panel prepare/unprepare calls being reported [3].

There have been patches[4] proposing reversing the entire direction of
pre_enable and post_disable, but that risks driving voltage into devices that
have yet to be powered up.
There have been discussions about adding either a pre_pre_enable, or adding a
DSI host_op to initialise the host[5]. Both require significant reworking to all
existing drivers in moving initialisation phases.
We have patches that look like they may well be addressing race conditions in
starting up a DSI peripheral[6].

This patch takes a hybrid of the two: an optional reversing of the order for
specific links within the bridge chain within pre_enable and post_disable done
within the drm_bridge framework.
I'm more than happy to move where the flag exists in structures (currently as
DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op), but does
this solve the problem posed? If not, then can you describe the actual scenario
it doesn't cover?
A DSI peripheral can set the flag to get the DSI host initialised first, and
therefore it has a stable LP-11 state before pre_enable. Likewise the peripheral
can still send shutdown commands prior to the DSI host being shut down in
post_disable. It also handles the case where there are multiple devices in the
chain that all want their upstream bridge enabled first, so should there be a
DSI mux between host and peripheral, then it can still get the host to the
correct state.

An example tree is at [7] which is drm-misc-next with these patches and then a
conversion of vc4_dsi to use the atomic bridge functions (will be upstreamed
once we're over this hurdle). It is working happily with the Toshiba TC358762 on
a Raspberry Pi 7" panel.
The same approach but on our vendor 5.15 tree[8] has also been tested
successfully on a TI SN65DSI83 and LVDS panel.

Whilst here, I've also documented the expected behaviour of DSI hosts and
peripherals to aid those who come along after.

Thanks
  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L940
[2] https://lists.freedesktop.org/archives/dri-devel/2022-January/337769.html
[3] https://lists.freedesktop.org/archives/dri-devel/2021-December/333908.html
[4] https://lists.freedesktop.org/archives/dri-devel/2021-October/328476.html
[5] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
[6] https://lists.freedesktop.org/archives/dri-devel/2022-February/341852.html
[7] https://github.com/6by9/linux/tree/drm-misc-next-vc4_dsi
[8] https://github.com/6by9/linux/tree/rpi-5.15.y-sn65dsi83
My branches are going to be out of date by now - sorry.

Dave Stevenson (4):
  drm/mediatek: dp: Replace usage of drm_bridge_chain_ functions
  drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
  drm/panel: Add prepare_prev_first flag to drm_panel
  drm/bridge: Document the expected behaviour of DSI host controllers

Sam Ravnborg (2):
  drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
  drm/bridge: Drop unused drm_bridge_chain functions

 Documentation/gpu/drm-kms-helpers.rst  |   7 +
 drivers/gpu/drm/bridge/panel.c         |   2 +
 drivers/gpu/drm/bridge/parade-ps8640.c |  18 +-
 drivers/gpu/drm/drm_bridge.c           | 294 ++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_dp.c      |   4 +-
 include/drm/drm_bridge.h               |  36 +--
 include/drm/drm_panel.h                |  10 +
 7 files changed, 201 insertions(+), 170 deletions(-)

-- 
2.34.1

