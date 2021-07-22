Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D863D1E28
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 08:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD406E94C;
	Thu, 22 Jul 2021 06:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90536E94C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 06:23:00 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 4a41c1df-eab5-11eb-8d1a-0050568cd888;
 Thu, 22 Jul 2021 06:23:12 +0000 (UTC)
Received: from saturn.lan (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 253FF194B25;
 Thu, 22 Jul 2021 08:23:11 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/7] drm/bridge: Drop deprecated functions
Date: Thu, 22 Jul 2021 08:22:39 +0200
Message-Id: <20210722062246.2512666-1-sam@ravnborg.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
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

	Sam

Sam Ravnborg (7):
      drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
      drm/bridge: Drop unused drm_bridge_chain functions
      drm/bridge: Add drm_bridge_new_crtc_state() helper
      drm/bridge: lontium-lt9611: Use atomic variants of drm_bridge_funcs
      drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      drm/bridge: Drop drm_bridge_chain_mode_fixup
      drm/todo: Add bridge related todo items

 Documentation/gpu/todo.rst              |  47 ++++++++++
 drivers/gpu/drm/bridge/lontium-lt9611.c |  69 ++++++---------
 drivers/gpu/drm/bridge/parade-ps8640.c  |  14 +--
 drivers/gpu/drm/drm_atomic.c            |  34 ++++++++
 drivers/gpu/drm/drm_bridge.c            | 147 --------------------------------
 drivers/gpu/drm/mediatek/mtk_hdmi.c     |  11 ---
 include/drm/drm_atomic.h                |   3 +
 include/drm/drm_bridge.h                |  31 -------
 8 files changed, 119 insertions(+), 237 deletions(-)



