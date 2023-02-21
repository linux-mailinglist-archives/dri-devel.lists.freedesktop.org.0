Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B669E411
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356C10E326;
	Tue, 21 Feb 2023 15:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98FA10E340
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:57:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 704575C9AF;
 Tue, 21 Feb 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676995067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7gfNIYJCSDK7WYQ7Ihv+MfFnKZ8GO1mm+rYKnFUEKY=;
 b=rdAJBnRLkIF2oSFP17qPeXTtpZal8Pxc9fyPbnH+Qd4Jz9dIlCsrbo0DtxjykcBfwPEKr1
 P9jIAYT/zDtTCTahuUU9pS4K3fBynWiQxEV6EHmn1y7xV1yOX/NB7ruMcBsOK0M1j6JwXp
 g25+QZ5HEL0jwEQFsBmPODme1z6fWi4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676995067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7gfNIYJCSDK7WYQ7Ihv+MfFnKZ8GO1mm+rYKnFUEKY=;
 b=JL/fyVzGWIJuIYR3inQJZznj5RfBQsNTOBer3nt0P7zh6nIAignRbpVpTBcbe+glZfgCiN
 LIZ5NyjG/b5Cc1Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4D93313481;
 Tue, 21 Feb 2023 15:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6KoKEvvp9GNOBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Feb 2023 15:57:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 2/4] drm/ast: Rework definition of I/O read and write helpers
Date: Tue, 21 Feb 2023 16:57:43 +0100
Message-Id: <20230221155745.27484-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221155745.27484-1-tzimmermann@suse.de>
References: <20230221155745.27484-1-tzimmermann@suse.de>
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

Ast defines a number of I/O helpers for accessing hardware. Only 4 of
the many generated functions are actually used. Replace the respective
generator macros with those 4 functions. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h | 48 ++++++++++-------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 1f46162adb64..6e5ed5bafdc1 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -238,45 +238,25 @@ struct ast_private *ast_device_create(const struct drm_driver *drv,
 #define AST_IO_VGACRCB_HWC_ENABLED     BIT(1)
 #define AST_IO_VGACRCB_HWC_16BPP       BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 
-#define __ast_read(x) \
-static inline u##x ast_read##x(struct ast_private *ast, u32 reg) { \
-u##x val = 0;\
-val = ioread##x(ast->regs + reg); \
-return val;\
+static inline u32 ast_read32(struct ast_private *ast, u32 reg)
+{
+	return ioread32(ast->regs + reg);
 }
 
-__ast_read(8);
-__ast_read(16);
-__ast_read(32)
-
-#define __ast_io_read(x) \
-static inline u##x ast_io_read##x(struct ast_private *ast, u32 reg) { \
-u##x val = 0;\
-val = ioread##x(ast->ioregs + reg); \
-return val;\
+static inline void ast_write32(struct ast_private *ast, u32 reg, u32 val)
+{
+	iowrite32(val, ast->regs + reg);
 }
 
-__ast_io_read(8);
-__ast_io_read(16);
-__ast_io_read(32);
-
-#define __ast_write(x) \
-static inline void ast_write##x(struct ast_private *ast, u32 reg, u##x val) {\
-	iowrite##x(val, ast->regs + reg);\
-	}
-
-__ast_write(8);
-__ast_write(16);
-__ast_write(32);
-
-#define __ast_io_write(x) \
-static inline void ast_io_write##x(struct ast_private *ast, u32 reg, u##x val) {\
-	iowrite##x(val, ast->ioregs + reg);\
-	}
+static inline u8 ast_io_read8(struct ast_private *ast, u32 reg)
+{
+	return ioread8(ast->ioregs + reg);
+}
 
-__ast_io_write(8);
-__ast_io_write(16);
-#undef __ast_io_write
+static inline void ast_io_write8(struct ast_private *ast, u32 reg, u8 val)
+{
+	iowrite8(val, ast->ioregs + reg);
+}
 
 static inline void ast_set_index_reg(struct ast_private *ast,
 				     uint32_t base, uint8_t index,
-- 
2.39.2

