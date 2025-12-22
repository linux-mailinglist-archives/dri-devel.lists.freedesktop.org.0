Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD320CD582E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C58D10E61E;
	Mon, 22 Dec 2025 10:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bsl812Fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEAB510E613
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8CDA44E41D33;
 Mon, 22 Dec 2025 10:12:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62C16606C1;
 Mon, 22 Dec 2025 10:12:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6169C10AB01A2; Mon, 22 Dec 2025 11:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J5RVBRf87Z75m13rh/8P2VEYGRdPDGtnY1g07bc3IJY=;
 b=bsl812FdCqEO+N+0WJtuN6pshbab9NIO37B5AcT34pIR5ccw6dx67sUxawso2fHS7g9YE3
 F8R9CTWPyUvbfRT5zEGitaCHVlrn+6f/+JEXbvlcwacnEDvg++b96z/VYjN9p8e/08nNC6
 1XZqddx21C7rwD2Wu4fHONEtB3WLr06zM/PkWxeqKH/+2brT6e+GQ+k/hcCIP8XEU0rOAn
 jMOs0dI89iVMufkY5l7XSJc+NbrP0M7sFN9dhGWZUR/SOKFoR1CXE3g3APQnUTrz+fSmNq
 Iypse/EuXXwtQFvB8MuHM7vsJsvalz1pLvDTplt9ldTuXSsGgiBlMDC5qrdDhQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:33 +0100
Subject: [PATCH v3 31/33] drm/vkms: Extract common code for connector
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-31-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2829;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yoSv2zmqsM08XpGUmJQS+2SLpyZ6XFDF5YGQcog13kY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlEJCgtE5ARQGGmxPsWE4yqYjRrHcDbYsD3m
 2RJNzKvn+GJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZRBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJnhg//bbmrzzKtS7SA6vQs1AyEkPLg3GEepj6
 gSsOyymWjglj1v5udl/3z/bALIQASIcW6vH69RPGEEIzWlt482OZENL2GkcdbslE2jg1f9iES31
 sOHe8PJyq2Rcrfe9s3a9IPPWUr2+4HWBzAjANtitFRF9thuUF5P7x61ZVtaTj6LDazMfWX46z51
 GAZgVvKk1JCgeKJFeZyKLvVaAmIzp7FMvRAUL69sLWKPrnUc7GWx7JcpH18IL7CX+PDWiweuLff
 A0BRWWU0wgxVQv5s/SZ5PRPBvqT4KVIoOxZU6XBRdkKIPL5tryvmkBTdF8tUI8nVUYytmxDMfbW
 oz8wn8EnjiU7SiREn4mxFWyp7G4oiy2cpUl70zdWij/6OovZevC9Lqht7G2/NUZCUqzTfRZJfdx
 MgV1aSV50lqPoQEWyELJa+u+idKM8RCzzUDYMW8Ez+1u104XTS1X3lEd8Ke0SbrzMZMDVrQsflP
 hgsA7on7FyNbs7De6mE+1i0OHJaSL+VLtAbH5VmU1S8wG7ZDRCGVha+JTzxTfZ3b3I6vYr+hojj
 ZU3w2K+V9g6FjwT7YKgTQVR6TxzvdsjBMJCarDZRUmnul3zs8Yctim4xKPeq/l3K+1Ff6bpzMjm
 SL6Z29kGAaUPNiOy1+j4VStn5MExTC94kBgatHyVWHfza/nfgzeU=
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

With the introduction of dynamic connector, some code will be shared
between dynamic and static connectors. Extract this part to avoid code
duplication

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 44 +++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 211f11c8473d..3ad614642355 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -110,22 +110,17 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
-						  struct vkms_config_connector *connector_cfg)
+/**
+ * vkms_connector_init() - Common initialization of vkms connector
+ * @vkmsdev: VKMS device containing the device
+ * @connector: VKMS connector to init. @connector->base must be
+ *             already initialized by DRM core.
+ * @connector_cfg: Connector configuration to apply
+ */
+static void vkms_connector_init(struct vkms_device *vkmsdev,
+				struct vkms_connector *connector,
+				const struct vkms_config_connector *connector_cfg)
 {
-	struct drm_device *dev = &vkmsdev->drm;
-	struct vkms_connector *connector;
-	int ret;
-
-	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector)
-		return ERR_PTR(-ENOMEM);
-
-	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
-				  vkms_config_connector_get_type(connector_cfg), NULL);
-	if (ret)
-		return ERR_PTR(ret);
-
 	if (vkms_config_connector_get_supported_colorspaces(connector_cfg)) {
 		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA) {
 			drm_mode_create_hdmi_colorspace_property(&connector->base,
@@ -145,6 +140,25 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 
 	if (vkms_config_connector_get_edid_enabled(connector_cfg))
 		drm_connector_attach_edid_property(&connector->base);
+}
+
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_connector *connector;
+	int ret;
+
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
+				  vkms_config_connector_get_type(connector_cfg), NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	vkms_connector_init(vkmsdev, connector, connector_cfg);
 
 	return connector;
 }

-- 
2.51.2

