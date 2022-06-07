Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE853F979
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716B712AEE4;
	Tue,  7 Jun 2022 09:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6EB12AEDF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:20:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 861BA21B46;
 Tue,  7 Jun 2022 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654593610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhjvJnMRV/+8A9BwOiH88DdcVHNFmF14jzAf+GiYuFc=;
 b=A8DgANlCEi4+GSzyACpxO3LW4OQ3SSiyXChIZurEJQffOL7RsKP9YH224A+UuOmwXei22J
 r4xwRDGg9SSTwFesyxOyu5sIkJHpGMX01YxbdnxBpFJjEozjuI9JGc/2ZNlwF1IOC3OFpH
 ZazW1scqYsnjKJDSSAEQCOq3/npSx3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654593610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xhjvJnMRV/+8A9BwOiH88DdcVHNFmF14jzAf+GiYuFc=;
 b=cWGBFPrtDbUDpnLoFCg8ICSGLO41g365PGbvsv9six4OfMsnDuFdimJeIFLVMfAFOtmHUp
 S2zrJEbiJveKV8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 539B813638;
 Tue,  7 Jun 2022 09:20:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0LgsE0oYn2JwLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 09:20:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 patrik.r.jakobsson@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 4/5] drm/ast: Fail probing if DCC channel could not be
 initialized
Date: Tue,  7 Jun 2022 11:20:07 +0200
Message-Id: <20220607092008.22123-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607092008.22123-1-tzimmermann@suse.de>
References: <20220607092008.22123-1-tzimmermann@suse.de>
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

Expect the hardware to provide a DDC channel. Fail probing if its
initialization fails.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 --
 drivers/gpu/drm/ast/ast_i2c.c  |  7 ++++---
 drivers/gpu/drm/ast/ast_mode.c | 38 ++++++++++++++++------------------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index a34db4380f68..bc01090d0ad1 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -137,7 +137,6 @@ struct ast_i2c_chan {
 
 struct ast_vga_connector {
 	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
 };
 
 static inline struct ast_vga_connector *
@@ -148,7 +147,6 @@ to_ast_vga_connector(struct drm_connector *connector)
 
 struct ast_sil164_connector {
 	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
 };
 
 static inline struct ast_sil164_connector *
diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index 93e91c36d649..1d039ff1396e 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -117,7 +117,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 
 	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
 	if (!i2c)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.class = I2C_CLASS_DDC;
@@ -143,10 +143,11 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 
 	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
 	if (ret)
-		return NULL;
+		return ERR_PTR(ret);
+
 	return i2c;
 
 out_kfree:
 	kfree(i2c);
-	return NULL;
+	return ERR_PTR(ret);
 }
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 582f278436ea..364035d22463 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1334,19 +1334,18 @@ static int ast_vga_connector_init(struct drm_device *dev,
 				  struct ast_vga_connector *ast_vga_connector)
 {
 	struct drm_connector *connector = &ast_vga_connector->base;
+	struct ast_i2c_chan *i2c;
 	int ret;
 
-	ast_vga_connector->i2c = ast_i2c_create(dev);
-	if (!ast_vga_connector->i2c)
-		drm_err(dev, "failed to add ddc bus for connector\n");
+	i2c = ast_i2c_create(dev);
+	if (IS_ERR(i2c)) {
+		ret = PTR_ERR(i2c);
+		drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
+		return ret;
+	}
 
-	if (ast_vga_connector->i2c)
-		ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
-						  DRM_MODE_CONNECTOR_VGA,
-						  &ast_vga_connector->i2c->adapter);
-	else
-		ret = drm_connector_init(dev, connector, &ast_vga_connector_funcs,
-					 DRM_MODE_CONNECTOR_VGA);
+	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA, &i2c->adapter);
 	if (ret)
 		return ret;
 
@@ -1406,19 +1405,18 @@ static int ast_sil164_connector_init(struct drm_device *dev,
 				     struct ast_sil164_connector *ast_sil164_connector)
 {
 	struct drm_connector *connector = &ast_sil164_connector->base;
+	struct ast_i2c_chan *i2c;
 	int ret;
 
-	ast_sil164_connector->i2c = ast_i2c_create(dev);
-	if (!ast_sil164_connector->i2c)
-		drm_err(dev, "failed to add ddc bus for connector\n");
+	i2c = ast_i2c_create(dev);
+	if (IS_ERR(i2c)) {
+		ret = PTR_ERR(i2c);
+		drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
+		return ret;
+	}
 
-	if (ast_sil164_connector->i2c)
-		ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
-						  DRM_MODE_CONNECTOR_DVII,
-						  &ast_sil164_connector->i2c->adapter);
-	else
-		ret = drm_connector_init(dev, connector, &ast_sil164_connector_funcs,
-					 DRM_MODE_CONNECTOR_DVII);
+	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
+					  DRM_MODE_CONNECTOR_DVII, &i2c->adapter);
 	if (ret)
 		return ret;
 
-- 
2.36.1

