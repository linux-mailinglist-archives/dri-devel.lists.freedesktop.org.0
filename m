Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002F335FB69
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 21:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B54B6E4D7;
	Wed, 14 Apr 2021 19:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 364 seconds by postgrey-1.36 at gabe;
 Wed, 14 Apr 2021 16:47:29 UTC
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4BC6E4AF;
 Wed, 14 Apr 2021 16:47:29 +0000 (UTC)
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:24 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 14 Apr 2021 09:41:22 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
 by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:11:12 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
 id C4D7C21351; Wed, 14 Apr 2021 22:11:10 +0530 (IST)
From: Rajeev Nandan <rajeevny@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1 3/3] drm/bridge: ti-sn65dsi86: Add DisplayPort aux backlight
 support
Date: Wed, 14 Apr 2021 22:09:50 +0530
Message-Id: <1618418390-15055-4-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
X-Mailman-Approved-At: Wed, 14 Apr 2021 19:14:23 +0000
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
Cc: mkrishn@codeaurora.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to control the backlight of the eDP panel connected to
the ti-sn65dsi86 bridge through aux channel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 drivers/gpu/drm/bridge/Kconfig        |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index e4110d6..e556ec22 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -239,6 +239,7 @@ config DRM_TI_SN65DSI86
 	select REGMAP_I2C
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select DRM_DP_AUX_BACKLIGHT
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index f27306c..813d067 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_aux_backlight.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -126,6 +127,7 @@
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
  * @supplies:     Data for bulk enabling/disabling our regulators.
+ * @backlight:    The DP aux backlight device.
  * @dp_lanes:     Count of dp_lanes we're using.
  * @ln_assign:    Value to program to the LN_ASSIGN register.
  * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
@@ -154,6 +156,7 @@ struct ti_sn_bridge {
 	struct drm_panel		*panel;
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
+	struct drm_dp_aux_backlight	*backlight;
 	int				dp_lanes;
 	u8				ln_assign;
 	u8				ln_polrs;
@@ -431,6 +434,8 @@ static void ti_sn_bridge_disable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
 
+	drm_dp_aux_backlight_disable(pdata->backlight);
+
 	drm_panel_disable(pdata->panel);
 
 	/* disable video stream */
@@ -819,6 +824,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   VSTREAM_ENABLE);
 
 	drm_panel_enable(pdata->panel);
+
+	drm_dp_aux_backlight_enable(pdata->backlight);
 }
 
 static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
@@ -1215,6 +1222,7 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
 	struct ti_sn_bridge *pdata;
+	struct drm_dp_aux_backlight *aux_bl;
 	int ret;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
@@ -1294,9 +1302,27 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
+	if (of_find_property(pdata->dev->of_node, "use-aux-backlight", NULL)) {
+		aux_bl = devm_kzalloc(pdata->dev, sizeof(*aux_bl), GFP_KERNEL);
+		if (!aux_bl) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		aux_bl->dev = pdata->dev;
+		aux_bl->aux = &pdata->aux;
+		ret = drm_dp_aux_backlight_register("ti-sn-aux-backlight", aux_bl);
+		if (ret)
+			goto out;
+		pdata->backlight = aux_bl;
+	}
+
 	ti_sn_debugfs_init(pdata);
 
 	return 0;
+
+out:
+	pm_runtime_disable(pdata->dev);
+	return ret;
 }
 
 static int ti_sn_bridge_remove(struct i2c_client *client)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
