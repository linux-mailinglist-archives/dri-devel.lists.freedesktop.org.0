Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30987733319
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D27910E633;
	Fri, 16 Jun 2023 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB4010E62F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:07:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1221821B54;
 Fri, 16 Jun 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686924462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mD3PaaVPuoRpBQmg5qtd9TvsI/JP4dfyjsY1mNbDIp0=;
 b=znTS3EpSBo0l1OKsLxVq/4/l8Tq6fHaUWwW5YfvUsM7o01dCGR/+o4B/8f7qf9UTsCjPAd
 EXd92pTKRQeoLckTGYfngp7YpGz2Yakm4W4Awblm2EYnflj0e6MevRB29NsL0shil73BBZ
 K5btiwIfbnd4liwK9SgUeoVBGRr7jcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686924462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mD3PaaVPuoRpBQmg5qtd9TvsI/JP4dfyjsY1mNbDIp0=;
 b=vDFoPjp2mSbZunE3OFUf7iatSOjxakD99dKZ5ARHNY0p84ixLifOIigQZ4VxCT7rTQDojX
 shsRTz6+Dj8gTrAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E066C138E8;
 Fri, 16 Jun 2023 14:07:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +IjQNa1sjGTfWgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 14:07:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 jammy_huang@aspeedtech.com
Subject: [PATCH 03/14] drm/ast: Implement register helpers in ast_drv.h
Date: Fri, 16 Jun 2023 15:52:25 +0200
Message-ID: <20230616140739.32042-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
References: <20230616140739.32042-1-tzimmermann@suse.de>
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

