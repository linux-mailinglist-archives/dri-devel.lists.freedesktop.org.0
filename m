Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C04B354D3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80F610E5E0;
	Tue, 26 Aug 2025 06:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PAOLdu2O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N5SO7rNv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PAOLdu2O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N5SO7rNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2A610E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:53:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 96FCC21DAE;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=PAOLdu2Oakjy1vCb41YjYIO1KHvDStU3GnT3KAM5b96d45ynMYPlFjoq8USyAue0LnhZbf
 ZQDGdoxJsWODeY0zCMY3l9jEU2qtUkwsf5bPVLnf7ieI+gEP6XRzNDvHQSKPAxZC3rKIcY
 FmcPSK2ZgIDIuK8PhFwdM/v7qfQ37iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=N5SO7rNvYf/Qzg+frtyWokZN+qij8PQ+tEL8FTYZYv4nYQHVTk7Y1jkq42nbFiBbBE8vMk
 eXKXCNZcCcXJCeDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PAOLdu2O;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N5SO7rNv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=PAOLdu2Oakjy1vCb41YjYIO1KHvDStU3GnT3KAM5b96d45ynMYPlFjoq8USyAue0LnhZbf
 ZQDGdoxJsWODeY0zCMY3l9jEU2qtUkwsf5bPVLnf7ieI+gEP6XRzNDvHQSKPAxZC3rKIcY
 FmcPSK2ZgIDIuK8PhFwdM/v7qfQ37iQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNWVCnhJrhQqrx6vFzGKAKFZjWu2hYBtU+PDtlVA+ZU=;
 b=N5SO7rNvYf/Qzg+frtyWokZN+qij8PQ+tEL8FTYZYv4nYQHVTk7Y1jkq42nbFiBbBE8vMk
 eXKXCNZcCcXJCeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D9C913A51;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AC+JFeNZrWhtMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 06:53:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/6] drm/ast: Remove unused mclk field
Date: Tue, 26 Aug 2025 08:49:22 +0200
Message-ID: <20250826065032.344412-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826065032.344412-1-tzimmermann@suse.de>
References: <20250826065032.344412-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 96FCC21DAE
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

