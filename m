Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBDD60EE4B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 05:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C5A10E234;
	Thu, 27 Oct 2022 03:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CAE10E16F
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 03:02:15 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 27 Oct 2022 11:02:14 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 29R329I1066884;
 Thu, 27 Oct 2022 11:02:09 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from VirtualBox.internal.ite.com.tw (192.168.70.46) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 27 Oct 2022 11:02:09 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v6 2/2] drm/bridge: add it6505 driver to read data-lanes and
 link-frequencies from dt
Date: Thu, 27 Oct 2022 11:01:54 +0800
Message-ID: <20221027030155.59238-3-allen.chen@ite.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027030155.59238-1-allen.chen@ite.com.tw>
References: <20221027030155.59238-1-allen.chen@ite.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.70.46]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: D2FAF83ABC70EADEED34BCE8DDA5CC3317F3AABE3E0EC9380F4DCCB60E1D035E2002:8
X-MAIL: mse.ite.com.tw 29R329I1066884
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
Cc: Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, David Airlie <airlied@linux.ie>,
 Allen Chen <allen.chen@ite.com.tw>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-Yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: allen chen <allen.chen@ite.com.tw>

Add driver to read data-lanes and link-frequencies from dt property to
restrict output bandwidth.

Signed-off-by: Allen chen <allen.chen@ite.com.tw>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 80 +++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index a4302492cf8df..ed4536cde3140 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -437,6 +437,8 @@ struct it6505 {
 	bool powered;
 	bool hpd_state;
 	u32 afe_setting;
+	u32 max_dpi_pixel_clock;
+	u32 max_lane_count;
 	enum hdcp_state hdcp_status;
 	struct delayed_work hdcp_work;
 	struct work_struct hdcp_wait_ksv_list;
@@ -1476,7 +1478,8 @@ static void it6505_parse_link_capabilities(struct it6505 *it6505)
 	it6505->lane_count = link->num_lanes;
 	DRM_DEV_DEBUG_DRIVER(dev, "Sink support %d lanes training",
 			     it6505->lane_count);
-	it6505->lane_count = min_t(int, it6505->lane_count, MAX_LANE_COUNT);
+	it6505->lane_count = min_t(int, it6505->lane_count,
+				   it6505->max_lane_count);
 
 	it6505->branch_device = drm_dp_is_branch(it6505->dpcd);
 	DRM_DEV_DEBUG_DRIVER(dev, "Sink %sbranch device",
@@ -2912,7 +2915,7 @@ it6505_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		return MODE_NO_INTERLACE;
 
-	if (mode->clock > DPI_PIXEL_CLK_MAX)
+	if (mode->clock > it6505->max_dpi_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
 	it6505->video_info.clock = mode->clock;
@@ -3099,10 +3102,32 @@ static int it6505_init_pdata(struct it6505 *it6505)
 	return 0;
 }
 
+static int it6505_get_data_lanes_count(const struct device_node *endpoint,
+				       const unsigned int min,
+				       const unsigned int max)
+{
+	int ret;
+
+	ret = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (ret < 0)
+		return ret;
+
+	if (ret < min || ret > max)
+		return -EINVAL;
+
+	return ret;
+}
+
 static void it6505_parse_dt(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
+	struct device_node *np = dev->of_node, *ep = NULL;
+	int len;
+	u64 link_frequencies;
+	u32 data_lanes[4];
 	u32 *afe_setting = &it6505->afe_setting;
+	u32 *max_lane_count = &it6505->max_lane_count;
+	u32 *max_dpi_pixel_clock = &it6505->max_dpi_pixel_clock;
 
 	it6505->lane_swap_disabled =
 		device_property_read_bool(dev, "no-laneswap");
@@ -3118,7 +3143,56 @@ static void it6505_parse_dt(struct it6505 *it6505)
 	} else {
 		*afe_setting = 0;
 	}
-	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %d", *afe_setting);
+
+	ep = of_graph_get_endpoint_by_regs(np, 1, 0);
+	of_node_put(ep);
+
+	if (ep) {
+		len = it6505_get_data_lanes_count(ep, 1, 4);
+
+		if (len > 0 && len != 3) {
+			of_property_read_u32_array(ep, "data-lanes",
+						   data_lanes, len);
+			*max_lane_count = len;
+		} else {
+			*max_lane_count = MAX_LANE_COUNT;
+			dev_err(dev, "error data-lanes, use default");
+		}
+	} else {
+		*max_lane_count = MAX_LANE_COUNT;
+		dev_err(dev, "error endpoint, use default");
+	}
+
+	ep = of_graph_get_endpoint_by_regs(np, 0, 0);
+	of_node_put(ep);
+
+	if (ep) {
+		len = of_property_read_variable_u64_array(ep,
+							  "link-frequencies",
+							  &link_frequencies, 0,
+							  1);
+		if (len >= 0) {
+			do_div(link_frequencies, 1000);
+			if (link_frequencies > 297000) {
+				dev_err(dev,
+					"max pixel clock error, use default");
+				*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
+			} else {
+				*max_dpi_pixel_clock = link_frequencies;
+			}
+		} else {
+			dev_err(dev, "error link frequencies, use default");
+			*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
+		}
+	} else {
+		dev_err(dev, "error endpoint, use default");
+		*max_dpi_pixel_clock = DPI_PIXEL_CLK_MAX;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "using afe_setting: %u, max_lane_count: %u",
+			     it6505->afe_setting, it6505->max_lane_count);
+	DRM_DEV_DEBUG_DRIVER(dev, "using max_dpi_pixel_clock: %u kHz",
+			     it6505->max_dpi_pixel_clock);
 }
 
 static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
-- 
2.25.1

