Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD2E7EDE1A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143C110E2C6;
	Thu, 16 Nov 2023 10:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC19810E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FBBD22917;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoPCOUWO8if0y/GidD68+pbioqHstfaRQkTOYBUXgnE=;
 b=rA6T0HLqX6OPLppD4DOVza52smWFa/aatUai0AHbirqGy70G8yrE1aK+IvntGfSFY3A7wT
 E/x/vc2RbVU0O9sBlc+43exthQB2HuZB3Ewq8mq7EuoKLU6FDuTGU8oFB8Sxi/9yR3mKdz
 PtNLwuxu5a/AQJ555oHTTDkSwiEWt3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoPCOUWO8if0y/GidD68+pbioqHstfaRQkTOYBUXgnE=;
 b=qQwZHPcmMFlKJN5MXeOmpcpKKfCv5Z4AQUzMUT77Sp3l8opdWFfy2w8ujLYRo+nU+SLSG1
 IMwZIl5M2ZGIOCCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 644E51377E;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0Eu4F8LoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 04/10] drm/ast: Add I/O helpers without ast device
Date: Thu, 16 Nov 2023 10:59:23 +0100
Message-ID: <20231116100240.22975-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116100240.22975-1-tzimmermann@suse.de>
References: <20231116100240.22975-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement I/O access in helpers that do now use an ast device
instance, but the raw pointer to the I/O memory. We'll later need
these helpers to detect the device type before allocating the ast
device instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h | 73 +++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 8b5d6e2954858..b82be890d9fce 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -262,55 +262,94 @@ static inline bool __ast_gen_is_eq(struct ast_device *ast, unsigned long gen)
 #define IS_AST_GEN6(__ast)	__ast_gen_is_eq(__ast, 6)
 #define IS_AST_GEN7(__ast)	__ast_gen_is_eq(__ast, 7)
 
+static inline u8 __ast_read8(const void __iomem *addr, u32 reg)
+{
+	return ioread8(addr + reg);
+}
+
+static inline u32 __ast_read32(const void __iomem *addr, u32 reg)
+{
+	return ioread32(addr + reg);
+}
+
+static inline void __ast_write8(void __iomem *addr, u32 reg, u8 val)
+{
+	iowrite8(val, addr + reg);
+}
+
+static inline void __ast_write32(void __iomem *addr, u32 reg, u32 val)
+{
+	iowrite32(val, addr + reg);
+}
+
+static inline u8 __ast_read8_i(void __iomem *addr, u32 reg, u8 index)
+{
+	__ast_write8(addr, reg, index);
+	return __ast_read8(addr, reg + 1);
+}
+
+static inline u8 __ast_read8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask)
+{
+	u8 val = __ast_read8_i(addr, reg, index);
+
+	return val & read_mask;
+}
+
+static inline void __ast_write8_i(void __iomem *addr, u32 reg, u8 index, u8 val)
+{
+	__ast_write8(addr, reg, index);
+	__ast_write8(addr, reg + 1, val);
+}
+
+static inline void __ast_write8_i_masked(void __iomem *addr, u32 reg, u8 index, u8 read_mask,
+					 u8 val)
+{
+	u8 tmp = __ast_read8_i_masked(addr, reg, index, read_mask);
+
+	tmp |= val;
+	__ast_write8_i(addr, reg, index, tmp);
+}
+
 static inline u32 ast_read32(struct ast_device *ast, u32 reg)
 {
-	return ioread32(ast->regs + reg);
+	return __ast_read32(ast->regs, reg);
 }
 
 static inline void ast_write32(struct ast_device *ast, u32 reg, u32 val)
 {
-	iowrite32(val, ast->regs + reg);
+	__ast_write32(ast->regs, reg, val);
 }
 
 static inline u8 ast_io_read8(struct ast_device *ast, u32 reg)
 {
-	return ioread8(ast->ioregs + reg);
+	return __ast_read8(ast->ioregs, reg);
 }
 
 static inline void ast_io_write8(struct ast_device *ast, u32 reg, u8 val)
 {
-	iowrite8(val, ast->ioregs + reg);
+	__ast_write8(ast->ioregs, reg, val);
 }
 
 static inline u8 ast_get_index_reg(struct ast_device *ast, u32 base, u8 index)
 {
-	ast_io_write8(ast, base, index);
-	++base;
-	return ast_io_read8(ast, base);
+	return __ast_read8_i(ast->ioregs, base, index);
 }
 
 static inline u8 ast_get_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
 					u8 preserve_mask)
 {
-	u8 val = ast_get_index_reg(ast, base, index);
-
-	return val & preserve_mask;
+	return __ast_read8_i_masked(ast->ioregs, base, index, preserve_mask);
 }
 
 static inline void ast_set_index_reg(struct ast_device *ast, u32 base, u8 index, u8 val)
 {
-	ast_io_write8(ast, base, index);
-	++base;
-	ast_io_write8(ast, base, val);
+	__ast_write8_i(ast->ioregs, base, index, val);
 }
 
 static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
 					  u8 preserve_mask, u8 val)
 {
-	u8 tmp = ast_get_index_reg_mask(ast, base, index, preserve_mask);
-
-	tmp |= val;
-	ast_set_index_reg(ast, base, index, tmp);
+	__ast_write8_i_masked(ast->ioregs, base, index, preserve_mask, val);
 }
 
 #define AST_VIDMEM_SIZE_8M    0x00800000
-- 
2.42.0

