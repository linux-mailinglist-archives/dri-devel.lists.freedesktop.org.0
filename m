Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9767EAD3454
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074010E4FF;
	Tue, 10 Jun 2025 11:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b6UxFmg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fu8SklUa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b6UxFmg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fu8SklUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242A210E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF77B211D1;
 Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
 b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
 0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
 TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
 b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
 zNa8VA46w0gKMcDQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b6UxFmg3;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fu8SklUa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
 b=b6UxFmg38AbXz4g1qm7BgBI0PAL2NgSHJ5LJkAOX1gZH9xgxn/avIQh/8yAAaIMUYeUjwY
 0x69A7tp1WYJgjd1ORM/lL9K5+90N2ceP3AUOXhMWMD+WBokO/sfyRqMWmVzEbzcYwoYqH
 TI3IiEXJ6fPpX5TXN2ghhyz4GoD+jkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6G4IDIDNKFIlIZgpoCkC+PXCI41saXphXc1w6SdcOU=;
 b=fu8SklUalOzO6Tu2Zdynp4px4puRTCU94T+CuD3dXNIzX/GdTT9YIyCsZkkHC/FRlpQgsk
 zNa8VA46w0gKMcDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5931213964;
 Tue, 10 Jun 2025 11:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OKicFPwQSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/14] fbdev/cyber2000fb: Unexport symbols
Date: Tue, 10 Jun 2025 12:56:37 +0200
Message-ID: <20250610105948.384540-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AF77B211D1
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
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

Fix the compile-time warning

  drivers/video/fbdev/cyber2000fb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/cyber2000fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 986760b90465..fcc565b2d98c 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1089,7 +1089,6 @@ void cyber2000fb_enable_extregs(struct cfb_info *cfb)
 		cyber2000_grphw(EXT_FUNC_CTL, old, cfb);
 	}
 }
-EXPORT_SYMBOL(cyber2000fb_enable_extregs);
 
 /*
  * Disable access to the extended registers
@@ -1109,7 +1108,6 @@ void cyber2000fb_disable_extregs(struct cfb_info *cfb)
 	else
 		cfb->func_use_count -= 1;
 }
-EXPORT_SYMBOL(cyber2000fb_disable_extregs);
 
 /*
  * Attach a capture/tv driver to the core CyberX0X0 driver.
@@ -1135,7 +1133,6 @@ int cyber2000fb_attach(struct cyberpro_info *info, int idx)
 
 	return int_cfb_info != NULL;
 }
-EXPORT_SYMBOL(cyber2000fb_attach);
 
 /*
  * Detach a capture/tv driver from the core CyberX0X0 driver.
@@ -1143,7 +1140,6 @@ EXPORT_SYMBOL(cyber2000fb_attach);
 void cyber2000fb_detach(int idx)
 {
 }
-EXPORT_SYMBOL(cyber2000fb_detach);
 
 #ifdef CONFIG_FB_CYBER2000_DDC
 
-- 
2.49.0

