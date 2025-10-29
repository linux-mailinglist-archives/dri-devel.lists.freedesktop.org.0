Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78AC1B48E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:38:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F88C10E7D1;
	Wed, 29 Oct 2025 14:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="vUCxPdSz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2C310E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0D9B21A174A;
 Wed, 29 Oct 2025 14:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7E05606E8;
 Wed, 29 Oct 2025 14:37:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DE28117F81BB; Wed, 29 Oct 2025 15:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xS/1Ec3oJHE02YD4Fccj9Q73h4DqLCBWTIm+KKVpV/4=;
 b=vUCxPdSzUnIzbPcKoIn5hwEtGfRls/yvSrVR3naGOjSbMHtROOzrdhl4E0EsScMd/Wpl1n
 oFyfJob0VcVkxxqhZnLsEtwkDgwlrV/NXHC9Q7sxxXXkG/iylfqsz+hjwTg7+Pp0X8kPzT
 dI20I+vJdyxSkv7zpwvYmIdyuvY4h4/trHfstNIBVrJpGWQ/dt6HCrnOUDsYnvaf3TIX/g
 j6CkeIWQ0Xpx8+BF1txLs8xd5fLmskrOOnVAHxXknc8VA8+W7Un3a6GWqNrqc+n8nPGzCe
 Z0OH4/fpW0bwnRhZxej2hphajnDy60SGly+ahxvIOyokuPeWORG59OHbiXfzfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:37:01 +0100
Subject: [PATCH RESEND v2 24/32] drm/vkms: Introduce config for connector
 supported colorspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-24-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6028;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0+98kTspyGPOT1vZSC+v8rAN3ugo7Kzz9vOSVYqHbkY=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ9OkXw2efnaBOV717sHLWAxSpXkMmeKuusj
 6M8J0UnmRWJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfQAKCRAgrS7GWxAs
 4tbRD/9X0PceeQysXlQIjAdWfuIrVnltgJgwO7zKPg1D1dFIuiCWMpZXeJSPFMIEq6LisjY1KaI
 ZTlUhfo52Bn/40BkMPB4mGH8n+bbKiAymoE/7mfMPw+ZW7iyo2LaQKW/++K0YdFqlI/s68taclF
 8JocTfEbAYp9o9jFcQkOhYwzy/B3yHh8kMnNH9ltj7JifGDxYjjivEDGnZSs8E95pqekx4XuW3N
 bP4GnBHtU67Skwn84Lj4GUirrwPtmTexW8aelu0jDRpyMTwrgT5hJUiZr7W1cV80nVST8h0HJ6p
 8qeGy+Is6l6ZL5WZ0BFJ8hy7eFcz3pELzW/cnM8I98jMtdgY/3aErkgw6xZmCwf6Y5gTv5RB5Yr
 OhJueJRG/QChhEVlcxKdQYDHkIdUlUULaW3CsviKnazKlcxLKXPgktPa7/cP2TAEqIUssdIAn5G
 6ZRQUrpW3iz9CamAaED6IsCQHodb8O0C9qxQNID/UwBk3VMUce5jyKs/gLuQdHHpPThr/DDfRM3
 2LhuQdSEEdwolZCalLnNXtRy23afrLbj3tsZ0lYJpQmfHvW4j9PzkTZjAVNa2yjRQn8Y6ot/NbF
 47berTb7m1GQSecWLx7U729XIvmpvnPzmf+ZK2CZNWDurrABUWFxfHuYcNDdkCKJvxD0akaWjFV
 PTSVF4FgDSrVjeg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

To emulate some HDR features of displays, it is required to expose some
properties on HDMI, eDP and DP connectors.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  3 +++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h            | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 15 ++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index c8b885306eed..e0ceecf2e2dd 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -202,6 +202,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 	vkms_config_for_each_connector(config, connector_cfg) {
 		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
 				DRM_MODE_CONNECTOR_VIRTUAL);
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_connector_get_supported_colorspaces(connector_cfg),
+				0);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 02e2f0249fb0..6f939b82c33f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -590,6 +590,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 		seq_printf(m, "\ttype=%s\n",
 			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
+		seq_puts(m, "\tsupported colorspaces=");
+		show_bitfield(m, vkms_config_connector_get_supported_colorspaces(connector_cfg),
+			      drm_get_colorspace_name);
+		seq_puts(m, "\n");
 	}
 
 	return 0;
@@ -896,6 +900,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
 	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
+	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 6a50ec7535af..d68133723444 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -131,6 +131,10 @@ struct vkms_config_encoder {
  * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
+ * @supported_colorspaces: Bitmask of all the supported colorspaces. Values
+ *                         are the sames as ones accepted by
+ *                         drm_mode_create_hdmi_colorspace_property() and
+ *                         drm_mode_create_dp_colorspace_property()
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -143,6 +147,7 @@ struct vkms_config_connector {
 
 	int type;
 	enum drm_connector_status status;
+	u32 supported_colorspaces;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -241,6 +246,31 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
  */
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_connector_set_supported_colorspaces() - Set the supported colorspaces for a connector
+ * @connector_cfg: Connector configuration to modify
+ * @supported_colorspaces: Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
+ */
+static inline void
+vkms_config_connector_set_supported_colorspaces(struct vkms_config_connector *connector_cfg,
+						u32 supported_colorspaces)
+{
+	connector_cfg->supported_colorspaces = supported_colorspaces;
+}
+
+/**
+ * vkms_config_connector_get_supported_colorspaces() - Get the supported colorspaces for a connector
+ * @connector_cfg: Connector configuration to query
+ *
+ * Returns:
+ * Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
+ */
+static inline u32
+vkms_config_connector_get_supported_colorspaces(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->supported_colorspaces;
+}
+
 /**
  * vkms_config_get_device_name() - Return the name of the device
  * @config: Configuration to get the device name from
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 5a87dc2d4c63..cc59d13c2d22 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -84,6 +84,21 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	if (vkms_config_connector_get_supported_colorspaces(connector_cfg)) {
+		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA) {
+			drm_mode_create_hdmi_colorspace_property(&connector->base,
+								 vkms_config_connector_get_supported_colorspaces(connector_cfg));
+			drm_connector_attach_hdr_output_metadata_property(&connector->base);
+			drm_connector_attach_colorspace_property(&connector->base);
+		} else if (connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
+			   connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
+			drm_mode_create_dp_colorspace_property(&connector->base,
+							       vkms_config_connector_get_supported_colorspaces(connector_cfg));
+			drm_connector_attach_hdr_output_metadata_property(&connector->base);
+			drm_connector_attach_colorspace_property(&connector->base);
+		}
+	}
+
 	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
 	return connector;

-- 
2.51.0

