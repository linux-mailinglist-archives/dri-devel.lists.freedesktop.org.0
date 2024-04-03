Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B0896C92
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831721129BE;
	Wed,  3 Apr 2024 10:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4232B1129B6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:33:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EC17635218;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C80E313A8B;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id KPyhL3gwDWaNEAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 10:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/ast: Define struct ast_ddc in ast_ddc.c
Date: Wed,  3 Apr 2024 12:31:30 +0200
Message-ID: <20240403103325.30457-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403103325.30457-1-tzimmermann@suse.de>
References: <20240403103325.30457-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: EC17635218
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

Move the definition of struct ast_ddc to ast_ddc.c and return the i2c
adapter from ast_ddc_create(). Update callers accordingly. Avoids
including Linux i2c header files, except where required. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_ddc.c  | 14 ++++++++++++--
 drivers/gpu/drm/ast/ast_ddc.h  | 13 ++-----------
 drivers/gpu/drm/ast/ast_mode.c |  8 ++++----
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index 4df52aeba4f7e..29cf5d157f344 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -21,12 +21,22 @@
  * of the Software.
  */
 
+#include <linux/i2c-algo-bit.h>
+#include <linux/i2c.h>
+
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
 #include "ast_ddc.h"
 #include "ast_drv.h"
 
+struct ast_ddc {
+	struct ast_device *ast;
+
+	struct i2c_algo_bit_data bit;
+	struct i2c_adapter adapter;
+};
+
 static void ast_ddc_algo_bit_data_setsda(void *data, int state)
 {
 	struct ast_ddc *ddc = data;
@@ -132,7 +142,7 @@ static void ast_ddc_release(struct drm_device *dev, void *res)
 	i2c_del_adapter(&ddc->adapter);
 }
 
-struct ast_ddc *ast_ddc_create(struct ast_device *ast)
+struct i2c_adapter *ast_ddc_create(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct ast_ddc *ddc;
@@ -173,5 +183,5 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 	if (ret)
 		return ERR_PTR(ret);
 
-	return ddc;
+	return &ddc->adapter;
 }
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
index 08f3994e09ccd..85c93edc9ae12 100644
--- a/drivers/gpu/drm/ast/ast_ddc.h
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -3,18 +3,9 @@
 #ifndef __AST_DDC_H__
 #define __AST_DDC_H__
 
-#include <linux/i2c.h>
-#include <linux/i2c-algo-bit.h>
-
 struct ast_device;
+struct i2c_adapter;
 
-struct ast_ddc {
-	struct ast_device *ast;
-
-	struct i2c_adapter adapter;
-	struct i2c_algo_bit_data bit;
-};
-
-struct ast_ddc *ast_ddc_create(struct ast_device *ast);
+struct i2c_adapter *ast_ddc_create(struct ast_device *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index bb9b66aba9ee9..ae21d89b899c8 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1360,7 +1360,7 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
 	struct ast_device *ast = to_ast_device(dev);
-	struct ast_ddc *ddc;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ddc = ast_ddc_create(ast);
@@ -1371,7 +1371,7 @@ static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
-					  DRM_MODE_CONNECTOR_VGA, &ddc->adapter);
+					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret)
 		return ret;
 
@@ -1429,7 +1429,7 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
 	struct ast_device *ast = to_ast_device(dev);
-	struct ast_ddc *ddc;
+	struct i2c_adapter *ddc;
 	int ret;
 
 	ddc = ast_ddc_create(ast);
@@ -1440,7 +1440,7 @@ static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connecto
 	}
 
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
-					  DRM_MODE_CONNECTOR_DVII, &ddc->adapter);
+					  DRM_MODE_CONNECTOR_DVII, ddc);
 	if (ret)
 		return ret;
 
-- 
2.44.0

