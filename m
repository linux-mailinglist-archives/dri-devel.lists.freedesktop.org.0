Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC6A6B841
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA27910E770;
	Fri, 21 Mar 2025 09:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YCadtz7w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhcCY13N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YCadtz7w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhcCY13N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937DF10E770
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:58:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CA6A1FB61;
 Fri, 21 Mar 2025 09:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
 b=YCadtz7wnAgiYrSGOKPoELOqS82RMQBMuATWBcO2vvt+3JY3SksQuNdgkgVxD/9ZHu2RM4
 3xgg93CUfjnjre0pi64I6X9yoq6ZSNY+Azc2paXqklDwlRXgqnlGC3s8NrqqWKGED4eyAI
 eRNJu3JvPaZaCbyWS/Vn9OiTbZ2DoXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
 b=PhcCY13NEdFVBsT0EI0mX6gxCiWd/e1GFZ1nZlfE/lvWzex9r8GN3Zrevo+T9AUqqkyyyx
 20lZ57Df4iA3FqBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YCadtz7w;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PhcCY13N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742551113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
 b=YCadtz7wnAgiYrSGOKPoELOqS82RMQBMuATWBcO2vvt+3JY3SksQuNdgkgVxD/9ZHu2RM4
 3xgg93CUfjnjre0pi64I6X9yoq6ZSNY+Azc2paXqklDwlRXgqnlGC3s8NrqqWKGED4eyAI
 eRNJu3JvPaZaCbyWS/Vn9OiTbZ2DoXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742551113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uCXBG/+T2WXWSYNFzDGd2Rzeco35M4yA69VIAwbOdMg=;
 b=PhcCY13NEdFVBsT0EI0mX6gxCiWd/e1GFZ1nZlfE/lvWzex9r8GN3Zrevo+T9AUqqkyyyx
 20lZ57Df4iA3FqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C67F0139AA;
 Fri, 21 Mar 2025 09:58:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mKEeL0g43Wd9JAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Mar 2025 09:58:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 00/11] backlight, lcd, led: Remove fbdev dependencies
Date: Fri, 21 Mar 2025 10:53:53 +0100
Message-ID: <20250321095517.313713-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1CA6A1FB61
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,ucw.cz,gmail.com,gmx.de,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

This series removes the remaining dependencies on fbdev from the
backlight, lcd and led subsystems. Each depends on fbdev events to
track display state. Make fbdev inform each subsystem via a dedicated
interface instead.

Patches 1 to 3 make fbdev track blank state for each display, so that
backlight code doesn't have to.

Patches 4 to 6 remove fbdev event handling from backlight code. Patches
7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
do the same for led's backlight trigger.

The final patch removes the event constants from fbdev.

With the series applied, the three subsystems do no longer depend on
fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
number of events. That mechanism has been deprecated for some time and
converted call to dedicated functions instead.

Testing is very welcome, as I don't have the hardware to test this
series.

v4:
- protect backlight declarations with IS_REACHABLE()
v3:
- export several symbols
- static-inline declare empty placeholders
v2:
- avoid IS_REACHABLE() in source file (Lee)
- simplify several interfaces and helpers
- use lock guards
- initialize global lists and mutices

Thomas Zimmermann (11):
  fbdev: Rework fb_blank()
  fbdev: Track display blanking state
  fbdev: Send old blank state in FB_EVENT_BLANK
  backlight: Implement fbdev tracking with blank state from event
  backlight: Move blank-state handling into helper
  backlight: Replace fb events with a dedicated function call
  backlight: lcd: Move event handling into helpers
  backlight: lcd: Replace fb events with a dedicated function call
  leds: backlight trigger: Move blank-state handling into helper
  leds: backlight trigger: Replace fb events with a dedicated function
    call
  fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
 drivers/video/backlight/backlight.c      |  93 +++++--------------
 drivers/video/backlight/lcd.c            | 108 +++++++++--------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 +++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
 drivers/video/fbdev/core/fbsysfs.c       |   8 +-
 include/linux/backlight.h                |  32 +++----
 include/linux/fb.h                       |  12 +--
 include/linux/lcd.h                      |  21 ++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 215 insertions(+), 208 deletions(-)

-- 
2.48.1

