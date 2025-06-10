Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8957AAD3453
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2E210E4F9;
	Tue, 10 Jun 2025 11:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BlewGn/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENKfIeIP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BlewGn/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ENKfIeIP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7887010E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8EAD11F84B;
 Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ0a/rl4uwGXRnCTX7S7dkRHmABQsdo0o8pUQ5hNdro=;
 b=BlewGn/vta2C1ZOkpvoHdiR5kDZc7ktyDmUyhq2DKS89E6OkpTd/4AJ94GqQc4SX+zb6qn
 jkR3Z8mRaa3SAU8PO2B/fE+CzDNCXNn8dMT9LTLAOsNUciZpjXpkRjm0OOoYONBqCaMfjm
 +hHRvIWcw/zlMGeYg/Wn6gWpC7KwlmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ0a/rl4uwGXRnCTX7S7dkRHmABQsdo0o8pUQ5hNdro=;
 b=ENKfIeIP9hW03gR5CJqW1Cep9JVB4nnX1iRwvIGJimGf17bKRHwAfBEIOL1guX70vxxRRx
 iJgnVxrthyrkqWCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ0a/rl4uwGXRnCTX7S7dkRHmABQsdo0o8pUQ5hNdro=;
 b=BlewGn/vta2C1ZOkpvoHdiR5kDZc7ktyDmUyhq2DKS89E6OkpTd/4AJ94GqQc4SX+zb6qn
 jkR3Z8mRaa3SAU8PO2B/fE+CzDNCXNn8dMT9LTLAOsNUciZpjXpkRjm0OOoYONBqCaMfjm
 +hHRvIWcw/zlMGeYg/Wn6gWpC7KwlmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gQ0a/rl4uwGXRnCTX7S7dkRHmABQsdo0o8pUQ5hNdro=;
 b=ENKfIeIP9hW03gR5CJqW1Cep9JVB4nnX1iRwvIGJimGf17bKRHwAfBEIOL1guX70vxxRRx
 iJgnVxrthyrkqWCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FC8C13A17;
 Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iK1RCvsQSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/14] fbdev: Remove trailing whitespaces
Date: Tue, 10 Jun 2025 12:56:34 +0200
Message-ID: <20250610105948.384540-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
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

Fix coding style.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/macmodes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/macmodes.c b/drivers/video/fbdev/macmodes.c
index d6be3c67d3df..cd689161f561 100644
--- a/drivers/video/fbdev/macmodes.c
+++ b/drivers/video/fbdev/macmodes.c
@@ -236,7 +236,7 @@ int mac_vmode_to_var(int vmode, int cmode, struct fb_var_screeninfo *var)
 	case CMODE_8:
 	    var->bits_per_pixel = 8;
 	    var->red.offset = 0;
-	    var->red.length = 8;   
+	    var->red.length = 8;
 	    var->green.offset = 0;
 	    var->green.length = 8;
 	    var->blue.offset = 0;
-- 
2.49.0

