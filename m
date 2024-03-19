Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F387F93A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACC910F5C0;
	Tue, 19 Mar 2024 08:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d5232Pyq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S2o92FZv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d5232Pyq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S2o92FZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C4710F588
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 234953750A;
 Tue, 19 Mar 2024 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=d5232PyqEFfImwTEGShRJD632wJ7MuMKNA2Ce1UtNZF+msGHHwSB9IomQ7MFo8Zs2qxtwy
 NDL6FRstIeRiVoS6A1mGjkUH9H9lwEWUfSDX5Z7hiIB6SVIiURCYuKKJlBohCnaRhHD7My
 rFctijyFp9e5b7Razeure9PYYU0UrAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=S2o92FZv56iTE1gQ9CK6jj4cYq6hK/soDoRxgkrliE/J0U4YfkLefF8TY/xyiEUaSz4awa
 GF6fFvy/xeoHr/Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=d5232PyqEFfImwTEGShRJD632wJ7MuMKNA2Ce1UtNZF+msGHHwSB9IomQ7MFo8Zs2qxtwy
 NDL6FRstIeRiVoS6A1mGjkUH9H9lwEWUfSDX5Z7hiIB6SVIiURCYuKKJlBohCnaRhHD7My
 rFctijyFp9e5b7Razeure9PYYU0UrAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836076;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=S2o92FZv56iTE1gQ9CK6jj4cYq6hK/soDoRxgkrliE/J0U4YfkLefF8TY/xyiEUaSz4awa
 GF6fFvy/xeoHr/Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8C3D136D6;
 Tue, 19 Mar 2024 08:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GF9zM2tJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 08/12] drm/ast: Store AST device in struct ast_ddc
Date: Tue, 19 Mar 2024 09:00:28 +0100
Message-ID: <20240319081430.10165-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[26.45%]
X-Spam-Level: ***
Authentication-Results: smtp-out1.suse.de;
	none
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

