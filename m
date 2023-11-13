Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EEC7E98AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957DE10E2FB;
	Mon, 13 Nov 2023 09:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB97F10E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 765A221903;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgNBTHDYepj0nsVj+wMKsqAaovxVsV+hmDxLTQr3f2E=;
 b=hbHSs3URCR/mfMlMWaT1R7vopk78iJdpAewQ19FFWDhEYhduPmiYJvY2IrQSjm5Fot24M2
 EU5mnIToEXTJW1hOWK+BOu7RAj1ZAxVj/f0b8xdpVXrtAdG23zEy4Xe9zuAtIa8ytshpOo
 QeWY4eVTv0hEC4VasZJGUBseQO/oUH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgNBTHDYepj0nsVj+wMKsqAaovxVsV+hmDxLTQr3f2E=;
 b=fz+KuflIToITdkbFmY6y+xJ5b6RMhy+ircdtmvaqBYBOoyGwvzhu/RayVczcWqMKdJlILM
 lD56r8CGPoosukDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48C3013907;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GPnYEATpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 04/10] drm/ast: Add I/O helpers without ast device
Date: Mon, 13 Nov 2023 09:50:26 +0100
Message-ID: <20231113091439.17181-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

