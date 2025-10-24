Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A711C04C02
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4758010E9F7;
	Fri, 24 Oct 2025 07:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="D6tVIy6S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JOHy3KUp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VLE31Yl/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hqI9aCE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76C10E9F6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:36:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 73A8B211F4;
 Fri, 24 Oct 2025 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761291397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IIjyVjTsKmTM3DyV9c7Fg0rxyqu0hiuVFiYvD0dfXfE=;
 b=D6tVIy6Sl+g47+arCAzMfoRHzEfFWsyPJlxy4xiJ7Nfxvx3HlAjZMxiD8f6k0/+0Sr3nz0
 L4EVvMxUys6n6k5VypDIiHoz+ASwssnWsyyMxiu1oHOD60zwWUFZtiTl663xNyAm1+VJrp
 UeiZy7h847B2I6oredjgWnJAVlPsZgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761291397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IIjyVjTsKmTM3DyV9c7Fg0rxyqu0hiuVFiYvD0dfXfE=;
 b=JOHy3KUp8++ANrU0aEgAIxgK/MY4CBMahUtgAxF2G9OETtpqAVTSJ9SBClr6rc1/Hxn1xE
 +VOy3BuQYkOMgKAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761291393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IIjyVjTsKmTM3DyV9c7Fg0rxyqu0hiuVFiYvD0dfXfE=;
 b=VLE31Yl/kUlNOdiCjxZQStbPyH9O9liLRgV66WFO3wI24Y1uDW8/IZhTGFEqOzx6AqiS6D
 Goesecw+rQOxTPX+udBNvOHE6YSqX+hMJdj3uiepNAs24i662npBFUVpK5FlFehmsuRpHi
 Il9TsudFwR+k10OJrV+39yZxTGaogRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761291393;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IIjyVjTsKmTM3DyV9c7Fg0rxyqu0hiuVFiYvD0dfXfE=;
 b=hqI9aCE7EEJplAXT4QORlZWHB9EbJggX2anJ866UAz7Np2Bv4cSWOJ1+InX5g/Vxp5Z+GW
 HDokJdrR4xa3ZUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D625132C2;
 Fri, 24 Oct 2025 07:36:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rizmCYEs+2iAIAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Oct 2025 07:36:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, pschneider1968@googlemail.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Bowler <nbowler@draconx.ca>, Douglas Anderson <dianders@chromium.org>,
 stable@vger.kernel.org
Subject: [PATCH] drm/ast: Clear preserved bits from register output value
Date: Fri, 24 Oct 2025 09:35:53 +0200
Message-ID: <20251024073626.129032-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.995];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_SEVEN(0.00)[10];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,googlemail.com,gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,lists.freedesktop.org:email,draconx.ca:email,chromium.org:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,googlemail.com]
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

Preserve the I/O register bits in __ast_write8_i_masked() as specified
by preserve_mask. Accidentally OR-ing the output value into these will
overwrite the register's previous settings.

Fixes display output on the AST2300, where the screen can go blank at
boot. The driver's original commit 312fec1405dd ("drm: Initial KMS
driver for AST (ASpeed Technologies) 2000 series (v2)") already added
the broken code. Commit 6f719373b943 ("drm/ast: Blank with VGACR17 sync
enable, always clear VGACRB6 sync off") triggered the bug.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Peter Schneider <pschneider1968@googlemail.com>
Closes: https://lore.kernel.org/dri-devel/a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com/
Tested-by: Peter Schneider <pschneider1968@googlemail.com>
Fixes: 6f719373b943 ("drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off")
Fixes: 312fec1405dd ("drm: Initial KMS driver for AST (ASpeed Technologies) 2000 series (v2)")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Nick Bowler <nbowler@draconx.ca>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v3.5+
---
 drivers/gpu/drm/ast/ast_drv.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 7be36a358e74..787e38c6c17d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -298,13 +298,13 @@ static inline void __ast_write8_i(void __iomem *addr, u32 reg, u8 index, u8 val)
 	__ast_write8(addr, reg + 1, val);
 }
 
-static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask,
+static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 preserve_mask,
 					 u8 val)
 {
-	u8 tmp = __ast_read8_i_masked(addr, reg, index, read_mask);
+	u8 tmp = __ast_read8_i_masked(addr, reg, index, preserve_mask);
 
-	tmp |= val;
-	__ast_write8_i(addr, reg, index, tmp);
+	val &= ~preserve_mask;
+	__ast_write8_i(addr, reg, index, tmp | val);
 }
 
 static inline u32 ast_read32(struct ast_device *ast, u32 reg)
-- 
2.51.0

