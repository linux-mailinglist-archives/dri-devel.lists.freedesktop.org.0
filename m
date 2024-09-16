Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC4A979CC7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DDF10E2E8;
	Mon, 16 Sep 2024 08:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0XVXAQ+h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wkXo8GaW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0XVXAQ+h";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wkXo8GaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D28610E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 08:29:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D74BF21BCB;
 Mon, 16 Sep 2024 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lpMtL9WwwhI4tt9w8VeReEGg+dzue5pjW0XyBSitqA=;
 b=0XVXAQ+hUkTbt9U26a5Sip0LTxkbMLd9nchFLs9+VfmLzuuAJbegrwSiLKgnNKAFYpGWVL
 yGLmi7CbM3OvAvM2mkmRpgeo/aQmcMBhDpzh1//TpMhnrurBDqvz1jV2HavxlkDRK6x9xp
 L8XKp+31FYYXsS5gr7lWslFwdKJRtYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lpMtL9WwwhI4tt9w8VeReEGg+dzue5pjW0XyBSitqA=;
 b=wkXo8GaWdT8aLd+ujO816RCjMe39OPosM14i7vmG03sNJA6QINp8O+AKfnVo9IKeX9xTYz
 XKvUBdmdu+CQ+kDg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0XVXAQ+h;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wkXo8GaW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726475365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lpMtL9WwwhI4tt9w8VeReEGg+dzue5pjW0XyBSitqA=;
 b=0XVXAQ+hUkTbt9U26a5Sip0LTxkbMLd9nchFLs9+VfmLzuuAJbegrwSiLKgnNKAFYpGWVL
 yGLmi7CbM3OvAvM2mkmRpgeo/aQmcMBhDpzh1//TpMhnrurBDqvz1jV2HavxlkDRK6x9xp
 L8XKp+31FYYXsS5gr7lWslFwdKJRtYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726475365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lpMtL9WwwhI4tt9w8VeReEGg+dzue5pjW0XyBSitqA=;
 b=wkXo8GaWdT8aLd+ujO816RCjMe39OPosM14i7vmG03sNJA6QINp8O+AKfnVo9IKeX9xTYz
 XKvUBdmdu+CQ+kDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B437A13AB1;
 Mon, 16 Sep 2024 08:29:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mH7DKmXs52bOPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 16 Sep 2024 08:29:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/ast: Use TX-chip register constants
Date: Mon, 16 Sep 2024 10:25:14 +0200
Message-ID: <20240916082920.56234-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916082920.56234-1-tzimmermann@suse.de>
References: <20240916082920.56234-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D74BF21BCB
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Replace magic values with named constants when reading the TX chip
from VGACRD1.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 13 +++++++------
 drivers/gpu/drm/ast/ast_main.c  |  9 +++++----
 drivers/gpu/drm/ast/ast_reg.h   |  2 +-
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index e5553334bfde..9e19d8c17730 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -444,18 +444,19 @@ static void ast_init_analog(struct ast_device *ast)
 
 void ast_init_3rdtx(struct ast_device *ast)
 {
-	u8 jreg;
+	u8 vgacrd1;
 
 	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast)) {
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
-		switch (jreg & 0x0e) {
-		case 0x04:
+		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
+						 AST_IO_VGACRD1_TX_TYPE_MASK);
+		switch (vgacrd1) {
+		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
 			ast_init_dvo(ast);
 			break;
-		case 0x08:
+		case AST_IO_VGACRD1_TX_DP501_VBIOS:
 			ast_launch_m68k(ast);
 			break;
-		case 0x0c:
+		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
 			ast_init_dvo(ast);
 			break;
 		default:
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index d0e4f0dc9234..7289bdc6066e 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -101,12 +101,13 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
 		 * as "reserved" in the spec)
 		 */
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1, 0xff);
+		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
+					      AST_IO_VGACRD1_TX_TYPE_MASK);
 		switch (jreg) {
-		case 0x04:
+		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
 			ast->tx_chip = AST_TX_SIL164;
 			break;
-		case 0x08:
+		case AST_IO_VGACRD1_TX_DP501_VBIOS:
 			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
 			if (ast->dp501_fw_addr) {
 				/* backup firmware */
@@ -116,7 +117,7 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 				}
 			}
 			fallthrough;
-		case 0x0c:
+		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
 			ast->tx_chip = AST_TX_DP501;
 		}
 	} else if (IS_AST_GEN7(ast)) {
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index daa5d3a9e6a1..2aadf07d135a 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -46,7 +46,7 @@
 #define AST_IO_VGACRD1_TX_CH7003_VBIOS		0x06
 #define AST_IO_VGACRD1_TX_DP501_VBIOS		0x08
 #define AST_IO_VGACRD1_TX_ANX9807_VBIOS		0x0a
-#define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c
+#define AST_IO_VGACRD1_TX_FW_EMBEDDED_FW	0x0c /* special case of DP501 */
 #define AST_IO_VGACRD1_TX_ASTDP			0x0e
 
 #define AST_IO_VGACRD7_EDID_VALID_FLAG	BIT(0)
-- 
2.46.0

