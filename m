Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED6933E7D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 16:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FC410E0C2;
	Wed, 17 Jul 2024 14:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Xh2xk0Le";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D5+b/EPg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Xh2xk0Le";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D5+b/EPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B0710E115
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 14:33:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91DAC1FCEC;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721226808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1iCA7gOTW8FHIjbuI0ELkZ50+BqCPlJc8x4peD8+2Q=;
 b=Xh2xk0LegeSxvEQUTwPi+tOoOjgckNjegxkMAA77N04Fx2YbBOvyMzTezqhjyip+KeiNcm
 OATerCaGmE1npAKkGyC+j36TWzNjabuFOJvrjBDLvHeVb3WENZmI2Ryn4uS1qNyk96FM1r
 KoT5Ncd/EBLhJNR4GzCnVY3xTUWJSqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721226808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1iCA7gOTW8FHIjbuI0ELkZ50+BqCPlJc8x4peD8+2Q=;
 b=D5+b/EPgwYhdjiDhjuXrtKNaH6mAmFiNRUX0U1d6U+F4Vu83RPDzu4F/1cSstV3VXc2hGd
 XWA75ql4N69YdrBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1721226808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1iCA7gOTW8FHIjbuI0ELkZ50+BqCPlJc8x4peD8+2Q=;
 b=Xh2xk0LegeSxvEQUTwPi+tOoOjgckNjegxkMAA77N04Fx2YbBOvyMzTezqhjyip+KeiNcm
 OATerCaGmE1npAKkGyC+j36TWzNjabuFOJvrjBDLvHeVb3WENZmI2Ryn4uS1qNyk96FM1r
 KoT5Ncd/EBLhJNR4GzCnVY3xTUWJSqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1721226808;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1iCA7gOTW8FHIjbuI0ELkZ50+BqCPlJc8x4peD8+2Q=;
 b=D5+b/EPgwYhdjiDhjuXrtKNaH6mAmFiNRUX0U1d6U+F4Vu83RPDzu4F/1cSstV3VXc2hGd
 XWA75ql4N69YdrBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B8221396E;
 Wed, 17 Jul 2024 14:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uM4dFTjWl2YmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jul 2024 14:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm/ast: astdp: Only test HDP state in
 ast_astdp_is_connected()
Date: Wed, 17 Jul 2024 16:24:18 +0200
Message-ID: <20240717143319.104012-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240717143319.104012-1-tzimmermann@suse.de>
References: <20240717143319.104012-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; REPLY(-4.00)[];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The overall control flow of the driver ensures that it never reads
EDID or sets display state on unconnected outputs. Therefore remove
all tests for Hot Plug Detection from these helpers. Also rename
the register constants.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c  | 12 +++---------
 drivers/gpu/drm/ast/ast_reg.h |  3 +--
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 59885d10d308..c45b336baf45 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -9,7 +9,7 @@
 
 bool ast_astdp_is_connected(struct ast_device *ast)
 {
-	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))
+	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
 		return false;
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS))
 		return false;
@@ -23,11 +23,9 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 
 	/*
 	 * CRDC[b0]: DP link success
-	 * CRDF[b0]: DP HPD
 	 * CRE5[b0]: Host reading EDID process is done
 	 */
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
-		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD) &&
 		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5,
 								ASTDP_HOST_EDID_READ_DONE_MASK))) {
 		goto err_astdp_edid_not_ready;
@@ -61,8 +59,7 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 			mdelay(j+1);
 
 			if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC,
-							ASTDP_LINK_SUCCESS) &&
-				ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD))) {
+							ASTDP_LINK_SUCCESS))) {
 				goto err_astdp_jump_out_loop_of_edid;
 			}
 
@@ -111,8 +108,6 @@ int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
 err_astdp_edid_not_ready:
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)))
 		return (~0xDC + 1);
-	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)))
-		return (~0xDF + 1);
 	if (!(ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xE5, ASTDP_HOST_EDID_READ_DONE_MASK)))
 		return (~0xE5 + 1);
 
@@ -182,8 +177,7 @@ void ast_dp_set_on_off(struct drm_device *dev, bool on)
 	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
 
 	// If DP plug in and link successful then check video on / off status
-	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS) &&
-		ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, ASTDP_HPD)) {
+	if (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, ASTDP_LINK_SUCCESS)) {
 		video_on_off <<= 4;
 		while (ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF,
 						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 569de3188191..e61954dabf1a 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -38,6 +38,7 @@
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
 #define AST_IO_VGACRD1_MCU_FW_EXECUTING	BIT(5)
+#define AST_IO_VGACRDF_HPD		BIT(0)
 
 #define AST_IO_VGAIR1_R			(0x5A)
 #define AST_IO_VGAIR1_VREFRESH		BIT(3)
@@ -70,11 +71,9 @@
 
 /*
  * CRDC[b0]: DP link success
- * CRDF[b0]: DP HPD
  * CRE5[b0]: Host reading EDID process is done
  */
 #define ASTDP_LINK_SUCCESS		BIT(0)
-#define ASTDP_HPD			BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE	BIT(0)
 #define ASTDP_HOST_EDID_READ_DONE_MASK	GENMASK(0, 0)
 
-- 
2.45.2

