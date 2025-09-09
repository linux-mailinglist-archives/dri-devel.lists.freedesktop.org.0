Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1D6B4FCAF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A1110E733;
	Tue,  9 Sep 2025 13:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Z7w9VLJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sz3gLo3D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z7w9VLJH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sz3gLo3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B919610E732
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:23:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5131D5C75D;
 Tue,  9 Sep 2025 13:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757424215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDmmUOHKWhWUjR7bSj4NSt8nFxQcRcKVIa/m9VzO5Ls=;
 b=Z7w9VLJHF0/XyuUgy0ommr0+e9BbXOH0Ylvk10k8vL3RR2grXTv85nu7D/p0gTgjmZy4AO
 /jncADVRjlJZNlu/Bd9pNwCU0JXVPZBbyYp1q4qjW/IA0JdMmKyDZAScRY49x/hj1q+uBF
 5LaAKcOW5seA37YGzzlRdMsm5eISY60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757424215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDmmUOHKWhWUjR7bSj4NSt8nFxQcRcKVIa/m9VzO5Ls=;
 b=sz3gLo3DYrL6tImwBtdR/PhlcAHcpEyBuGdOODtrfToU27l8Dc4jBtUF/0wBGMzTyOScq6
 h+frezhsRtzVQUAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z7w9VLJH;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sz3gLo3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1757424215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDmmUOHKWhWUjR7bSj4NSt8nFxQcRcKVIa/m9VzO5Ls=;
 b=Z7w9VLJHF0/XyuUgy0ommr0+e9BbXOH0Ylvk10k8vL3RR2grXTv85nu7D/p0gTgjmZy4AO
 /jncADVRjlJZNlu/Bd9pNwCU0JXVPZBbyYp1q4qjW/IA0JdMmKyDZAScRY49x/hj1q+uBF
 5LaAKcOW5seA37YGzzlRdMsm5eISY60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1757424215;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDmmUOHKWhWUjR7bSj4NSt8nFxQcRcKVIa/m9VzO5Ls=;
 b=sz3gLo3DYrL6tImwBtdR/PhlcAHcpEyBuGdOODtrfToU27l8Dc4jBtUF/0wBGMzTyOScq6
 h+frezhsRtzVQUAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DAE213A56;
 Tue,  9 Sep 2025 13:23:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8N7aBVcqwGgmXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Sep 2025 13:23:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	arnd@arndb.de,
	soci@c64.rulez.org
Cc: daniel.palmer@sony.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] fbdev: Make drivers depend on FB_TILEBLITTING
Date: Tue,  9 Sep 2025 15:19:30 +0200
Message-ID: <20250909132047.152612-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909132047.152612-1-tzimmermann@suse.de>
References: <20250909132047.152612-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 5131D5C75D
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
 MIME_TRACE(0.00)[0:+]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,arndb.de,c64.rulez.org];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:dkim,suse.de:mid,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_SEVEN(0.00)[7];
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

The option CONFIG_FB_TILEBLITTING is controlled by the user. Selecting
it from drivers can lead to cyclic dependencies within the config. In
fbcon, there's special handling for tile blitting, which currently
cannot be disabled without first disabling the relevant fbdev drivers.
Fix the Kconfig dependency to make it work.

Some guidelines for using select can be found in the kernel docs at [1].

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.16/source/Documentation/kbuild/kconfig-language.rst#L147 # [1]
---
 drivers/video/fbdev/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index c21484d15f0c..6cea1449b4c5 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -816,11 +816,11 @@ config FB_I810_I2C
 config FB_MATROX
 	tristate "Matrox acceleration"
 	depends on FB && PCI
+	depends on FB_TILEBLITTING
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select FB_TILEBLITTING
 	select FB_MACMODES if PPC_PMAC
 	help
 	  Say Y here if you have a Matrox Millennium, Matrox Millennium II,
@@ -1053,11 +1053,11 @@ config FB_ATY_BACKLIGHT
 config FB_S3
 	tristate "S3 Trio/Virge support"
 	depends on FB && PCI && HAS_IOPORT
+	depends on FB_TILEBLITTING
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
@@ -1258,11 +1258,11 @@ config FB_VOODOO1
 config FB_VT8623
 	tristate "VIA VT8623 support"
 	depends on FB && PCI && HAS_IOPORT
+	depends on FB_TILEBLITTING
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
@@ -1296,11 +1296,11 @@ config FB_TRIDENT
 config FB_ARK
 	tristate "ARK 2000PV support"
 	depends on FB && PCI && HAS_IOPORT
+	depends on FB_TILEBLITTING
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_IOMEM_FOPS
-	select FB_TILEBLITTING
 	select FB_SVGALIB
 	select VGASTATE
 	select FONT_8x16 if FRAMEBUFFER_CONSOLE
-- 
2.51.0

