Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2DAC8BFE
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 12:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0765610E00B;
	Fri, 30 May 2025 10:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 925 seconds by postgrey-1.36 at gabe;
 Fri, 30 May 2025 10:19:07 UTC
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033BA10E00B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 10:19:06 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b7zLf4QPJz2TSL7;
 Fri, 30 May 2025 18:02:34 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
 by mail.maildlp.com (Postfix) with ESMTPS id 8B3EF140293;
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
Subject: [PATCH drm-dp 07/10] drm/hisilicon/hibmc: add dp encoder modeset
Date: Fri, 30 May 2025 17:54:29 +0800
Message-ID: <20250530095432.1206966-8-shiyongbang@huawei.com>
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

Add GPU display control enable in dp_mode_set(), which is already
in vdac's mode_set, however, if vdac is not connected, GPU
cannot work.

Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")
Signed-off-by: Baihan Li <libaihan@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
index e4b13f21ccb3..d9ae7567ebb7 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
@@ -11,6 +11,7 @@
 #include <drm/drm_edid.h>
 
 #include "hibmc_drm_drv.h"
+#include "hibmc_drm_regs.h"
 #include "dp/dp_hw.h"
 
 #define HIBMC_DP_MASKED_SINK_HPD_PLUG_INT	BIT(2)
@@ -169,9 +170,26 @@ static void hibmc_dp_encoder_disable(struct drm_encoder *drm_encoder,
 	hibmc_dp_display_en(dp, false);
 }
 
+static void hibmc_dp_encoder_mode_set(struct drm_encoder *encoder,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_connector_state *conn_state)
+{
+	struct drm_device *dev = encoder->dev;
+	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
+	u32 reg;
+
+	reg = readl(priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+	reg |= HIBMC_DISPLAY_CONTROL_FPVDDEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_PANELDATE(1);
+	reg |= HIBMC_DISPLAY_CONTROL_FPEN(1);
+	reg |= HIBMC_DISPLAY_CONTROL_VBIASEN(1);
+	writel(reg, priv->mmio + HIBMC_DISPLAY_CONTROL_HISILE);
+}
+
 static const struct drm_encoder_helper_funcs hibmc_dp_encoder_helper_funcs = {
 	.atomic_enable = hibmc_dp_encoder_enable,
 	.atomic_disable = hibmc_dp_encoder_disable,
+	.atomic_mode_set = hibmc_dp_encoder_mode_set,
 };
 
 irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
-- 
2.33.0

