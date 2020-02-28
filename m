Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECF81732B3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 09:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130996EE50;
	Fri, 28 Feb 2020 08:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F556EE50;
 Fri, 28 Feb 2020 08:18:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49642B345;
 Fri, 28 Feb 2020 08:18:32 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, noralf@tronnes.org,
 sam@ravnborg.org, alexander.deucher@amd.com, emil.velikov@collabora.com
Subject: [PATCH v4 4/4] drm/qxl: Use simple encoder
Date: Fri, 28 Feb 2020 09:18:28 +0100
Message-Id: <20200228081828.18463-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200228081828.18463-1-tzimmermann@suse.de>
References: <20200228081828.18463-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The qxl driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

v4:
	* handle errors returned from drm_simple_encoder_init()
v2:
	* rebase onto new simple-encoder interface

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/qxl/qxl_display.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index ab4f8dd00400..09583a08e141 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -31,6 +31,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
@@ -1007,9 +1008,6 @@ static struct drm_encoder *qxl_best_encoder(struct drm_connector *connector)
 	return &qxl_output->enc;
 }
 
-static const struct drm_encoder_helper_funcs qxl_enc_helper_funcs = {
-};
-
 static const struct drm_connector_helper_funcs qxl_connector_helper_funcs = {
 	.get_modes = qxl_conn_get_modes,
 	.mode_valid = qxl_conn_mode_valid,
@@ -1059,15 +1057,6 @@ static const struct drm_connector_funcs qxl_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void qxl_enc_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-}
-
-static const struct drm_encoder_funcs qxl_enc_funcs = {
-	.destroy = qxl_enc_destroy,
-};
-
 static int qxl_mode_create_hotplug_mode_update_property(struct qxl_device *qdev)
 {
 	if (qdev->hotplug_mode_update_property)
@@ -1086,6 +1075,7 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 	struct qxl_output *qxl_output;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	int ret;
 
 	qxl_output = kzalloc(sizeof(struct qxl_output), GFP_KERNEL);
 	if (!qxl_output)
@@ -1098,15 +1088,19 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 	drm_connector_init(dev, &qxl_output->base,
 			   &qxl_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL);
 
-	drm_encoder_init(dev, &qxl_output->enc, &qxl_enc_funcs,
-			 DRM_MODE_ENCODER_VIRTUAL, NULL);
+	ret = drm_simple_encoder_init(dev, &qxl_output->enc,
+				      DRM_MODE_ENCODER_VIRTUAL);
+	if (ret) {
+		drm_err(dev, "drm_simple_encoder_init() failed, error %d\n",
+			ret);
+		goto err_drm_connector_cleanup;
+	}
 
 	/* we get HPD via client monitors config */
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 	encoder->possible_crtcs = 1 << num_output;
 	drm_connector_attach_encoder(&qxl_output->base,
 					  &qxl_output->enc);
-	drm_encoder_helper_add(encoder, &qxl_enc_helper_funcs);
 	drm_connector_helper_add(connector, &qxl_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
@@ -1116,6 +1110,11 @@ static int qdev_output_init(struct drm_device *dev, int num_output)
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
 	return 0;
+
+err_drm_connector_cleanup:
+	drm_connector_cleanup(&qxl_output->base);
+	kfree(qxl_output);
+	return ret;
 }
 
 static struct drm_framebuffer *
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
