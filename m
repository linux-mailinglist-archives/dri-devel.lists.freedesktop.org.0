Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF70886833
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 09:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA83B10EB80;
	Fri, 22 Mar 2024 08:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0S3wt8em";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="93bv81oG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tvbeTPTp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pA+W3Tr9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B385410EB80
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 08:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 016C05FB69;
 Fri, 22 Mar 2024 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711096209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GiUnFDgqNov/IFO4HBVqrimv4mN9kMkaWe5OzF0aaTM=;
 b=0S3wt8emF8dEf6VbwlC6douPH6aoO61LLFBotox24XrUGgM/+bVd1wEv1EFUfwviT9YOue
 P9FvKp7r+67dk0v64Z5hrBhFBrbxUT3dozs0ICstPdqVS2zdRsUpiNrZDEQL1YR1XjoVQZ
 VdemcEAEW59FcykXPjD3NhHFr6oEG40=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711096209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GiUnFDgqNov/IFO4HBVqrimv4mN9kMkaWe5OzF0aaTM=;
 b=93bv81oGXgeFpfYT2QV3ndduFHv9e0J+thCMwHu8V6bbuYx5etsO3MaL8iJNXkRELwvYSI
 cJQ7y7dC/Lehp8DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711096208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GiUnFDgqNov/IFO4HBVqrimv4mN9kMkaWe5OzF0aaTM=;
 b=tvbeTPTpgWOihB4o/wGhNvE7uf+UuJv3t7HY6c4CIYBG1iWqgRxGPz64DxeS/RK/cJi/og
 OMDJXlcHECCT68gNupmB5BFZPyp2QtZeMa0IyxKPsz3TilDoOcdna9JWX6jFi20AQxEInu
 0yFxxUpBN/GnXoBe6mzTAG/azfD9mKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711096208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GiUnFDgqNov/IFO4HBVqrimv4mN9kMkaWe5OzF0aaTM=;
 b=pA+W3Tr9SQdht+oJcMsv5gqG1JRpN9LzwA9sYFhKp/MVZTZ0dml3PnpBJSkIU4I72AgZx2
 Xw9CnUsekUhPezCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4CAC132FF;
 Fri, 22 Mar 2024 08:30:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ciPqJo9B/WW0MgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Mar 2024 08:30:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: nbowler@draconx.ca,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, stable@vger.kernel.org
Subject: [PATCH] fbdev: Select I/O-memory framebuffer ops for SBus
Date: Fri, 22 Mar 2024 09:29:46 +0100
Message-ID: <20240322083005.24269-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 6.57
X-Spam-Flag: NO
X-Spamd-Bar: ++++++
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tvbeTPTp;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pA+W3Tr9
X-Spamd-Result: default: False [6.57 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[draconx.ca,gmx.de,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-0.14)[67.89%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[renesas];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_SPAM_SHORT(1.52)[0.505];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[12]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[draconx.ca:email,ravnborg.org:email,arndb.de:email,ffwll.ch:email,glider.be:email,suse.de:dkim,suse.de:email,gmx.de:email,lists.freedesktop.org:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: ******
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 016C05FB69
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

Framebuffer I/O on the Sparc Sbus requires read/write helpers for
I/O memory. Select FB_IOMEM_FOPS accordingly.

Reported-by: Nick Bowler <nbowler@draconx.ca>
Closes: https://lore.kernel.org/lkml/5bc21364-41da-a339-676e-5bb0f4faebfb@draconx.ca/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 8813e86f6d82 ("fbdev: Remove default file-I/O implementations")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/video/fbdev/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a61b8260b8f36..edced74f0eeaf 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -494,6 +494,7 @@ config FB_SBUS_HELPERS
 	select FB_CFB_COPYAREA
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 
 config FB_BW2
 	bool "BWtwo support"
@@ -514,6 +515,7 @@ config FB_CG6
 	depends on (FB = y) && (SPARC && FB_SBUS)
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the CGsix (GX, TurboGX)
 	  frame buffer.
@@ -523,6 +525,7 @@ config FB_FFB
 	depends on FB_SBUS && SPARC64
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
+	select FB_IOMEM_FOPS
 	help
 	  This is the frame buffer device driver for the Creator, Creator3D,
 	  and Elite3D graphics boards.
-- 
2.44.0

