Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8509388B0F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671BC10E79A;
	Mon, 25 Mar 2024 20:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o1abBdWa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wg0Um+6n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o1abBdWa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wg0Um+6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6E910E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AAC637252;
 Mon, 25 Mar 2024 20:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkDeDhn0iEdrVorDtH1VtzfV63GmAL4N6y3iYm8Gde8=;
 b=o1abBdWacWCGIRDFSf84ZVBa03gFvWGBN8BjAjea0dfc9EGXkK4Aoxq6XULa+wkOUjolbT
 CtK8pfNZ+cgwCvoioimlB73CVEHhihYy4D6K/ElJQJTpaux7XZZSXalSYc0GQRDwkuDgoc
 L3XeVXIhmKs6xQgNq310ObSGHUngRWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkDeDhn0iEdrVorDtH1VtzfV63GmAL4N6y3iYm8Gde8=;
 b=wg0Um+6nzVHpF8owYSmEO8afWU6WJpVYnUcTznZwIJrQY73q76HcZMUvFZMPQO6f4Ye+j8
 rKHpo3MQcTSL0rDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkDeDhn0iEdrVorDtH1VtzfV63GmAL4N6y3iYm8Gde8=;
 b=o1abBdWacWCGIRDFSf84ZVBa03gFvWGBN8BjAjea0dfc9EGXkK4Aoxq6XULa+wkOUjolbT
 CtK8pfNZ+cgwCvoioimlB73CVEHhihYy4D6K/ElJQJTpaux7XZZSXalSYc0GQRDwkuDgoc
 L3XeVXIhmKs6xQgNq310ObSGHUngRWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VkDeDhn0iEdrVorDtH1VtzfV63GmAL4N6y3iYm8Gde8=;
 b=wg0Um+6nzVHpF8owYSmEO8afWU6WJpVYnUcTznZwIJrQY73q76HcZMUvFZMPQO6f4Ye+j8
 rKHpo3MQcTSL0rDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 415B913A71;
 Mon, 25 Mar 2024 20:08:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IGyhDtrZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v6 02/13] drm/ast: Fail probing if DDC channel could not be
 initialized
Date: Mon, 25 Mar 2024 21:06:47 +0100
Message-ID: <20240325200855.21150-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Flag: NO
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

Expect the hardware to provide a DDC channel. Fail probing if its
initialization fails. Failing to initialize the DDC indicates a
larger problem, so there's no point in continuing.

v4:
	* give a rational in the commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 --
 drivers/gpu/drm/ast/ast_i2c.c  |  7 +++--
 drivers/gpu/drm/ast/ast_mode.c | 52 +++++++++++++---------------------
 3 files changed, 24 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3be5ccf1f5f4d..cb0e4f332be80 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -160,7 +160,6 @@ struct ast_i2c_chan {
 
 struct ast_vga_connector {
 	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
 };
 
 static inline struct ast_vga_connector *
@@ -171,7 +170,6 @@ to_ast_vga_connector(struct drm_connector *connector)
 
 struct ast_sil164_connector {
 	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
 };
 
 static inline struct ast_sil164_connector *
diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index e5d3f7121de42..c3046223a4919 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -117,7 +117,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 
 	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
 	if (!i2c)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	i2c->adapter.owner = THIS_MODULE;
 	i2c->adapter.dev.parent = dev->dev;
@@ -142,10 +142,11 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 
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
index a718646a66b8f..38c31a7283a69 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1345,22 +1345,18 @@ static int ast_crtc_init(struct drm_device *dev)
 
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
 	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
 
-	if (!ast_vga_connector->i2c)
-		goto err_drm_connector_update_edid_property;
-
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
 	mutex_lock(&ast->modeset_lock);
 
-	edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
+	edid = drm_get_edid(connector, connector->ddc);
 	if (!edid)
 		goto err_mutex_unlock;
 
@@ -1373,7 +1369,6 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 
 err_mutex_unlock:
 	mutex_unlock(&ast->modeset_lock);
-err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
@@ -1394,19 +1389,18 @@ static int ast_vga_connector_init(struct drm_device *dev,
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
 
@@ -1451,22 +1445,18 @@ static int ast_vga_output_init(struct ast_device *ast)
 
 static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
 	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct edid *edid;
 	int count;
 
-	if (!ast_sil164_connector->i2c)
-		goto err_drm_connector_update_edid_property;
-
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
 	 * by acquiring the I/O-register lock.
 	 */
 	mutex_lock(&ast->modeset_lock);
 
-	edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
+	edid = drm_get_edid(connector, connector->ddc);
 	if (!edid)
 		goto err_mutex_unlock;
 
@@ -1479,7 +1469,6 @@ static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector
 
 err_mutex_unlock:
 	mutex_unlock(&ast->modeset_lock);
-err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
@@ -1500,19 +1489,18 @@ static int ast_sil164_connector_init(struct drm_device *dev,
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
2.44.0

