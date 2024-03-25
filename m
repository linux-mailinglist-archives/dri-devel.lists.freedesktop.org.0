Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84EE88B0EF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077DC10E6F0;
	Mon, 25 Mar 2024 20:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15BA10E2BB
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B75AF37256;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 684C213AC5;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0M40GNzZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 08/13] drm/ast: Store AST device in struct ast_ddc
Date: Mon, 25 Mar 2024 21:06:53 +0100
Message-ID: <20240325200855.21150-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: B75AF37256
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

The DDC code needs the AST device. Store a pointer in struct ast_ddc
and avoid internal upcasts. Improves type safety within the DDC code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_ddc.c | 10 +++++-----
 drivers/gpu/drm/ast/ast_ddc.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index 24b7d589f0d4c..47670285fd765 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -30,7 +30,7 @@
 static void ast_i2c_setsda(void *i2c_priv, int data)
 {
 	struct ast_ddc *ddc = i2c_priv;
-	struct ast_device *ast = to_ast_device(ddc->dev);
+	struct ast_device *ast = ddc->ast;
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -46,7 +46,7 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
 static void ast_i2c_setscl(void *i2c_priv, int clock)
 {
 	struct ast_ddc *ddc = i2c_priv;
-	struct ast_device *ast = to_ast_device(ddc->dev);
+	struct ast_device *ast = ddc->ast;
 	int i;
 	u8 ujcrb7, jtemp;
 
@@ -62,7 +62,7 @@ static void ast_i2c_setscl(void *i2c_priv, int clock)
 static int ast_i2c_getsda(void *i2c_priv)
 {
 	struct ast_ddc *ddc = i2c_priv;
-	struct ast_device *ast = to_ast_device(ddc->dev);
+	struct ast_device *ast = ddc->ast;
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -84,7 +84,7 @@ static int ast_i2c_getsda(void *i2c_priv)
 static int ast_i2c_getscl(void *i2c_priv)
 {
 	struct ast_ddc *ddc = i2c_priv;
-	struct ast_device *ast = to_ast_device(ddc->dev);
+	struct ast_device *ast = ddc->ast;
 	uint32_t val, val2, count, pass;
 
 	count = 0;
@@ -121,7 +121,7 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 	ddc = drmm_kzalloc(dev, sizeof(*ddc), GFP_KERNEL);
 	if (!ddc)
 		return ERR_PTR(-ENOMEM);
-	ddc->dev = dev;
+	ddc->ast = ast;
 
 	adapter = &ddc->adapter;
 	adapter->owner = THIS_MODULE;
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
index d423b144a3458..08f3994e09ccd 100644
--- a/drivers/gpu/drm/ast/ast_ddc.h
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -7,11 +7,11 @@
 #include <linux/i2c-algo-bit.h>
 
 struct ast_device;
-struct drm_device;
 
 struct ast_ddc {
+	struct ast_device *ast;
+
 	struct i2c_adapter adapter;
-	struct drm_device *dev;
 	struct i2c_algo_bit_data bit;
 };
 
-- 
2.44.0

