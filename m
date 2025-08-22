Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BEB31995
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C16810E112;
	Fri, 22 Aug 2025 13:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zGrU3aCd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LrEeSvC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zGrU3aCd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LrEeSvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3A10E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:31:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AC7A62210A;
 Fri, 22 Aug 2025 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=zGrU3aCd/ayw5uiNue6E7Uf2fqWaUDL4M1OiQawMAM4fK7hmiVZAQAWyHCt5yjO9Xw8AOJ
 CMutl86uB97CIzsNLXPXRsaX7KVHwyejC9GYOzrhv0g/Iudx2nt3596xKIPIWy5DHxTON+
 zFX9oRfLjgGHohUviy/I2hqSlsWGerY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=6LrEeSvCrad8f4ODLDpT4zNV6Xa8GctmKtJcz/YLLwQZN2GD/7nbo3MxmzDWaj2vUxK0XH
 5JwN4Q87PbZcKABA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=zGrU3aCd/ayw5uiNue6E7Uf2fqWaUDL4M1OiQawMAM4fK7hmiVZAQAWyHCt5yjO9Xw8AOJ
 CMutl86uB97CIzsNLXPXRsaX7KVHwyejC9GYOzrhv0g/Iudx2nt3596xKIPIWy5DHxTON+
 zFX9oRfLjgGHohUviy/I2hqSlsWGerY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=6LrEeSvCrad8f4ODLDpT4zNV6Xa8GctmKtJcz/YLLwQZN2GD/7nbo3MxmzDWaj2vUxK0XH
 5JwN4Q87PbZcKABA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 720CF13A31;
 Fri, 22 Aug 2025 13:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EE2rGjhxqGgneAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Aug 2025 13:31:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] drm/ast: Remove unused mclk field
Date: Fri, 22 Aug 2025 14:52:10 +0200
Message-ID: <20250822132846.25376-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822132846.25376-1-tzimmermann@suse.de>
References: <20250822132846.25376-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

The memory clock is not necessary for the driver. In default for
AST2600 is event incorrect; should be 800 MHz. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_main.c | 26 --------------------------
 2 files changed, 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 403b86f00a54..c9c933b5a70d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -173,7 +173,6 @@ struct ast_device {
 	enum ast_chip chip;
 
 	uint32_t dram_type;
-	uint32_t mclk;
 
 	void __iomem	*vram;
 	unsigned long	vram_base;
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 0b3fb6856db7..492cc8461eb0 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -215,7 +215,6 @@ static int ast_get_dram_info(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct device_node *np = dev->dev->of_node;
 	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
-	uint32_t denum, num, div, ref_pll, dsel;
 
 	switch (ast->config_mode) {
 	case ast_use_dt:
@@ -243,10 +242,6 @@ static int ast_get_dram_info(struct ast_device *ast)
 	case ast_use_defaults:
 	default:
 		ast->dram_type = AST_DRAM_1Gx16;
-		if (IS_AST_GEN6(ast))
-			ast->mclk = 800;
-		else
-			ast->mclk = 396;
 		return 0;
 	}
 
@@ -300,27 +295,6 @@ static int ast_get_dram_info(struct ast_device *ast)
 		}
 	}
 
-	if (mcr_scu_strap & 0x2000)
-		ref_pll = 14318;
-	else
-		ref_pll = 12000;
-
-	denum = mcr_scu_mpll & 0x1f;
-	num = (mcr_scu_mpll & 0x3fe0) >> 5;
-	dsel = (mcr_scu_mpll & 0xc000) >> 14;
-	switch (dsel) {
-	case 3:
-		div = 0x4;
-		break;
-	case 2:
-	case 1:
-		div = 0x2;
-		break;
-	default:
-		div = 0x1;
-		break;
-	}
-	ast->mclk = ref_pll * (num + 2) / ((denum + 2) * (div * 1000));
 	return 0;
 }
 
-- 
2.50.1

