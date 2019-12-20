Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A7012739F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 03:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1861B6EBC1;
	Fri, 20 Dec 2019 02:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CC06EBC1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 02:47:46 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8110E4344E29D7646A5C;
 Fri, 20 Dec 2019 10:31:24 +0800 (CST)
Received: from localhost (10.45.92.44) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 10:31:17 +0800
From: Zhihui Chen <chenzhihui4@huawei.com>
To: <chenzhihui244@msn.com>, <xinliang.liu@linaro.org>,
 <zourongrong@gmail.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/hisilicon/hibmc: add DPMS on/off function
Date: Fri, 20 Dec 2019 10:31:12 +0800
Message-ID: <20191220023112.2728-1-chenzhihui4@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Originating-IP: [10.45.92.44]
X-CFilter-Loop: Reflected
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
Cc: puck.chen@hisilicon.com, kong.kongxinwei@hisilicon.com, baowenyi@huawei.com,
 Zhihui Chen <chenzhihui4@huawei.com>, allan.wang@siliconmotion.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add DPMS function to turn on/off signal of monitor

Signed-off-by: Zhihui Chen <chenzhihui4@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 16 ++++++++++++++++
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h |  6 ++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 722e369f30d4..24de937c1cb1 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -189,6 +189,20 @@ static struct drm_plane *hibmc_plane_init(struct hibmc_drm_private *priv)
 	return plane;
 }
 
+static void hibmc_crtc_dpms(struct drm_crtc *crtc, int dpms)
+{
+	struct hibmc_drm_private *priv = crtc->dev->dev_private;
+	unsigned int reg;
+
+	reg = readl(priv->mmio + HIBMC_CRT_DISP_CTL);
+	reg &= ~HIBMC_CRT_DISP_CTL_DPMS_MASK;
+	reg |= HIBMC_FIELD(HIBMC_CRT_DISP_CTL_DPMS, dpms);
+	reg &= ~HIBMC_CRT_DISP_CTL_TIMING_MASK;
+	if (dpms == HIBMC_CRT_DPMS_ON)
+		reg |= HIBMC_CRT_DISP_CTL_TIMING(1);
+	writel(reg, priv->mmio + HIBMC_CRT_DISP_CTL);
+}
+
 static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
@@ -205,6 +219,7 @@ static void hibmc_crtc_atomic_enable(struct drm_crtc *crtc,
 	reg |= HIBMC_CURR_GATE_DISPLAY(1);
 	hibmc_set_current_gate(priv, reg);
 	drm_crtc_vblank_on(crtc);
+	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_ON);
 }
 
 static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -213,6 +228,7 @@ static void hibmc_crtc_atomic_disable(struct drm_crtc *crtc,
 	unsigned int reg;
 	struct hibmc_drm_private *priv = crtc->dev->dev_private;
 
+	hibmc_crtc_dpms(crtc, HIBMC_CRT_DPMS_OFF);
 	drm_crtc_vblank_off(crtc);
 
 	hibmc_set_power_mode(priv, HIBMC_PW_MODE_CTL_MODE_SLEEP);
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
index b63a1ee15ceb..b9e20cfcfb5a 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_regs.h
@@ -68,6 +68,12 @@
 
 #define HIBMC_CRT_DISP_CTL			0x80200
 
+#define HIBMC_CRT_DISP_CTL_DPMS(x)		((x) << 30)
+#define HIBMC_CRT_DISP_CTL_DPMS_MASK		0xc0000000
+
+#define HIBMC_CRT_DPMS_ON			0
+#define HIBMC_CRT_DPMS_OFF			3
+
 #define HIBMC_CRT_DISP_CTL_CRTSELECT(x)		((x) << 25)
 #define HIBMC_CRT_DISP_CTL_CRTSELECT_MASK	0x2000000
 
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
