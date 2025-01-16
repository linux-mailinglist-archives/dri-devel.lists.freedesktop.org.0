Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB976A14134
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD9C10E9E8;
	Thu, 16 Jan 2025 17:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="jMVduNQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB6210E576
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5A036000C;
 Thu, 16 Jan 2025 17:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS830BSv3QBhd5psoKpHFXUbN21wRhiq+K8cM+bl5EE=;
 b=jMVduNQqkTW3LNdOqVWHxyE+hbRM6iXI9TDTQz3IJXWcIcerdTlsRA4kIowTGkFGWuwpv5
 /8wqF9Fv9mjifO/dJ6KgDepOAB9bh9icitcJ7yo8Qd8HSGs92GTaTKClUzW3peQIRLiSKm
 jBHa4+mk0cdRlrxcC542VOGQXOH+Q6ipfVcSIqbz2Ej6mHrg8rKXrQzSuOpI59AyPPTmr4
 vbzpNubulIzI2oz6xPfLC9BspRHH1RuDYbzjJXj6UGywkw2dKTk/M29rZva7Qn0LrdVclS
 o37Avr8PUd0zHijw5cX3ZclrMviDEN9KHEM3h93sgVtS1aypXKmihK9swdNzVA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:19 +0100
Subject: [PATCH v9 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-google-vkms-managed-v9-7-3e4ae1bd05a0@bootlin.com>
References: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
In-Reply-To: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=liZFsNvU9Lk2TYFgA0qSW3dSAtB5swCojSksOEVVuhU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbcbgn20WN98HytnlHlITfW6Rua5fa9c1krG
 s+1uOcz+w+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG3AAKCRAgrS7GWxAs
 4mjZEADIF+fcrS4h1T50NgzHA9fYgbKey93ZuMnv/zLgpMlIF1OuRTXefI72pHWh0tM7NalDcr8
 k5C/iSkMd9NJGWOtdgtumJEF4iCy7vyeaYnaUxRkRJyjq4n++SxRm9NwV5Vq0f5hf2N4LljO838
 JhKA11BqYWnGnVst1yScP74PwgXMpb7edPAoLMEJhcgSyLo0afq08uCWjbF/xrPtbU/wED/dvWp
 Spg6H5KjMOwxX12FZ06LbqP3jTjsHpBN86Cu/ewhv2e0FAnhc/1Zr9CKREDCU5P906C4ERTyLZK
 Hs/o3fToybWI4TWKfnMTOgquycTpITAVF9V4lLWs2TgTBg2eZjdgCvAwOe0ERWjxEMoKwAdTvpw
 EUSQqeLC35XpL+iJx45KxbdtT7EuFpcga85364hEmnF/tsC1Ucm9C3AM9e0CLY1sz+dbuehu3lc
 R5KfFsHI6MTVqsfkXDzvEpsyLrqnrfS8vwempm/TaPKCxr5XO1Z1j9nuhS2Vdh5Pd7kqWqnLk3y
 KUaR/Du9874gvONx1XGNiL10Q/uyv8AqGKDvpn6eg+bw0Munk4t02CdWh8Mo8dgK2afEYD4W8eO
 xwE781T7ZsmS32JZBVqUo2hQ8FIONxZuGxoeOLQVE+h3k4HUFUiHK2taIHP3lZunaLwKt9rK8VU
 dr02quEHAFik5Fw==
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

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 74 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_writeback.h     |  6 ++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 4cdc6cdcf76beb33f169a46f5895f0d681b11453..3628fbef77524a7390b3929896a20f1c0a82117d 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -340,6 +340,80 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
 
+/**
+ * drm_writeback_connector_cleanup - Cleanup the writeback connector
+ * @dev: DRM device
+ * @wb_connector: Pointer to the writeback connector to clean up
+ *
+ * This will decrement the reference counter of blobs and destroy properties. It
+ * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
+ * clean up the attached encoder and the drm_connector.
+ */
+static void drm_writeback_connector_cleanup(struct drm_device *dev,
+					    struct drm_writeback_connector *wb_connector)
+{
+	unsigned long flags;
+	struct drm_writeback_job *pos, *n;
+
+	delete_writeback_properties(dev);
+	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+
+	spin_lock_irqsave(&wb_connector->job_lock, flags);
+	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
+		drm_writeback_cleanup_job(pos);
+		list_del(&pos->list_entry);
+	}
+	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
+}
+
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

