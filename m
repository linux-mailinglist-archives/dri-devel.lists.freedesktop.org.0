Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6B7948FB6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC6510E359;
	Tue,  6 Aug 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UDYAJua1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cMxR4E2h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UDYAJua1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cMxR4E2h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B8D10E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F343A1FB4D;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mniLECJuMXGrSNrnVK6p1OSGRYI+52lZ06aBYRqsmQ=;
 b=UDYAJua1TrfV7fxkYzz7ikFxzT4GXLZWgLOds4eK0L01m02ivxAJSqEf+UZZjgO2P6pSMF
 CoBCmJoJiVhnekcCrgj3PsWzNr+FR7jc/xsJUd6IKdnYrZK3crTSSVljMhECy6jpEag36c
 N3etaZ+rgQj8r1YR/IiA7FGsuj7f+es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mniLECJuMXGrSNrnVK6p1OSGRYI+52lZ06aBYRqsmQ=;
 b=cMxR4E2htdmQui10MPTQVoUazpWJtgi+tpHxPxAHssaOc22ieuSoFPpktt0fT+GloIornd
 uMDiGUB7Gt2d/zCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mniLECJuMXGrSNrnVK6p1OSGRYI+52lZ06aBYRqsmQ=;
 b=UDYAJua1TrfV7fxkYzz7ikFxzT4GXLZWgLOds4eK0L01m02ivxAJSqEf+UZZjgO2P6pSMF
 CoBCmJoJiVhnekcCrgj3PsWzNr+FR7jc/xsJUd6IKdnYrZK3crTSSVljMhECy6jpEag36c
 N3etaZ+rgQj8r1YR/IiA7FGsuj7f+es=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948967;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mniLECJuMXGrSNrnVK6p1OSGRYI+52lZ06aBYRqsmQ=;
 b=cMxR4E2htdmQui10MPTQVoUazpWJtgi+tpHxPxAHssaOc22ieuSoFPpktt0fT+GloIornd
 uMDiGUB7Gt2d/zCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC9C713770;
 Tue,  6 Aug 2024 12:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mAXgLGYdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] drm/ast: dp501: Use struct drm_edid and helpers
Date: Tue,  6 Aug 2024 14:52:00 +0200
Message-ID: <20240806125601.78650-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.79 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.19)[-0.972]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.79
X-Spam-Flag: NO
X-Spam-Level: 
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 92 ++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 478efa226170..1c5a4902d4c2 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -318,32 +318,63 @@ static bool ast_dp501_is_connected(struct ast_device *ast)
 	return true;
 }
 
-static bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
+static int ast_dp512_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
-	struct ast_device *ast = to_ast_device(dev);
-	u32 i, boot_address, offset, data;
-	u32 *pEDIDidx;
+	struct ast_device *ast = data;
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
+		for (i = 0; i < len; i += 4) {
+			ediddata = ast_mindwm(ast, boot_address + offset + i);
+
+			switch (i % 4) {
+			case 3:
+				*buf = (ediddata >> 24) & 0xff;
+				++buf;
+				fallthrough;
+			case 2:
+				*buf = (ediddata >> 16) & 0xff;
+				++buf;
+				fallthrough;
+			case 1:
+				*buf = (ediddata >> 8) & 0xff;
+				++buf;
+				fallthrough;
+			case 0:
+				*buf = (ediddata) & 0xff;
+				++buf;
+				break;
+			}
 		}
 	} else {
-		/* Read EDID */
-		offset = AST_DP501_EDID_DATA;
-		for (i = 0; i < 128; i += 4) {
-			data = readl(ast->dp501_fw_buf + offset + i);
-			pEDIDidx = (u32 *)(ediddata + i);
-			*pEDIDidx = data;
+		for (i = 0; i < len; i += 4) {
+			ediddata = readl(ast->dp501_fw_buf + offset + i);
+
+			switch (i % 4) {
+			case 3:
+				*buf = (ediddata >> 24) & 0xff;
+				++buf;
+				fallthrough;
+			case 2:
+				*buf = (ediddata >> 16) & 0xff;
+				++buf;
+				fallthrough;
+			case 1:
+				*buf = (ediddata >> 8) & 0xff;
+				++buf;
+				fallthrough;
+			case 0:
+				*buf = (ediddata) & 0xff;
+				++buf;
+				break;
+			}
 		}
 	}
 
@@ -511,29 +542,16 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
 
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

