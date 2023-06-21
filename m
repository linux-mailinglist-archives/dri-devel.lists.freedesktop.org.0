Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C2738449
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100D410E470;
	Wed, 21 Jun 2023 13:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498AC10E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:00:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4F4B21C8A;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687352434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOEsSmpxfvE9VWykcXcX8hUspFK5uKF+LVBkXBzT4uo=;
 b=xRSM32lBK4RFbaLIq/4zF4iD9em8V7F3CCURySSkX+jE0q5/i3ajSgVk7VgA34ojFpichy
 Igl/Hyj7t6Pk/YPNySGfZPeMIUeB6rifoDV+sQInqfokG4cNyBJtWd6oaYvRp3GWhq57nO
 Me8tvPT3O2Wwjo6e35/NrJdjuFY63cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687352434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOEsSmpxfvE9VWykcXcX8hUspFK5uKF+LVBkXBzT4uo=;
 b=MGQIEuZbWCO99acUegE/tKpnYXSAOjUQm9Mpiu18e+UmdZgyUB54fDW6uGEb89R2CBBU+V
 KJvH9TxTILniDkDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FCA6134B1;
 Wed, 21 Jun 2023 13:00:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IEEtJnL0kmTaWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 13:00:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com, suijingfeng@loongson.cn
Subject: [PATCH v2 03/14] drm/ast: Implement register helpers in ast_drv.h
Date: Wed, 21 Jun 2023 14:53:37 +0200
Message-ID: <20230621130032.3568-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621130032.3568-1-tzimmermann@suse.de>
References: <20230621130032.3568-1-tzimmermann@suse.de>
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

There are already a number of register I/O functions in ast_drv.h.
For consistency, move the remaining functions there as well. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com> # AST2600
---
 drivers/gpu/drm/ast/ast_drv.h  | 34 ++++++++++++++++++++++++----------
 drivers/gpu/drm/ast/ast_main.c | 28 ----------------------------
 2 files changed, 24 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index fc4760a67596f..0141705beaee9 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -257,22 +257,36 @@ static inline void ast_io_write8(struct ast_device *ast, u32 reg, u8 val)
 	iowrite8(val, ast->ioregs + reg);
 }
 
-static inline void ast_set_index_reg(struct ast_device *ast,
-				     uint32_t base, uint8_t index,
-				     uint8_t val)
+static inline u8 ast_get_index_reg(struct ast_device *ast, u32 base, u8 index)
+{
+	ast_io_write8(ast, base, index);
+	++base;
+	return ast_io_read8(ast, base);
+}
+
+static inline u8 ast_get_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
+					u8 preserve_mask)
+{
+	u8 val = ast_get_index_reg(ast, base, index);
+
+	return val & preserve_mask;
+}
+
+static inline void ast_set_index_reg(struct ast_device *ast, u32 base, u8 index, u8 val)
 {
 	ast_io_write8(ast, base, index);
 	++base;
 	ast_io_write8(ast, base, val);
 }
 
-void ast_set_index_reg_mask(struct ast_device *ast,
-			    uint32_t base, uint8_t index,
-			    uint8_t mask, uint8_t val);
-uint8_t ast_get_index_reg(struct ast_device *ast,
-			  uint32_t base, uint8_t index);
-uint8_t ast_get_index_reg_mask(struct ast_device *ast,
-			       uint32_t base, uint8_t index, uint8_t mask);
+static inline void ast_set_index_reg_mask(struct ast_device *ast, u32 base, u8 index,
+					  u8 preserve_mask, u8 val)
+{
+	u8 tmp = ast_get_index_reg_mask(ast, base, index, preserve_mask);
+
+	tmp |= val;
+	ast_set_index_reg(ast, base, index, tmp);
+}
 
 static inline void ast_open_key(struct ast_device *ast)
 {
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index da33cfc6366ec..862fdf02f6100 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -35,34 +35,6 @@
 
 #include "ast_drv.h"
 
-void ast_set_index_reg_mask(struct ast_device *ast,
-			    uint32_t base, uint8_t index,
-			    uint8_t mask, uint8_t val)
-{
-	u8 tmp;
-	ast_io_write8(ast, base, index);
-	tmp = (ast_io_read8(ast, base + 1) & mask) | val;
-	ast_set_index_reg(ast, base, index, tmp);
-}
-
-uint8_t ast_get_index_reg(struct ast_device *ast,
-			  uint32_t base, uint8_t index)
-{
-	uint8_t ret;
-	ast_io_write8(ast, base, index);
-	ret = ast_io_read8(ast, base + 1);
-	return ret;
-}
-
-uint8_t ast_get_index_reg_mask(struct ast_device *ast,
-			       uint32_t base, uint8_t index, uint8_t mask)
-{
-	uint8_t ret;
-	ast_io_write8(ast, base, index);
-	ret = ast_io_read8(ast, base + 1) & mask;
-	return ret;
-}
-
 static void ast_detect_config_mode(struct drm_device *dev, u32 *scu_rev)
 {
 	struct device_node *np = dev->dev->of_node;
-- 
2.41.0

