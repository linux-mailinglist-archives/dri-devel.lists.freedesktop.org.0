Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB4A14DA1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 11:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BFE10E306;
	Fri, 17 Jan 2025 10:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UFssp3hu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oWIR4Igg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hMtFN4Z7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UoKsCIex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E183D10E18B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 10:34:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EC211F37C;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXch0KQxu/QTL6KcwqkbzgYsnNMXxSQkjf0C/B/Cg2A=;
 b=UFssp3huXM/mDwPE4z48a2jsIm7WrLjDCfliSQ164ObP09H89PVDIoKLbtIyr6/GUDWg2i
 tTKPCcBHOy6GhG1Q1a7nESCME5FFz3chFN0DC8suUs7hTsmCJrJ3dW5mt92D3teDf6MlEp
 FZSP56D2wSco3CxW++csPsu4a/xXad0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXch0KQxu/QTL6KcwqkbzgYsnNMXxSQkjf0C/B/Cg2A=;
 b=oWIR4IggxSkjRfM0U6OYLYKA5hElIjI++hxdZMnW6sj9iSyc8LJ2IIyi63vkOY6bkqPeg8
 BtSGXlRy/zZXaWBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737110095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXch0KQxu/QTL6KcwqkbzgYsnNMXxSQkjf0C/B/Cg2A=;
 b=hMtFN4Z72dtN+caiiYNnzTXI3UriyXu06QlC7XxWDV0r1rgM0ldYLo0VhtIbgXHaCVwrbD
 EPTJX1BTaGQLSbfM1MFIrCRhrC6uzsNmtGze6qKXB2IFOgiaWL1Zn9Y+nH73Tu0D/hzQCK
 5wYOykFgo6yKmfSj6cfisS4Xmaxb2po=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737110095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXch0KQxu/QTL6KcwqkbzgYsnNMXxSQkjf0C/B/Cg2A=;
 b=UoKsCIexzD+s4ZYVxWi6n96q2om8Kp79QBgSYMGH9GsQk+tmEvhM5mvZXMz8Y3C9qUlaTy
 3t+ixBRPpC+xz4Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 74DC913A30;
 Fri, 17 Jan 2025 10:34:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sPY4G08yimewLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jan 2025 10:34:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/8] drm/ast: Detect wide-screen support before creating
 modeset pipeline
Date: Fri, 17 Jan 2025 11:29:06 +0100
Message-ID: <20250117103450.28692-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250117103450.28692-1-tzimmermann@suse.de>
References: <20250117103450.28692-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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

Wide-screen support is relevant for mode validation. Do not detect it
before setting up the mode-setting pipeline. Gets the function call out
of the way of other initialization code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index bc37c65305d48..037d389ab630d 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -290,7 +290,6 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 	ast->regs = regs;
 	ast->ioregs = ioregs;
 
-	ast_detect_widescreen(ast);
 	ast_detect_tx_chip(ast, need_post);
 
 	ret = ast_get_dram_info(ast);
@@ -315,6 +314,8 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 			drm_info(dev, "failed to map reserved buffer!\n");
 	}
 
+	ast_detect_widescreen(ast);
+
 	ret = ast_mode_config_init(ast);
 	if (ret)
 		return ERR_PTR(ret);
-- 
2.47.1

