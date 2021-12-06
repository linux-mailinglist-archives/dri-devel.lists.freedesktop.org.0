Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E94693E5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EC27B48B;
	Mon,  6 Dec 2021 10:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558AE72DA4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 09:11:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E485B21B38;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638781889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMCaNdw6a1Ja7upQ4N3Uodp4tr2riFznMk8i0Epk9qU=;
 b=06CgQuohofA2t4FWXnn1S2bq2nj1oJn+OrWFkIXxpqkmeiGOIAJT73hIYRZJjkx8QiMmrW
 m+ED67kUEiMfHyVk/12rXZYEd1738nOLJjoK/bOc2ugxFM10POckfaJdD/MJypNe38Kl4R
 kLyeUoDy6eMDkEtFSinEHV9HBzb9aJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638781889;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMCaNdw6a1Ja7upQ4N3Uodp4tr2riFznMk8i0Epk9qU=;
 b=v8kZCgnyXf8c31+L9PT9/mlehguhyHt5RMT8lyPGgmXLNW9b0fLvpKwc7CJNrdqY+e5pjq
 Mp9bnaImdniVOkBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B658413B2D;
 Mon,  6 Dec 2021 09:11:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0BiHK8HTrWE8IwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Dec 2021 09:11:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH v2 3/3] drm/ast: Move I2C code into separate source file
Date: Mon,  6 Dec 2021 10:11:25 +0100
Message-Id: <20211206091125.29501-4-tzimmermann@suse.de>
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

Move I2C code into its own source file. Makes the mode-setting
code a little less convoluted.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/Makefile   |   2 +-
 drivers/gpu/drm/ast/ast_drv.h  |   3 +
 drivers/gpu/drm/ast/ast_i2c.c  | 152 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c | 128 ---------------------------
 4 files changed, 156 insertions(+), 129 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_i2c.c

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 438a2d05b115..21f71160bc3e 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,6 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ast-y := ast_drv.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o
+ast-y := ast_drv.o ast_i2c.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2cfce7dc95af..00bfa41ff7cb 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -357,4 +357,7 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
 
