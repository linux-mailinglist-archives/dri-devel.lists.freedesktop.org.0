Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BFEA0BE61
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFED10E750;
	Mon, 13 Jan 2025 17:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AFFVB3Bp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE7210E74E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 417E01C000E;
 Mon, 13 Jan 2025 17:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rhkm4SWnVXLA2hOybJrr/wTwUJgRFInEzeDBYkCOeik=;
 b=AFFVB3BpTpsZJuhZYtVd3PUb7PZUZAskbLXv8bnkd7ekxPt3YcYt2fHZEhtoNUGfgTVjav
 DCwQkkaCUdwGLZLFcNP3O6O+62DH6nuicZBpOaEnIGIpnA7mizXN8UW8dtNIJ2s+4OVwYB
 Y80CME09gzdpGSsnmmm0LcMMiWTMTXQoVvAIZus58Qnfkipcd1kGzzMHD+PlgArYUBwkaD
 8Q5wjXfkIxaI4knz9NS/NmgIxqRQ3Wtf0HsYrQHP8DOkIqZw2i1rtc97oMLbry6xTPyrs/
 D7bQsCKxXb7XTUWdTNmnVZTWdktHXk2+imKCqUdapTPr8kbwsZeKTU3dEIDR8w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 Jan 2025 18:09:07 +0100
Subject: [PATCH v7 6/7] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-google-vkms-managed-v7-6-4f81d1893e0b@bootlin.com>
References: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
In-Reply-To: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3239;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tFx2yYzeaN4yo6sXaRo9UQp+25Fu+UIo9XIbw0N4slg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUi1X8MbNc41FCu7qMsbD9Fxsf7DzsfRY8mqG
 DsVg3LDZ3iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VItQAKCRAgrS7GWxAs
 4oJVEACaXyBp1esR3bxNkgUOvfJ4bR8uAz5Ba/hxlDjVYgjsTUjImLo1mHDvcQzjh/9mym6Yr5h
 rQT2oi02ss5YYAXVSiMhOiiUYg++GxfCTvK1eAg1rTSnU2BDSELZHqUDYdUr9wtwm4LIkkC1LFx
 yIgyC8wxQareAsbVQGoWQ88ipj/l3xVprzwKIhLg9cwK/3Yjex7nqqzG0F2zUXxu4K0yYCAZE+U
 UH/T9lgOsW1KJ6ePwyCe5UlJgnoDVTmU25i0cHcGtZAfymWW+wxiAtDo1lltRhwvGAhQV1nVk0Z
 rqFfxAnQjr/vjo0/GifSUp2Yk4wVNaAZ6MJ4CQ92zKVr7YMxX4XM4DGQ5+qZJqjThduBVW2EfRa
 ldZDq9/UJM/zAFUdoHap9EfKWF5f3UWjwgHojxhy80v46D18KijXZ95R3uF7SY3Xnh+Ji+ZheVe
 cKBrLsRIyT8lSEoUwRo8msEDQOZeQmiTCRW8f/QeW3Vfdj7+pFZ/L4GQAhlIddruSvno8roWhml
 TXhltIbdAHEP5DF7Ja8RDApf/Zh8qWUSy1owL7P7AjtmK/0A8ROKXigBRhkOk462Lhja9XBcR3t
 6qQmQoeKlCnN6dPEVky8AZXDytXywbGEl2GfBSbz9LObQId+c4KWkG2Ax79osomn4GCP72cggfZ
 6RP/MLZemeLTCNw==
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

To allows driver to only use drmm objects, add helper to create
drm_writeback_connectors with automated lifetime management.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 48 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_writeback.h     |  6 ++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index b767184289222353489b21416a3329352c3bdfa0..1d0f35ff96396ee6e887ac987d6075e122e89b1a 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -367,6 +367,54 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
+/**
+ * drmm_writeback_connector_init - Initialize a writeback connector with
+ * a custom encoder
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc: Encoder to connect this writeback connector
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ *
+ * This function initialize a writeback connector and register its cleanup.
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const u32 *formats, int n_formats)
+{
+	struct drm_connector *connector = &wb_connector->base;
+	int ret;
+
+	ret = drmm_connector_init(dev, connector, con_funcs,
+				  DRM_MODE_CONNECTOR_WRITEBACK, NULL);
+	if (ret)
+		return ret;
+
+	ret = __drm_writeback_connector_init(dev, wb_connector, enc, formats,
+					     n_formats);
+	if (ret)
+		return ret;
+
+	ret = drmm_add_action_or_reset(dev, (void *)drm_writeback_connector_cleanup,
+				       wb_connector);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drmm_writeback_connector_init);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 17e576c80169a820e8d5587b229b2cc2ee369a18..c380a7b8f55a3616fa070c037d5cc653b0061fe6 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -161,6 +161,12 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				const struct drm_connector_funcs *con_funcs, const u32 *formats,
 				int n_formats);
 
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const u32 *formats, int n_formats);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 

-- 
2.47.1

