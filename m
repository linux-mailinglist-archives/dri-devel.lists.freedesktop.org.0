Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A9CA17C5A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D7110E567;
	Tue, 21 Jan 2025 10:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P/jaPthX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D118710E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D1FDE4000F;
 Tue, 21 Jan 2025 10:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QY2VyBBaFCg4V5NH0VvIOmrVaSzP7xHEB7taYLc6l2Q=;
 b=P/jaPthX4Z6bejPohEQwyPKNN5XTEEMxoMZJOhLTEAFjltQHukTJzNrLjjr9J4N3yUSaD6
 cNj2K+L/OCSGR2y/1E84I8FD5H7k5ae/xaQg5Sb/Zn/ACe0mRZFyXU1riFg584EojWVTTa
 uwiBqwkd7DMlKT6S846HIFU9ERgo5RhqDS+0UGy/gtCmXRQ6El5LT2sul5v3X5meKScRNh
 aZBhoy7oRDQDXSwisft64Wrqk9MjsBHfy184yvftLQOjnxxNFPOOwdun28X8SeyvPI4/zs
 udRqI7lh9MJ6aU9EJVWSVVkh0nnsAx6CoDMoEvK64u2J9H4NhWm/bMiSiXjndg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:27 +0100
Subject: [PATCH v3 03/16] drm/vkms: Move default_config creation to its own
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-3-cac00a3c3544@bootlin.com>
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
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EY/waz6vmQDdmJlBI0i2XUrbsOqJqUD3UKiquIiszZQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30grWnw6mZQ800QBx7yDI03LVzU2Yvvpx2MT
 CP4U9NOt9OJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IAAKCRAgrS7GWxAs
 4pweEACcSgc7mKwr/I4I2tjewKg7N1ABhjz8kTK0koX4vkBTX/3pKd7uu0wMRiPiEJyoRmbJlEO
 SuQATAVzGCrz93paugDDZK0g3sJYc0MOBwBdDeT9mKBaLzoDbbTwB1nbObthMfo1s+AF97ytoaM
 UY3RoG2NNuPH4XpiLfdp+/HWePJez507abkCBnf6JRjmvmQroZ2uIffIoJmTDjphhdipS2zTfAi
 zWKxb9s1AT5x58Iuro9PArLEPnFoK3K5SmM8WZw7m9AQ8KWPvyhzhOy3v5fi6TFBltiUJazZUpm
 JOac8EgBPjgQfqTDnRTT2FBExpuNt88JomGICEbo8pIuv5o26TVRxtzQjqSKBive3AwWtAe/R8r
 W4xBupjrfpOmInXZC55B12yr3r9ADhgKcruC5yhxOVpjacBxRLxcx29iVKpKVsqEgYw08XDTukd
 L1R2s5tPaCs4r1qDBrWoN1F7GKBoNaNTsmfVhKjRJ8w9Ee0Io2+q/e2PXv3bETJD6Q7OHQubRPR
 tlNpLx8CDX9uXPMsV+L7M6Vp761kozCIqJm2+EESoS9dC6MITkDBLyv8+fDCcDF0AXfBKfqc/m3
 DXPjtY6thcXFYYMxR7sD4pGnzOCKuq9NuAaubHElVRITesdqsefN4qm2g3QyoSNRLDuOW+LsAJT
 wM1stNVj3FhM10g==
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

Extract the initialization of the default configuration to a function.
Refactor, no functional changes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
[Changes: Cherry pick and solve conflicts]
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 15 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  9 +++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    |  7 +------
 3 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8d5c1429e6e196ef46c95c6ae73330bc4be2be39..e7c7f46303e8ce4c9de68878668b855ac0fc5d2e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -18,6 +18,21 @@ struct vkms_config *vkms_config_create(void)
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
 
+struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable_overlay,
+					      bool enable_cursor)
+{
+	struct vkms_config *vkms_config = vkms_config_create();
+
+	if (IS_ERR(vkms_config))
+		return vkms_config;
+
+	vkms_config->writeback = enable_writeback;
+	vkms_config->overlay = enable_overlay;
+	vkms_config->cursor = enable_cursor;
+
+	return vkms_config;
+}
+
 void vkms_config_destroy(struct vkms_config *config)
 {
 	kfree(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index df571dd67352ca90fb47bd937fb9f11ceb95fcb2..2afb795586c6924a46dd4ba777bf22a4f51cddda 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -42,4 +42,13 @@ void vkms_config_destroy(struct vkms_config *config);
  */
 bool vkms_config_is_valid(struct vkms_config *vkms_config);
 
+/**
+ * vkms_config_alloc_default() - Allocate the configuration for the default device
+ * @enable_writeback: Enable the writeback connector for this configuration
+ * @enable_overlay: Create some overlay planes
+ * @enable_cursor:  Create a cursor plane
+ */
+struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable_overlay,
+					      bool enable_cursor);
+
 #endif //_VKMS_CONFIG_H
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6b0e5fd0e26f04359b0d10252496c52b15d83896..4440549c3084a341d03ec66119ba7998012bd662 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -213,15 +213,10 @@ static int vkms_create(struct vkms_config *config)
 static int __init vkms_init(void)
 {
 	int ret;
-
-	default_config = vkms_config_create();
+	default_config = vkms_config_alloc_default(enable_writeback, enable_overlay, enable_cursor);
 	if (IS_ERR(default_config))
 		return PTR_ERR(default_config);
 
-	default_config->cursor = enable_cursor;
-	default_config->writeback = enable_writeback;
-	default_config->overlay = enable_overlay;
-
 	ret = vkms_create(default_config);
 	if (ret)
 		vkms_config_destroy(default_config);

-- 
2.47.1

