Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97B1253E5B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 08:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CE66EB33;
	Thu, 27 Aug 2020 06:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985436EA3B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 08:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 95E3929943E
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] drm/bridge: ps8640: Print an error if VDO control fails
Date: Wed, 26 Aug 2020 10:15:25 +0200
Message-Id: <20200826081526.674866-5-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826081526.674866-1-enric.balletbo@collabora.com>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Aug 2020 06:57:36 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print an error message inside ps8640_bridge_vdo_control() function when
it fails so we can simplify a bit the callers, they will only need to
check the error code.

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2: None

 drivers/gpu/drm/bridge/parade-ps8640.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index ce3e8b2da8c9..9f7b7a9c53c5 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -82,8 +82,11 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
 	ret = i2c_smbus_write_i2c_block_data(client, PAGE3_SET_ADD,
 					     sizeof(vdo_ctrl_buf),
 					     vdo_ctrl_buf);
-	if (ret < 0)
+	if (ret < 0) {
+		DRM_ERROR("failed to %sable VDO: %d\n",
+			  ctrl == ENABLE ? "en" : "dis", ret);
 		return ret;
+	}
 
 	return 0;
 }
@@ -150,10 +153,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 	}
 
 	ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
-	if (ret) {
-		DRM_ERROR("failed to enable VDO: %d\n", ret);
+	if (ret)
 		goto err_regulators_disable;
-	}
 
 	/* Switch access edp panel's edid through i2c */
 	ret = i2c_smbus_write_byte_data(client, PAGE2_I2C_BYPASS,
@@ -175,9 +176,7 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	int ret;
 
-	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
-	if (ret < 0)
-		DRM_ERROR("failed to disable VDO: %d\n", ret);
+	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
 
 	gpiod_set_value(ps_bridge->gpio_reset, 1);
 	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
