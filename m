Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F65A14137
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D9D10E9F1;
	Thu, 16 Jan 2025 17:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="i4jbaIrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F8410E9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D548D6000B;
 Thu, 16 Jan 2025 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kU8aEs77fF9qgIAmqQ6svDQpn6KLGmRQxF31gvkx7D0=;
 b=i4jbaIrtLSD/fkvoDAR9HMxbycJIeoAH0gT49Tg8DaWWO1XkyI3NS7Fi297gu9WbSvxv89
 69C1qqwTPDZ6wHoJD0u3Hnp75wGvwKSV6ylOg7A5/RpEmYoJ0cvaREo+uhnWe+3Wc5J7G0
 tno02Wiadtx00Xf4gddECV8tImK48O5sDb7ypw9iBaPsPszWw3hNuMe7C9EAiBvngPNbL6
 lR38s6HJcinP1KJODLpb8cZMwk/aJK4H/j5Y1XjKX8kdWNZaFbcnFN95/sByCTPv4jBEEn
 XVS9s7rSQ2M3VGAptEE8c0W2gTLXNC5XBESFQEhZwdySzEKvvGpyR9DrcTS2LQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 16 Jan 2025 18:47:18 +0100
Subject: [PATCH v9 6/8] drm: writeback: Add missing cleanup in case of
 initialization failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-google-vkms-managed-v9-6-3e4ae1bd05a0@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2553;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=M4w0O+NYTB5dgGY2gUWrNLUjYQzNpf3MFvPeyIQjrxs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbbiyn+IwPfYy8oaogNIn/JdhWXeF157mTID
 wgP7TWE35aJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lG2wAKCRAgrS7GWxAs
 4sBTD/9fs2GzjcLpO3dOikiL+p8iC6bFhVDltpLhD+/LdDJ464jjS2CtBTgPn+KXxSx1Vb1ufee
 z15XuwIJT7Saqp+MQT1RFMz/aByDGOgcEzGo+aa+ZNc+DzaC8I+JU050bVhezAUbbh9QPsNsABU
 h1B669GcRtIW7GGetLVLnj+qPT/vZmQddJFfKJQIDyuqTo1lIGzCjcVkhDXAZM2iqutsEbKQjLF
 x8XQ8NNLPgbB+VevvVUNpKkV3EZ5yzGujIe4AYeLZce/2kQlCBSMLeBIW8MxXwM4IHu8yJaDZ5s
 mZ0ZB4vAChz9uNz5E+aRrq57bk+Ix3TGYsExLaZoiI5DgDMZuJvg59IkkUyDzVS6nSfUvH6ohNq
 46ldTVlfCQdBLgtEwCOtNI7XrbIZk1wAuy9BCF45Nk3t/k5myVnURVnKj9vT/FoKpBsepucURla
 XAF6/nDPoqInr+qTIJnlmtzsDnEckeG/VtwW7q+jZt6hthBzKjaJtTTCFmyuaa+nFPf5j/JyVbV
 /zewCThYGgiJJdyS3ayj+Zo1jcZmprRQ1B1DqffU96+LRNBDYGCsIJ6Bx7rsrq6Hk9D1qH35z8+
 D9erNJvoJh+b2x1NkP04pb2fbkgSB4fulakNvAj0fl9lsU7qHJqQiGbeyBNAEQS/I6U/947QLuJ
 5430w19o5lf9Nog==
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

The current implementation of drm_writeback_connector initialization does
not properly clean up all resources in case of failure (allocated
properties and possible_encoders). Add this cleaning in case of failure.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_writeback.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 057af96dafeb879534a695167ad16e8a4e9a1bce..4cdc6cdcf76beb33f169a46f5895f0d681b11453 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -196,6 +196,22 @@ int drm_writeback_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_writeback_connector_init);
 
+static void delete_writeback_properties(struct drm_device *dev)
+{
+	if (dev->mode_config.writeback_pixel_formats_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_pixel_formats_property);
+		dev->mode_config.writeback_pixel_formats_property = NULL;
+	}
+	if (dev->mode_config.writeback_out_fence_ptr_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_out_fence_ptr_property);
+		dev->mode_config.writeback_out_fence_ptr_property = NULL;
+	}
+	if (dev->mode_config.writeback_fb_id_property) {
+		drm_property_destroy(dev, dev->mode_config.writeback_fb_id_property);
+		dev->mode_config.writeback_fb_id_property = NULL;
+	}
+}
+
 /**
  * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
  * a custom encoder
@@ -231,18 +247,20 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	int ret = create_writeback_properties(dev);
 
 	if (ret != 0)
-		return ret;
+		goto failed_properties;
 
 	connector->interlace_allowed = 0;
 
 	ret = drm_connector_attach_encoder(connector, enc);
 	if (ret)
-		return ret;
+		goto failed_properties;
 
 	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
 					formats);
-	if (IS_ERR(blob))
-		return PTR_ERR(blob);
+	if (IS_ERR(blob)) {
+		ret = PTR_ERR(blob);
+		goto failed_properties;
+	}
 
 	INIT_LIST_HEAD(&wb_connector->job_queue);
 	spin_lock_init(&wb_connector->job_lock);
@@ -265,6 +283,9 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 	wb_connector->pixel_formats_blob_ptr = blob;
 
 	return 0;
+failed_properties:
+	delete_writeback_properties(dev);
+	return ret;
 }
 
 /**

-- 
2.47.1

