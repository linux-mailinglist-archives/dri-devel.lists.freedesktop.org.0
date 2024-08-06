Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3118A948FAF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED0310E34A;
	Tue,  6 Aug 2024 12:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EDB10E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78E8A219A6;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 417F513770;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uBy4DmYdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/9] drm/ast: astdp: Use struct drm_edid and helpers
Date: Tue,  6 Aug 2024 14:51:58 +0200
Message-ID: <20240806125601.78650-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 78E8A219A6
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Convert ASTDP support to struct drm_edid and its helpers. Simplifies
and modernizes the EDID handling.

The driver reads 4 bytes at once, but the overall read length is now
variable. Therefore update the EDID read loop to never return more than
the requested bytes.

The device does not seem to support EDID extensions, as the driver
actively clears any such information from the main EDID header. As
the new interface allows for reading extension blocks for EDID, make
sure that the block is always 0 (i.e., the main header). A later
update might fix that.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 55 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 217c155f0874..1eed1cc55280 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -20,11 +20,14 @@ static bool ast_astdp_is_connected(struct ast_device *ast)
 	return true;
 }
 
-static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
+static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct ast_device *ast = data;
 	int ret = 0;
-	u8 i;
+	unsigned int i;
+
+	if (block > 0)
+		return -EIO; /* extension headers not supported */
 
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
@@ -35,13 +38,23 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	/* Start reading EDID data */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
 
-	for (i = 0; i < 32; i++) {
+	for (i = 0; i < len; i += 4) {
+		unsigned int offset;
 		unsigned int j;
+		u8 ediddata[4];
+		u8 vgacre4;
+
+		offset = (i + block * EDID_LENGTH) / 4;
+		if (offset >= 64) {
+			ret = -EIO;
+			goto out;
+		}
+		vgacre4 = offset;
 
 		/*
 		 * CRE4[7:0]: Read-Pointer for EDID (Unit: 4bytes); valid range: 0~64
 		 */
-		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, i);
+		ast_set_index_reg(ast, AST_IO_VGACRI, 0xe4, vgacre4);
 
 		/*
 		 * CRD7[b0]: valid flag for EDID
@@ -65,7 +78,7 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
 			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
 				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
-				if (vgacrd6 == i)
+				if (vgacrd6 == offset)
 					break;
 			}
 		}
@@ -93,7 +106,9 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			ediddata[2] = 0;
 		}
 
-		ediddata += 4;
+		memcpy(buf, ediddata, min((len - i), sizeof(ediddata)));
+
+		buf += 4;
 	}
 
 out:
@@ -330,29 +345,17 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
-	void *edid;
-	int succ;
+	struct drm_device *dev = connector->dev;
+	struct ast_device *ast = to_ast_device(dev);
+	const struct drm_edid *drm_edid;
 	int count;
 
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (!edid)
-		goto err_drm_connector_update_edid_property;
-
-	succ = ast_astdp_read_edid(connector->dev, edid);
-	if (succ < 0)
-		goto err_kfree;
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = drm_edid_read_custom(connector, ast_astdp_read_edid_block, ast);
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return count;
-
-err_kfree:
-	kfree(edid);
-err_drm_connector_update_edid_property:
-	drm_connector_update_edid_property(connector, NULL);
-	return 0;
 }
 
 static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector,
-- 
2.46.0

