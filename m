Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A0243490
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9B56E529;
	Thu, 13 Aug 2020 07:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D14F6E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 08:44:05 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 61B75C5C84;
 Wed, 12 Aug 2020 16:36:11 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [103.29.142.67])
 by smtp.263.net (postfix) whith ESMTP id
 P12148T140383488132864S1597221366062844_; 
 Wed, 12 Aug 2020 16:36:10 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4d9e7216a08741cb642cd53bd73f90d4>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: a.hajda@samsung.com
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From: Algea Cao <algea.cao@rock-chips.com>
To: a.hajda@samsung.com, kuankuan.y@gmail.com, hjc@rock-chips.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 airlied@linux.ie, heiko@sntech.de, jernej.skrabec@siol.net,
 algea.cao@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, jonas@kwiboo.se,
 mripard@kernel.org, darekm@google.com, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 jbrunet@baylibre.com, maarten.lankhorst@linux.intel.com, daniel@ffwll.ch
Subject: [PATCH 5/6] drm/rockchip: dw_hdmi: Add get_output_bus_format
Date: Wed, 12 Aug 2020 16:36:03 +0800
Message-Id: <20200812083603.4320-1-algea.cao@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200812083120.743-1-algea.cao@rock-chips.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add get_output_bus_format in dw_hdmi_plat_data to get
hdmi output bus format. The output bus format is determined
by color format and depth, which can be set by rockchip
hdmi properties.

Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
---

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 47 +++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 8f22d9a566db..a602d25639a7 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -100,6 +100,7 @@ struct rockchip_hdmi {
 
 	unsigned int colordepth;
 	enum drm_hdmi_output_type hdmi_output;
+	unsigned long output_bus_format;
 };
 
 #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
@@ -498,6 +499,50 @@ static const struct dw_hdmi_property_ops dw_hdmi_rockchip_property_ops = {
 	.get_property		= dw_hdmi_rockchip_get_property,
 };
 
+static void
+dw_hdmi_rockchip_output_bus_format_select(struct rockchip_hdmi *hdmi)
+{
+	unsigned long bus_format;
+
+	if (hdmi->hdmi_output == DRM_HDMI_OUTPUT_YCBCR420) {
+		if (hdmi->colordepth > 8)
+			bus_format = MEDIA_BUS_FMT_UYYVYY10_0_5X30;
+		else
+			bus_format = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
+	} else if (hdmi->hdmi_output == DRM_HDMI_OUTPUT_YCBCR422) {
+		if (hdmi->colordepth == 12)
+			bus_format = MEDIA_BUS_FMT_UYVY12_1X24;
+		else if (hdmi->colordepth == 10)
+			bus_format = MEDIA_BUS_FMT_UYVY10_1X20;
+		else
+			bus_format = MEDIA_BUS_FMT_UYVY8_1X16;
+	} else {
+		if (hdmi->colordepth > 8) {
+			if (hdmi->hdmi_output != DRM_HDMI_OUTPUT_DEFAULT_RGB)
+				bus_format = MEDIA_BUS_FMT_YUV10_1X30;
+			else
+				bus_format = MEDIA_BUS_FMT_RGB101010_1X30;
+		} else {
+			if (hdmi->hdmi_output != DRM_HDMI_OUTPUT_DEFAULT_RGB)
+				bus_format = MEDIA_BUS_FMT_YUV8_1X24;
+			else
+				bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		}
+	}
+
+	hdmi->output_bus_format = bus_format;
+}
+
+static unsigned long
+dw_hdmi_rockchip_get_output_bus_format(void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+
+	dw_hdmi_rockchip_output_bus_format_select(hdmi);
+
+	return hdmi->output_bus_format;
+}
+
 static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
@@ -685,6 +730,8 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data->property_ops = &dw_hdmi_rockchip_property_ops;
 
+	plat_data->get_output_bus_format =
+		dw_hdmi_rockchip_get_output_bus_format;
 	encoder = &hdmi->encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index dc561ebe7a9b..13495f810328 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -175,6 +175,7 @@ struct dw_hdmi_plat_data {
 	const struct dw_hdmi_phy_config *phy_config;
 	int (*configure_phy)(struct dw_hdmi *hdmi, void *data,
 			     unsigned long mpixelclock);
+	unsigned long (*get_output_bus_format)(void *data);
 };
 
 struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
-- 
2.25.1



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
