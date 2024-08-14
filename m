Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3A951D41
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C8C10E4B3;
	Wed, 14 Aug 2024 14:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="N8hkJupm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36FA10E4AC
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 14:36:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABA961C0009;
 Wed, 14 Aug 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723646194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gGkNGJMzZViUMrQFxHqtTa4PKI8hM4Nr9e+8KnU9Ck=;
 b=N8hkJupmXvzURO5c1YBNRAT+vUTz60dVFana44g3+2uN5ecaWhul6r9+/I0C6LD8tAIWKi
 WmUAanFFOznSw0c7bS0J+Po9lv+FZS85BNs+Nm1SLCcXnB88eP1INqsyR6RbQ9Yl2jDcs1
 QlW2rpJOEY7CajS8U4XqSJItLOOh04agxxPnBG0qa0VIAWetSDebR/xa9Si6NVMbmXRuC8
 bTQyOKnroPJtE05+flkPeQdAajDZKfv6wJJI/yAndvTQ17RF1M9xJowqOl+aP0NbupMq7Q
 CpCyLmIzKzrOckHXyhvdWy2kg3UpRwhPgvcJPzN695aaKhfUDb/D6AiNgQtZNA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 16:36:27 +0200
Subject: [PATCH RFC 05/15] drm/vkms: Move default_config creation to its
 own function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240814-google-remove-crtc-index-from-parameter-v1-5-6e179abf9fd4@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eoc3G8Sjl8nrWI19alC5LCkl998LvHQCHg6UVKRKeXA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMDq8uWzI7dOx+vw/of7Iu7jWUg6t9LR0ieff
 obWSDZUJaCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzA6gAKCRAgrS7GWxAs
 4sjED/43s19ysPK+BTYVWwULWU0Bz3OWjgm/5+urxVXoSBaUZdT3lhF6S1tH1DkV0xe7ftKpJbO
 9t/XAXd62UAls5k4NTCWan5coh2tsV+MwiYmmzYVAGiBdzN9HUyRUlpyssjQM+iQKZlvStrSwRL
 E04uZRVDVIY8j801rG3KjKA+LSWUNbuPI0dXhXXCTneJjld3VSLexZVaq2+wqKlXc16jqUVADiI
 RkO+Yg9wn54Nzd0Q46TIglgIne/quzxGJ8LCp2KpVYKGxTuEsYa62ixaEQ1GhsE/U5KAL2a72Cz
 z5Ih8EzVnX2qEDKFyrzWjkOs4O6jFiiZcRjjVkZTGhM23fYjiInxnlHuAplf14WcxFNvPABI9OT
 YPjGPA4GmNCTLIiEEI8FD1VjIcDOFJJGpetVVVCaPZpvx8wuuQSsY1GlgHMAPAagWWDJZ0CVK+3
 83Qe9DRoJd5v5LQ8dO+RRlggLx8TDi4Si+9qqEAj39DD3645s9hrdRsNHIm77ZJgcZg7deXv+me
 ovJhTqUnnWZKxAsqPpJBQcOUg2nEFb7zqgY/X3J3xU9IU1w/Qq24emrqUffhg2Apv4C5muGqmCO
 /tVgsQckX/KuUkzacCYAsRoWuDM2K47E4c5vSl0Ug4wALL3mu2SGX/6ykF1j8m83SG0ys1dlEoM
 01wEvqHZRlXOdcQ==
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
 drivers/gpu/drm/vkms/vkms_config.c | 16 ++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  9 +++++++++
 drivers/gpu/drm/vkms/vkms_drv.c    |  7 +------
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index d8348af9587e..27b49a2ad9c8 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -16,6 +16,22 @@ struct vkms_config *vkms_config_create(void)
 	return config;
 }
 
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
+
 void vkms_config_destroy(struct vkms_config *config)
 {
 	kfree(config);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 363f5bc8f64b..50c3b021a66b 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -43,4 +43,13 @@ void vkms_config_destroy(struct vkms_config *config);
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
index dbdb1f565a8f..af237daa3c5c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -328,15 +328,10 @@ static int vkms_create(struct vkms_config *config)
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
2.44.2

