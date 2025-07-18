Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE65B09BDA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE87D10E8EB;
	Fri, 18 Jul 2025 07:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF0410E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:01:28 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bk0wG0lV1zdbwy;
 Fri, 18 Jul 2025 14:57:18 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 3432C180B66;
 Fri, 18 Jul 2025 15:01:26 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:26 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:25 +0800
From: Yongbang Shi <shiyongbang@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kong.kongxinwei@hisilicon.com>, <dmitry.baryshkov@oss.qualcomm.com>
CC: <liangjian010@huawei.com>, <chenjianmin@huawei.com>,
 <fengsheng5@huawei.com>, <shiyongbang@huawei.com>, <libaihan@huawei.com>,
 <shenjian15@huawei.com>, <shaojijie@huawei.com>,
 <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 drm-dp 08/11] drm/hisilicon/hibmc: fix no showing when no
 connectors connected
Date: Fri, 18 Jul 2025 14:51:22 +0800
Message-ID: <20250718065125.2892404-9-shiyongbang@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250718065125.2892404-1-shiyongbang@huawei.com>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.169.71.169]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
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

Our chip support KVM over IP feature, so hibmc diiver need to support
displaying without any connectors plugged in. If no connectors connected,
set the vdac connector status to 'connected' to handle BMC KVM. Use
is_connected to check all physical outputs.
For get_modes: using BMC modes for connector if no display is attached to
phys VGA cable, otherwise use EDID modes by drm_connector_helper_get_modes.

Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
ChangeLog:
v2 -> v3:
  - fix hibmc_connector_get_modes() and hibmc_vdac_detect() to realize BMC KVM, suggested by Dmitry Baryshkov.
---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |  5 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  4 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 55 +++++++++++++------
 3 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index 99b30a6c7e06..262ebe6138f0 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -58,9 +58,12 @@ static int hibmc_dp_detect(struct drm_connector *connector,
 {
 	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
 
-	if (!hibmc_dp_detect_link(&priv->dp))
+	if (!hibmc_dp_detect_link(&priv->dp)) {
+		priv->is_connected |= BIT(0);
 		return connector_status_connected;
+	}
 
+	priv->is_connected &= ~BIT(0);
 	return connector_status_disconnected;
 }
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
index ca8502e2760c..d68588ecec9b 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
@@ -31,6 +31,7 @@ struct hibmc_vdac {
 	struct drm_connector connector;
 	struct i2c_adapter adapter;
 	struct i2c_algo_bit_data bit_data;
+	int phys_status;
 };
 
 struct hibmc_drm_private {
@@ -43,6 +44,9 @@ struct hibmc_drm_private {
 	struct drm_crtc crtc;
 	struct hibmc_vdac vdac;
 	struct hibmc_dp dp;
+
+	/* VGA and DP phys connect status, BIT(0) is DP, BIT(1) is VGA */
+	int is_connected;
 };
 
 static inline struct hibmc_vdac *to_hibmc_vdac(struct drm_connector *connector)
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 841e81f47b68..3cdf640d1785 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -25,27 +25,18 @@
 static int hibmc_connector_get_modes(struct drm_connector *connector)
 {
 	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
-	const struct drm_edid *drm_edid;
 	int count;
 
-	drm_edid = drm_edid_read_ddc(connector, &vdac->adapter);
-
-	drm_edid_connector_update(connector, drm_edid);
-
-	if (drm_edid) {
-		count = drm_edid_connector_add_modes(connector);
-		if (count)
-			goto out;
+	if (vdac->phys_status == connector_status_connected) {
+		count = drm_connector_helper_get_modes(connector);
+	} else {
+		drm_edid_connector_update(connector, NULL);
+		count = drm_add_modes_noedid(connector,
+					     connector->dev->mode_config.max_width,
+					     connector->dev->mode_config.max_height);
+		drm_set_preferred_mode(connector, 1024, 768); // 1024x768
 	}
 
-	count = drm_add_modes_noedid(connector,
-				     connector->dev->mode_config.max_width,
-				     connector->dev->mode_config.max_height);
-	drm_set_preferred_mode(connector, 1024, 768);
-
-out:
-	drm_edid_free(drm_edid);
-
 	return count;
 }
 
@@ -57,10 +48,38 @@ static void hibmc_connector_destroy(struct drm_connector *connector)
 	drm_connector_cleanup(connector);
 }
 
+static int hibmc_vdac_detect(struct drm_connector *connector,
+			     struct drm_modeset_acquire_ctx *ctx,
+			     bool force)
+{
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
+	struct hibmc_vdac *vdac = to_hibmc_vdac(connector);
+	enum drm_connector_status status;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	vdac->phys_status = status;
+
+	if (status == connector_status_connected) {
+		priv->is_connected |= BIT(1);
+		return connector_status_connected;
+	}
+
+	priv->is_connected &= ~BIT(1);
+
+	/* if all connectors are disconnected,
+	 * return connected to support BMC KVM display.
+	 */
+	if (!priv->is_connected)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
 static const struct drm_connector_helper_funcs
 	hibmc_connector_helper_funcs = {
 	.get_modes = hibmc_connector_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.detect_ctx = hibmc_vdac_detect,
 };
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
-- 
2.33.0

