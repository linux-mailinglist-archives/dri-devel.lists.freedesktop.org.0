Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A39A17C6A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316AF10E577;
	Tue, 21 Jan 2025 10:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gbt9y2aa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF6C10E569
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 308E74000C;
 Tue, 21 Jan 2025 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uTZN2ccLO8iHkJaWPvHiGP/G3x0f/RdchrD/cM6uvTc=;
 b=gbt9y2aaUBbg0u4p68quQZRxyqRDaoex7my43fmxqB/BUMYZ7snkjJNUYjPl0CUrogyGqY
 VR+vpaPnwvEZCIBdycbIRzO5Xrf/y8YB4CFFtuFCcj2/LPyRVCaoPMGuKtb6pV3qW3Qlva
 desJFaLJKEE9WjC2Jo2KjbSeuh780DD6Lc5aGr/jnioFINcDAgv8wo4y5bF7MzuqiZeuBz
 7Nld15cQH9lXj5AhAzqSIu7lzApp/fnd+KFC4TWTz0yPCNRB7onECV9VD8f5F/ErMXaaVc
 o+ILNMI6iuVQmBNELBd5SD4HZC285zcqkkEXFwCzolLRu+xGwfEJw9QcKdJ7zQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:38 +0100
Subject: [PATCH v3 14/16] drm/vkms: Introduce config for connector status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-14-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4015;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=O4QgJ2Fxi9tAm7ZgS3BUqW2s6EgHDl+aw7VV+hrKKCs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30kuiLTjyfXsm2ZmH1U4GR8M/JS3UZy1Dtv1
 VsybfhQzbaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499JAAKCRAgrS7GWxAs
 4kAdEACt8P4dkhyu7fb/aUlE4ka6uoZRYDKBVry9icsMW0aGF0RGN8mmomT1JRhRBY+w9iJKQYL
 YFyNJn1WT97pM935da1+9NwroZr18B/j1pKvuURvsuorDrigsPmX8UzhehbZdbfaQ3nSxIXOpjq
 bjuoT7URFRPQakzjMHmGGrEe4P5OHRkLRKS25oEi1b2UfKYGIi1pZ1fJxyHUpTwBuXJjKumtf0j
 4SfPciEb2fWEh7S30TcPSxrPy3bdj0pRIo1EkC0vX9jpfkI/5ZbUhETdokhhZLoRKD3BVjwUx1v
 xJNHDIeDA0Ql+gJQTwsTVJXnaUl8RLWR8icNew6frLQyKioncmtYLVPt6JD4IGLAwawYLJba+ms
 Q4Ryx+6xp0RWxSIc0dYGKN5mpF319WNn88SEou8DroxcRJGpRatYFEI8jAZrn5UyhrMFkWEmDBz
 goCwsfalNqvOCNbPsmxMomB6ZDz11sU7QwvjHbJ0YL1aIyBodJ0oiZTxHXpoF9bix9SoeJnEyYj
 SQsp1pYgv3eyetliJIZ1eGL7/DAOmpzK5I49s+RQI93SNvnVP0+u9bwDLTJr5dYx6QwRMVMnMHl
 mIgm2QGm0XLeotPNMPH61NLbs6X9dJWBPWxlT4X3tBI2A7iN5hRntQSKy9M4VZQ91b6HiNeITiY
 UGXe3kBy71Ca1Tg==
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

VKMS driver does not currently support connector hotpluging. Add
an option to change the connector status once a device is created.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
[adpated it for my implementation]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  4 ++++
 drivers/gpu/drm/vkms/vkms_output.c | 24 ++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 57e211e48a90d3a4d7f8677c40a2b35d44b847e5..5eba4284269d058f12f78ddba96cb40215e85f72 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -2,6 +2,7 @@
 
 #include <kunit/visibility.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_probe_helper.h>
 
 #include "vkms_config.h"
 #include "vkms_drv.h"
@@ -160,10 +161,19 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
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
index 72bfaadd4322f9e1607a6b9425fb8aaf8bd9d5f6..8e0c9b753821f75f10b3090743905471d0abac36 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -103,11 +103,15 @@ struct vkms_config_connector {
 
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
index 50aa802da479e5ba383e5db49dc2c7c6981f0bef..75d90df44da3b6dd3ed3ae104a6bc6d51c9bf089 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,9 +7,33 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+static struct vkms_config_connector *vkms_config_connector_from_vkms_connector(struct drm_connector *connector)
+{
+	struct vkms_device *vkms_device = drm_device_to_vkms_device(connector->dev);
+	struct vkms_config_connector *connector_cfg;
+
+	list_for_each_entry(connector_cfg, &vkms_device->config->connectors, link) {
+		if (connector_cfg->connector == connector)
+			return connector_cfg;
+	}
+	return NULL;
+}
+
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector, bool force)
+{
+	enum drm_connector_status status = connector->status;
+	struct vkms_config_connector *connector_cfg = vkms_config_connector_from_vkms_connector(connector);
+
+	if (connector_cfg)
+		status = connector_cfg->status;
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
2.47.1

