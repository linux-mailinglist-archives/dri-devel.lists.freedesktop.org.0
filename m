Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E187F933
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AF210F592;
	Tue, 19 Mar 2024 08:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MN+wZDmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IoW3PZOg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MN+wZDmt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IoW3PZOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7A810E71F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4272637508;
 Tue, 19 Mar 2024 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAL8MjnVxH2G4y+/i+1qYaCM3M3lFMmUa1cUNzJHfhc=;
 b=MN+wZDmtQ30wc1JyIOjw/2TGEmU/cKrVeTmdB7Z2yR4cZeClvi2ur5Oyspu7g29XJotcNB
 f/9nAjg4/E2K3u6KTpXwR67gONVCGUWToYvU7JCQ8a5X+Ct/SCz2lPZTPyDGj6Vyv+Vy50
 M8A6q+UkU0c4vqt1mwVRIAqjPrgY9Zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAL8MjnVxH2G4y+/i+1qYaCM3M3lFMmUa1cUNzJHfhc=;
 b=IoW3PZOgyyROoNvLVZz5ykhU8D4Vblafzs1PBMJyxcZ+fKcLoSNfCnDn3r21dos32X62FW
 NIk0WV9rWtI/W8Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAL8MjnVxH2G4y+/i+1qYaCM3M3lFMmUa1cUNzJHfhc=;
 b=MN+wZDmtQ30wc1JyIOjw/2TGEmU/cKrVeTmdB7Z2yR4cZeClvi2ur5Oyspu7g29XJotcNB
 f/9nAjg4/E2K3u6KTpXwR67gONVCGUWToYvU7JCQ8a5X+Ct/SCz2lPZTPyDGj6Vyv+Vy50
 M8A6q+UkU0c4vqt1mwVRIAqjPrgY9Zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAL8MjnVxH2G4y+/i+1qYaCM3M3lFMmUa1cUNzJHfhc=;
 b=IoW3PZOgyyROoNvLVZz5ykhU8D4Vblafzs1PBMJyxcZ+fKcLoSNfCnDn3r21dos32X62FW
 NIk0WV9rWtI/W8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0436A13700;
 Tue, 19 Mar 2024 08:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KJJBO2pJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 05/12] drm/ast: Move DDC code to ast_ddc.{c,h}
Date: Tue, 19 Mar 2024 09:00:25 +0100
Message-ID: <20240319081430.10165-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MN+wZDmt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IoW3PZOg
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.49
X-Rspamd-Queue-Id: 4272637508
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

