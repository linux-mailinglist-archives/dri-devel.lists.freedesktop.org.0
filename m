Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A8843FD55
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E7136EA5C;
	Fri, 29 Oct 2021 13:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207DD6EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 13:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0DC271F45A6E
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: a.hajda@samsung.com
Cc: narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] drm/bridge: parade-ps8640: Don't try to enable VDO if
 poweron fails
Date: Fri, 29 Oct 2021 15:26:48 +0200
Message-Id: <20211029132650.918761-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
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

If the bridge cannot get powered on, there's no reason to try to
communicate with it: change the ps8640_bridge_poweron function to
return an error value to the caller, so that we can avoid calling
ps8640_bridge_vdo_control() in ps8640_pre_enable() if the poweron
sequence fails.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 4b36e4dc78f1..8c5402947b3c 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -293,19 +293,19 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 	return 0;
 }
 
-static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
+static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
 	int ret, status;
 
 	if (ps_bridge->powered)
-		return;
+		return 0;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
 				    ps_bridge->supplies);
 	if (ret < 0) {
 		DRM_ERROR("cannot enable regulators %d\n", ret);
-		return;
+		return ret;
 	}
 
 	gpiod_set_value(ps_bridge->gpio_powerdown, 0);
@@ -352,11 +352,13 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 
 	ps_bridge->powered = true;
 
-	return;
+	return 0;
 
 err_regulators_disable:
 	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
 			       ps_bridge->supplies);
+
+	return ret;
 }
 
 static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
@@ -381,7 +383,9 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	int ret;
 
-	ps8640_bridge_poweron(ps_bridge);
+	ret = ps8640_bridge_poweron(ps_bridge);
+	if (ret)
+		return;
 
 	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
 	if (ret < 0)
-- 
2.33.0

