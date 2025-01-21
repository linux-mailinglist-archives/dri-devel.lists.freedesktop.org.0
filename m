Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98495A17C67
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9CD10E569;
	Tue, 21 Jan 2025 10:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GW4f/gHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54B910E56F
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 040F740015;
 Tue, 21 Jan 2025 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1L45snXRbo8coOmjDH+6FXlXlk9PA0CwtvqQLbt7rxQ=;
 b=GW4f/gHdOK3yjoD9kr9eALv9YxBAaKoLe8FhaaRafTQfuEY6SnDnvCpF8LzIvJY6m2G6U5
 DoLH1ybWkP7rwng93UDyB1F61Avtc5Y7HwN75Hzcx7kSzguKm/kILrY7m9EJkl6lHj3NkI
 Bok9VU+hvE6R2NI0TnvCdIwUW2vMYD4dwBRDDg3mTUdJnZgw6ajoEPjuo99b3IwnN6a0XB
 enUgK+ViwQ7hvZwVLr23nr0oEvBf6DPafu7PAVfWltEggk3/w6hVLkI4+hpZdvNXMPot05
 ok/p6FZVnd/lGKXf22m9FRzWv13BjBIBQ5Bd/2Cq/MSVkUmjubW7xFn71F2Qbw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:39 +0100
Subject: [PATCH v3 15/16] drm/vkms: Introduce config for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-15-cac00a3c3544@bootlin.com>
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
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3463;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=k1HVDWUOwoXCv+se/NTmEAQUM+zoChcbWYjKvCcZaew=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30kDvjlXFSbzyU+ash4NXe6sjMOPFGWhSwba
 e+CaHeF4g+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499JAAKCRAgrS7GWxAs
 4puAD/44Yw/tgydOJHNi1VVc25eEPMS3H7phu/LGDSkZZwBegXhBxedOIB5ksgxQlkrdl2bDBVN
 2jdFEpl+GbVqfZWbeIRxTRWISIDPgmVG8Qq0uR3ZIJEg7hBuoRFkWrAJ033CnpHgMf+tYb73s9L
 Vh80BZiNjkdY4DMu/DLejfYOqbS9C1rsnH+MdMlq9o+vjImJaNfF6/itye4pWLLxZUB2raNHRlg
 tLdhlH5pMjSj86eOoADpAWMOp44YRGHSxXd772UThhthXegfojVuqpwinrWUEBD2hKbMovCJLRt
 naPJ2cxEtaBJ8xgM6IYtFXeUETiY2FHkUQ7SikMm2dSHSWwT3hqdbSiLAzsbNrFUGXeS2p8Z5GO
 vkY6Nrp0DYuAWzREYYi7s4mlRAm0bPKFuFyUx2toZWZh/OA5HfP3JBCp+7vvI4muCscHyRfdWG9
 nBsX96WFeZHEtQRBrONrXbXNrsm5tm6u42KKvPKlSb1yKoJneGQ4WkXZvsX7kLEVuT3nl77YplR
 p/7npq2p0gg67IgJ9IZ2IwL/ls2IgQT368yizx3psMQ5pDfYw+tmP2YtfWz9U9nryOW+wftlkoL
 EnVs/X/ZtnW+DvmwT/E4G4WStjSwwsuhiU0q8sfiQ2HWTO1+ybaiSo4HrC2AyCOlkLazcV0Rxlg
 F3dPgu1JFdaZ/jA==
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

To properly test the EDID reading without using the DRM override, add an
option to configure the EDID for a connector.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c |  1 +
 drivers/gpu/drm/vkms/vkms_config.h |  2 ++
 drivers/gpu/drm/vkms/vkms_output.c | 37 ++++++++++++++++++++++++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 5eba4284269d058f12f78ddba96cb40215e85f72..3e8883298e73e75fb16ac05e449a7ee8fac72935 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -162,6 +162,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
 	vkms_config_connector->type = DRM_MODE_CONNECTOR_VIRTUAL;
 	vkms_config_connector->status = connector_status_unknown;
+	vkms_config_connector->edid_blob_len = 0;
 
 	return vkms_config_connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 8e0c9b753821f75f10b3090743905471d0abac36..6844ca8523decd51116fb36f98ed40a09bc2284b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -104,6 +104,8 @@ struct vkms_config_connector {
 	struct xarray possible_encoders;
 	int type;
 	enum drm_connector_status status;
+	char edid_blob[PAGE_SIZE];
+	int edid_blob_len;
 
 	/* Internal usage */
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 75d90df44da3b6dd3ed3ae104a6bc6d51c9bf089..8f7df59aa2c1517eb78e9b94b8611b15431fd234 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -38,13 +38,44 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int vkms_connector_read_block(void *context, u8 *buf, unsigned int block, size_t len)
+{
+	struct vkms_config_connector *config = context;
+
+	if (block * len + len > config->edid_blob_len)
+		return 1;
+	memcpy(buf, &config->edid_blob[block * len], len);
+	return 0;
+}
+
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
+	const struct drm_edid *drm_edid = NULL;
 	int count;
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(connector->dev);
+	struct vkms_config_connector *context = NULL;
+
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, link) {
+		if (connector_cfg->connector == connector) {
+			context = connector_cfg;
+			break;
+		}
+	}
+	if (context)
+		drm_edid = drm_edid_read_custom(connector, vkms_connector_read_block, context);
+
+	/*
+	 * Unconditionally update the connector. If the EDID was read
+	 * successfully, fill in the connector information derived from the
+	 * EDID. Otherwise, if the EDID is NULL, clear the connector
+	 * information.
+	 */
+	drm_edid_connector_update(connector, drm_edid);
+
+	count = drm_edid_connector_add_modes(connector);
 
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+	drm_edid_free(drm_edid);
 
 	return count;
 }

-- 
2.47.1

