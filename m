Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DABA2271C21
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 09:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CE06E235;
	Mon, 21 Sep 2020 07:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F466E134
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 03:27:59 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 3C5CD2830584C37A486F;
 Mon, 21 Sep 2020 11:27:56 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 11:27:48 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon 2/3] drm/hisilicon: Features to support reading
 resolutions from EDID
Date: Mon, 21 Sep 2020 11:25:21 +0800
Message-ID: <1600658722-35945-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
References: <1600658722-35945-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Sep 2020 07:34:45 +0000
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

Use drm_get_edid to get the resolution, if that fails, set it to
a fixed resolution.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 35 ++++++++++++++++++++----
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 376a05d..e84d381 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -20,13 +20,24 @@
 
 static int hibmc_connector_get_modes(struct drm_connector *connector)
 {
-	int count;
+	int count = 0;
+	void *edid;
+	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
+
+	edid = drm_get_edid(connector, &hibmc_connector->adapter);
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		count = drm_add_edid_modes(connector, edid);
+	}
 
-	count = drm_add_modes_noedid(connector,
+	if (!edid || count == 0) {
+		count = drm_add_modes_noedid(connector,
 				     connector->dev->mode_config.max_width,
 				     connector->dev->mode_config.max_height);
-	drm_set_preferred_mode(connector, 1024, 768);
+		drm_set_preferred_mode(connector, 1024, 768);
+	}
 
+	kfree(edid);
 	return count;
 }
 
@@ -77,10 +88,19 @@ static const struct drm_encoder_funcs hibmc_encoder_funcs = {
 int hibmc_vdac_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = priv->dev;
+	struct hibmc_connector *hibmc_connector = &priv->connector;
 	struct drm_encoder *encoder = &priv->encoder;
-	struct drm_connector *connector = &priv->connector;
+	struct drm_connector *connector = &hibmc_connector->base;
 	int ret;
 
+	hibmc_connector->dev = dev;
+
+	ret = hibmc_ddc_create(hibmc_connector);
+	if (ret) {
+		drm_err(dev, "failed to create connector: %d\n", ret);
+		return ret;
+	}
+
 	encoder->possible_crtcs = 0x1;
 	ret = drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
 			       DRM_MODE_ENCODER_DAC, NULL);
@@ -91,12 +111,15 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 
 	drm_encoder_helper_add(encoder, &hibmc_encoder_helper_funcs);
 
-	ret = drm_connector_init(dev, connector, &hibmc_connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &hibmc_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &hibmc_connector->adapter);
 	if (ret) {
 		drm_err(dev, "failed to init connector: %d\n", ret);
 		return ret;
 	}
+
 	drm_connector_helper_add(connector, &hibmc_connector_helper_funcs);
 
 	drm_connector_attach_encoder(connector, encoder);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
