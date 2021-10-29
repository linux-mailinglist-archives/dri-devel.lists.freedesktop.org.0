Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 944B343FD56
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 15:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9966EA5B;
	Fri, 29 Oct 2021 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E863B6EA5B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 13:27:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4CD2C1F45A72
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: a.hajda@samsung.com
Cc: narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/3] drm/bridge: parade-ps8640: Perform full poweroff if
 poweron fails
Date: Fri, 29 Oct 2021 15:26:50 +0200
Message-Id: <20211029132650.918761-3-angelogioacchino.delregno@collabora.com>
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

In function ps8640_bridge_poweron(), in case of a failure not relative
to the regulators enablement, the code was disabling the regulators but
the gpio changes that happened during the poweron sequence were not
being reverted back to a clean poweroff state.

Since it is expected that, when we enter ps8640_bridge_poweron(), the
powerdown and reset GPIOs are both in active state exactly as they were
left in the poweroff function before, we can simply call function
__ps8640_bridge_poweroff() in the failure case, reverting every change
that was done during the power on sequence.

Of course it was chosen to call the poweroff function instead of adding
code to revert the GPIO changes to the poweron one to avoid duplicating
code, as we would be doing exactly what the poweroff function does.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 9334217d02c9..8b54b515828a 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -346,7 +346,7 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 
 	if (ret < 0) {
 		DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
-		goto err_regulators_disable;
+		goto err_poweroff;
 	}
 
 	msleep(50);
@@ -362,23 +362,22 @@ static int ps8640_bridge_poweron(struct ps8640 *ps_bridge)
 	ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
 	if (ret < 0) {
 		DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
-		goto err_regulators_disable;
+		goto err_poweroff;
 	}
 
 	/* Switch access edp panel's edid through i2c */
 	ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
 	if (ret < 0) {
 		DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
-		goto err_regulators_disable;
+		goto err_poweroff;
 	}
 
 	ps_bridge->powered = true;
 
 	return 0;
 
-err_regulators_disable:
-	regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
-			       ps_bridge->supplies);
+err_poweroff:
+	__ps8640_bridge_poweroff(ps_bridge);
 
 	return ret;
 }
-- 
2.33.0

