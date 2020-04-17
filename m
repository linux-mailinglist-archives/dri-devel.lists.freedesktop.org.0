Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A31AEB34
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683246E1B3;
	Sat, 18 Apr 2020 09:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B1B6E3F3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:06:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id E83542A2A77
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org,
	Collabora Kernel ML <kernel@collabora.com>
Subject: [PATCH v3 0/7] Convert mtk-dsi to drm_bridge API and get EDID for
 ps8640 bridge
Date: Fri, 17 Apr 2020 17:06:07 +0200
Message-Id: <20200417150614.2631786-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 linux-mediatek@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PS8640 dsi-to-eDP bridge driver is using the panel bridge API,
however, not all the components in the chain have been ported to the
drm_bridge API. Actually, when a panel is attached the default panel's mode
is used, but in some cases we can't get display up if mode getting from
eDP control EDID is not chosen.

This series address that problem, first implements the .get_edid()
callback in the PS8640 driver (which is not used until the conversion is
done) and then, converts the Mediatek DSI driver to use the drm_bridge
API.

As far as I know, we're the only users of the mediatek dsi driver in
mainline, so should be safe to switch to the new chain of drm_bridge API
unconditionally.

The patches has been tested on a Acer Chromebook R13 (Elm) running a
Chrome OS userspace and checking that the valid EDID mode reported by
the bridge is selected.

[1] https://lore.kernel.org/lkml/20200210063523.133333-1-hsinyi@chromium.org/

Changes in v3:
- Replace s/bridge/next bridge/ for comment. (Laurent Pinchart)
- Add the bridge.type. (Laurent Pinchart)
- Use next_bridge field to store the panel bridge. (Laurent Pinchart)
- Add the bridge.type field. (Laurent Pinchart)
- This patch requires https://lkml.org/lkml/2020/4/16/2080 to work
  properly.
- Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)

Changes in v2:
- Do not set connector_type for panel here. (Sam Ravnborg)

Enric Balletbo i Serra (7):
  drm/bridge: ps8640: Get the EDID from eDP control
  drm/bridge_connector: Set default status connected for eDP connectors
  drm/mediatek: mtk_dsi: Rename bridge to next_bridge
  drm/mediatek: mtk_dsi: Convert to bridge driver
  drm/mediatek: mtk_dsi: Use simple encoder
  drm/mediatek: mtk_dsi: Use the drm_panel_bridge API
  drm/mediatek: mtk_dsi: Create connector for bridges

 drivers/gpu/drm/bridge/parade-ps8640.c |  12 ++
 drivers/gpu/drm/drm_bridge_connector.c |   1 +
 drivers/gpu/drm/mediatek/mtk_dsi.c     | 276 ++++++++-----------------
 3 files changed, 96 insertions(+), 193 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
