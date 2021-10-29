Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FD43FD54
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49326EA58;
	Fri, 29 Oct 2021 13:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867376EA58
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 13:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A44491F45A6F
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: a.hajda@samsung.com
Cc: narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] drm/bridge: parade-ps8640: Move real poweroff action to
 new function
Date: Fri, 29 Oct 2021 15:26:49 +0200
Message-Id: <20211029132650.918761-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029132650.918761-1-angelogioacchino.delregno@collabora.com>
References: <20211029132650.918761-1-angelogioacchino.delregno@collabora.com>
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

In preparation for varying the poweron error handling in function
ps8640_bridge_poweron(), move function ps8640_bridge_poweroff() up
and also move the actual logic to power off the chip to a new
__ps8640_bridge_poweroff() function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 39 +++++++++++++++-----------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 8c5402947b3c..9334217d02c9 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -293,6 +293,28 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 	return 0;
 }
 
+static void __ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
+{
+	int ret;
+
+	gpiod_set_value(ps_bridge->gpio_reset, 1);
+	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
+	if (regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
+				   ps_bridge->supplies)) {
+		DRM_ERROR("cannot disable regulators %d\n", ret);
+	}
+}
+
+static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
+{
+	if (!ps_bridge->powered)
+		return;
+
+	__ps8640_bridge_poweroff(ps_bridge);
+
+	ps_bridge->powered = false;
+}
+
 static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 {
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -361,23 +383,6 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 	return ret;
 }
 
-static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
-{
-	int ret;
-
-	if (!ps_bridge->powered)
-		return;
-
-	gpiod_set_value(ps_bridge->gpio_reset, 1);
-	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
-	ret = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
-				     ps_bridge->supplies);
-	if (ret < 0)
-		DRM_ERROR("cannot disable regulators %d\n", ret);
-
-	ps_bridge->powered = false;
-}
-
 static void ps8640_pre_enable(struct drm_bridge *bridge)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
-- 
2.33.0

