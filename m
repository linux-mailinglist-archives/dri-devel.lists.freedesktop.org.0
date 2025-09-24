Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06EBB98EB9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81AC810E6B3;
	Wed, 24 Sep 2025 08:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="A+p3rvLV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lhcoF7HB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gwRgloC2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E618Y3n+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0F510E6B3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:37:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BAEC41F7A0;
 Wed, 24 Sep 2025 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758703019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxliJjpJtcdzbJMqAzFEygmY6QomSMl3ih5Uoc2zLbk=;
 b=A+p3rvLVwxITMLVepA12ek1SbPAlIwcjujDFaM7Y4pKQD/SmsXtF+gqa95wC4POZsbSbhp
 oNGQuFiXJfjChYX61X9JDgP+dV3EEB/O8WSLIYX8sNH036fjLyHAcJiT7cDAq2/3TVxaJy
 RbF0Y9i5LE5KJ5fOGSRvXieUlFIxCQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758703019;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxliJjpJtcdzbJMqAzFEygmY6QomSMl3ih5Uoc2zLbk=;
 b=lhcoF7HBnodmo470+E1t2QlmqpQQlzPJjkHagpR6W/QQ7W0WCrAHsrtEgpm7pyN3b+g22Z
 lVn3ZSPxY24+OeDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758703018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxliJjpJtcdzbJMqAzFEygmY6QomSMl3ih5Uoc2zLbk=;
 b=gwRgloC23/b6JPcSj5Zja9sxvE22R5nW1GZeKq1mBS/bEbDu5LFrt0Q2dYKajZfzRneVtN
 MS0UZcxx4Bjmg7+2rN2FsW4rVBvHDaqI1A3/QZswwI+amGG65n0z4ixERMM/t0SsttYRT1
 4zBu6Xc7AIo4IJtoYHLc2GzeoYnsD7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758703018;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=pxliJjpJtcdzbJMqAzFEygmY6QomSMl3ih5Uoc2zLbk=;
 b=E618Y3n+X/mgkFFqb5VSomM7doCwuXFVoXIts8eviZv/V5yaOUCNxAVd4pFQSJwfn6ORSU
 ic2cV7tcfzdSqfBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92CCC13A61;
 Wed, 24 Sep 2025 08:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qapiIqqt02hFAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 24 Sep 2025 08:36:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	arnd@arndb.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] fbdev: Make drivers depend on LCD_CLASS_DEVICE
Date: Wed, 24 Sep 2025 10:33:40 +0200
Message-ID: <20250924083411.165979-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_TO(0.00)[gmx.de,arndb.de];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]
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

LCD_CLASS_DEVICE is the user-controlled option that enables the LCD
display subsystem. Do not select it from fbdev drivers. Selecting it
from drivers can lead to cyclic dependencies within the config.

Some guidelines for using select can be found in the kernel docs at [1].

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.16/source/Documentation/kbuild/kconfig-language.rst#L147 # [1]
---
 drivers/video/fbdev/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 6cea1449b4c5..0bea7eae6161 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -126,9 +126,9 @@ config FB_ACORN
 config FB_CLPS711X
 	tristate "CLPS711X LCD support"
 	depends on FB && (ARCH_CLPS711X || COMPILE_TEST)
+	depends on LCD_CLASS_DEVICE
 	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
-	select LCD_CLASS_DEVICE
 	select VIDEOMODE_HELPERS
 	help
 	  Say Y to enable the Framebuffer driver for the Cirrus Logic
@@ -150,7 +150,7 @@ config FB_IMX
 	tristate "Freescale i.MX1/21/25/27 LCD support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on ARCH_MXC || COMPILE_TEST
-	select LCD_CLASS_DEVICE
+	depends on LCD_CLASS_DEVICE
 	select FB_IOMEM_HELPERS
 	select FB_MODE_HELPERS
 	select VIDEOMODE_HELPERS
-- 
2.51.0

