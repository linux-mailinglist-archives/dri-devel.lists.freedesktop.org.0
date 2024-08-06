Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A1A948FAE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F177010E0C6;
	Tue,  6 Aug 2024 12:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CFA10E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B5991FB4C;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 031A813770;
 Tue,  6 Aug 2024 12:56:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sHcfO2Udsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/9] drm/ast: astdp: Move locking into EDID helper
Date: Tue,  6 Aug 2024 14:51:57 +0200
Message-ID: <20240806125601.78650-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 3B5991FB4C
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

The modeset mutex protects EDID retrival from concurrent modeset
operations. Acquire the lock in ast_astdp_read_edid(). Prepares the
code for conversion to struct drm_edid.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index ef2dd9d82de9..217c155f0874 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -26,6 +26,12 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	int ret = 0;
 	u8 i;
 
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&ast->modeset_lock);
+
 	/* Start reading EDID data */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
 
@@ -95,6 +101,8 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE,
 			       AST_IO_VGACRE5_EDID_READ_DONE);
 
+	mutex_unlock(&ast->modeset_lock);
+
 	return ret;
 }
 
@@ -323,9 +331,6 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
 	void *edid;
-	struct drm_device *dev = connector->dev;
-	struct ast_device *ast = to_ast_device(dev);
-
 	int succ;
 	int count;
 
@@ -333,17 +338,9 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 	if (!edid)
 		goto err_drm_connector_update_edid_property;
 
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&ast->modeset_lock);
-
 	succ = ast_astdp_read_edid(connector->dev, edid);
 	if (succ < 0)
-		goto err_mutex_unlock;
-
-	mutex_unlock(&ast->modeset_lock);
+		goto err_kfree;
 
 	drm_connector_update_edid_property(connector, edid);
 	count = drm_add_edid_modes(connector, edid);
@@ -351,8 +348,7 @@ static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 
 	return count;
 
-err_mutex_unlock:
-	mutex_unlock(&ast->modeset_lock);
+err_kfree:
 	kfree(edid);
 err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
-- 
2.46.0

