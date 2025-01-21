Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E7A17C63
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ECD10E570;
	Tue, 21 Jan 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UbOwfMjO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7586710E569
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FB5F4001B;
 Tue, 21 Jan 2025 10:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA6XdpN3w5XidNwrdB+1bIHakVyQR6K7aeCy8o0KAhk=;
 b=UbOwfMjOj1H8WUJOX6Cchr+oRXVeraHWobWnsSJVI2IEYsxRo8PEr7iDfek+1n1zeRHehH
 DiY+Agg6Cz0aX+Som/ZabxIV354hk3OWanx1GZoxwLxhYA2tVX+xwaAluolESJaXyzajSJ
 hqbg9vynfUynFTVpq8SdbQV8P3svpEBSMQ7V8LN7rekLnddRf7h5HeurSDp/3Oc9Yw+KOn
 AFfV7lxjSIdUv/DGVvu9vJktg5GHFRU52cr8X8WnkCVn93rBf8/jASlIJTYfd0ByqVrk9p
 1fl+QXXWC5XNfEYaeThfUNmcYMTpowcAGTChKGUSqWB/lO+IkaOOru2f0K+ycQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:36 +0100
Subject: [PATCH v3 12/16] drm/vkms: Introduce config for connector type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-12-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Fn4dj3/bZMFWIay4+pa2CTqCgY7/s9nwUyzsXJExpVw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30juZQ5Qw22v5jOxelR1ueR3t+Hw7fFpXVhh
 bPvee+Ed3+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IwAKCRAgrS7GWxAs
 4iLpEACYpTsZIhY6OljFqcgGCHhCJNW0jY7Ua7JNV91CEh8tc3cUKIHRxmRx4jUJb3BIScKEVLe
 ez8QxIOWhV6xFbyfTN0HzKebsPSbdAnuawMgZaRlCh7b8piQqNhUmCS5UtSfeBqBX0J+aRj5ejs
 Wpfe4JNP4OTDijmhYg1w9Oulwj4roTHdxSjR31QNf0O0TsA32n2Ov943u4mD05hjxXxmQBkbi50
 1yRcfktW76NuHpCHHrecL6kVDshD3vRUqs7DZvEklRZ+ApgYXtnJpC2RCOTDgOvJon5ajvKbBjy
 UuAUEZZ3kgXDuIM9i/GBDlRATQwepdIibQtKghozeqXtmmIqtFMQPOvwInqGLHwBzpxOmkAfjr1
 dttoOWvnZiKs3oafvmY8Bvaf/wyVu5KKTJajs1tgRqYI0wE8o2WvSMPR8jqSlWvuk3ihMQyxsD7
 7PSjrLo7CkFdUHHbQMJ3UUu5qj7Q+n2/UC808WYjOkglzq1o4UXU+GP+cWW54EBL1nAerAThcY4
 YnJO/clL+NQLl3NVtFUDrVpIw4ochEDD0KmIbNU4sIGtx6idctv8yUGfNWqyLQzKsQmsHd1S8yK
 FbvBcAQ3GIbzik8Zui+XjbOXxViXHt+xBbUr+7SayoiHMKj1pBd/6ErEMwVKAH9uws6rKUo1ZZJ
 fHm3lrPWiQNhkrg==
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

To allow emulation of different kind of connector, make the connector type
configurable.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 1 +
 drivers/gpu/drm/vkms/vkms_config.h | 1 +
 drivers/gpu/drm/vkms/vkms_output.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f1f02c66755f9660b48dfa5cb786afa1e6ae553b..d2006d7b47f9cf21487659cc3eacb6272d1904b0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -144,6 +144,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *v
 
 	list_add(&vkms_config_connector->link, &vkms_config->connectors);
 	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
+	vkms_config_connector->type = DRM_MODE_CONNECTOR_VIRTUAL;
 
 	return vkms_config_connector;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 584d015d6b8f420d82b2cfe38c991e93ad8288f3..18b8978b7b7b58c45fcf11f7130883013e34d8ed 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -100,6 +100,7 @@ struct vkms_config_connector {
 	struct list_head link;
 
 	struct xarray possible_encoders;
+	int type;
 
 	/* Internal usage */
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 146ce254a027c662ae275dd2ec0024a46fa8119d..50aa802da479e5ba383e5db49dc2c7c6981f0bef 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		if (!config_connector->connector)
 			return -ENOMEM;
 		ret = drmm_connector_init(&vkmsdev->drm, config_connector->connector,
-					  &vkms_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+					  &vkms_connector_funcs, config_connector->type, NULL);
 		if (ret)
 			return ret;
 		drm_connector_helper_add(config_connector->connector, &vkms_conn_helper_funcs);

-- 
2.47.1

