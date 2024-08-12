Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC9F94E9D8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC72310E193;
	Mon, 12 Aug 2024 09:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GUab0Bfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/KUdrQYM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GUab0Bfz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/KUdrQYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1917410E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:32:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A42D020252;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIeJjwIfNAuhKPPodwSc8Gw0rOhMLNa0q3bzIVEH8Ho=;
 b=GUab0BfzMu8WrTpA2lB7VhVhpwZnoy9Q8ILBGqSJXoDHEgGpd6ojJrr6myFhCFibHUt4zc
 ATJv7DLKyTPLQCiNAlqX6xWeCnw6lV0mYVV5xwbr4wfmkseSKqKZnhHqVIH70xVqaz7GQ+
 2QAm+r2rLENG77wdXY+ui6I++gZ3OYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIeJjwIfNAuhKPPodwSc8Gw0rOhMLNa0q3bzIVEH8Ho=;
 b=/KUdrQYMs1c8EjqLUEjmhqw//OYhgmaAP9ivbTJ41xXN9b01tUGrTfFd8k57tFrzNWNdPp
 SS+Qa9btwChW1uCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GUab0Bfz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/KUdrQYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723455137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIeJjwIfNAuhKPPodwSc8Gw0rOhMLNa0q3bzIVEH8Ho=;
 b=GUab0BfzMu8WrTpA2lB7VhVhpwZnoy9Q8ILBGqSJXoDHEgGpd6ojJrr6myFhCFibHUt4zc
 ATJv7DLKyTPLQCiNAlqX6xWeCnw6lV0mYVV5xwbr4wfmkseSKqKZnhHqVIH70xVqaz7GQ+
 2QAm+r2rLENG77wdXY+ui6I++gZ3OYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723455137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SIeJjwIfNAuhKPPodwSc8Gw0rOhMLNa0q3bzIVEH8Ho=;
 b=/KUdrQYMs1c8EjqLUEjmhqw//OYhgmaAP9ivbTJ41xXN9b01tUGrTfFd8k57tFrzNWNdPp
 SS+Qa9btwChW1uCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D41413A23;
 Mon, 12 Aug 2024 09:32:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8BiDGaHWuWYjMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 09:32:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/9] drm/ast: astdp: Use struct drm_edid and helpers
Date: Mon, 12 Aug 2024 11:30:37 +0200
Message-ID: <20240812093211.382263-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812093211.382263-1-tzimmermann@suse.de>
References: <20240812093211.382263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.01
X-Rspamd-Queue-Id: A42D020252
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

v2:
- fix reading if len is not a multiple of 4

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 55 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 217c155f0874..22c4f2a126e9 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -20,11 +20,15 @@ static bool ast_astdp_is_connected(struct ast_device *ast)
 	return true;
 }
 
-static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
+static int ast_astdp_read_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct ast_device *ast = data;
+	size_t rdlen = round_up(len, 4);
 	int ret = 0;
-	u8 i;
+	unsigned int i;
+
+	if (block > 0)
+		return -EIO; /* extension headers not supported */
 
 	/*
 	 * Protect access to I/O registers from concurrent modesetting
@@ -35,13 +39,23 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 	/* Start reading EDID data */
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xe5, (u8)~AST_IO_VGACRE5_EDID_READ_DONE, 0x00);
 
-	for (i = 0; i < 32; i++) {
+	for (i = 0; i < rdlen; i += 4) {
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
@@ -65,7 +79,7 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
 			if (vgacrd7 & AST_IO_VGACRD7_EDID_VALID_FLAG) {
 				vgacrd6 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd6);
-				if (vgacrd6 == i)
+				if (vgacrd6 == offset)
 					break;
 			}
 		}
@@ -93,7 +107,8 @@ static int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			ediddata[2] = 0;
 		}
 
-		ediddata += 4;
+		memcpy(buf, ediddata, min((len - i), 4));
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

