Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82697B09BE0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3E310E8E8;
	Fri, 18 Jul 2025 07:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08BD10E8E9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 07:01:25 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bk0vR62dnz14Lq4;
 Fri, 18 Jul 2025 14:56:35 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
 by mail.maildlp.com (Postfix) with ESMTPS id 7A3971402ED;
 Fri, 18 Jul 2025 15:01:23 +0800 (CST)
Received: from kwepemq100007.china.huawei.com (7.202.195.175) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:23 +0800
Received: from localhost.huawei.com (10.169.71.169) by
 kwepemq100007.china.huawei.com (7.202.195.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Jul 2025 15:01:22 +0800
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
Subject: [PATCH v3 drm-dp 02/11] drm/hisilicon/hibmc: fix dp probabilistical
 detect errors after HPD irq
Date: Fri, 18 Jul 2025 14:51:16 +0800
Message-ID: <20250718065125.2892404-3-shiyongbang@huawei.com>
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

The debouncing when HPD pulled out still remains sometimes, 200ms still can
not ensure helper_detect() is correct. Add hibmc_dp_detect_link() in
detect_ctx(), which is to try dp link training.

Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
Signed-off-by: Baihan Li <libaihan@huawei.com>
Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 27 +++++++++++++++----
 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 10 ++++---
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
index 8f0daec7d174..2d2fb6e759c3 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
@@ -3,6 +3,7 @@
 
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <drm/drm_managed.h>
 #include "dp_config.h"
 #include "dp_comm.h"
 #include "dp_reg.h"
@@ -162,6 +163,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
 
 	mutex_init(&dp_dev->lock);
 
+	drmm_mutex_init(drm_dev, &dp->link_train_mutex);
+
 	dp->dp_dev = dp_dev;
 
 	dp_dev->dev = drm_dev;
@@ -238,19 +241,33 @@ void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
 	msleep(50);
 }
 
-int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
+int hibmc_dp_detect_link(struct hibmc_dp *dp)
 {
 	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
-	int ret;
+	int ret = 0;
+
+	mutex_lock(&dp->link_train_mutex);
 
 	if (!dp_dev->link.status.channel_equalized) {
 		ret = hibmc_dp_link_training(dp_dev);
-		if (ret) {
+		if (ret)
 			drm_err(dp->drm_dev, "dp link training failed, ret: %d\n", ret);
-			return ret;
-		}
 	}
 
+	mutex_unlock(&dp->link_train_mutex);
+
+	return ret;
+}
+
+int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
+{
+	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
+	int ret;
+
+	ret = hibmc_dp_detect_link(dp);
+	if (ret)
+		return ret;
+
 	hibmc_dp_display_en(dp, false);
 	hibmc_dp_link_cfg(dp_dev, mode);
 
diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
index 665f5b166dfb..9b45e88e47e4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
@@ -50,9 +50,11 @@ struct hibmc_dp {
 	struct drm_dp_aux aux;
 	struct hibmc_dp_cbar_cfg cfg;
 	u32 irq_status;
+	struct mutex link_train_mutex; /* link training mutex */
 };
 
 int hibmc_dp_hw_init(struct hibmc_dp *dp);
+int hibmc_dp_detect_link(struct hibmc_dp *dp);
 int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
 void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
 void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index d06832e62e96..354e18bb2998 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -34,9 +34,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
 static int hibmc_dp_detect(struct drm_connector *connector,
 			   struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	mdelay(200);
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
 
-	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
+	if (!hibmc_dp_detect_link(&priv->dp))
+		return connector_status_connected;
+
+	return connector_status_disconnected;
 }
 
 static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
@@ -128,8 +131,7 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
 		hibmc_dp_reset_link(&priv->dp);
 	}
 
-	if (dev->registered)
-		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
+	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
 
 	drm_dev_exit(idx);
 
-- 
2.33.0

