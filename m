Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B74693C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACA47AE20;
	Mon,  6 Dec 2021 10:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136E772E3D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 09:11:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6AC221B36;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638781889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdB3J/zkE4wCZiAGOR4nBfoQRDcEAZFW8LG1D4giods=;
 b=h/m8vRCcr/ntOzx06CWxRHiUYHuDSFgFGmUsOlL6WOtaazIe/PzGDCw9uOa+37II0lFXIi
 o2ZxeFJVx42jHLYqF2SsfYBzkj4GO8IRgyc2JZkl/oKeScHbfkef8LXX4VFsT4NHEenj6Y
 irlfbeinhYy74GZQHNnqxEVBYkmhlnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638781889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdB3J/zkE4wCZiAGOR4nBfoQRDcEAZFW8LG1D4giods=;
 b=KmnLB0aBSUMMTWwURyBzVIQ1QdEOi6dc3ps/0g9UbMDA+rEgj4RP5Y7hpS1Km9DSCJ3EZJ
 xMO0MJWKq53P8ECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BDBA13B27;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qJ6YIMHTrWE8IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 09:11:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH v2 2/3] drm/ast: Convert I2C code to managed cleanup
Date: Mon,  6 Dec 2021 10:11:24 +0100
Message-Id: <20211206091125.29501-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206091125.29501-1-tzimmermann@suse.de>
References: <20211206091125.29501-1-tzimmermann@suse.de>
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

Release the I2C adapter as part of the DRM device cleanup. Remove
ast's dedicated helper for struct drm_connector_funcs.destroy.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 36 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 692e7a3b3555..abb8a3fdd812 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,6 +40,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -48,7 +49,6 @@
 #include "ast_tables.h"
 
 static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
-static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
 
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
@@ -1300,14 +1300,6 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 	return flags;
 }
 
-static void ast_connector_destroy(struct drm_connector *connector)
-{
-	struct ast_connector *ast_connector = to_ast_connector(connector);
-
-	ast_i2c_destroy(ast_connector->i2c);
-	drm_connector_cleanup(connector);
-}
-
 static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 	.get_modes = ast_get_modes,
 	.mode_valid = ast_mode_valid,
@@ -1316,7 +1308,7 @@ static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 static const struct drm_connector_funcs ast_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = ast_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -1493,6 +1485,14 @@ static void set_data(void *i2c_priv, int data)
 	}
 }
 
+static void ast_i2c_release(struct drm_device *dev, void *res)
+{
+	struct ast_i2c_chan *i2c = res;
+
+	i2c_del_adapter(&i2c->adapter);
+	kfree(i2c);
+}
+
 static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 {
 	struct ast_i2c_chan *i2c;
@@ -1521,19 +1521,15 @@ static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	ret = i2c_bit_add_bus(&i2c->adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
-		goto out_free;
+		goto out_kfree;
 	}
 
+	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
+	if (ret)
+		return NULL;
 	return i2c;
-out_free:
-	kfree(i2c);
-	return NULL;
-}
 
-static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
-{
-	if (!i2c)
-		return;
-	i2c_del_adapter(&i2c->adapter);
+out_kfree:
 	kfree(i2c);
+	return NULL;
 }
-- 
2.34.1

