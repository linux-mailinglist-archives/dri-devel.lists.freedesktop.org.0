Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40303BEC462
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6280F10ECE8;
	Sat, 18 Oct 2025 02:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CMQjxjPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF4B10E2E2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 810814E4115B;
 Sat, 18 Oct 2025 02:02:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 570FA60701;
 Sat, 18 Oct 2025 02:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45AD0102F2380; 
 Sat, 18 Oct 2025 04:02:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=fTuFMJDTvbkZgKvZRV0c+t3F6zz7i8FZBsHDq+i8lt0=;
 b=CMQjxjPe61gbADGaU9ran+x6EE9Cr4amkxJ+p9wkq6n0pfd+YozDqODVziDkSAShkkbyDD
 paZBGCO3om0YWVI5o7ItLju63WgSxsqpFIcHkEdcZA19XQI7GHE/lLbBagyza0PK3xgS06
 FO6CG9BN8POZ5GRKZOAm2EKCqNOkdfUax1Bcv0hSjI97Rp2wa6yJzCRzcPNlPicNgzpcOY
 5buKOvm40M9QD6LlcBVP6IoMIA427ZBZw9GevWaXJ1lFqpfWym46sOZ8iLBZ5X7kBwb6Pz
 u+Uc+VNLZaosIUHCk2R5fuExqUNQ3t+YmlyGNiTD3mcknN1gJuHHohHp4Jwd0Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:20 +0200
Subject: [PATCH 20/22] drm/vkms: Store the enabled/disabled status for
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251018-vkms-all-config-v1-20-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5650;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8VvJUvuGWIERwcAsm32j+6lc7oBxnvtA0YFDiz8tItI=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT/Bv3MRelY543npUk9NJCYaoZLtSGsFfzcw
 IZgewWwZeyJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/wAKCRAgrS7GWxAs
 4mTJEACMNq03jBv61NTt1qmfPj9DsRIHmD1AYVxKPVrw8Q3c0N4fHvf81okgQ4d4L1rShy/olic
 7jEKDzzL7CqfzsMI4lZwgQFMQQJKySy07UBoNT7AAfPvu+4GjBIAmGcCjD96OXO/9uwgl8H8pV+
 XXKNbGywXVhyFKFeeFBd2NJm9enLWFByMc0zCOQLPs0gf5KRXzb+MCf3Buz7fTdUX3aXEcTyuPS
 oEQOvv+O1zmpudKjkSCrBFl+IZNcZ7KZhgvyKszRVWXBMfo0QyOMqcrbbxMSDiKCv97MBZFkJ3X
 KT5tp9sEUNTLMwKXfb7mgO27A/GE4wOWSZz5TD/4dFbXxvbsmMdOxl5yUvxri8zzRbmYs9ftlIg
 lgN3VasAim/Icj8MpESAaMuAWcm1LNqtiHBgMXt2lJ024uDg2mD+6ECc5BoBz+ooEXp8WKaaLvb
 WBkJqc/kmv5MRZw5Ma7TJ8X9a1uoTRv6m6rZkHQObk3azX1/BDTKTQm20zuX74RXRmHUzlwHBrb
 0LQK63sBIYu/JF5yHozvnUo2vVXJ3YIGhcpr/FVeaoqALIEgeykkqagjC03BSM0qisAd/JxFsuX
 8ecwXH06JJb3I91NM2DJlhBiplfcljyMajjJpTJ4U2WIu/I4kpwIiELl17VAUkwSKPKgW63kh8w
 Nqio4lsCDJM/+cg==
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

In order to prepare for dynamic connector configuration, we need to store
if a connector is dynamic and if it is enabled.

The two new vkms_config_connector fields will helps for that.

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  4 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  2 +
 drivers/gpu/drm/vkms/vkms_config.h            | 66 +++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index d1e380da31ff..f4b5f8f59fab 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -192,6 +192,10 @@ static void vkms_config_test_default_config(struct kunit *test)
 				0);
 		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_edid_enabled(connector_cfg),
 				false);
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_enabled(connector_cfg),
+				true);
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_dynamic(connector_cfg),
+				false);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 56e2082b91c9..fd724ae2ebc9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -773,6 +773,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->status = connector_status_connected;
 	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
+	vkms_config_connector_set_dynamic(connector_cfg, false);
+	vkms_config_connector_set_enabled(connector_cfg, true);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index eaf76a58aab6..6716b5a85f0d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -128,6 +128,8 @@ struct vkms_config_encoder {
  * @link: Link to the others connector in vkms_config
  * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
+ * @dynamic: Store if a connector should be created with drm_connector_dynamic_init
+ * @enabled: If @dynamic, this means that the correct is currently registered in drm
  * @status: Status (connected, disconnected...) of the connector
  * @edid: Stores the current EDID
  * @edid_len: Current EDID length
@@ -142,6 +144,8 @@ struct vkms_config_connector {
 	struct vkms_config *config;
 
 	int type;
+	bool enabled;
+	bool dynamic;
 	enum drm_connector_status status;
 	u32 supported_colorspaces;
 	bool edid_enabled;
@@ -185,6 +189,24 @@ struct vkms_config_connector {
 #define vkms_config_for_each_connector(config, connector_cfg) \
 	list_for_each_entry((connector_cfg), &(config)->connectors, link)
 
+/**
+ * vkms_config_for_each_connector_static - Iterate over the static vkms_config connectors
+ * @config: &struct vkms_config pointer
+ * @connector_cfg: &struct vkms_config_connector pointer used as cursor
+ */
+#define vkms_config_for_each_connector_static(config, connector_cfg) \
+	vkms_config_for_each_connector((config), (connector_cfg)) \
+		if (!(connector_cfg)->dynamic)
+
+/**
+ * vkms_config_for_each_connector_dynamic - Iterate over the dynamic vkms_config connectors
+ * @config: &struct vkms_config pointer
+ * @connector_cfg: &struct vkms_config_connector pointer used as cursor
+ */
+#define vkms_config_for_each_connector_dynamic(config, connector_cfg) \
+	vkms_config_for_each_connector((config), (connector_cfg)) \
+		if ((connector_cfg)->dynamic)
+
 /**
  * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
  * possible CRTCs
@@ -441,6 +463,50 @@ vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
 	connector_cfg->type = type;
 }
 
+/**
+ * vkms_config_connector_set_enabled() - If the connector is part of the device
+ * @crtc_cfg: Target connector
+ * @enabled: Add or remove the connector
+ */
+static inline void
+vkms_config_connector_set_enabled(struct vkms_config_connector *connector_cfg,
+				  bool enabled)
+{
+	connector_cfg->enabled = enabled;
+}
+
+/**
+ * vkms_config_connector_is_enabled() - If the connector is part of the device
+ * @connector_cfg: The connector
+ */
+static inline bool
+vkms_config_connector_is_enabled(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->enabled;
+}
+
+/**
+ * vkms_config_connector_set_dynamic() - If the connector is dynamic
+ * @crtc_cfg: Target connector
+ * @enabled: Enable or disable the dynamic status
+ */
+static inline void
+vkms_config_connector_set_dynamic(struct vkms_config_connector *connector_cfg,
+				  bool dynamic)
+{
+	connector_cfg->dynamic = dynamic;
+}
+
+/**
+ * vkms_config_connector_is_enabled() - If the connector is dynamic
+ * @connector_cfg: The connector
+ */
+static inline bool
+vkms_config_connector_is_dynamic(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->dynamic;
+}
+
 /*
  * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
  * @plane_cfg: Plane to get the default rotation from

-- 
2.51.0

