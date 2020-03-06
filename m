Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0217B7F2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0FF6EC81;
	Fri,  6 Mar 2020 08:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398E76EC5A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 03:43:47 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8A50CF91B8D15A427E9D;
 Fri,  6 Mar 2020 11:43:40 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Fri, 6 Mar 2020 11:43:33 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <puck.chen@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tzimmermann@suse.de>, <kraxel@redhat.com>, <alexander.deucher@amd.com>,
 <tglx@linutronix.de>, <dri-devel@lists.freedesktop.org>,
 <xinliang.liu@linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] drm/hisilicon: Code cleanup for hibmc_drv_vdac
Date: Fri, 6 Mar 2020 11:43:02 +0800
Message-ID: <1583466184-7060-5-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
References: <1583466184-7060-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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

code cleanup for hibmc_drv_vdac.c, no actual function changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Signed-off-by: Gong junjie <gongjunjie2@huawei.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 49 ++++++++----------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 678ac2e..f0e6bb8 100644
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
@@ -131,6 +98,22 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 	}
 
 	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
+	connector = devm_kzalloc(dev->dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("failed to alloc memory when init connector\n");
+		return -ENOMEM;
+	}
+
+	ret = drm_connector_init(dev, connector,
+				 &hibmc_connector_funcs,
+				 DRM_MODE_CONNECTOR_VGA);
+	if (ret) {
+		DRM_ERROR("failed to init connector: %d\n", ret);
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
+	drm_connector_register(connector);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
