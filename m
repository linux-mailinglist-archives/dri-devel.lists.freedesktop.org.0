Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A987F939
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:14:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0610F5BA;
	Tue, 19 Mar 2024 08:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hHEgb74b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/u1xf0vH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hHEgb74b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/u1xf0vH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAE410F58C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B8F15D33A;
 Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=hHEgb74brOqS5t/YOGaAFDSRqdEx60a810PVkC770uRhIiAxm33DG5xg3SSb+X2b5yWwYh
 NZXJOorZV3Cx96uV+3RVSNwnPtF0LbiuCMu/YoSGwSbLqtM8xWQaXYCvR8pLYkaoACYSjo
 mIFlMwj/kJqiQ5RbfP732e+O8GuMw90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=/u1xf0vHa/sAevQuuMjIjPXBE891paO7r/D5mjhiB5NFNYu6nx/5dURvK9Peuyo5ZyQYXE
 0fu7I6o9D4GZVBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=hHEgb74brOqS5t/YOGaAFDSRqdEx60a810PVkC770uRhIiAxm33DG5xg3SSb+X2b5yWwYh
 NZXJOorZV3Cx96uV+3RVSNwnPtF0LbiuCMu/YoSGwSbLqtM8xWQaXYCvR8pLYkaoACYSjo
 mIFlMwj/kJqiQ5RbfP732e+O8GuMw90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=/u1xf0vHa/sAevQuuMjIjPXBE891paO7r/D5mjhiB5NFNYu6nx/5dURvK9Peuyo5ZyQYXE
 0fu7I6o9D4GZVBDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B4F313700;
 Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPInCWxJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 09/12] drm/ast: Rename struct i2c_algo_bit_data callbacks
 and their parameters
Date: Tue, 19 Mar 2024 09:00:29 +0100
Message-ID: <20240319081430.10165-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.49
X-Spam-Flag: NO
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hHEgb74b;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/u1xf0vH"
X-Spamd-Result: default: False [3.49 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[8];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.00)[14.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: ***
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6B8F15D33A
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

