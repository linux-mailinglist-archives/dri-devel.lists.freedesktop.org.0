Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CF023046A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EED46E20D;
	Tue, 28 Jul 2020 07:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01DD6E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CB01AD73;
 Tue, 28 Jul 2020 07:44:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 01/13] drm/ast: Move I2C code within ast_mode.c
Date: Tue, 28 Jul 2020 09:44:13 +0200
Message-Id: <20200728074425.2749-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728074425.2749-1-tzimmermann@suse.de>
References: <20200728074425.2749-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The I2C support feels slammed down to the end of ast_mode.c. Improve
this by moving the code before it's callers, remove the declarations,
rename the callbacks to match I2C's get/set sda/scl convention, and
prefix all functions with ast_. No functional changes have been made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 249 +++++++++++++++++----------------
 1 file changed, 125 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 154cd877d9d1..19f1dfc8e9e0 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -46,9 +46,6 @@
 #include "ast_drv.h"
 #include "ast_tables.h"
 
-static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
-static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
-
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -514,6 +511,131 @@ static void ast_set_start_address_crt1(struct ast_private *ast,
 
 }
 
+/*
+ * I2C
+ */
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
+static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
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
+	i2c->adapter.dev.parent = &dev->pdev->dev;
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
+		goto out_free;
+	}
+
+	return i2c;
+out_free:
+	kfree(i2c);
+	return NULL;
+}
+
+static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
+{
+	if (!i2c)
+		return;
+	i2c_del_adapter(&i2c->adapter);
+	kfree(i2c);
+}
+
 /*
  * Primary plane
  */
@@ -1146,124 +1268,3 @@ int ast_mode_config_init(struct ast_private *ast)
 
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
-	i2c->adapter.dev.parent = &dev->pdev->dev;
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
-		goto out_free;
-	}
-
-	return i2c;
-out_free:
-	kfree(i2c);
-	return NULL;
-}
-
-static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
-{
-	if (!i2c)
-		return;
-	i2c_del_adapter(&i2c->adapter);
-	kfree(i2c);
-}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
