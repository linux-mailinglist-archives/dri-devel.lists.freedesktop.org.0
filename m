Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E359E9D62EA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EECD10EC38;
	Fri, 22 Nov 2024 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gf5W/Vtc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920910EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4B791C0008;
 Fri, 22 Nov 2024 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jzuSQ7XWNth9nLO58Lj8CZjuqIwgPyHE7wF5M+8a88E=;
 b=gf5W/Vtc8HqHlS1O+bD1C0QD130XNymKdl7yR4MGt67Fp49rg0u0p7Af8tVbA8xrfILeBf
 cFam/lthbqday4fm3KQbIoIjduaOj60tgjKFysXy7Wa9JcmuhxZ38j3+3sgf5zEvjSTUgT
 fUC5FB3rcIht4N4w4Q2xrGAv8BfxjPQag+Yzs9oLUs4LTZyY9MOc83cTjUjSa1qP9Owrue
 +8goZSNKSHS6fomyYgyugUqUPifnJ44kusOYENQSdV7cjUhX7ASWvPnqN+Y/U/d0stBPwG
 NKotWjtAPyeBFbdexGNLW5UCuVyKrwqB4PLi5s319729I9aXCAcZmDpfRQVI4w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:20 +0100
Subject: [PATCH RFC v2 16/18] drm/vkms: Introduce config for connector status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-16-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3589;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=bLnbWwXKLbazSIS/ctWB/cU2s2pysEf7G+KMJSRKhtE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1RZc++KCbWtnju0RcA8/kxo/o/dtIsj7Qay
 ce2qVNzLKuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UQAKCRAgrS7GWxAs
 4ngDD/wMrpUY/JjH/IEjiIkaPwViQ1no9IyNuGn4bXv5ELw0vXw4WnqKBR+UrUFOgYeEHMDM3uy
 TTht0dr/k4haU7nRyrROXs0RamiA6idrMR0THXy2OtCT6yvCQudWNaWc4/lxPr8fNZMHkfbNGwG
 QjO7rf7pt3/mUNitR5PDhuPGhWOLKBBpvW5Ezkum25+9M9kmcaMHBsss9629KNbv10OyFB45Pjg
 8800k5e6m2o3D9+y8ktZDVM0KFxuh68ti33QfWyWRCcHDawuGfd+ZY7HY0J54i+2RzjvtgEJsOZ
 wpnK2E5eeYWtjl5SHL8k5gAc3fHATxd3kmtBun+dzYbzxVuWB+VHEYqSYmuT0UXdEeCd/RKf6Q0
 CRJlGHCQYnosbniZatNlOvQb1HfQlczVX/rNWkWkKw7H5Vq1yKcYQAPac/6xPbe9sZS9zMLEX6/
 3uf8XcabJJZQUzKuxlVUi9ruGEU1w1TdZFRSDB6antAHu+An9SBiYrxFC/TRNmDX793IghLEWpB
 czYBe6wIe3s9XGL4T5sA6S4JjpXRektdWlY36tsPhsUxkjsNU9lcl6d7OFAWhf6j1+YXOiALPVG
 nHLkybe08vPs/ZWjx0f+QcrSCVJirJX8GogeLKozG1d4v96MggQJk3O26IOSyh7IhZ8ercKv0hj
 PA0MAe40oeL/COw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
[adpated it for my implementation]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  4 ++++
 drivers/gpu/drm/vkms/vkms_output.c | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 4726929c2b54b2e670f9ef53b05ec009ca495e08..ac1a9658c5075c118d59da965ca3392355ccb2b2 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -2,6 +2,7 @@
 
 #include <kunit/visibility.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_probe_helper.h>
 
 #include "vkms_config.h"
 #include "vkms_drv.h"
@@ -197,10 +198,19 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 	list_add(&vkms_config_connector->link, &vkms_config->connectors);
 	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
 	vkms_config_connector->type = DRM_MODE_CONNECTOR_VIRTUAL;
+	vkms_config_connector->status = connector_status_unknown;
 
 	return vkms_config_connector;
 }
 
+void vkms_config_connector_update_status(struct vkms_config_connector *vkms_config_connector,
+					 enum drm_connector_status status)
+{
+	vkms_config_connector->status = status;
+	if (vkms_config_connector->connector)
+		drm_kms_helper_hotplug_event(vkms_config_connector->connector->dev);
+}
+
 struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config)
 {
 	if (!vkms_config)
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 5487e0140da0e111c36f9a22d4e783a20c880a1d..bba56c9d8aeceac97a4339ef42ab663c5dc54e65 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -111,11 +111,15 @@ struct vkms_config_connector {
 
 	struct xarray possible_encoders;
 	int type;
+	enum drm_connector_status status;
 
 	/* Internal usage */
 	struct drm_connector *connector;
 };
 
+void vkms_config_connector_update_status(struct vkms_config_connector *vkms_config_connector,
+					 enum drm_connector_status status);
+
 /**
  * vkms_config_register_debugfs() - Register the debugfs file to display current configuration
  */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index aea6366fd9a662483ed5a255d02d5025a30297f7..fc6a0cdade0739b94820ed4e0924cf355137fe79 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,9 +7,26 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(connector->dev);
+	enum drm_connector_status status = connector->status;
+	struct vkms_config_connector *connector_cfg;
+
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, link) {
+		if (connector_cfg->connector == connector) {
+			status = connector_cfg->status;
+			break;
+		}
+	}
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
+	.detect = vkms_connector_detect,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };

-- 
2.47.0

