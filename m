Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2ACD581A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E28310E615;
	Mon, 22 Dec 2025 10:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UiZnQI3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5133510E616
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 24C064E41D35;
 Mon, 22 Dec 2025 10:12:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EC88C606C1;
 Mon, 22 Dec 2025 10:12:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6AC5210AB019E; Mon, 22 Dec 2025 11:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=yTTRbpqypHIqE7M/6uF9YUabZ9LYuBJ9m2GDLJy6KX8=;
 b=UiZnQI3ORk2lEkFtOTr7Nm80+TZoFLFmPXtLBs1Qr2IOzxSLvI5K9kASBN583wwyLzfMTm
 +EYcqqj11iMJXXE2yDeuILusGEjgXKpwyecCEoseJXujsM+G25LSdQWNHQKXtKPohD+1rw
 oYRdDSTJar40A++kzNmnabr2k7a6s11xqdXghrxuoLf8d3usuKP8vWPSQ42yirFVPfYsDH
 OLdujj920oXwjnk2PANyv2W+xTH/GkiCJM6vpYI5kVrZloNfuTa2eRTdQKZvuwiHaR6MEz
 TURoN1MsJ6FyVOSgwLnCLXlIIpYk5SbsjXM1SHuLCBAakYkR7RrpTfaIG46WLw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:27 +0100
Subject: [PATCH v3 25/33] drm/vkms: Introduce config for connector
 supported colorspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-25-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6094;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Yhwzf6/7jZni4mNzAuhgG5kLyTe1klV7qjEZI8Tn6Zw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDBpM2tIi3K/VJMaBMK2Qe4Z1N9ZDziA4st
 sj93DQf2qyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKx8RAAzLmc9z/1KSW54y9zSfIxxsNN/mJUG7O
 iTLirycCQhSEjLMRoSd2xzotmRg5nqx3qyTipHBrNioMBOMhKa4wbjV0N6tuECzJINvod7J0Inw
 sHw8xJvDTrdhrEb97f46fp7UwNxPXhVCO4/JI6fVkcTCfhpJFQPjYaqN5jAsLwobgmemJ18W/gu
 iq725svhUJshtCkvz9vkYrn5wftaAcLG12SWzlt8MK8nb29zOjNbPsrk1GtRasgQ5TGfzI0zJ8d
 DSa4XaJeUhwEhVRYVT+gb9/4ix17PVnJrKVAM4mBZd5Ewd3wfm7XWWhlc0a/twtk7qZZsIN0YHF
 xf8vH2gGXCaDni3hgtEkSIQ9udLF9Nvu7QukovTmjzGQbvrQfQoFuLLH65QZoCuP0upZspJuZPJ
 u30U5kgF4Uc199nlwF9rmMH33mDPxuHPJkBj8sTslb2ZW1XnCJZKLd3pOceTVnalA+sqUIpqXXf
 6SbQkCUWXu/ZF85tOtmxXpum7gcHwfSDrzOqzGV1wYUZrMUZXvKOqWzL9ivs+ZcmTi3VgXh0gr7
 Dx9rfMGGAkzodIRWdsNaWsBqZ6bERwk5z30mz85mVBnLCzEQbVyAtVw3NWbbZjPTWfzMo9ShacA
 Hic+I2erHUiN9nNGcQWFcUmOZsFNbvqbKvLlsNURzJ7kVAnVYTXQ=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  3 +++
 drivers/gpu/drm/vkms/vkms_config.c            |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.h            | 30 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 15 ++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1900cc79db2b..a31fd230c1d4 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -215,6 +215,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 	vkms_config_for_each_connector(config, connector_cfg) {
 		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
 				DRM_MODE_CONNECTOR_VIRTUAL);
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_connector_get_supported_colorspaces(connector_cfg),
+				0);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 59ce55efb167..de661c85c11f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -591,6 +591,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 		seq_printf(m, "\ttype=%s\n",
 			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
+		seq_puts(m, "\tsupported colorspaces=");
+		show_bitfield(m, vkms_config_connector_get_supported_colorspaces(connector_cfg),
+			      drm_get_colorspace_name);
+		seq_puts(m, "\n");
 	}
 
 	return 0;
@@ -908,6 +912,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
 	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
+	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4a4058b407e7..c9d777589cb6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -132,6 +132,10 @@ struct vkms_config_encoder {
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
@@ -144,6 +148,7 @@ struct vkms_config_connector {
 
 	int type;
 	enum drm_connector_status status;
+	u32 supported_colorspaces;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -243,6 +248,31 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
  */
 void vkms_config_destroy(struct vkms_config *config);
 
+/**
+ * vkms_config_connector_set_supported_colorspaces() - Set the supported colorspaces for a connector
+ * @connector_cfg: Connector configuration to modify
+ * @supported_colorspaces: Bitmask of supported colorspaces (DRM_MODE_COLORIMETRY_*)
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
+ * Bitmask of supported colorspaces (DRM_MODE_COLORIMETRY_*)
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
2.51.2

