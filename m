Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3021B31996
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 15:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C1210EB10;
	Fri, 22 Aug 2025 13:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CZnEv7p9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMp7Fd/8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CZnEv7p9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UMp7Fd/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F85D10E110
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 13:31:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D9421F38E;
 Fri, 22 Aug 2025 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BowsHQRUjbGpowq7stAcvbdrpq1Nnai6mrNj1i2oN+w=;
 b=CZnEv7p9ElW3bw435pBIVCFTeZHgLgWYJJ8lLfkFUhIXng9keWUDUyvt4WBHPUOOTIax2s
 Xwnh2hxG6c9uEhtRl2pO/CO7RhM1S6yzFhL6cAL4mQ80Lz6d1TXpBdHrnxA4rKi3cA0xFL
 SL8n1U4V3HHjmTK9mamn+vwkZKSHdpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BowsHQRUjbGpowq7stAcvbdrpq1Nnai6mrNj1i2oN+w=;
 b=UMp7Fd/8AYFcq/neYfHw9AEUFGbqaDEk4uVUaPhyZyVGTdednd+ZJKnlG7wCN5sn7BjK/Y
 CgjDytBLKqT4ECAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CZnEv7p9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="UMp7Fd/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755869496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BowsHQRUjbGpowq7stAcvbdrpq1Nnai6mrNj1i2oN+w=;
 b=CZnEv7p9ElW3bw435pBIVCFTeZHgLgWYJJ8lLfkFUhIXng9keWUDUyvt4WBHPUOOTIax2s
 Xwnh2hxG6c9uEhtRl2pO/CO7RhM1S6yzFhL6cAL4mQ80Lz6d1TXpBdHrnxA4rKi3cA0xFL
 SL8n1U4V3HHjmTK9mamn+vwkZKSHdpM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755869496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BowsHQRUjbGpowq7stAcvbdrpq1Nnai6mrNj1i2oN+w=;
 b=UMp7Fd/8AYFcq/neYfHw9AEUFGbqaDEk4uVUaPhyZyVGTdednd+ZJKnlG7wCN5sn7BjK/Y
 CgjDytBLKqT4ECAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BC4813A73;
 Fri, 22 Aug 2025 13:31:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UEZHCThxqGgneAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Aug 2025 13:31:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] drm/ast: Remove unused dram_bus_width field
Date: Fri, 22 Aug 2025 14:52:09 +0200
Message-ID: <20250822132846.25376-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822132846.25376-1-tzimmermann@suse.de>
References: <20250822132846.25376-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 6D9421F38E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

The DRAM bus width is not necessary for the driver. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 1 -
 drivers/gpu/drm/ast/ast_main.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e37a55295ed7..403b86f00a54 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -172,7 +172,6 @@ struct ast_device {
 	enum ast_config_mode config_mode;
 	enum ast_chip chip;
 
-	uint32_t dram_bus_width;
 	uint32_t dram_type;
 	uint32_t mclk;
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 830f1c5fe893..0b3fb6856db7 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -242,7 +242,6 @@ static int ast_get_dram_info(struct ast_device *ast)
 		break;
 	case ast_use_defaults:
 	default:
-		ast->dram_bus_width = 16;
 		ast->dram_type = AST_DRAM_1Gx16;
 		if (IS_AST_GEN6(ast))
 			ast->mclk = 800;
@@ -251,11 +250,6 @@ static int ast_get_dram_info(struct ast_device *ast)
 		return 0;
 	}
 
-	if (mcr_cfg & 0x40)
-		ast->dram_bus_width = 16;
-	else
-		ast->dram_bus_width = 32;
-
 	if (IS_AST_GEN6(ast)) {
 		switch (mcr_cfg & 0x03) {
 		case 0:
-- 
2.50.1

