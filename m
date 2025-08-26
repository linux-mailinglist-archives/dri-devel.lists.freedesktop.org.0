Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C391B354D0
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 08:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35D10E5E2;
	Tue, 26 Aug 2025 06:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EqyNDsKa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SLVqekdT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EqyNDsKa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SLVqekdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA3610E5CB
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 06:53:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D385120028;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRgtKYXpmQ7OLqMC0m6SXmxG/t7VRs4PErRcdQ1KLJY=;
 b=EqyNDsKaQTdo3S7dVOgYUzTweL1vyYGMvAhwRom7BJXikmUYPQ5scA9G3iMTShW515p1bn
 6lB8o5d0Ei8w8YZmRGRDsgs7rTW9G/Fx90Lpxk6Xo7UHtXAlhxHGcCJApkNjITrAXVzLNY
 bpZ7PB5CjZibFWRZNhmJmufZtqzD0mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRgtKYXpmQ7OLqMC0m6SXmxG/t7VRs4PErRcdQ1KLJY=;
 b=SLVqekdTh2ttK9sHWx+bNmoAXX7jxMPTWsOEIg8bMkrcKFQ7g2n4hED+mG/x5BjMjSPOOz
 x3DxDFyAeM26e5Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756191203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRgtKYXpmQ7OLqMC0m6SXmxG/t7VRs4PErRcdQ1KLJY=;
 b=EqyNDsKaQTdo3S7dVOgYUzTweL1vyYGMvAhwRom7BJXikmUYPQ5scA9G3iMTShW515p1bn
 6lB8o5d0Ei8w8YZmRGRDsgs7rTW9G/Fx90Lpxk6Xo7UHtXAlhxHGcCJApkNjITrAXVzLNY
 bpZ7PB5CjZibFWRZNhmJmufZtqzD0mw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756191203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iRgtKYXpmQ7OLqMC0m6SXmxG/t7VRs4PErRcdQ1KLJY=;
 b=SLVqekdTh2ttK9sHWx+bNmoAXX7jxMPTWsOEIg8bMkrcKFQ7g2n4hED+mG/x5BjMjSPOOz
 x3DxDFyAeM26e5Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D12413A31;
 Tue, 26 Aug 2025 06:53:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yHklJeNZrWhtMQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 06:53:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/6] drm/ast: Remove unused SCU-MPLL and SCU-STRAP values
Date: Tue, 26 Aug 2025 08:49:23 +0200
Message-ID: <20250826065032.344412-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826065032.344412-1-tzimmermann@suse.de>
References: <20250826065032.344412-1-tzimmermann@suse.de>
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

The ast driver used SCU-MPLL and SCU-STRAP to compute the memory
clock. Remove the now unused values.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 492cc8461eb0..41ff880cfdec 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -214,7 +214,7 @@ static int ast_get_dram_info(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct device_node *np = dev->dev->of_node;
-	uint32_t mcr_cfg, mcr_scu_mpll, mcr_scu_strap;
+	uint32_t mcr_cfg;
 
 	switch (ast->config_mode) {
 	case ast_use_dt:
@@ -222,22 +222,13 @@ static int ast_get_dram_info(struct ast_device *ast)
 		 * If some properties are missing, use reasonable
 		 * defaults for GEN5
 		 */
-		if (of_property_read_u32(np, "aspeed,mcr-configuration",
-					 &mcr_cfg))
+		if (of_property_read_u32(np, "aspeed,mcr-configuration", &mcr_cfg))
 			mcr_cfg = 0x00000577;
-		if (of_property_read_u32(np, "aspeed,mcr-scu-mpll",
-					 &mcr_scu_mpll))
-			mcr_scu_mpll = 0x000050C0;
-		if (of_property_read_u32(np, "aspeed,mcr-scu-strap",
-					 &mcr_scu_strap))
-			mcr_scu_strap = 0;
 		break;
 	case ast_use_p2a:
 		ast_write32(ast, 0xf004, 0x1e6e0000);
 		ast_write32(ast, 0xf000, 0x1);
 		mcr_cfg = ast_read32(ast, 0x10004);
-		mcr_scu_mpll = ast_read32(ast, 0x10120);
-		mcr_scu_strap = ast_read32(ast, 0x10170);
 		break;
 	case ast_use_defaults:
 	default:
-- 
2.50.1

