Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E152859B
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 15:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B9410F629;
	Mon, 16 May 2022 13:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA50910EED0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 13:40:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 542CD22006;
 Mon, 16 May 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652708418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWl/Pp1Yd3F0genCxebm13txW5HPhBCMM1E2lkUQc8k=;
 b=L6J+BjkZlHadk0d1pWjYsNIsOCf5pAX777FNZEa8kU4cPewS281FFwQlqWhF3SK4Rx0urf
 g7hiT7T9Lfg37g7m9LR1sTX19UghrGLYJ8U+ujvltPH2AXNAhxZ63u8RFg9JVuywC9s8vw
 2+Hft7IAqnNXdEzZpp/qAQIZDJKGXNU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652708418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWl/Pp1Yd3F0genCxebm13txW5HPhBCMM1E2lkUQc8k=;
 b=FjLJrtSrnXKEgK/KCTKSaaf8QojzHQ6An0MBVlwLYqsUEA7E1POPj2e4hXk9wqoPB1ipKr
 yqyKMj0Pb108qGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2BCFD13ADC;
 Mon, 16 May 2022 13:40:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mHrjCUJUgmIpAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 16 May 2022 13:40:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 4/7] drm/mgag200: Switch I2C code to managed cleanup
Date: Mon, 16 May 2022 15:40:12 +0200
Message-Id: <20220516134015.5845-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516134015.5845-1-tzimmermann@suse.de>
References: <20220516134015.5845-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the I2C state within struct mga_device and switch I2C to
managed release. Simplifies the related code and lets us remove
mga_connector_destroy().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++--
 drivers/gpu/drm/mgag200/mgag200_i2c.c  | 33 +++++++++-----------------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 24 ++++---------------
 3 files changed, 18 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index a18384c41fc4..5bdd09432114 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -179,7 +179,6 @@ struct mga_i2c_chan {
 
 struct mga_connector {
 	struct drm_connector base;
-	struct mga_i2c_chan *i2c;
 };
 
 struct mga_mc {
@@ -239,6 +238,7 @@ struct mga_device {
 
 	struct mga_connector connector;
 	struct mgag200_pll pixpll;
+	struct mga_i2c_chan i2c;
 	struct drm_simple_display_pipe display_pipe;
 };
 
@@ -251,8 +251,7 @@ static inline struct mga_device *to_mga_device(struct drm_device *dev)
 int mgag200_modeset_init(struct mga_device *mdev);
 
 				/* mgag200_i2c.c */
-struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
-void mgag200_i2c_destroy(struct mga_i2c_chan *i2c);
+int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c);
 
 				/* mgag200_mm.c */
 int mgag200_mm_init(struct mga_device *mdev);
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 31e2c641a781..f57b33917152 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -86,10 +86,16 @@ static int mga_gpio_getscl(void *data)
 	return (mga_i2c_read_gpio(mdev) & i2c->clock) ? 1 : 0;
 }
 
-struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
+static void mgag200_i2c_release(void *res)
 {
-	struct mga_device *mdev = to_mga_device(dev);
-	struct mga_i2c_chan *i2c;
+	struct mga_i2c_chan *i2c = res;
+
+	i2c_del_adapter(&i2c->adapter);
+}
+
+int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
+{
+	struct drm_device *dev = &mdev->base;
 	int ret;
 	int data, clock;
 
@@ -118,10 +124,6 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 		break;
 	}
 
-	i2c = kzalloc(sizeof(struct mga_i2c_chan), GFP_KERNEL);
-	if (!i2c)
-		return ERR_PTR(-ENOMEM);
-
 	i2c->data = data;
 	i2c->clock = clock;
 	i2c->adapter.owner = THIS_MODULE;
@@ -143,20 +145,7 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
 
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret)
-		goto err_kfree;
+		return ret;
 
-	return i2c;
-
-err_kfree:
-	kfree(i2c);
-	return ERR_PTR(ret);
-}
-
-void mgag200_i2c_destroy(struct mga_i2c_chan *i2c)
-{
-	if (!i2c)
-		return;
-	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
+	return devm_add_action_or_reset(dev->dev, mgag200_i2c_release, i2c);
 }
-
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 4c0680dd1a78..ae78950e270b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -811,13 +811,6 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-static void mga_connector_destroy(struct drm_connector *connector)
-{
-	struct mga_connector *mga_connector = to_mga_connector(connector);
-	mgag200_i2c_destroy(mga_connector->i2c);
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
 	.get_modes  = mgag200_vga_connector_helper_get_modes,
 	.mode_valid = mga_vga_mode_valid,
@@ -826,7 +819,7 @@ static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs =
 static const struct drm_connector_funcs mga_vga_connector_funcs = {
 	.reset                  = drm_atomic_helper_connector_reset,
 	.fill_modes             = drm_helper_probe_single_connector_modes,
-	.destroy                = mga_connector_destroy,
+	.destroy                = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
@@ -836,12 +829,11 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
 	struct drm_device *dev = &mdev->base;
 	struct mga_connector *mconnector = &mdev->connector;
 	struct drm_connector *connector = &mconnector->base;
-	struct mga_i2c_chan *i2c;
+	struct mga_i2c_chan *i2c = &mdev->i2c;
 	int ret;
 
-	i2c = mgag200_i2c_create(dev);
-	if (IS_ERR(i2c)) {
-		ret = PTR_ERR(i2c)
+	ret = mgag200_i2c_init(mdev, i2c);
+	if (ret) {
 		drm_err(dev, "failed to add DDC bus: %d\n", ret);
 		return ret;
 	}
@@ -851,16 +843,10 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
 					  DRM_MODE_CONNECTOR_VGA,
 					  &i2c->adapter);
 	if (ret)
-		goto err_mgag200_i2c_destroy;
+		return ret;
 	drm_connector_helper_add(connector, &mga_vga_connector_helper_funcs);
 
-	mconnector->i2c = i2c;
-
 	return 0;
-
-err_mgag200_i2c_destroy:
-	mgag200_i2c_destroy(i2c);
-	return ret;
 }
 
 /*
-- 
2.36.1

