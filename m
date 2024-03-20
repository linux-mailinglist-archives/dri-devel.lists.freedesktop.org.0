Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4DE880ECE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF1F10F41E;
	Wed, 20 Mar 2024 09:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Fpu0tEPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oiY+Ab1f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Fpu0tEPb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oiY+Ab1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253D610E732
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFE0B340EC;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=Fpu0tEPbXqvzBSh9+hsoxilTOEzhpmepVQ81R9IXKbBoXLamvjMFbYu83LCtl+n+/BheM8
 FUBSvoPYowG0F2NUdlFTTdn71Nr0CHUqw7bmFooh+8is5FKRTO9thcGV2gGO+2rjF4jCd8
 MCoGBogORAWyjZMRfV2VhExr1ojO3C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=oiY+Ab1fhCTJr+qP+o4Dz/G+1pjYYWY7/35RX9mjq4KK5IfptLjD7J54HQl/BNgD1tgpMb
 MJFpSchfTK0C0FAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=Fpu0tEPbXqvzBSh9+hsoxilTOEzhpmepVQ81R9IXKbBoXLamvjMFbYu83LCtl+n+/BheM8
 FUBSvoPYowG0F2NUdlFTTdn71Nr0CHUqw7bmFooh+8is5FKRTO9thcGV2gGO+2rjF4jCd8
 MCoGBogORAWyjZMRfV2VhExr1ojO3C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36NEjgwCa6kisP5dfkxACCgheGwYa83rz4qKu32rndU=;
 b=oiY+Ab1fhCTJr+qP+o4Dz/G+1pjYYWY7/35RX9mjq4KK5IfptLjD7J54HQl/BNgD1tgpMb
 MJFpSchfTK0C0FAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A397B136E4;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yL+6Jmiu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 09/13] drm/ast: Rename struct i2c_algo_bit_data callbacks
 and their parameters
Date: Wed, 20 Mar 2024 10:34:14 +0100
Message-ID: <20240320093738.6341-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[11.34%]
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

