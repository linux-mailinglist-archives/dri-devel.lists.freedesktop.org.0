Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12290435286
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967F06E364;
	Wed, 20 Oct 2021 18:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6E36E364
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:19:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3a529610-31d2-11ec-9c3f-0050568c148b;
 Wed, 20 Oct 2021 18:19:13 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 120B7194B68;
 Wed, 20 Oct 2021 20:19:07 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: PATCH [v2 0/7] drm/bridge: Drop deprecated functions
Date: Wed, 20 Oct 2021 20:18:54 +0200
Message-Id: <20211020181901.2114645-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Over time we have accumulated some deprecated functions etc. in drm_bridge.
This patch-set starts to move over to the atomic variants and deletes what
is not used anymore.

There was only one user of the non-atomic drm_bridge_chain functions in
parade-ps8640 - migrate it to the atomic variants and delete the non-atomic
drm_bridge_chain functions.

There was only one user of drm_bridge_chain_mode_fixup in mediatk. The use
in the mediatek driver was wrong and with the single user gone we could also
delete this function.

Added a few todo items.

Next step is to migrate the easy bridge drivers to use the atomic variants
of drm_bridge_funcs operations. The easy ones are the drivers wihtout
mode_set or mode_fixup.
I have something typed up already, but wanted feedback on this patchset before
sending out additional patches.

v2:
  v2 have been long in the coming as I wanted to wait until I
  started to have some spare time for linux stuff again, and thus time to
  address any comments timely.
  - Added Maxime's r-b (from old thread, so using old mail address [1])
  - Fixed several small issues in patch 3 that introduces a new helper
  - Added a few more folks on cc in hope to see some testing


	Sam


[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-1-sam@ravnborg.org/

Sam Ravnborg (7):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/bridge: Add drm_atomic_get_new_crtc_for_bridge() helper
      drm/bridge: lontium-lt9611: Use atomic variants of drm_bridge_funcs
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst              |  49 +++++++++++
 drivers/gpu/drm/bridge/lontium-lt9611.c |  75 +++++++---------
 drivers/gpu/drm/bridge/parade-ps8640.c  |  14 +--
 drivers/gpu/drm/drm_atomic.c            |  42 +++++++++
 drivers/gpu/drm/drm_bridge.c            | 147 --------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  11 ---
 include/drm/drm_atomic.h                |   3 +
 include/drm/drm_bridge.h                |  31 -------
 8 files changed, 135 insertions(+), 237 deletions(-)


