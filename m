Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790C9A3899
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 10:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1A10E0F7;
	Fri, 18 Oct 2024 08:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 570 seconds by postgrey-1.36 at gabe;
 Fri, 18 Oct 2024 08:33:43 UTC
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A810E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 08:33:43 +0000 (UTC)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by cantor.telenet-ops.be (Postfix) with ESMTPS id 4XVHmV3trhz4wxTB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:24:10 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
 by baptiste.telenet-ops.be with cmsmtp
 id RkQ32D00D1MdCM201kQ38B; Fri, 18 Oct 2024 10:24:10 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1t1iGy-003z14-3v;
 Fri, 18 Oct 2024 10:24:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1t1hgJ-005rH0-4Y;
 Fri, 18 Oct 2024 09:45:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
Date: Fri, 18 Oct 2024 09:45:52 +0200
Message-Id: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Each bridge instance creates up to four auxiliary devices with different
names.  However, their IDs are always zero, causing duplicate filename
errors when a system has multiple bridges:

    sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn65dsi86.gpio.0'

Fix this by using a unique instance ID per bridge instance.

Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
/sys/bus/auxiliary/devices
├── ti_sn65dsi86.gpio.0
├── ti_sn65dsi86.pwm.0
├── ti_sn65dsi86.aux.0
├── ti_sn65dsi86.bridge.0
├── ti_sn65dsi86.gpio.1
├── ti_sn65dsi86.pwm.1
├── ti_sn65dsi86.aux.1
└── ti_sn65dsi86.bridge.1
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 9e31f750fd889745..8f6ac48aefdb70b3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
+#include <linux/idr.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
@@ -168,6 +169,7 @@
  * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
  * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
+ * @id:           Unique instance ID
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		*bridge_aux;
@@ -202,8 +204,11 @@ struct ti_sn65dsi86 {
 	atomic_t			pwm_pin_busy;
 #endif
 	unsigned int			pwm_refclk_freq;
+	int				id;
 };
 
+static DEFINE_IDA(ti_sn65dsi86_ida);
+
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
 	{ .range_min = 0, .range_max = 0xFF },
 };
@@ -488,6 +493,7 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 		return -ENOMEM;
 
 	aux->name = name;
+	aux->id = pdata->id;
 	aux->dev.parent = dev;
 	aux->dev.release = ti_sn65dsi86_aux_device_release;
 	device_set_of_node_from_dev(&aux->dev, dev);
@@ -1889,6 +1895,13 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
 				       pdata->supplies);
 }
 
+static void ti_sn65dsi86_devm_ida_free(void *data)
+{
+	struct ti_sn65dsi86 *pdata = data;
+
+	ida_free(&ti_sn65dsi86_ida, pdata->id);
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -1903,6 +1916,17 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
+
+	ret = ida_alloc(&ti_sn65dsi86_ida, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	pdata->id = ret;
+
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_devm_ida_free, pdata);
+	if (ret)
+		return ret;
+
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
 
-- 
2.34.1

