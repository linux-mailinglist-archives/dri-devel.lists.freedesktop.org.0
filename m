Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F42CB6C4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294726EA2A;
	Wed,  2 Dec 2020 08:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Tue, 01 Dec 2020 10:44:13 UTC
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDF76E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 10:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id DE821E0141;
 Tue,  1 Dec 2020 02:38:10 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Eg-ax_6CXk5; Tue,  1 Dec 2020 02:38:09 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: marex@denx.de, stefan@agner.ch, airlied@linux.ie, daniel@ffwll.ch,
 shawnguo@kernel.org
Subject: [PATCH] drm: mxsfb: Add interconnect path request
Date: Tue,  1 Dec 2020 11:37:57 +0100
Message-Id: <20201201103757.32165-1-martin.kepplinger@puri.sm>
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add interconnect support to mxsfb so that it is able to request enough
bandwidth to DDR for display output to work.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 33 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 13 ++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 6faf17b6408d..b05e8e5f1e38 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -15,6 +15,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/interconnect.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -311,6 +312,34 @@ static const struct of_device_id mxsfb_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
 
+
+static int mxsfb_init_icc(struct platform_device *pdev)
+{
+	struct drm_device *drm = platform_get_drvdata(pdev);
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+	int ret;
+
+	/* Optional interconnect request */
+	mxsfb->icc_path = devm_of_icc_get(&pdev->dev, "lcdif-dram");
+	if (IS_ERR(mxsfb->icc_path)) {
+		ret = PTR_ERR(mxsfb->icc_path);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		mxsfb->icc_path = NULL;
+		dev_dbg(drm->dev,
+			"No interconnect may cause display underflows!\n");
+	}
+
+	ret = icc_set_bw(mxsfb->icc_path, 0, MBps_to_icc(700));
+	if (ret) {
+		dev_err(drm->dev, "%s: icc_set_bw failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mxsfb_probe(struct platform_device *pdev)
 {
 	struct drm_device *drm;
@@ -329,6 +358,10 @@ static int mxsfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free;
 
+	ret = mxsfb_init_icc(pdev);
+	if (ret)
+		goto err_free;
+
 	ret = drm_dev_register(drm, 0);
 	if (ret)
 		goto err_unload;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index 399d23e91ed1..d74ff4818e62 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -41,6 +41,8 @@ struct mxsfb_drm_private {
 	struct drm_encoder		encoder;
 	struct drm_connector		*connector;
 	struct drm_bridge		*bridge;
+
+	struct icc_path			*icc_path;
 };
 
 static inline struct mxsfb_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 3e1bb0aefb87..8925ee7deeaa 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -13,6 +13,7 @@
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
+#include <linux/interconnect.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -310,6 +311,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_device *drm = mxsfb->drm;
 	dma_addr_t paddr;
+	int ret;
+
+	ret = icc_enable(mxsfb->icc_path);
+	if (ret)
+		dev_err_ratelimited(drm->dev, "%s: icc_enable failed: %d\n",
+				    __func__, ret);
 
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_enable_axi_clk(mxsfb);
@@ -334,6 +341,7 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_pending_vblank_event *event;
+	int ret;
 
 	mxsfb_disable_controller(mxsfb);
 
@@ -349,6 +357,11 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	mxsfb_disable_axi_clk(mxsfb);
 	pm_runtime_put_sync(drm->dev);
+
+	ret = icc_disable(mxsfb->icc_path);
+	if (ret)
+		dev_err_ratelimited(drm->dev, "%s: icc_disable failed: %d\n",
+				    __func__, ret);
 }
 
 static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
