Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62C880ECA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9655410F3C4;
	Wed, 20 Mar 2024 09:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="WL/smNGz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKQhrdL1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WL/smNGz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKQhrdL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259E010E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9DA64340EB;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=WL/smNGzVvQ4qiJmkayRO4By8bNYOZkpfMB5Kk0HeaT88PlJ6W7QsEBWkPNDSUHii4nSD+
 LBln8PCG6fClhCLcVHLCt4OoOLajKqfcGMwmGXCCnauI+coRMua+tKLCt7C+9HD4PaFfdb
 ipxruveWc8P62v7gK9ak7jgSrF09GZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=JKQhrdL1B5EjS+SHcoiDub5iYKVgouK8cY0sIUvF0RcXeFJOh4YuKqTOxMpDeOAKkFiD4E
 0QOgmm6+XPUxGkDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=WL/smNGzVvQ4qiJmkayRO4By8bNYOZkpfMB5Kk0HeaT88PlJ6W7QsEBWkPNDSUHii4nSD+
 LBln8PCG6fClhCLcVHLCt4OoOLajKqfcGMwmGXCCnauI+coRMua+tKLCt7C+9HD4PaFfdb
 ipxruveWc8P62v7gK9ak7jgSrF09GZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weV+cyZOZ/0J6o57o88XrqvhBqaypjYjAFkmTQjTpok=;
 b=JKQhrdL1B5EjS+SHcoiDub5iYKVgouK8cY0sIUvF0RcXeFJOh4YuKqTOxMpDeOAKkFiD4E
 0QOgmm6+XPUxGkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6130A136CD;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sMqHFmiu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 08/13] drm/ast: Store AST device in struct ast_ddc
Date: Wed, 20 Mar 2024 10:34:13 +0100
Message-ID: <20240320093738.6341-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240320093738.6341-1-tzimmermann@suse.de>
References: <20240320093738.6341-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***
X-Spamd-Bar: +++
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="WL/smNGz";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JKQhrdL1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [3.48 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.01)[48.02%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 3.48
X-Rspamd-Queue-Id: 9DA64340EB
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

