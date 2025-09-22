Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C595CB8F638
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F9C10E38C;
	Mon, 22 Sep 2025 08:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="MbWm1PJ/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UdJ/3zz8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rlCVBaqG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AJwpx3Qm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BD210E38C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 08:01:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F3061F8B0;
 Mon, 22 Sep 2025 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758528079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LeDdhm2PhyHO8oTu+kmY6QT+6VhDFohx1iJw2P7KbGk=;
 b=MbWm1PJ/OUzu/woh1OMAn//CFsGvaV3BeKwlRswtuDBBCFgP8m/jtgaRh8GNXq17uatXls
 DtajUIUnKZl/lz1zmH+SPhK/6u+EDFP+1OhVX9i8bs4K7/nRCqsGMTHMnX7AfkYy66exqH
 k/kVS5aRDxqsVvXXBbLdnZ6H88GRcB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758528079;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LeDdhm2PhyHO8oTu+kmY6QT+6VhDFohx1iJw2P7KbGk=;
 b=UdJ/3zz8gdaeUSGYoDO6stTC+VSyFxzqnJ2sd5CfQ3WdB6QOBZzoFViFglyezCYXcFwvXj
 XhECWzng73Hn3iBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758528074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LeDdhm2PhyHO8oTu+kmY6QT+6VhDFohx1iJw2P7KbGk=;
 b=rlCVBaqG5KT/wMA7CnayjpmOq3QnxGlwGXP3pS9gC/sCTBmX7CNmGhsqrqt7E0JyMl8RB1
 WHPFRYnTYMFw4nAZ4a/iCw5m5lL1tstDNxRvlSBegdmlQ1fHS5xjF887yZEpd7StNJkHlH
 HscYPz5bo5hR+O3Wdsx0cW6NWhyEAiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758528074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=LeDdhm2PhyHO8oTu+kmY6QT+6VhDFohx1iJw2P7KbGk=;
 b=AJwpx3QmcxfPUXoZfeWCihxzHayww+A7W6KoqJrAb8XmF9FytD73f9+Eel5rHN60o2IcHp
 +ZWg0WRIs2TMufDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 11FA71388C;
 Mon, 22 Sep 2025 08:01:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nXUzA0oC0WjyCQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 22 Sep 2025 08:01:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] MAINTAINERS: Add dedicated entry for fbcon
Date: Mon, 22 Sep 2025 09:57:43 +0200
Message-ID: <20250922075821.23236-1-tzimmermann@suse.de>
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
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_TO(0.00)[ffwll.ch,gmx.de];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
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

While fbdev as a whole is obsolete, fbcon is still relevant for
most Linux systems. But it's been under-maintained for some time.
I'm volunteering to keep an eye on fbcon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 838ae3c2b6fc..749844664f8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9666,6 +9666,25 @@ S:	Maintained
 W:	https://floatingpoint.billm.au/
 F:	arch/x86/math-emu/
 
+FRAMEBUFFER CONSOLE
+M:	Thomas Zimmermann <tzimmermann@suse.de>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-fbdev@vger.kernel.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/fb/fbcon.rst
+F:	drivers/video/fbdev/core/bitblit.c
+F:	drivers/video/fbdev/core/fb_logo.c
+F:	drivers/video/fbdev/core/fbcon.c
+F:	drivers/video/fbdev/core/fbcon.h
+F:	drivers/video/fbdev/core/fbcon_ccw.c
+F:	drivers/video/fbdev/core/fbcon_cw.c
+F:	drivers/video/fbdev/core/fbcon_rotate.c
+F:	drivers/video/fbdev/core/fbcon_rotate.h
+F:	drivers/video/fbdev/core/fbcon_ud.c
+F:	drivers/video/fbdev/core/softcursor.c
+F:	drivers/video/fbdev/core/tileblit.c
+
 FRAMEBUFFER CORE
 M:	Simona Vetter <simona@ffwll.ch>
 S:	Odd Fixes
-- 
2.51.0

