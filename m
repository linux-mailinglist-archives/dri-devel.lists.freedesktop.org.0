Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5791A522E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 14:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB1F6E320;
	Sat, 11 Apr 2020 12:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84A16E22E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 02:50:46 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 51D0EEDB1F23B09CDA7E;
 Sat, 11 Apr 2020 10:50:43 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Sat, 11 Apr 2020 10:50:35 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/hisilicon: Code refactoring for hibmc_drv_vdac
Date: Sat, 11 Apr 2020 10:49:47 +0800
Message-ID: <1586573387-42003-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 11 Apr 2020 12:53:57 +0000
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

code refactoring for hibmc_drv_vdac.c, no actual function changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 48 ++++++++----------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 678ac2e..d56c5d4 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -52,32 +52,6 @@ static const struct drm_connector_funcs hibmc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static struct drm_connector *
-hibmc_connector_init(struct hibmc_drm_private *priv)
-{
-	struct drm_device *dev = priv->dev;
-	struct drm_connector *connector;
-	int ret;
-
-	connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector) {
-		DRM_ERROR("failed to alloc memory when init connector\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	ret = drm_connector_init(dev, connector,
-				 &hibmc_connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
-	if (ret) {
-		DRM_ERROR("failed to init connector: %d\n", ret);
-		return ERR_PTR(ret);
-	}
-	drm_connector_helper_add(connector,
-				 &hibmc_connector_helper_funcs);
-
-	return connector;
-}
-
 static void hibmc_encoder_mode_set(struct drm_encoder *encoder,
 				   struct drm_display_mode *mode,
 				   struct drm_display_mode *adj_mode)
@@ -109,13 +83,6 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	struct drm_connector *connector;
 	int ret;
 
-	connector = hibmc_connector_init(priv);
-	if (IS_ERR(connector)) {
-		DRM_ERROR("failed to create connector: %ld\n",
-			  PTR_ERR(connector));
-		return PTR_ERR(connector);
-	}
-
 	encoder = devm_kzalloc(dev->dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("failed to alloc memory when init encoder\n");
@@ -131,6 +98,21 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	}
 
 	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
+
+	connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("failed to alloc memory when init connector\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_connector_init(dev, connector, &hibmc_connector_funcs,
+				 DRM_MODE_CONNECTOR_VGA);
+	if (ret) {
+		DRM_ERROR("failed to init connector: %d\n", ret);
+		return ret;
+	}
+	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
