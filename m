Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9A4CD783
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BE410FCF3;
	Fri,  4 Mar 2022 15:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F1E10FCE2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:18:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e24so182245wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=LpEm5lITSK4dVx393iF9G4choTREyA8qM+KlZcxhxjk=;
 b=Ywsd9rLTQG/vh7O58Y9DrgeNFIU+rIM6lqep+fzP6SrZQQ97pLAhL4ptB88jsSj2XA
 AdLSFA3Int3H0f0Qx38CBm4sUZeSRxZ8Fsdqd/BJuEGALgDW6w0d+qT8BJ4QbCja9tby
 bqcrfr4xOzywCdSozmMNRhFfqI2kSc52D5z+3SVMe/iYpL2QMpYh92LcmZo1ehLRg8os
 zpL+jeYRhs/Wvf47JGk68iZB7pnDc9doP1yl1OUOq6+4cUgFoNU064RoZTu+Qfb1YcBw
 F2jRWGvTkIwQV/fQjLAoredN7IzXg0uL7IrEYqXSUyTZ2R/O0JlRRS9z0HB1iGA0dNqT
 +2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LpEm5lITSK4dVx393iF9G4choTREyA8qM+KlZcxhxjk=;
 b=Ad3vj969PU8Mdg2oPwfebxyPL0ljEm6BFVU7qcvHYHYG+PvL7g+Lm5Efp7mbPnEkju
 VaOxFsKGvCBHrkpnd7fiB39bidMZnnznpX03aDEniuipTQJt0yNiRKYbe0pR5oucIgMS
 9M1LJZLz5h0Q6lXoeWFgg9b/YLE2Y8dttGc+mhN8rf+tmd/fx6/YPb/kv7DwCt7sW1OG
 i5ZsIY0EDewzh0qmtUGlKqnZ1hoB2/wctqugjpY/fvg/yzFlMk3rdPeli0/Fh4/P6T+k
 cHNSTncoJRfxTZUTOklT5T7oXAS2O8xOuq6WKEvAqZpaQ8ZZ5W4u+pAxaGb8Jp72e9OB
 +c/A==
X-Gm-Message-State: AOAM530a4kLb/39LrEszDl2U3gnpaA2JizAZqQ2mZBb9bT1ciU9L15Fm
 Z820tlEZdh3xlVr2VxFG9ENvOg==
X-Google-Smtp-Source: ABdhPJxd2Sw75dp5OHnwpqDxVDen65umRPtbl9UZgVMLyPy5f+p4UHLKhlIg65W7dSN5UwKEUOrqDA==
X-Received: by 2002:adf:ea4a:0:b0:1f0:6501:80f7 with SMTP id
 j10-20020adfea4a000000b001f0650180f7mr4039469wrn.306.1646407100027; 
 Fri, 04 Mar 2022 07:18:20 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4409711wrq.3.2022.03.04.07.18.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Mar 2022 07:18:19 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Date: Fri,  4 Mar 2022 15:17:55 +0000
Message-Id: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All

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

Dave Stevenson (4):
  drm/bridge: Remove duplication from drm_bridge and drm_atomic_bridge
    chains
  drm/bridge: Introduce pre_enable_upstream_first to alter bridge init
    order
  drm/panel: Add prepare_upstream_first flag to drm_panel
  drm/bridge: Document the expected behaviour of DSI host controllers

 Documentation/gpu/drm-kms-helpers.rst |   7 ++
 drivers/gpu/drm/bridge/panel.c        |   3 +
 drivers/gpu/drm/drm_bridge.c          | 181 ++++++++++++++++++++++++----------
 include/drm/drm_bridge.h              |   8 ++
 include/drm/drm_panel.h               |  10 ++
 5 files changed, 159 insertions(+), 50 deletions(-)

-- 
2.7.4

