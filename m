Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31D7EC1EC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 13:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB8810E546;
	Wed, 15 Nov 2023 12:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79C10E54A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 12:13:45 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id F22302070A;
 Wed, 15 Nov 2023 13:13:42 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/3] drm/bridge: lt8912b: Add suspend/resume support
Date: Wed, 15 Nov 2023 13:13:36 +0100
Message-Id: <20231115121338.22959-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115121338.22959-1-francesco@dolcini.it>
References: <20231115121338.22959-1-francesco@dolcini.it>
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
Cc: Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add support for suspend and resume. The lt8912b will power off when
going into suspend and power on when resuming.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 03532efb893b..097ab04234b7 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -634,6 +634,33 @@ static const struct drm_bridge_funcs lt8912_bridge_funcs = {
 	.get_edid = lt8912_bridge_get_edid,
 };
 
+static int lt8912_bridge_resume(struct device *dev)
+{
+	struct lt8912 *lt = dev_get_drvdata(dev);
+	int ret;
+
+	ret = lt8912_hard_power_on(lt);
+	if (ret)
+		return ret;
+
+	ret = lt8912_soft_power_on(lt);
+	if (ret)
+		return ret;
+
+	return lt8912_video_on(lt);
+}
+
+static int lt8912_bridge_suspend(struct device *dev)
+{
+	struct lt8912 *lt = dev_get_drvdata(dev);
+
+	lt8912_hard_power_off(lt);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(lt8912_bridge_pm_ops, lt8912_bridge_suspend, lt8912_bridge_resume);
+
 static int lt8912_parse_dt(struct lt8912 *lt)
 {
 	struct gpio_desc *gp_reset;
@@ -770,6 +797,7 @@ static struct i2c_driver lt8912_i2c_driver = {
 	.driver = {
 		.name = "lt8912",
 		.of_match_table = lt8912_dt_match,
+		.pm = pm_sleep_ptr(&lt8912_bridge_pm_ops),
 	},
 	.probe = lt8912_probe,
 	.remove = lt8912_remove,
-- 
2.25.1

