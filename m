Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F7A500FF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF1C10E788;
	Wed,  5 Mar 2025 13:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AbrZ9Jw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDmdL8by";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AbrZ9Jw6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDmdL8by";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629FB10E788
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:47:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38630211A9;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmVht2RqLIkR1QpiTXLLfnUPfqBXyKbIOBG5hmQTOas=;
 b=AbrZ9Jw658HkQaJwUXGwL6GK5kajo0WamqY59gYqExYrA5y/4IFTZXplgxxHXm+i8gllYT
 0WYo9nNhmMxVZMBt7aAMOx9DROa4bYahJ3EHyqOCBMlJXzLiIpjR6YPL9NQwV9gOPpM7mj
 +aUY4g7wPmlF0rjTPCWh1hrVvn68qqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmVht2RqLIkR1QpiTXLLfnUPfqBXyKbIOBG5hmQTOas=;
 b=xDmdL8byCUaiaT/QbG7OQ3/KSFaahEqMAIW8SD5H0AXR04+dLNsiM7vk1qWAlYYeqjts7T
 soRiUsf3+KPVV1AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741182419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmVht2RqLIkR1QpiTXLLfnUPfqBXyKbIOBG5hmQTOas=;
 b=AbrZ9Jw658HkQaJwUXGwL6GK5kajo0WamqY59gYqExYrA5y/4IFTZXplgxxHXm+i8gllYT
 0WYo9nNhmMxVZMBt7aAMOx9DROa4bYahJ3EHyqOCBMlJXzLiIpjR6YPL9NQwV9gOPpM7mj
 +aUY4g7wPmlF0rjTPCWh1hrVvn68qqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741182419;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmVht2RqLIkR1QpiTXLLfnUPfqBXyKbIOBG5hmQTOas=;
 b=xDmdL8byCUaiaT/QbG7OQ3/KSFaahEqMAIW8SD5H0AXR04+dLNsiM7vk1qWAlYYeqjts7T
 soRiUsf3+KPVV1AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1275E13A71;
 Wed,  5 Mar 2025 13:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IIw3A9NVyGfYQwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Mar 2025 13:46:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm/ast: Add VGACRAA register constants
Date: Wed,  5 Mar 2025 14:35:42 +0100
Message-ID: <20250305134401.60609-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305134401.60609-1-tzimmermann@suse.de>
References: <20250305134401.60609-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
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

Add register constants for VGACRAA and use them when detecting the
size of the VGA memory. Aligns the code with the programming manual.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mm.c  | 5 +++--
 drivers/gpu/drm/ast/ast_reg.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 20d833632a01..8d8aac8c0814 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -37,9 +37,10 @@ static u32 ast_get_vram_size(struct ast_device *ast)
 {
 	u8 jreg;
 	u32 vram_size;
+	u8 vgacraa;
 
-	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xaa, 0xff);
-	switch (jreg & 3) {
+	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
+	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
 	case 0:
 		vram_size = SZ_8M;
 		break;
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index bb2cc1d8b84e..039b93bed19e 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -33,6 +33,7 @@
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
 #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)
+#define AST_IO_VGACRAA_VGAMEM_SIZE_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRB6_HSYNC_OFF	BIT(0)
 #define AST_IO_VGACRB6_VSYNC_OFF	BIT(1)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
-- 
2.48.1

