Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAF8A2ACAC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B0B10E8A0;
	Thu,  6 Feb 2025 15:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="SZYN8cYg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XHBCv36H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZYN8cYg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XHBCv36H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4810E23C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:40:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 136002111F;
 Thu,  6 Feb 2025 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/xgMD1Faxm0qO52k1H+QacINyfxkkqf6yxZmV6fupSY=;
 b=SZYN8cYgsKK/9+T1yHibQOVLk+KmGphs8gkCsN4MRriCmI49+9jeWbqOjdz0Td83O+Ghny
 9nILAU4p0ukFO5qAOsIQ53ZlCFo9BtEpOGhq+8iTRk1zVmmOa7A2weaoA9E9v3obM0eyXW
 fZFx0LMGGSuqNfEM1sRlCHns0C7XPeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/xgMD1Faxm0qO52k1H+QacINyfxkkqf6yxZmV6fupSY=;
 b=XHBCv36HfiPGvcW5b/BeP+qY0LTqeCcBgtEv9m12QhNRsTcmaaScrgJUUjT5PIr3YufOHj
 t0DqhWLvlGc8W8Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738856444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/xgMD1Faxm0qO52k1H+QacINyfxkkqf6yxZmV6fupSY=;
 b=SZYN8cYgsKK/9+T1yHibQOVLk+KmGphs8gkCsN4MRriCmI49+9jeWbqOjdz0Td83O+Ghny
 9nILAU4p0ukFO5qAOsIQ53ZlCFo9BtEpOGhq+8iTRk1zVmmOa7A2weaoA9E9v3obM0eyXW
 fZFx0LMGGSuqNfEM1sRlCHns0C7XPeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738856444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/xgMD1Faxm0qO52k1H+QacINyfxkkqf6yxZmV6fupSY=;
 b=XHBCv36HfiPGvcW5b/BeP+qY0LTqeCcBgtEv9m12QhNRsTcmaaScrgJUUjT5PIr3YufOHj
 t0DqhWLvlGc8W8Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C779513697;
 Thu,  6 Feb 2025 15:40:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UD1lL/vXpGf4PAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 15:40:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: pavel@ucw.cz, lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, simona@ffwll.ch
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC PATCH 00/13] backlight, lcd, led: Remove fbdev dependencies
Date: Thu,  6 Feb 2025 16:30:19 +0100
Message-ID: <20250206154033.697495-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ucw.cz,kernel.org,gmail.com,gmx.de,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

This series removes the last dependencies on fbdev from the backlight,
lcd and led subsystems. Each depends on fbdev events to track display
state. Make fbdev inform each subsystem via a dedicated interface
instead.

Patches 1 to 3 make fbdev track blank state for each display, so
that backlight code doesn't have to.

Patches 4 to 6 remove fbdev event handling from backlight code. Patches
7 to 9 remove fbdev event handling from lcd code and patches 10 to 12
do the same for led's backlight trigger.

The final patch removes the event constants from fbdev.

With the series applied, the three subsystems do no longer depend
on fbdev. It's also a clean up for fbdev. Fbdev used to send out a
large number of events. That mechanism has been deprecated for some
time and converted call to dedicated functions instead.

Testing is very welcome, as I don't have the hardware to really test
this series.

Thomas Zimmermann (13):
  fbdev: Rework fb_blank()
  fbdev: Track display blanking state
  fbdev: Send old blank state in FB_EVENT_BLANK
  backlight: Implement fbdev tracking with blank state from event
  backlight: Move blank-state handling into helper
  backlight: Replace fb events with a dedicated function call
  backlight: lcd: Maintain global list of lcd devices
  backlight: lcd: Move event handling into helpers
  backlight: lcd: Replace fb events with a dedicated function call
  leds: backlight trigger: Maintain global list of led backlight
    triggers
  leds: backlight trigger: Move blank-state handling into helper
  leds: backlight trigger: Replace fb events with a dedicated function
    call
  fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  49 +++++-----
 drivers/video/backlight/backlight.c      |  93 +++++--------------
 drivers/video/backlight/lcd.c            | 109 +++++++++--------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 +++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  88 +++++++++++++++---
 drivers/video/fbdev/core/fbsysfs.c       |   8 +-
 include/linux/backlight.h                |  22 ++---
 include/linux/fb.h                       |  12 +--
 include/linux/lcd.h                      |  12 ++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 204 insertions(+), 208 deletions(-)

-- 
2.48.1

