Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020587F93D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C010F5FA;
	Tue, 19 Mar 2024 08:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kHk6Sjjc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oy1dGI7r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kHk6Sjjc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oy1dGI7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E4110F58C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0BE15D339;
 Tue, 19 Mar 2024 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=kHk6Sjjcu5ohKlgIrLV4+1oNIws6rXygRwwAuvk9N8zKbLYUwfArVzQ5RqSF3ENdCgYR0O
 QQCktJGVXLspyuX6BSzYmFOORQS8E7e2xx2EJ7diBYSVOawAECikfhP0herW44WQll+R82
 vEVUEqUWMbaRyVyh4bdZOgAggyg/wpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=oy1dGI7rCl8GWff7r6/IPhA92dpnD2W54qasiLvnP2aYQLJEY0DdxAEIbViBU0Asm1DPR4
 239j9Wi4ICYY/fBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=kHk6Sjjcu5ohKlgIrLV4+1oNIws6rXygRwwAuvk9N8zKbLYUwfArVzQ5RqSF3ENdCgYR0O
 QQCktJGVXLspyuX6BSzYmFOORQS8E7e2xx2EJ7diBYSVOawAECikfhP0herW44WQll+R82
 vEVUEqUWMbaRyVyh4bdZOgAggyg/wpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836075;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=oy1dGI7rCl8GWff7r6/IPhA92dpnD2W54qasiLvnP2aYQLJEY0DdxAEIbViBU0Asm1DPR4
 239j9Wi4ICYY/fBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9289D13700;
 Tue, 19 Mar 2024 08:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IHE9ImtJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 07/12] drm/ast: Pass AST device to ast_ddc_create()
Date: Tue, 19 Mar 2024 09:00:27 +0100
Message-ID: <20240319081430.10165-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.49
X-Spam-Flag: NO
X-Spamd-Bar: +++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kHk6Sjjc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oy1dGI7r
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
 BAYES_HAM(-0.00)[26.35%]; ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: D0BE15D339
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

The DDC code needs the AST device. Pass it to ast_ddc_create() and
avoid an internal upcast. Improves type safety within the DDC code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_ddc.c  | 3 ++-
 drivers/gpu/drm/ast/ast_ddc.h  | 3 ++-
 drivers/gpu/drm/ast/ast_mode.c | 6 ++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ddc.c b/drivers/gpu/drm/ast/ast_ddc.c
index c0e5d03c028d8..24b7d589f0d4c 100644
--- a/drivers/gpu/drm/ast/ast_ddc.c
+++ b/drivers/gpu/drm/ast/ast_ddc.c
@@ -110,8 +110,9 @@ static void ast_ddc_release(struct drm_device *dev, void *res)
 	i2c_del_adapter(&ddc->adapter);
 }
 
-struct ast_ddc *ast_ddc_create(struct drm_device *dev)
+struct ast_ddc *ast_ddc_create(struct ast_device *ast)
 {
+	struct drm_device *dev = &ast->base;
 	struct ast_ddc *ddc;
 	struct i2c_adapter *adapter;
 	struct i2c_algo_bit_data *bit;
diff --git a/drivers/gpu/drm/ast/ast_ddc.h b/drivers/gpu/drm/ast/ast_ddc.h
index 071f9be3e27de..d423b144a3458 100644
--- a/drivers/gpu/drm/ast/ast_ddc.h
+++ b/drivers/gpu/drm/ast/ast_ddc.h
@@ -6,6 +6,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
+struct ast_device;
 struct drm_device;
 
 struct ast_ddc {
@@ -14,6 +15,6 @@ struct ast_ddc {
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_ddc *ast_ddc_create(struct drm_device *dev);
+struct ast_ddc *ast_ddc_create(struct ast_device *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 40cb495acc908..fc73d3b65b2a1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1388,10 +1388,11 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 
 static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_ddc *ddc;
 	int ret;
 
-	ddc = ast_ddc_create(dev);
+	ddc = ast_ddc_create(ast);
 	if (IS_ERR(ddc)) {
 		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
@@ -1485,10 +1486,11 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 
 static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
+	struct ast_device *ast = to_ast_device(dev);
 	struct ast_ddc *ddc;
 	int ret;
 
-	ddc = ast_ddc_create(dev);
+	ddc = ast_ddc_create(ast);
 	if (IS_ERR(ddc)) {
 		ret = PTR_ERR(ddc);
 		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
-- 
2.44.0

