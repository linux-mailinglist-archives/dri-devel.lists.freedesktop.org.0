Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2654B8EB5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C25610E664;
	Wed, 16 Feb 2022 17:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624DE10E692
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 17:00:11 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso4210389wmq.4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=t1uftG9u+2yZWI/oH72uWkO2zeA82m78vyYn2+ro3tQ=;
 b=Q5NlIpc2xWy6T8g1S7gmluCCRee5TUWmOsGWCAPoOQ+03syhmEFWcigVnorMpWuEgY
 yTJNFzk9n8Ln3p3jdbE0MDh3WuONXBwzSfg4zgPkGKDONqaNsAB75fcrWLtH0o4WLSoX
 JjwrvnuGX5RKVl64ME8P/GGilYW0o0tYNWOdNdp/t80OpZRYEHo6BKXWLm0j/rXqY5Wc
 bQSJgy4P2XEz7zRwKn7Ozq1b/aO3dYm35n+VOiA4kYSf20efuR/pzPoDOEG3X9dgEcfA
 SeSssGo7hrPCt2VmyEAft4XQyU1WeMrqAb/FEEQI1eRW42zK1WjxAz2rjSoAktPRP0UY
 PcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t1uftG9u+2yZWI/oH72uWkO2zeA82m78vyYn2+ro3tQ=;
 b=aFdGVIIEuFuP3jCpVdHJv4vT65dnsn2wwJk2UVKB18BneB8tYkfvymzaY8dd27RlGI
 1n9l6qWIKWOdRDn2nNCa8eK8cdENbmlKb3rCthTiDzH07iuHzhZZwNVD7aAch33FLNZ6
 i+Vd+qnY0rg0i2rlqv6WWRSSIQ5xdZL4lhHux65L8zfTBJlfDgS9u8P3p+gQtHtToOwh
 hT0ucgvwqi31GbmBrn41RCxbgWP6kNIhNpRJHdUmXfQlpF2wzjsrvf295dWrcYSE/WpW
 fH6dt48Icgj8L78GFagB2KF0evDRa3onRfr08FygFUe9d0p16HzVpzoxVn4mVI8BfW/J
 DA5w==
X-Gm-Message-State: AOAM532riT+AgnsLmrj8xMwIpqChpKxkXLL/x2NBZAm5k5w//7wgJ9nA
 kR4PNnDomkRhI3LKc8Xbd8rt8Q==
X-Google-Smtp-Source: ABdhPJw4iYBSBIDWtqJMWCNWYquBUeSbfc8ygtHVcBQ8GOqS2BRYouXVTSGBwdt7EtUs3rEvHmrNHQ==
X-Received: by 2002:a7b:c7cf:0:b0:37b:fb77:af9 with SMTP id
 z15-20020a7bc7cf000000b0037bfb770af9mr2501745wmk.143.1645030809868; 
 Wed, 16 Feb 2022 09:00:09 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id g8sm24059322wrd.9.2022.02.16.09.00.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:00:09 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] DSI host and peripheral initialisation ordering
Date: Wed, 16 Feb 2022 16:59:42 +0000
Message-Id: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
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


Dave Stevenson (2):
  drm: Introduce DRM_BRIDGE_OP_UPSTREAM_FIRST to alter bridge init order
  drm/bridge: Document the expected behaviour of DSI host controllers

 Documentation/gpu/drm-kms-helpers.rst |   7 +
 drivers/gpu/drm/drm_bridge.c          | 235 ++++++++++++++++++++++++++++++----
 include/drm/drm_bridge.h              |   8 ++
 3 files changed, 225 insertions(+), 25 deletions(-)

-- 
2.7.4