+/* ast_i2c.c */
+struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
new file mode 100644
index 000000000000..8e4589d74b21
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -0,0 +1,152 @@
+// SPDX-License: MIT
+/*
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "ast_drv.h"
+
+static void ast_i2c_setsda(void *i2c_priv, int data)
+{
+	struct ast_i2c_chan *i2c = i2c_priv;
+	struct ast_private *ast = to_ast_private(i2c->dev);
+	int i;
+	u8 ujcrb7, jtemp;
+
+	for (i = 0; i < 0x10000; i++) {
+		ujcrb7 = ((data & 0x01) ? 0 : 1) << 2;
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
+		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04);
+		if (ujcrb7 == jtemp)
+			break;
+	}
+}
+
+static void ast_i2c_setscl(void *i2c_priv, int clock)
+{
+	struct ast_i2c_chan *i2c = i2c_priv;
+	struct ast_private *ast = to_ast_private(i2c->dev);
+	int i;
+	u8 ujcrb7, jtemp;
+
+	for (i = 0; i < 0x10000; i++) {
+		ujcrb7 = ((clock & 0x01) ? 0 : 1);
+		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
+		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01);
+		if (ujcrb7 == jtemp)
+			break;
+	}
+}
+
+static int ast_i2c_getsda(void *i2c_priv)
+{
+	struct ast_i2c_chan *i2c = i2c_priv;
+	struct ast_private *ast = to_ast_private(i2c->dev);
+	uint32_t val, val2, count, pass;
+
+	count = 0;
+	pass = 0;
+	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
+	do {
+		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
+		if (val == val2) {
+			pass++;
+		} else {
+			pass = 0;
+			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
+		}
+	} while ((pass < 5) && (count++ < 0x10000));
+
+	return val & 1 ? 1 : 0;
+}
+
+static int ast_i2c_getscl(void *i2c_priv)
+{
+	struct ast_i2c_chan *i2c = i2c_priv;
+	struct ast_private *ast = to_ast_private(i2c->dev);
+	uint32_t val, val2, count, pass;
+
+	count = 0;
+	pass = 0;
+	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
+	do {
+		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
+		if (val == val2) {
+			pass++;
+		} else {
+			pass = 0;
+			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
+		}
+	} while ((pass < 5) && (count++ < 0x10000));
+
+	return val & 1 ? 1 : 0;
+}
+
+static void ast_i2c_release(struct drm_device *dev, void *res)
+{
+	struct ast_i2c_chan *i2c = res;
+
+	i2c_del_adapter(&i2c->adapter);
+	kfree(i2c);
+}
+
+struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
+{
+	struct ast_i2c_chan *i2c;
+	int ret;
+
+	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
+	if (!i2c)
+		return NULL;
+
+	i2c->adapter.owner = THIS_MODULE;
+	i2c->adapter.class = I2C_CLASS_DDC;
+	i2c->adapter.dev.parent = dev->dev;
+	i2c->dev = dev;
+	i2c_set_adapdata(&i2c->adapter, i2c);
+	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
+		 "AST i2c bit bus");
+	i2c->adapter.algo_data = &i2c->bit;
+
+	i2c->bit.udelay = 20;
+	i2c->bit.timeout = 2;
+	i2c->bit.data = i2c;
+	i2c->bit.setsda = ast_i2c_setsda;
+	i2c->bit.setscl = ast_i2c_setscl;
+	i2c->bit.getsda = ast_i2c_getsda;
+	i2c->bit.getscl = ast_i2c_getscl;
+	ret = i2c_bit_add_bus(&i2c->adapter);
+	if (ret) {
+		drm_err(dev, "Failed to register bit i2c\n");
+		goto out_kfree;
+	}
+
+	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
+	if (ret)
+		return NULL;
+	return i2c;
+
+out_kfree:
+	kfree(i2c);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index abb8a3fdd812..44c2aafcb7c2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,7 +40,6 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -48,8 +47,6 @@
 #include "ast_drv.h"
 #include "ast_tables.h"
 
-static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
-
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -1408,128 +1405,3 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	return 0;
 }
-
-static int get_clock(void *i2c_priv)
-{
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = to_ast_private(i2c->dev);
-	uint32_t val, val2, count, pass;
-
-	count = 0;
-	pass = 0;
-	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
-	do {
-		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
-		if (val == val2) {
-			pass++;
-		} else {
-			pass = 0;
-			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >> 4) & 0x01;
-		}
-	} while ((pass < 5) && (count++ < 0x10000));
-
-	return val & 1 ? 1 : 0;
-}
-
-static int get_data(void *i2c_priv)
-{
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = to_ast_private(i2c->dev);
-	uint32_t val, val2, count, pass;
-
-	count = 0;
-	pass = 0;
-	val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
-	do {
-		val2 = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
-		if (val == val2) {
-			pass++;
-		} else {
-			pass = 0;
-			val = (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >> 5) & 0x01;
-		}
-	} while ((pass < 5) && (count++ < 0x10000));
-
-	return val & 1 ? 1 : 0;
-}
-
-static void set_clock(void *i2c_priv, int clock)
-{
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = to_ast_private(i2c->dev);
-	int i;
-	u8 ujcrb7, jtemp;
-
-	for (i = 0; i < 0x10000; i++) {
-		ujcrb7 = ((clock & 0x01) ? 0 : 1);
-		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
-		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01);
-		if (ujcrb7 == jtemp)
-			break;
-	}
-}
-
-static void set_data(void *i2c_priv, int data)
-{
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_private *ast = to_ast_private(i2c->dev);
-	int i;
-	u8 ujcrb7, jtemp;
-
-	for (i = 0; i < 0x10000; i++) {
-		ujcrb7 = ((data & 0x01) ? 0 : 1) << 2;
-		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
-		jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04);
-		if (ujcrb7 == jtemp)
-			break;
-	}
-}
-
-static void ast_i2c_release(struct drm_device *dev, void *res)
-{
-	struct ast_i2c_chan *i2c = res;
-
-	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
-}
-
-static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
-{
-	struct ast_i2c_chan *i2c;
-	int ret;
-
-	i2c = kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
-	if (!i2c)
-		return NULL;
-
-	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
-	i2c->adapter.dev.parent = dev->dev;
-	i2c->dev = dev;
-	i2c_set_adapdata(&i2c->adapter, i2c);
-	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
-		 "AST i2c bit bus");
-	i2c->adapter.algo_data = &i2c->bit;
-
-	i2c->bit.udelay = 20;
-	i2c->bit.timeout = 2;
-	i2c->bit.data = i2c;
-	i2c->bit.setsda = set_data;
-	i2c->bit.setscl = set_clock;
-	i2c->bit.getsda = get_data;
-	i2c->bit.getscl = get_clock;
-	ret = i2c_bit_add_bus(&i2c->adapter);
-	if (ret) {
-		drm_err(dev, "Failed to register bit i2c\n");
-		goto out_kfree;
-	}
-
-	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
-	if (ret)
-		return NULL;
-	return i2c;
-
-out_kfree:
-	kfree(i2c);
-	return NULL;
-}
-- 
2.34.1

