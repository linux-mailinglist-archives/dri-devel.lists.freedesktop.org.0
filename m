Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE42288B0F0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDBC10E695;
	Mon, 25 Mar 2024 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3830F10E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0BD125CB5A;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B201713A71;
 Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 6PUpKtvZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 06/13] drm/ast: Rename struct ast_i2c_chan to struct ast_ddc
Date: Mon, 25 Mar 2024 21:06:51 +0100
Message-ID: <20240325200855.21150-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0BD125CB5A
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

The struct struct ast_i2c_chan represents the Display Data Channel
(DDC); I2C is the underlying bus. Rename the structure, the variables
and the helper ast_i2c_create() to ddc-like terms. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_ddc.c  | 71 ++++++++++++++++++----------------
 drivers/gpu/drm/ast/ast_ddc.h  |  4 +-
 drivers/gpu/drm/ast/ast_mode.c | 24 ++++++------
 3 files changed, 52 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index df604b4e9673c..c0e5d03c028d8 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -29,8 +29,8 @@
 
 static void ast_i2c_setsda(void *i2c_priv, int data)
 {
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_device *ast = to_ast_device(i2c->dev);
+	struct ast_ddc *ddc = i2c_priv;
+	struct ast_device *ast = to_ast_device(ddc->dev);
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -45,8 +45,8 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
 
 static void ast_i2c_setscl(void *i2c_priv, int clock)
 {
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_device *ast = to_ast_device(i2c->dev);
+	struct ast_ddc *ddc = i2c_priv;
+	struct ast_device *ast = to_ast_device(ddc->dev);
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -61,8 +61,8 @@ static void ast_i2c_setscl(void *i2c_priv, int clock)
 
 static int ast_i2c_getsda(void *i2c_priv)
 {
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_device *ast = to_ast_device(i2c->dev);
+	struct ast_ddc *ddc = i2c_priv;
+	struct ast_device *ast = to_ast_device(ddc->dev);
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -83,8 +83,8 @@ static int ast_i2c_getsda(void *i2c_priv)
 
 static int ast_i2c_getscl(void *i2c_priv)
 {
-	struct ast_i2c_chan *i2c = i2c_priv;
-	struct ast_device *ast = to_ast_device(i2c->dev);
+	struct ast_ddc *ddc = i2c_priv;
+	struct ast_device *ast = to_ast_device(ddc->dev);
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -103,45 +103,50 @@ static int ast_i2c_getscl(void *i2c_priv)
 	return val & 1 ? 1 : 0;
 }
 
-static void ast_i2c_release(struct drm_device *dev, void *res)
+static void ast_ddc_release(struct drm_device *dev, void *res)
 {
-	struct ast_i2c_chan *i2c = res;
+	struct ast_ddc *ddc = res;
 
-	i2c_del_adapter(&i2c->adapter);
+	i2c_del_adapter(&ddc->adapter);
 }
 
-struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
+struct ast_ddc *ast_ddc_create(struct drm_device *dev)
 {
-	struct ast_i2c_chan *i2c;
+	struct ast_ddc *ddc;
+	struct i2c_adapter *adapter;
+	struct i2c_algo_bit_data *bit;
 	int ret;
 
-	i2c = drmm_kzalloc(dev->dev, sizeof(*i2c), GFP_KERNEL);
-	if (!i2c)
+	ddc = drmm_kzalloc(dev, sizeof(*ddc), GFP_KERNEL);
+	if (!ddc)
 		return ERR_PTR(-ENOMEM);
-
-	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.dev.parent = dev->dev;
-	i2c->dev = dev;
-	i2c_set_adapdata(&i2c->adapter, i2c);
-	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "AST DDC bus");
-	i2c->adapter.algo_data = &i2c->bit;
-
-	i2c->bit.udelay = 20;
-	i2c->bit.timeout = 2;
-	i2c->bit.data = i2c;
-	i2c->bit.setsda = ast_i2c_setsda;
-	i2c->bit.setscl = ast_i2c_setscl;
-	i2c->bit.getsda = ast_i2c_getsda;
-	i2c->bit.getscl = ast_i2c_getscl;
-	ret = i2c_bit_add_bus(&i2c->adapter);
+	ddc->dev = dev;
+
+	adapter = &ddc->adapter;
+	adapter->owner = THIS_MODULE;
+	adapter->dev.parent = dev->dev;
+	i2c_set_adapdata(adapter, ddc);
+	snprintf(adapter->name, sizeof(adapter->name), "AST DDC bus");
+
+	bit = &ddc->bit;
+	bit->udelay = 20;
+	bit->timeout = 2;
+	bit->data = ddc;
+	bit->setsda = ast_i2c_setsda;
+	bit->setscl = ast_i2c_setscl;
+	bit->getsda = ast_i2c_getsda;
+	bit->getscl = ast_i2c_getscl;
+
+	adapter->algo_data = bit;
+	ret = i2c_bit_add_bus(adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
 		return ERR_PTR(ret);
 	}
 
-	ret = drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
+	ret = drmm_add_action_or_reset(dev, ast_ddc_release, ddc);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return i2c;
+	return ddc;
 }
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
index 244666fd6c530..071f9be3e27de 100644
--- a/drivers/gpu/drm/ast/ast_ddc.h
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -8,12 +8,12 @@
 
 struct drm_device;
 
-struct ast_i2c_chan {
+struct ast_ddc {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
+struct ast_ddc *ast_ddc_create(struct drm_device *dev);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bdef2160726e6..40cb495acc908 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1388,18 +1388,18 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 
 static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct ast_i2c_chan *i2c;
+	struct ast_ddc *ddc;
 	int ret;
 
-	i2c = ast_i2c_create(dev);
-	if (IS_ERR(i2c)) {
-		ret = PTR_ERR(i2c);
-		drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
+	ddc = ast_ddc_create(dev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
+		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, &i2c->adapter);
+					  DRM_MODE_CONNECTOR_VGA, &ddc->adapter);
 	if (ret)
 		return ret;
 
@@ -1485,18 +1485,18 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 
 static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct ast_i2c_chan *i2c;
+	struct ast_ddc *ddc;
 	int ret;
 
-	i2c = ast_i2c_create(dev);
-	if (IS_ERR(i2c)) {
-		ret = PTR_ERR(i2c);
-		drm_err(dev, "failed to add ddc bus for connector; ret=%d\n", ret);
+	ddc = ast_ddc_create(dev);
+	if (IS_ERR(ddc)) {
+		ret = PTR_ERR(ddc);
+		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
 		return ret;
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
-					  DRM_MODE_CONNECTOR_DVII, &i2c->adapter);
+					  DRM_MODE_CONNECTOR_DVII, &ddc->adapter);
 	if (ret)
 		return ret;
 
-- 
2.44.0

