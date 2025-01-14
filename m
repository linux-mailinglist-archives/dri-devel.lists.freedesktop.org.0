Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB4AA10887
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBEB10E339;
	Tue, 14 Jan 2025 14:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZUZXflcY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9070F10E33A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86262C0010;
 Tue, 14 Jan 2025 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcFo04aePHcVATEz/b+YPOhv65FHdQoDZzb/BhLAltA=;
 b=ZUZXflcYXdQKN1L6q+HhHLFX5+0YeYlhBLlNl6FCao25kxq18Lg5EmHyyZIfLI3TuD7Ccr
 YN1NAa+tasfm2L42Y6oLZ+vLgLU++31jTZKDUc1IfE4jNR7Y1+efI02W1RjILZ3pv81UYL
 m/7jednKPsKd1dBRiNikHTWWlowXImwIRCgYC808EkyzGYytJinfE8eJCx1PZMVo/w9d5S
 EU2E/UKTzczj9ePMfdnw0y/bQDGG0771kN0+gUwFKJCMyQpUAj5301jWtUINQKJCnInIvF
 ornZDU4wzZLtscKDBm3f763jxN5j9ydS7vw3IwzeVNaF5ge04pEfDi1TnXJ2Qw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:49 +0100
Subject: [PATCH v8 7/8] drm: writeback: Create drmm variants for
 drm_writeback_connector initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-7-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+fUb0GLJudMuErVuypsDt3jWi3Z7jzufxwye9EpDQwI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9FQz72oosOEbLe+RlYB/2zznAsBCsQEG+V7
 2aG/i66xkeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRQAKCRAgrS7GWxAs
 4ptVD/9UZRIC5vQc+IMa5Au67aIDPhcqTNNjm+pEeXWzm+5wqdsSPwGtOCKQF+8SLzvhMFVm5AN
 JOJAqeFgLEBqBwH625HalBtU1fTZelP9hIsUf2jbGP3FC9mzdbgDJMF9nOXE6E949BnFCbeOjfK
 VoCdtFyNE8jWywEQhHnBynCYKww4mxKBWqmDc/gWxTrzlqcDP8bYBaA9fXebeTKkojmkvQk05cI
 TCySFoKV30lLysv8bDj1gz4jiU5o0yKsRHvm7oQSozK+V2idCeuOjXm8Wrm+8/v/HYDYtgLkPVb
 HLVnyF1y2e46ll63xSgwIeWSaCzNCxd+8cqpbiVXE5NOSiJkIWH/KBHBHqRs1UzVkXfS5GpG7n5
 6YOq5l1NrrIcnOmUkCCvfRzAD0ZpDzZ14yq9b8Fvs+8kJg+qw+QSo4AQmwjh/rhz4lFDgqcXQEe
 SS7OlQlXyz6CvSIJuOvM/ltU1gpxuavtXb7Jc/BYELU8Iwq3CK56vueTGM+9sLvwZ/DBWa5gGqe
 S+Mbn5aRt0r60USd2oCLkfAifhSWPSkFtcHjAnN0txsdVcknLMMazwd82f5vZzuBHtfDDnLSOZ1
 UQuFa3mWKtonzmyTxJQuBMUnRUgguaXMtvYzcqFttw6mLoZXGVvr/tGOXQroa4F6F5Ie9gc4zgC
 WGQOaydqAyohQ/w==
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

