Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F141294E9D9
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC52110E18E;
	Mon, 12 Aug 2024 09:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AE410E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B7A7224F9;
 Mon, 12 Aug 2024 09:32:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E87EC13A23;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SJhlN6HWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/9] drm/ast: dp501: Use struct drm_edid and helpers
Date: Mon, 12 Aug 2024 11:30:39 +0200
Message-ID: <20240812093211.382263-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812093211.382263-1-tzimmermann@suse.de>
References: <20240812093211.382263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 2B7A7224F9
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Convert DP501 support to struct drm_edid and its helpers. Simplifies
and modernizes the EDID handling.

The driver reads 4 bytes at once, but the overall read length is now
variable. Therefore update the EDID read loop to never return more than
the requested bytes.

v2:
- fix reading EDID data

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 59 ++++++++++++---------------------
 1 file changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 478efa226170..0dc37b65e1d7 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -318,32 +318,30 @@ static bool ast_dp501_is_connected(struct ast_device *ast)
 	return true;
 }
 
-static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
+static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
-	struct ast_device *ast = to_ast_device(dev);
-	u32 i, boot_address, offset, data;
-	u32 *pEDIDidx;
+	struct ast_device *ast = data;
+	size_t rdlen = round_up(len, 4);
+	u32 i, boot_address, offset, ediddata;
 
-	if (!ast_dp501_is_connected(ast))
-		return false;
+	if (block > (512 / EDID_LENGTH))
+		return -EIO;
+
+	offset = AST_DP501_EDID_DATA + block * EDID_LENGTH;
 
 	if (ast->config_mode == ast_use_p2a) {
 		boot_address = get_fw_base(ast);
 
-		/* Read EDID */
-		offset = AST_DP501_EDID_DATA;
-		for (i = 0; i < 128; i += 4) {
-			data = ast_mindwm(ast, boot_address + offset + i);
-			pEDIDidx = (u32 *)(ediddata + i);
-			*pEDIDidx = data;
+		for (i = 0; i < rdlen; i += 4) {
+			ediddata = ast_mindwm(ast, boot_address + offset + i);
+			memcpy(buf, &ediddata, min((len - i), 4));
+			buf += 4;
 		}
 	} else {
-		/* Read EDID */
-		offset = AST_DP501_EDID_DATA;
-		for (i = 0; i < 128; i += 4) {
-			data = readl(ast->dp501_fw_buf + offset + i);
-			pEDIDidx = (u32 *)(ediddata + i);
-			*pEDIDidx = data;
+		for (i = 0; i < rdlen; i += 4) {
+			ediddata = readl(ast->dp501_fw_buf + offset + i);
+			memcpy(buf, &ediddata, min((len - i), 4));
+			buf += 4;
 		}
 	}
 
@@ -511,29 +509,16 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
 
 static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 {
-	void *edid;
-	bool succ;
+	struct ast_device *ast = to_ast_device(connector->dev);
+	const struct drm_edid *drm_edid;
 	int count;
 
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-	if (!edid)
-		goto err_drm_connector_update_edid_property;
-
-	succ = ast_dp501_read_edid(connector->dev, edid);
-	if (!succ)
-		goto err_kfree;
-
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = drm_edid_read_custom(connector, ast_dp512_read_edid_block, ast);
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
 
 static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector,
-- 
2.46.0

