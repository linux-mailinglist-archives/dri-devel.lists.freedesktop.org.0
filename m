Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6004AB052
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 16:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4D110E219;
	Sun,  6 Feb 2022 15:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA8510E136
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 15:44:23 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id cbdf1ec5-8763-11ec-ac19-0050568cd888;
 Sun, 06 Feb 2022 15:45:23 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 27216194BB5;
 Sun,  6 Feb 2022 16:44:19 +0100 (CET)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 0/9] drm/bridge: ps8640 and ti-sn65dsi86 updates
Date: Sun,  6 Feb 2022 16:43:56 +0100
Message-Id: <20220206154405.1243333-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.32.0
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new macro DRM_BRIDGE_STATE_OPS that can be used to
assign atomic_reset and atomic_{duplicate,destroy}_state to
the default implementations. They will be valid in most cases.

Add a drm variant of media-bus-format.h to hold a single
function to get the bpc from the bus format.

Also add a small drm_atomic_helper_bridge_dsi_input_bus_fmt helper.

Update ti-sn65dsi86 to support atomic and NO_CONNECTOR.
The NO_CONNECTOR support was from Rob Clark - I just rebased it.
To support NO_CONNECTOR use the newly introduced function to
lokk up bpc from the bus format.

Update parade-ps8640 to support atomic. To do this just migrate
to the atomic variants of the operations and add the few mandatry
missing callbacks.

A few of the patches are migrated from a patchset I posted several
months ago and I decided to add them here for now, which explains
why there is a v4 of a patch in a v1 submission.

For the output bus fmt stuff I did what I think is correct - but
as I have paged out all my memory of this it may be all wrong.

The code builds - but needs testing.

I was temped to move bridge helpers to a new drm_bridge_helper.c
but that will wait until next time.

	Sam

Rob Clark (1):
      drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support

Sam Ravnborg (8):
      drm/bridge: add DRM_BRIDGE_STATE_OPS macro
      drm: add drm specific media-bus-format header file
      drm: add drm_atomic_helper_bridge_dsi_input_bus_fmt
      drm/bridge: ti-sn65dsi86: Use atomic variants of drm_bridge_funcs
      drm/bridge: ti-sn65dsi86: Fetch bpc via drm_bridge_state
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: ps8640: plug atomic_get_input_bus_fmts
      drm/bridge: Drop unused drm_bridge_chain functions

 drivers/gpu/drm/bridge/parade-ps8640.c |  18 ++++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c  |  57 +++++++++--------
 drivers/gpu/drm/drm_atomic_helper.c    |  41 ++++++++++++
 drivers/gpu/drm/drm_bridge.c           | 110 ---------------------------------
 include/drm/drm_atomic_helper.h        |   7 +++
 include/drm/drm_bridge.h               |  40 ++++--------
 include/drm/media-bus-format.h         |  53 ++++++++++++++++
 7 files changed, 157 insertions(+), 169 deletions(-)


