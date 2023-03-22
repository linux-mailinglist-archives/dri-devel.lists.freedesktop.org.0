Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5697B6C4D0F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 15:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B2610E94F;
	Wed, 22 Mar 2023 14:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 22 Mar 2023 14:08:30 UTC
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D58D10E94F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 14:08:30 +0000 (UTC)
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch
 [31.10.206.125])
 by mail11.truemail.it (Postfix) with ESMTPA id B465C2095C;
 Wed, 22 Mar 2023 15:03:14 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not
 found
Date: Wed, 22 Mar 2023 15:03:09 +0100
Message-Id: <20230322140309.95936-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Matheus Castello <matheus.castello@toradex.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matheus Castello <matheus.castello@toradex.com>

Returns EPROBE_DEFER when of_drm_find_bridge() fails, this is consistent
with what all the other DRM bridge drivers are doing and this is
required since the bridge might not be there when the driver is probed
and this should not be a fatal failure.

Cc: <stable@vger.kernel.org>
Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
Signed-off-by: Matheus Castello <matheus.castello@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 2019a8167d69..fec02e47cfdb 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -676,8 +676,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 
 	lt->hdmi_port = of_drm_find_bridge(port_node);
 	if (!lt->hdmi_port) {
-		dev_err(lt->dev, "%s: Failed to get hdmi port\n", __func__);
-		ret = -ENODEV;
+		dev_dbg(lt->dev, "%s: Failed to get hdmi port\n", __func__);
+		ret = -EPROBE_DEFER;
 		goto err_free_host_node;
 	}
 
-- 
2.25.1

