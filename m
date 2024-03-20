Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FF880EC6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 10:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5653610F35C;
	Wed, 20 Mar 2024 09:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UxQh32uR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UfSO6gLJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UxQh32uR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UfSO6gLJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B833710E8B3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 09:37:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B3BE340EA;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=UxQh32uRZa0JhJOUKSGOfFA1ZWr1cfWrVE2rma4boL6KdPtn2uvd69nfxvcGWVYX6fqxOl
 Xxh1/Q7s/ora2pKilZR0sQrgDgIEKcZA2pNy21vZ/vYi/Xt/kadMfJyyir6xgz0aP9EmMm
 43HlZar0qRBmCIehAIXVcWOBm2lAhHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=UfSO6gLJhulo+U0A5YFOH8UC6tUufd6xBFS0Q6bO5fq3ilSZHuQam0bTHtD8iaZn9RiV5L
 z617pVkBvp86a/BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710927464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=UxQh32uRZa0JhJOUKSGOfFA1ZWr1cfWrVE2rma4boL6KdPtn2uvd69nfxvcGWVYX6fqxOl
 Xxh1/Q7s/ora2pKilZR0sQrgDgIEKcZA2pNy21vZ/vYi/Xt/kadMfJyyir6xgz0aP9EmMm
 43HlZar0qRBmCIehAIXVcWOBm2lAhHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710927464;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TzK8M3cEvMoCxxd6DDt9pHHAMkLlSrSfvsFxqLrtAFU=;
 b=UfSO6gLJhulo+U0A5YFOH8UC6tUufd6xBFS0Q6bO5fq3ilSZHuQam0bTHtD8iaZn9RiV5L
 z617pVkBvp86a/BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C806136E4;
 Wed, 20 Mar 2024 09:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AGzKBWiu+mWoWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Mar 2024 09:37:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 07/13] drm/ast: Pass AST device to ast_ddc_create()
Date: Wed, 20 Mar 2024 10:34:12 +0100
Message-ID: <20240320093738.6341-8-tzimmermann@suse.de>
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
 BAYES_HAM(-0.00)[25.62%]
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

