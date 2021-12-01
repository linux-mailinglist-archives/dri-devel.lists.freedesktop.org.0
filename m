Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF24651B3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613E06EDFB;
	Wed,  1 Dec 2021 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684266EDF8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:31:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D2711FD5D;
 Wed,  1 Dec 2021 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638372662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcmopkV7ZYYQrvfmYjDsUg+UKqH+rbDrWPc0Gqpt1IY=;
 b=lFHzTFZgsnc30zGQfLDhfiZJmMPUctofomCs/JUOSaLEAXctlOU7siVdaotsEmAsxxl6HH
 KN+NqhgmImtAS0VmhDC1elRSFoFNHNTgcZV67QtxaXCj75/gV7Yd/Ox11AKubbU/4OHyDY
 fAEGxA9BNJCaVhZgAb/FMpi/6BIftlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638372662;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcmopkV7ZYYQrvfmYjDsUg+UKqH+rbDrWPc0Gqpt1IY=;
 b=drfzSjZvtnyyIVDKtkGqvPMB7kR+XijC6afJG0IHiRyji4PB5o0heNx48trBprPkCKK3j/
 mzBirNsT9VX2HpAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDAE713CE4;
 Wed,  1 Dec 2021 15:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kKIaNTWVp2GkfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 15:31:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch,
	sam@ravnborg.org
Subject: [PATCH 2/3] drm/ast: Convert I2C code to managed cleanup
Date: Wed,  1 Dec 2021 16:30:59 +0100
Message-Id: <20211201153100.403-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201153100.403-1-tzimmermann@suse.de>
References: <20211201153100.403-1-tzimmermann@suse.de>
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

Release the I2C adapter as part of the DRM device cleanup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 36 +++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 3f0c8c1f9777..a84dced95440 100644
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
2.34.0

