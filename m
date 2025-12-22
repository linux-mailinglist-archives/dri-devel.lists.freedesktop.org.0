Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA59CD5826
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434AE10E61A;
	Mon, 22 Dec 2025 10:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1AfHk5l2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5343D10E619
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 28D6C1A2374;
 Mon, 22 Dec 2025 10:12:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F25BB606C1;
 Mon, 22 Dec 2025 10:12:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A05810AB01A3; Mon, 22 Dec 2025 11:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398365; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=gvdZH6gGBykKk6CN6i1s7cZc+6EPuOT+mmajVf0RNVY=;
 b=1AfHk5l2SsMt70cFXOCdBJC2HMNvKiFSKcRbWOCAtoQBv7ZTYmWnjU205fX5WGvyQ105Gj
 EFF2Sbbv663amS7PeCBL/7RuDTfL6EE9zUTowjlx3fEJ7YuSryuYwcefpSWiZZTQ0sK4Ed
 FTcmMrGe9mDfCslEajVmY55QvZgXR/34GYjgd6ZJty+B6ILXzMdFkMp2oWGS3GpA08GMYR
 +mbkmhnJtLT7kx9jrHMa29fc37S49nFq3K+qkpp6DlqmnFArE9YhGXImP8g8Q+WjKEXJb3
 sUko6VZ7z0b53rOM0RXbjNEOm6rqpO8kizuA5Jt7AfFmQwj/vCR8htuARbIxzA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:32 +0100
Subject: [PATCH v3 30/33] drm/vkms: Rename vkms_connector_init to
 vkms_connector_init_static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-30-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2889;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=V/+e1zKI4sX8lqdyAbtlaxr1nfQRLxcCFIcUk2OVYxQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDphUscokf1eiCZ2vgNVfSNct+s7RRZqc7h
 x4aYelzmFaJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLpbhAAha+Iuj9NzBYBF/mC20878EOQye8EFCV
 dn1BDFJuIsIZmuxcQcO/2vyDvbxrAdbKQDnh9RU7c38J3xt2OhMRFSVpYU9GVT/xEdObIF9Dc29
 jsKtGoATWPblExsS/rmtr7BD176w026qOtiI4q4krM6AcRWkF2CHHu8RiOUrVYl4HBi3bmNhCMx
 lAi6S6lse1VsrD0dwkhJXp7uoBXqphnbSL8EHKDwru3LtCkoKRFcCNFtPy/anf/HBN5XAFOPFJt
 JJ7GugKrUrf4UyfCmOj3OiAk24xl7ilWzjwnV90WY4kvFGChuZJXFeoLcbpiy1NMl+BQ244vSVn
 GAT0+/8WeW/bYFz5SSLQuoKlG2QhDiA6WHk71taz/UgzPqn2IgUAGg70X2dX3mpwnrexSqjAFeS
 i0qhJEBqfCncmky81n+QRzpdyQDAnmf4PMyek0i/bNuW6YC/NYWWHcI30PDCyMGISzGgfAmG0+V
 RiDXv+eC716vRjSojGiU5nWOhhJn+UdNlHuY092ox3CFsIzbZFo4KCi29vYcwNgDlt+R/TIWbJ7
 1eGQcCSLH7oEfKfO+H6TczcfvBU4qA4ZSF/f5AfJlK4Cz1Ix9bMGGPnuYYdcxr7J7Xr0KyEbKzw
 Gw6vThpOfZIkixBTMt1Xml1E8djqOwx8EMxePJji6YuSF4Fi21eA=
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

With the introduction of dynamic connectors we will have two way of
initializing a VKMS connector. Rename the current function to clarify
the case.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 4 ++--
 drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
 drivers/gpu/drm/vkms/vkms_output.c    | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 311858727175..211f11c8473d 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -110,8 +110,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg)
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 33253d29b1cc..85f9082c710e 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -19,14 +19,14 @@ struct vkms_connector {
 };
 
 /**
- * vkms_connector_init() - Initialize a connector
+ * vkms_connector_init_static() - Initialize a connector
  * @vkmsdev: VKMS device containing the connector
  *
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
-					   struct vkms_config_connector *connector_cfg);
+struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
+						  struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 1288c8551bc8..13c4ca5fd39d 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -93,11 +93,11 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+	vkms_config_for_each_connector_static(vkmsdev->config, connector_cfg) {
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
+		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.51.2

