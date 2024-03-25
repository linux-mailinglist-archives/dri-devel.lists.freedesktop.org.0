Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA2888B0EB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0610E59A;
	Mon, 25 Mar 2024 20:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BAA10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB36B5CB58;
 Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5991E13AC5;
 Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id oAiYFNvZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 05/13] drm/ast: Move DDC code to ast_ddc.{c,h}
Date: Mon, 25 Mar 2024 21:06:50 +0100
Message-ID: <20240325200855.21150-6-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: AB36B5CB58
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

Rename ast_i2c.c to ast_ddc.c and move its interface into the
new header ast_ddc.h. Update all include statements as necessary
and change the adapter name to 'AST DDC bus'.

This avoids including I2C headers in the driver's main header file,
which doesn't need them. Renaming files to _ddc indicates that the
code is about the DDC. I2C is really just the underlying bus here.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/Makefile                 | 10 +++++++++-
 drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} |  4 ++--
 drivers/gpu/drm/ast/ast_ddc.h                | 19 +++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h                | 13 +------------
 drivers/gpu/drm/ast/ast_mode.c               |  1 +
 5 files changed, 32 insertions(+), 15 deletions(-)
 rename drivers/gpu/drm/ast/{ast_i2c.c => ast_ddc.c} (97%)
 create mode 100644 drivers/gpu/drm/ast/ast_ddc.h

diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
index 5a53ce51fb249..d794c076bc242 100644
--- a/drivers/gpu/drm/ast/Makefile
+++ b/drivers/gpu/drm/ast/Makefile
@@ -3,6 +3,14 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-ast-y := ast_drv.o ast_i2c.o ast_main.o ast_mm.o ast_mode.o ast_post.o ast_dp501.o ast_dp.o
+ast-y := \
+	ast_ddc.o \
+	ast_dp501.o \
+	ast_dp.o \
+	ast_drv.o \
+	ast_main.o \
+	ast_mm.o \
+	ast_mode.o \
+	ast_post.o
 
 obj-$(CONFIG_DRM_AST) := ast.o
diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_ddc.c
similarity index 97%
rename from drivers/gpu/drm/ast/ast_i2c.c
rename to drivers/gpu/drm/ast/ast_ddc.c
index dc28a5cbb1c2a..df604b4e9673c 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -24,6 +24,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 
+#include "ast_ddc.h"
 #include "ast_drv.h"
 
 static void ast_i2c_setsda(void *i2c_priv, int data)
@@ -122,8 +123,7 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);
-	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
-		 "AST i2c bit bus");
+	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name), "AST DDC bus");
 	i2c->adapter.algo_data = &i2c->bit;
 
 	i2c->bit.udelay = 20;
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
new file mode 100644
index 0000000000000..244666fd6c530
--- /dev/null
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef __AST_DDC_H__
+#define __AST_DDC_H__
+
+#include <linux/i2c.h>
+#include <linux/i2c-algo-bit.h>
+
+struct drm_device;
+
+struct ast_i2c_chan {
+	struct i2c_adapter adapter;
+	struct drm_device *dev;
+	struct i2c_algo_bit_data bit;
+};
+
+struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
+
+#endif
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 12ad1c0fe151b..ba3d86973995f 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -28,8 +28,6 @@
 #ifndef __AST_DRV_H__
 #define __AST_DRV_H__
 
-#include <linux/i2c.h>
-#include <linux/i2c-algo-bit.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
@@ -149,15 +147,9 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 }
 
 /*
- * Connector with i2c channel
+ * BMC
  */
 
-struct ast_i2c_chan {
-	struct i2c_adapter adapter;
-	struct drm_device *dev;
-	struct i2c_algo_bit_data bit;
-};
-
 struct ast_bmc_connector {
 	struct drm_connector base;
 	struct drm_connector *physical_connector;
@@ -476,9 +468,6 @@ bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
 
-/* ast_i2c.c */
-struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
-
 /* aspeed DP */
 bool ast_astdp_is_connected(struct ast_device *ast);
 int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cbda04fca7107..bdef2160726e6 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -46,6 +46,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include "ast_ddc.h"
 #include "ast_drv.h"
 #include "ast_tables.h"
 
-- 
2.44.0

