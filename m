Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C97BD846F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587DF10E100;
	Tue, 14 Oct 2025 08:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Q271Jckx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/qXGzpYN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YTTtmQll";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yeItfiMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00E710E100
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:50:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 047711FE2D;
 Tue, 14 Oct 2025 08:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760431831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i11LJ7nncHg086f03omHJ+llRQCdxubUY4D+8oL8+Kg=;
 b=Q271JckxZr7AMSvaO2T42S725khNg69//SwE9hnPRHihuNPL8Q0evXSZ8fceSU5x/abMXb
 W76xawUo6QTJuIuw5SYm/KqSODyJnUx47ZXb3KCoX/yk2BbBD5qg98anWobMYoCMBZRrKZ
 UrOoHWACMeKNJf9tapeW4um/AjmwmBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760431831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i11LJ7nncHg086f03omHJ+llRQCdxubUY4D+8oL8+Kg=;
 b=/qXGzpYNSzVrrDPcbtyDlka5mryRfkXloijaQQ1e6l4GT+Im+RXS+aZsBe3N0GRMHZG5Sn
 v3B5IhurOCqjbdDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760431830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i11LJ7nncHg086f03omHJ+llRQCdxubUY4D+8oL8+Kg=;
 b=YTTtmQll7EGubaepMsi6kmSiO4bL4zVLiP+9eth+hTD/5M2iYbDogDLcOZfZHOs9NvuxYF
 wZKJaxibJNnktMVpeiuaoRFHciUkox7T08FWYwdUP18GPS7aig/KDHE4WOlaCIYySRZHCj
 XO4MKgUhf+gK6Ib0QJ0caKgo58+gRlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760431830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i11LJ7nncHg086f03omHJ+llRQCdxubUY4D+8oL8+Kg=;
 b=yeItfiMNBV7nfVUgANy2+pU2NQVHQkQ8XBbj/u6o/cB15uhE0ixPFWtl2U27hRTamhbdv4
 l5D54QOylsk9xaAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF53B13A44;
 Tue, 14 Oct 2025 08:50:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qc9FLdUO7mhUKQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 14 Oct 2025 08:50:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Subject: [PATCH v2] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Date: Tue, 14 Oct 2025 10:46:34 +0200
Message-ID: <20251014084743.18242-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_SEVEN(0.00)[7];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Blank the display by disabling sync pulses with VGACR17<7>. Unblank
by reenabling them. This VGA setting should be supported by all Aspeed
hardware.

Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
not reenable it after the soft reset. The display output remains dark.
When the display is off during boot, some BMCs set the sync-off bits in
VGACRB6, so the display remains dark. Observed with  Blackbird AST2500
BMCs. Clearing the sync-off bits unconditionally fixes these issues.

Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
access to video memory.

v2:
- init vgacrb6 correctly (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: ce3d99c83495 ("drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers")
Tested-by: Nick Bowler <nbowler@draconx.ca>
Reported-by: Nick Bowler <nbowler@draconx.ca>
Closes: https://lore.kernel.org/dri-devel/wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi/
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.7+
---
 drivers/gpu/drm/ast/ast_mode.c | 18 ++++++++++--------
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6b9d510c509d..9b6a7c54fbb5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct ast_device *ast = to_ast_device(crtc->dev);
+	u8 vgacr17 = 0x00;
+	u8 vgacrb6 = 0xff;
 
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
+	vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;
+	vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
+
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
 }
 
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_device *ast = to_ast_device(crtc->dev);
-	u8 vgacrb6;
+	u8 vgacr17 = 0xff;
 
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
-
-	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
-		  AST_IO_VGACRB6_HSYNC_OFF;
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
+	vgacr17 &= ~AST_IO_VGACR17_SYNC_ENABLE;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
 
 	/*
 	 * HW cursors require the underlying primary plane and CRTC to
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index e15adaf3a80e..30578e3b07e4 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -29,6 +29,7 @@
 #define AST_IO_VGAGRI			(0x4E)
 
 #define AST_IO_VGACRI			(0x54)
+#define AST_IO_VGACR17_SYNC_ENABLE	BIT(7) /* called "Hardware reset" in docs */
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
 #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
-- 
2.51.0

