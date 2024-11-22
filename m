Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450219D62D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13C410EC22;
	Fri, 22 Nov 2024 17:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="J8hPHHv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9116010EC1D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 332ED1C0005;
 Fri, 22 Nov 2024 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5kG/+pvZVQrU54fb/iIcp/sowdPerCbadurT9JrGjEo=;
 b=J8hPHHv2KTgD7At/9PW72EHy4W2KxuOSmtj2eTV1Cf5iybRvhPB6As7Udif89kHXg2tnnW
 AY6+O0nWWcEi/VQvlQch9UioozU9uay0G/Fp9BShZP9PUOy2xlNtHplY6e+hXX1tYXoVb5
 PIjVQ56YET4iIk1DUTUV5NmXa5FllCWp8Ta8M6CeXL3rmfNgzYlxTk+79bMImyKrGwhy4y
 pnPot5BhHEpzEzaoMJbwZ2D3bzrAkQpkir8qGUZysfMCVkZIpx8/bGsc0hLke4xuvVXO/B
 +W6ysNDUWSgskndC5Cgd+KsOFmji5SPHFzJd/M77h5t7/78RGvhsqhWOEmUJWg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:07 +0100
Subject: [PATCH RFC v2 03/18] drm/vkms: Move default_config creation to its
 own function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-3-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ojS8il8nmfApHeXNw/AOz9r4p9aUJ0tSXXtnUxcQgW4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1NHf9ewgg5+0TT9NMoI7EvMuFWOH6t9bBZ4
 GjWXMHDefaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9TQAKCRAgrS7GWxAs
 4nn3EACYKk2BDQwS+UJ+oGQysxZvh3S/a0zfpQqlmzEfzMMjmL4phgfPTaBIHt1l/8dA6usutdT
 gZCL2oIaY96KOkO+4plmZNUZ/odVJ7WP63BsZX5JC7rvwMY3hfm4nqW2s5XJS2dd3OV1dl7SZ87
 CCQWCwdR8zEUnmSKf5x8q0zm/wzLPdUWFPRg/3TfgH5JzHhoLEgddhPJ1U4WbMUrAJnHQ/cHVlW
 R6pq2lL3avFpf/4XhU+3rnQujC4p10N9jYVjjF9u8qNVGivQmj6qmJNOZpFEvDTmr//nP+MYKgT
 p4G8QuyYHSg6DA9sfJFwIn0FW7+XDDRbQoHZxXbqc2H7CXEBb22BT64qkL4QSZtZtGNhtV8MKRi
 uDXM5Lr9VYffeU55WanN+ujihELTry/jCrye5jJJPC2n7Sh1HrDuV0uYxXa7EOgT4ss5Wt9YSek
 sg4Cvrjlo1iWuCsLTevppyDH7T+DGVCortj3YHH5LKSDneLVMOrv9MPxe/H/1tmir898k2VpEo/
 jOp7B01EvGLTiB0l+aR8HsgO8qGChY71QYEwzJYWjRuq4ZEQnitZ2j7Te2EkqeDZ1Hrjfk2zkTC
 UGYo4ebImQjQn9ptohD6Au2YIGbdzQVG/bURKJpJd3p1kyOq3Cm3+wAFFpX+v2CiiN90shlmE9t
 p0hqt3k9iR2p9Fw==
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
index 8d5c1429e6e196ef46c95c6ae73330bc4be2be39..f7e0d39952ac73ea49c710b49becd391b5aaa66a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -18,6 +18,22 @@ struct vkms_config *vkms_config_create(void)
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
index e399566a5b5d6a6cf92a41c72910e857fc4e743f..61ae2986568093ab0df7174a0a4678a75f9aad0c 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -215,15 +215,10 @@ static int vkms_create(struct vkms_config *config)
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
2.47.0

