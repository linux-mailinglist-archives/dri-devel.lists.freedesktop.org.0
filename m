Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE779FE9FB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6806310E56C;
	Mon, 30 Dec 2024 18:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lqMJ4mst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA63410E56D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36B85E0002;
 Mon, 30 Dec 2024 18:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=esRRjJHDEk8HQ8R6rqbLTaRvPZxdOMS/qwKf6ebtbdo=;
 b=lqMJ4mstZN9HdJRSIxNnGzaomk6pe36aXJydJA4Qi3qKcsJqyLkCHHGdF9RJGe3Hf1witC
 G0IbikHT/61YAJtIlLBpwshWEUybGxpt2lSipwEZGZbiWYE5+ATJ3z2Hw1K1RF6yZjPaxb
 aEeVG94hgRcj82TMfSn6UFtoSh8SZDcO0ledWsCZGyyZtI3pPJ+mPgm114nHC0xjWlurpD
 2Y1R43ZN5Gey8UoR9JhziorD17tnnTEPMICNz0j4+m8KnCWnYOcyO3mN4zXY7hGb7wfoT8
 O7ApwtfVmoR1ZG83MRujOL3NGpzOL2qHYTxCD4rrC8n0/7HO169G90GwXL+yWQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:37:37 +0100
Subject: [PATCH v6 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-google-vkms-managed-v6-7-15c7d65cd63b@bootlin.com>
References: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
In-Reply-To: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4084;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EhkSYEZ68pDeZzMyUb+Yt9Bo/Mxf6ioebvaRQ1NiqGU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhy/jRThFwlfdT2r8urnrM3pQvWHPHV6xUcn
 zkJmKXimWOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocgAKCRAgrS7GWxAs
 4jOpD/4w6gts7wLnCWexMUFv1C0pJsE7Cox0atBmhJ53WZPIoB10lKqibFCvjAmNAzGcV9Aj4vk
 QbzDyGapklLPMPbLpL22HEFgfFOtZK7WTDtRwJwTzfMYLUHlzRne69T0aNJNliJsdYRWK+Ornsx
 p4e2P2yMAtD5vTaaBuLsEIemIpT9NO+XRM7XA2rI8Hoi1WLbsxutqhKwlJdeM4MeejcsdyyKDPs
 402P6/pai28BM6tcLiTIQIEj4QkvGDigFkzg8s5yJ/5Pa+uoqoSJFY1H7u1ainkU5P4AYpQkeA4
 1qdbIpJHX762yyWjTcOKfvj0kOgJtYJDHQroHAsUV8zpOcfx7ht4sRXSJcn0jcWMqR8PNLTAwGY
 Xi57EWrifuuZMfbrvi4m8yJBlzTbir+RGcPID72z6z45vwVnysvfsgaLfXJ56rrAzqWkmKhnkQR
 4qq1qIO+b3lobxj0nz6VGLwDFRy5JdHq4dLqEsCVB2GfbUZgU4INuZ+brImiZF1xG8/9jM8sIgT
 WeUsY6zlTKAlu9tTv6EfoMrYvabhZiPMz1GOeIDqg8AZe3w3022139NTTVO69aLjWhbSCeOJk6W
 0tOCyXhz+HNr7hUVmVVXofZsPmbM9UkkyemloNmxKCy+Ce52kALgSmQsX+DIX9f21PTcV1/MI6p
 9qFMmq/GADFcQIQ==
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
 drivers/gpu/drm/drm_writeback.c | 69 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_writeback.h     |  8 +++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 9c69f7181e02c23dabce488405608c40d4184af5..1251f65aae9e3b6fb5c5de9ab9280e5430342208 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -369,6 +369,75 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
 
+/**
+ * drmm_writeback_connector_init - Initialize a writeback connector with
+ * a custom encoder
+ *
+ * @dev: DRM device
+ * @wb_connector: Writeback connector to initialize
+ * @con_funcs: Connector funcs vtable
+ * @enc: handle to the already initialized drm encoder, optional
+ * @enc_funcs: Encoder funcs vtable, optional, only used when @enc is NULL
+ * @formats: Array of supported pixel formats for the writeback engine
+ * @n_formats: Length of the formats array
+ * @possible_crtcs: if @enc is NULL, this will set the possible_crtc for the
+ *		    newly created encoder
+ *
+ * This function initialize a writeback connector and register its cleanup.
+ *
+ * This function creates the writeback-connector-specific properties if they
+ * have not been already created, initializes the connector as
+ * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
+ * values.
+ *
+ * If @enc is NULL, this function will create a drm-managed encoder and will
+ * attach @enc_funcs on it. It will also attach the CRTC passed in
+ * @possible_crtcs
+ *
+ * Returns: 0 on success, or a negative error code
+ */
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const struct drm_encoder_helper_funcs *enc_funcs,
+				  const u32 *formats, int n_formats,
+				  u32 possible_crtcs)
+{
+	struct drm_connector *connector = &wb_connector->base;
+	int ret;
+
+	if (!enc) {
+		ret = drmm_encoder_init(dev, &wb_connector->encoder,
+					NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
+		if (ret)
+			return ret;
+
+		enc = &wb_connector->encoder;
+		enc->possible_crtcs |= possible_crtcs;
+		if (enc_funcs)
+			drm_encoder_helper_add(enc, enc_funcs);
+	}
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
index 17e576c80169a820e8d5587b229b2cc2ee369a18..885373a34c000ae9a4ecff8d76125290bffca3f0 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -161,6 +161,14 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				const struct drm_connector_funcs *con_funcs, const u32 *formats,
 				int n_formats);
 
+int drmm_writeback_connector_init(struct drm_device *dev,
+				  struct drm_writeback_connector *wb_connector,
+				  const struct drm_connector_funcs *con_funcs,
+				  struct drm_encoder *enc,
+				  const struct drm_encoder_helper_funcs *enc_funcs,
+				  const u32 *formats, int n_formats,
+				  u32 possible_crtcs);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 

-- 
2.47.1

