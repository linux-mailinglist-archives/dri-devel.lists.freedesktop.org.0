Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084A951D43
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E249910E4B2;
	Wed, 14 Aug 2024 14:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nU09Wv9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C5810E4B2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 853BB1C0014;
 Wed, 14 Aug 2024 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mejIIXPURaek6mjtWd5mqBmpe3HOEF3GsOx95SQDqq4=;
 b=nU09Wv9Zj0DTXtTaKtchzwscuZiS12inNG2Jw/2EjbLRSnYDxmMJuhvZ69PZXxDWgTZl80
 oC+o4sENhLpu3pgb5ErwlMD5QYSCfE8YjQM4B4ia0PiTSnOz09nVBm7VFn2mqjE0aEzAO5
 zaFwULtCAVdfTU8qZM7+kFBhckWjZBAAw4AfmAxfJK3/YARrZUVCHyN2ahmPAF2CyB18I1
 LJqUfUugFkkNpzPNLjOx1JarMnPSZMYV4ilUFQ0LKFHq20DBW5p4oYBq1mlwWAPH1zqTo0
 jXsHLxDGb3kpCY4KkCYfRpFCKjEy09+M6z1JPjONbyyvleWJXPNlmXpo9rMOng==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:33 +0200
Subject: [PATCH RFC 11/15] drm: writeback: Add drm_writeback_connector cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6odxYTXA8ortXBUomxRjgorI0mo39N/O6CGAuFuXVcs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDrBA7inbkZtwi0MgSJNciMd8SobTqox5trU
 XlkRcpuF1SJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6wAKCRAgrS7GWxAs
 4lhFEACNrxekua9mWX20TEWhv9sE/GhKeSR4A5A6U8B8kWrddIESqC0zODhuxosYvKduF51Vh2m
 bAn67DXGORWvAtTTziGKbBmRz0pDtnPsxBeIR9ntA63xQQLVwT1n6chdF0L2vjy19tVSfZY0aYn
 aAfiBxqDwRJbi/blbhg4Q3g8wxYtz1Bzk0gN2JqFWxb8cAXki2/k6mdSKW0+pZSxIhWksGT0kjd
 Lag4w9yl+/iuHh93rcoWSesYP3FNknZ+KQgXuIZfGZ5/VLCyU2IM+VdqKb85FaTKJbYNBg8u6I0
 OzZlWcjPwnmGd1/pBxXZh7inWMv1+FkysIB9oZTdvfxlg4KCxmIfS19t+0r84ScUxYWyHuvyoRe
 lk4szoFyE7syRWqscQbhRKUMu00Y2vAc/uBcEk582giDv0CgV6jkbwaIDsXh4KJ2GbQaaYQh4sP
 pAM4RbLJZljJRQoa/zRurzXI6/flDTQ+rXzHg6i+FveoXLe+3EfwKzrEpqlU10O+614cUkHuBVx
 bTNsuOPeK9HmERQaH9HUCAPkaUlsjCX62h9u3KViMRy7APkVgbOA3H1BqGi3hbaD55rv9SzfcjM
 Rn49P7munhIk7iW6RANw6WGSFGhT8v9Jb9wXGoJ69/1g3Re5eyPIoAGhLayjrIeapWLtskREFFj
 fbJN+lwKox6s1ag==
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

Currently drm_writeback_connector are created by
drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
Both of the function uses drm_connector_init and drm_encoder_init, but
there is no way to properly clean those structure from outside.

This patch introduce the new function drm_writeback_connector_cleanup to
allow a proper cleanup.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 10 ++++++++++
 include/drm/drm_writeback.h     | 11 +++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index a031c335bdb9..505a4eb40f93 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -184,6 +184,7 @@ int drm_writeback_connector_init(struct drm_device *dev,
 	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
 
 	wb_connector->encoder.possible_crtcs = possible_crtcs;
+	wb_connector->managed_encoder = true;
 
 	ret = drm_encoder_init(dev, &wb_connector->encoder,
 			       &drm_writeback_encoder_funcs,
@@ -290,6 +291,15 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
 
+void drm_writeback_connector_cleanup(struct drm_writeback_connector *wb_connector)
+{
+	drm_connector_cleanup(&wb_connector->base);
+	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
+	if (wb_connector->managed_encoder)
+		drm_encoder_cleanup(&wb_connector->encoder);
+}
+EXPORT_SYMBOL(drm_writeback_connector_cleanup);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb)
 {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 17e576c80169..e651c0c0c84c 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -35,6 +35,15 @@ struct drm_writeback_connector {
 	 */
 	struct drm_encoder encoder;
 
+	/**
+	 * @managed_encoder: Sets to true if @encoder was created by drm_writeback_connector_init()
+	 *
+	 * If the user used drm_writeback_connector_init_with_encoder() to create the connector,
+	 * @encoder is not valid and not managed by drm_writeback_connector. This fields allows
+	 * the drm_writeback_cleanup() function to properly destroy the encoder if needed.
+	 */
+	bool managed_encoder;
+
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -161,6 +170,8 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				const struct drm_connector_funcs *con_funcs, const u32 *formats,
 				int n_formats);
 
+void drm_writeback_connector_cleanup(struct drm_writeback_connector *wb_connector);
+
 int drm_writeback_set_fb(struct drm_connector_state *conn_state,
 			 struct drm_framebuffer *fb);
 

-- 
2.44.2

