Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FC896C93
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC061129BF;
	Wed,  3 Apr 2024 10:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jar3Q+Ia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wMDIIOBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F6D1129B9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:33:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C15A65CB42;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712140408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAgk9h9DMEsO8TDgJ2RTL921hxPdkToIyf1pW3MwtlI=;
 b=jar3Q+IaW//x/VPdCLKbG9XCkD8z/FII3B9GtQm7FONaULd6VZQJI/uiUFAFGjnEgWcyfY
 gfu58hpdDWi1+1p3jvrtsaZKJLpLPt5qMQTJG7W9tB6WUPUZWXl1iegF3EUY7gZ3YANXQC
 ADMv9nKS30VIAXmDpzF2iE0YUHpKq4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712140408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAgk9h9DMEsO8TDgJ2RTL921hxPdkToIyf1pW3MwtlI=;
 b=wMDIIOBM9KrVSaxSF5nmb7xIpb5k9TBR+khRvTPF81Kp/4ai/cfA9Tg+KScUmQ/nJOCNMp
 6p11jq/xizK0wWDQ==
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9DABA13357;
 Wed,  3 Apr 2024 10:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id aExEJXgwDWaNEAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 10:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/ast: Group DDC init code by data structure
Date: Wed,  3 Apr 2024 12:31:29 +0200
Message-ID: <20240403103325.30457-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403103325.30457-1-tzimmermann@suse.de>
References: <20240403103325.30457-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.995]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-0.00)[44.21%]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email, imap2.dmz-prg2.suse.org:rdns,
 imap2.dmz-prg2.suse.org:helo]
X-Spam-Score: -2.80
X-Spam-Level: 
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

Reorder the code to set up the DDC channel by data structure, so
that each data structure's init is in a separate block: first the
bit algo then the i2c adapter. Makes the code more readable. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_ddc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index 3e156a6b6831d..4df52aeba4f7e 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -145,15 +145,7 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 		return ERR_PTR(-ENOMEM);
 	ddc->ast = ast;
 
-	adapter = &ddc->adapter;
-	adapter->owner = THIS_MODULE;
-	adapter->dev.parent = dev->dev;
-	i2c_set_adapdata(adapter, ddc);
-	snprintf(adapter->name, sizeof(adapter->name), "AST DDC bus");
-
 	bit = &ddc->bit;
-	bit->udelay = 20;
-	bit->timeout = usecs_to_jiffies(2200);
 	bit->data = ddc;
 	bit->setsda = ast_ddc_algo_bit_data_setsda;
 	bit->setscl = ast_ddc_algo_bit_data_setscl;
@@ -161,8 +153,16 @@ struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 	bit->getscl = ast_ddc_algo_bit_data_getscl;
 	bit->pre_xfer = ast_ddc_algo_bit_data_pre_xfer;
 	bit->post_xfer = ast_ddc_algo_bit_data_post_xfer;
+	bit->udelay = 20;
+	bit->timeout = usecs_to_jiffies(2200);
 
+	adapter = &ddc->adapter;
+	adapter->owner = THIS_MODULE;
 	adapter->algo_data = bit;
+	adapter->dev.parent = dev->dev;
+	snprintf(adapter->name, sizeof(adapter->name), "AST DDC bus");
+	i2c_set_adapdata(adapter, ddc);
+
 	ret = i2c_bit_add_bus(adapter);
 	if (ret) {
 		drm_err(dev, "Failed to register bit i2c\n");
-- 
2.44.0

