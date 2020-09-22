Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA22273C93
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F596E832;
	Tue, 22 Sep 2020 07:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD89C6E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:06:36 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6E7D71941BDA90A9D88A;
 Tue, 22 Sep 2020 15:06:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 15:06:16 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <tzimmermann@suse.de>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH drm/hisilicon v2 2/2] drm/hisilicon: Features to support
 reading resolutions from EDID
Date: Tue, 22 Sep 2020 15:03:50 +0800
Message-ID: <1600758230-13389-3-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600758230-13389-1-git-send-email-tiantao6@hisilicon.com>
References: <1600758230-13389-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:35 +0000
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
a fixed resolution. Rewrite the desrtoy callback function to release
resources.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 38 +++++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
index 376a05d..c6999ed 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c
@@ -21,12 +21,24 @@
 static int hibmc_connector_get_modes(struct drm_connector *connector)
 {
 	int count;
+	void *edid;
+	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
+
+	edid = drm_get_edid(connector, &hibmc_connector->adapter);
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		count = drm_add_edid_modes(connector, edid);
+		if (count)
+			goto out;
+	}
 
 	count = drm_add_modes_noedid(connector,
 				     connector->dev->mode_config.max_width,
 				     connector->dev->mode_config.max_height);
 	drm_set_preferred_mode(connector, 1024, 768);
 
+out:
+	kfree(edid);
 	return count;
 }
 
@@ -36,6 +48,14 @@ static enum drm_mode_status hibmc_connector_mode_valid(struct drm_connector *con
 	return MODE_OK;
 }
 
+static void hibmc_connector_destroy(struct drm_connector *connector)
+{
+	struct hibmc_connector *hibmc_connector = to_hibmc_connector(connector);
+
+	i2c_del_adapter(&hibmc_connector->adapter);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_helper_funcs
 	hibmc_connector_helper_funcs = {
 	.get_modes = hibmc_connector_get_modes,
@@ -44,7 +64,7 @@ static const struct drm_connector_helper_funcs
 
 static const struct drm_connector_funcs hibmc_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
+	.destroy = hibmc_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -77,10 +97,17 @@ static const struct drm_encoder_funcs hibmc_encoder_funcs = {
 int hibmc_vdac_init(struct hibmc_drm_private *priv)
 {
 	struct drm_device *dev = priv->dev;
+	struct hibmc_connector *hibmc_connector = &priv->connector;
 	struct drm_encoder *encoder = &priv->encoder;
-	struct drm_connector *connector = &priv->connector;
+	struct drm_connector *connector = &hibmc_connector->base;
 	int ret;
 
+	ret = hibmc_ddc_create(dev, hibmc_connector);
+	if (ret) {
+		drm_err(dev, "failed to create ddc: %d\n", ret);
+		return ret;
+	}
+
 	encoder->possible_crtcs = 0x1;
 	ret = drm_encoder_init(dev, encoder, &hibmc_encoder_funcs,
 			       DRM_MODE_ENCODER_DAC, NULL);
@@ -91,12 +118,15 @@ int hibmc_vdac_init(struct hibmc_drm_private *priv)
 
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
