Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47FAC8C06
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 12:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E3F10E803;
	Fri, 30 May 2025 10:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3D010E7E6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:21:08 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4b7zHX1ZfWzCtWk;
 Fri, 30 May 2025 17:59:52 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 59293180B27;
 Fri, 30 May 2025 18:03:38 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:38 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 May 2025 18:03:37 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <lidongming5@huawei.com>, <libaihan@huawei.com>, <shenjian15@huawei.com>,
 <shaojijie@huawei.com>, <jani.nikula@linux.intel.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm-dp 06/10] drm/hisilicon/hibmc: add dp mode valid check
Date: Fri, 30 May 2025 17:54:28 +0800
Message-ID: <20250530095432.1206966-7-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250530095432.1206966-1-shiyongbang@huawei.com>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100007.china.huawei.com (7.202.195.175)
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

From: Baihan Li <libaihan@huawei.com>

If DP is connected, add mode check and BW check in mode_valid_ctx() to
ensure DP's cfg is usable.

Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 10 ++++
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  7 +++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 59 +++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index ee0b543afd7f..4f93d60b932b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -259,6 +259,16 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp)
 	dp->dp_dev->link.status.channel_equalized = false;
 }
 
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.link_rate;
+}
+
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp)
+{
+	return dp->dp_dev->link.cap.lanes;
+}
+
 static const struct hibmc_dp_color_raw g_rgb_raw[] = {
 	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
 	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 68867475508c..ebc7256ad006 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -12,6 +12,10 @@
 #include <drm/drm_print.h>
 #include <drm/display/drm_dp_helper.h>
 
+/* 27 * 10000000 * 80% = 216000000 */
+#define DP_MODE_VALI_CAL	216000000
+#define BPP_24				24
+
 struct hibmc_dp_dev;
 
 enum hibmc_dp_cbar_pattern {
@@ -51,6 +55,7 @@ struct hibmc_dp {
 	struct hibmc_dp_cbar_cfg cfg;
 	u32 irq_status;
 	int hpd_status;
+	bool is_connected;
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
@@ -61,5 +66,7 @@ void hibmc_dp_reset_link(struct hibmc_dp *dp);
 void hibmc_dp_hpd_cfg(struct hibmc_dp *dp);
 void hibmc_dp_enable_int(struct hibmc_dp *dp);
 void hibmc_dp_disable_int(struct hibmc_dp *dp);
+u8 hibmc_dp_get_link_rate(struct hibmc_dp *dp);
+u8 hibmc_dp_get_lanes(struct hibmc_dp *dp);
 
 #endif
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 191fb434baa7..e4b13f21ccb3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -16,8 +16,31 @@
 #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
 #define HIBMC_DP_MASKED_SINK_HPD_UNPLUG_INT	BIT(3)
 
+struct hibmc_dp_disp_clk {
+	u16 hdisplay;
+	u16 vdisplay;
+	u32 clock;
+};
+
+static const struct hibmc_dp_disp_clk hibmc_dp_clk_table[] = {
+	{640, 480, 25175}, /* 25175 khz */
+	{800, 600, 40000}, /* 40000 khz */
+	{1024, 768, 65000}, /* 65000 khz */
+	{1152, 864, 80000}, /* 80000 khz */
+	{1280, 768, 79500}, /* 79500 khz */
+	{1280, 720, 74250}, /* 74250 khz */
+	{1280, 960, 108000}, /* 108000 khz */
+	{1280, 1024, 108000}, /* 108000 khz */
+	{1440, 900, 106500}, /* 106500 khz */
+	{1600, 900, 108000}, /* 108000 khz */
+	{1600, 1200, 162000}, /* 162000 khz */
+	{1920, 1080, 148500}, /* 148500 khz */
+	{1920, 1200, 193250}, /* 193250 khz */
+};
+
 static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 {
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
 	const struct drm_edid *drm_edid;
 	int count;
 
@@ -27,6 +50,8 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 
 	count = drm_edid_connector_add_modes(connector);
 
+	dp->is_connected = !!count;
+
 	drm_edid_free(drm_edid);
 
 	return count;
@@ -43,9 +68,43 @@ static int hibmc_dp_detect(struct drm_connector *connector,
 		return connector_status_disconnected;
 }
 
+static int hibmc_dp_mode_valid(struct drm_connector *connector,
+			       const struct drm_display_mode *mode,
+			       struct drm_modeset_acquire_ctx *ctx,
+			       enum drm_mode_status *status)
+{
+	struct hibmc_dp *dp = to_hibmc_dp(connector);
+	u64 cur_val, max_val;
+
+	if (!dp->is_connected) {
+		*status = MODE_OK;
+		return 0;
+	}
+
+	/* check DP link BW */
+	cur_val = (u64)mode->htotal * mode->vtotal * drm_mode_vrefresh(mode) * BPP_24;
+	max_val = (u64)hibmc_dp_get_link_rate(dp) * DP_MODE_VALI_CAL * hibmc_dp_get_lanes(dp);
+	if (cur_val > max_val)
+		*status = MODE_CLOCK_HIGH;
+	else
+		*status = MODE_OK;
+
+	/* check the clock */
+	for (size_t i = 0; i < ARRAY_SIZE(hibmc_dp_clk_table); i++) {
+		if (hibmc_dp_clk_table[i].hdisplay == mode->hdisplay &&
+		    hibmc_dp_clk_table[i].vdisplay == mode->vdisplay) {
+			if (hibmc_dp_clk_table[i].clock != mode->clock)
+				*status = MODE_CLOCK_RANGE;
+		}
+	}
+
+	return 0;
+}
+
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
 	.get_modes = hibmc_dp_connector_get_modes,
 	.detect_ctx = hibmc_dp_detect,
+	.mode_valid_ctx = hibmc_dp_mode_valid,
 };
 
 static int hibmc_dp_late_register(struct drm_connector *connector)
-- 
2.33.0

