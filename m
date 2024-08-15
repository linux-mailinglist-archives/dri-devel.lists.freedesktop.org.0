Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBAA9536ED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7410E45A;
	Thu, 15 Aug 2024 15:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ALSIuUM3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UUBoKIry";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NFZ0yAIN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Vlg9Zf4w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FD810E43B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:20:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E729E2002C;
 Thu, 15 Aug 2024 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGZ0GjEoFLCk6FyaHtEES3QO8p8MS2QEyNtLk3D6Ejs=;
 b=ALSIuUM35fHJq1PTYikyFYukTwMliBq3xKOwmqG2qsWjrQ+F81AcOmTZEdO5Dj+V6m3Plr
 baaN/A+w0cceN+z+s+p5xzT6TV8LQqP59mmByXAAUzXx0KPaCQUrarEc/V/Isdpnm/C4ZQ
 pL8ejXqbBC93C+oeTK5SCvCubDvVo0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGZ0GjEoFLCk6FyaHtEES3QO8p8MS2QEyNtLk3D6Ejs=;
 b=UUBoKIryfGl7caOHwbCupwqt9Bx5gX7IMc6kvPI0Ra/vpu5nVv5wkmzJwLr5QrlTwq7pqc
 OCMVlcEituRp/DDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGZ0GjEoFLCk6FyaHtEES3QO8p8MS2QEyNtLk3D6Ejs=;
 b=NFZ0yAIN/8ciDYRfMf6IHC2prck56iwf3veuLV8RBbhfLt7SJSxCPL2RQD5XIE8g+nI5lM
 nyfiLjuAeZlxfs7tt7hGUcsbwMDXhjavhDbaidFdVCgCm2dKnpS8+VzJFm8ePH1/fBtbYH
 stJfUD0fedJmj4HrBOZfGHoMh3KDOqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PGZ0GjEoFLCk6FyaHtEES3QO8p8MS2QEyNtLk3D6Ejs=;
 b=Vlg9Zf4wbvh+F6eWBYHd2hCVtjH+sKIrK2zzodEASMIhNc2e/xm3anmmp1ToSNMq9B8xcH
 Us11KS8M5DY8ONCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACB6A13983;
 Thu, 15 Aug 2024 15:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sIzMKJ4cvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:19:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 04/11] drm/ast: astdp: Use struct drm_edid and helpers
Date: Thu, 15 Aug 2024 17:18:46 +0200
Message-ID: <20240815151953.184679-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815151953.184679-1-tzimmermann@suse.de>
References: <20240815151953.184679-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_dp.c | 55 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index c2b08a414ae4..45e5c92d19c2 100644
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
@@ -331,29 +346,17 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 
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

