Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9588B0E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC00610E4F2;
	Mon, 25 Mar 2024 20:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC6B10E322
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B30D5CB56;
 Mon, 25 Mar 2024 20:09:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id BD9CF13A71;
 Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gEn/LNzZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:09:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 09/13] drm/ast: Rename struct i2c_algo_bit_data callbacks
 and their parameters
Date: Mon, 25 Mar 2024 21:06:54 +0100
Message-ID: <20240325200855.21150-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.00
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Queue-Id: 1B30D5CB56
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

Align the names of the algo-bit helpers with ast's convention of
using an ast prefix plus the struct's name plus the callback's name
for such function symbols. Change the parameter names of these
helpers to 'data' and 'state', as used in the declaration of struct
i2c_algo_bit_data. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_ddc.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index 47670285fd765..b84e656124f18 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -27,15 +27,15 @@
 #include "ast_ddc.h"
 #include "ast_drv.h"
 
-static void ast_i2c_setsda(void *i2c_priv, int data)
+static void ast_ddc_algo_bit_data_setsda(void *data, int state)
 {
-	struct ast_ddc *ddc = i2c_priv;
+	struct ast_ddc *ddc = data;
 	struct ast_device *ast = ddc->ast;
 	int i;
 	u8 ujcrb7, jtemp;
 
 	for (i = 0; i < 0x10000; i++) {
-		ujcrb7 = ((data & 0x01) ? 0 : 1) << 2;
+		ujcrb7 = ((state & 0x01) ? 0 : 1) << 2;
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0xf1, ujcrb7);
 		jtemp = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x04);
 		if (ujcrb7 == jtemp)
@@ -43,15 +43,15 @@ static void ast_i2c_setsda(void *i2c_priv, int data)
 	}
 }
 
-static void ast_i2c_setscl(void *i2c_priv, int clock)
+static void ast_ddc_algo_bit_data_setscl(void *data, int state)
 {
-	struct ast_ddc *ddc = i2c_priv;
+	struct ast_ddc *ddc = data;
 	struct ast_device *ast = ddc->ast;
 	int i;
 	u8 ujcrb7, jtemp;
 
 	for (i = 0; i < 0x10000; i++) {
-		ujcrb7 = ((clock & 0x01) ? 0 : 1);
+		ujcrb7 = ((state & 0x01) ? 0 : 1);
 		ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0xf4, ujcrb7);
 		jtemp = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xb7, 0x01);
 		if (ujcrb7 == jtemp)
@@ -59,9 +59,9 @@ static void ast_i2c_setscl(void *i2c_priv, int clock)
 	}
 }
 
-static int ast_i2c_getsda(void *i2c_priv)
+static int ast_ddc_algo_bit_data_getsda(void *data)
 {
-	struct ast_ddc *ddc = i2c_priv;
+	struct ast_ddc *ddc = data;
 	struct ast_device *ast = ddc->ast;
 	uint32_t val, val2, count, pass;
 
@@ -81,9 +81,9 @@ static int ast_i2c_getsda(void *i2c_priv)
 	return val & 1 ? 1 : 0;
 }
 
-static int ast_i2c_getscl(void *i2c_priv)
+static int ast_ddc_algo_bit_data_getscl(void *data)
 {
-	struct ast_ddc *ddc = i2c_priv;
+	struct ast_ddc *ddc = data;
 	struct ast_device *ast = ddc->ast;
 	uint32_t val, val2, count, pass;
 
@@ -133,10 +133,10 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 	bit->udelay = 20;
 	bit->timeout = 2;
 	bit->data = ddc;
-	bit->setsda = ast_i2c_setsda;
-	bit->setscl = ast_i2c_setscl;
-	bit->getsda = ast_i2c_getsda;
-	bit->getscl = ast_i2c_getscl;
+	bit->setsda = ast_ddc_algo_bit_data_setsda;
+	bit->setscl = ast_ddc_algo_bit_data_setscl;
+	bit->getsda = ast_ddc_algo_bit_data_getsda;
+	bit->getscl = ast_ddc_algo_bit_data_getscl;
 
 	adapter->algo_data = bit;
 	ret = i2c_bit_add_bus(adapter);
-- 
2.44.0

