Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D26408B4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C910E0C0;
	Fri,  2 Dec 2022 14:47:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097D10E143
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:47:30 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so6624842wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Je/MlxqhkzO2j7i49SS0WUbHgkx+oTQ3UEcXkxEVADg=;
 b=YmyEuIvTY2uuchL86i9KOKeXihiopY1ASIGDauZJ9AqaOYxIzG4am9HdvjUTGCC9rX
 KuySJ0m8a+6IbNu4axXQnZg05qZ/p3WJCM4d1x/XXxRdhVX9h7pqcnE6WR6bJ3s5JMgI
 lf6cQzoTyK4VwZRBJ54XCryh3RP2bFHHK7bQZEHV0aOqWDIlK4+iqxVtAmXlJtUmIuud
 07zBGcsAjrP4bgPelqa6vGJfciPNUOS0vij1+/pNSnhtI8SDs/9Z/VWBHW5asTs7EBKt
 mWGa7jHOpw412zNDi2k4j0Rkv9xGWX8OyjE0GKEEn7mzouP4WbXqk+abmLFbHTIFD4Nj
 AJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Je/MlxqhkzO2j7i49SS0WUbHgkx+oTQ3UEcXkxEVADg=;
 b=ncJojjrjQJEV/8pNJ3/E+8vamunZ5BgKOFHhsarm1QwKR83kbjOUyk64jralTeXd2p
 IW3AVkNKUM4sQKHu8P01YMLNYZVfmT44/FOh7OMKLeJNbdXqJnNdWRHpfxCXidvs0opM
 m/0ekTXg45Zi/ehFCRkyJkDa20/Cr+Is684MqCDe+tCl0chuZ4jJOFhAOOj122Lb7eOs
 bSDI5TEJZ7clsYKlCaIzHA3YmPZbXRk7muXQrnbxy/U3vd3oFkCha12H1c6oGwFIhnAH
 saRZg1C1dbyCeWiEZBhU3JNWqafu6RvcoyjEleJmjjXsZUCk1X8YN+jcQsErkcGapkYv
 /+sw==
X-Gm-Message-State: ANoB5pkUJxZT7BXNZDVp+3ZJbp6VT/y7dRn+uUtMtTKJDXXuC0II1akY
 B9gqTKj6fYUG667EUXI7lqMmUw==
X-Google-Smtp-Source: AA0mqf6Uw1gMuqvZufwrAJB9M6RRah4spsqEAekZwF79JSI2U0yBJwATdI2O1VxSFCVuYxvaQ/z78Q==
X-Received: by 2002:a05:600c:3514:b0:3cf:a985:7692 with SMTP id
 h20-20020a05600c351400b003cfa9857692mr45433268wmq.104.1669992448589; 
 Fri, 02 Dec 2022 06:47:28 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm10700152wms.44.2022.12.02.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:47:28 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] DSI host and peripheral initialisation ordering
Date: Fri,  2 Dec 2022 14:28:11 +0000
Message-Id: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
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

Dave Stevenson (3):
  drm/bridge: Introduce pre_enable_prev_first to alter bridge init order
  drm/panel: Add prepare_prev_first flag to drm_panel
  drm/bridge: Document the expected behaviour of DSI host controllers

Sam Ravnborg (2):
  drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
  drm/bridge: Drop unused drm_bridge_chain functions

 Documentation/gpu/drm-kms-helpers.rst  |   7 +
 drivers/gpu/drm/bridge/panel.c         |   2 +
 drivers/gpu/drm/bridge/parade-ps8640.c |  18 +-
 drivers/gpu/drm/drm_bridge.c           | 293 ++++++++++++++-----------
 include/drm/drm_bridge.h               |  36 +--
 include/drm/drm_panel.h                |  10 +
 6 files changed, 198 insertions(+), 168 deletions(-)

-- 
2.34.1

