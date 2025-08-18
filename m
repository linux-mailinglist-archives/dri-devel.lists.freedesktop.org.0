Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2BB29F84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 12:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1C510E435;
	Mon, 18 Aug 2025 10:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B3JmU40+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P54mdeCe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B3JmU40+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P54mdeCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8B210E428
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 10:49:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F8DB1F44E;
 Mon, 18 Aug 2025 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XadkrTwdTNZR/f4ID8Lrj2WkVCxvKtsABauxJ9Ar6Z4=;
 b=B3JmU40+Znrg3g2AdC9PKYk1O0RHI2AzLzu5BLgIRg3wWIiAO9ROm1R7vmb9BsxHvkymqa
 P2so8hmBKfR74rEanmkMj5fKZXm9I/MDzCXMKwDHqzZ+MeYVJZOUmkiX54tlmZ/Yrqqhsf
 8bLyfWnGDhN+5IHlY1nZVbwt4w+/1IM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XadkrTwdTNZR/f4ID8Lrj2WkVCxvKtsABauxJ9Ar6Z4=;
 b=P54mdeCeoPBRBOZ67ktk4rrVEMJLnRIR4Ps30dt4J9EkrgTDHF8MC6IcnHVn9H0OtfFwRR
 DJ0f8V7oCEskEvCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B3JmU40+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=P54mdeCe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755514185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XadkrTwdTNZR/f4ID8Lrj2WkVCxvKtsABauxJ9Ar6Z4=;
 b=B3JmU40+Znrg3g2AdC9PKYk1O0RHI2AzLzu5BLgIRg3wWIiAO9ROm1R7vmb9BsxHvkymqa
 P2so8hmBKfR74rEanmkMj5fKZXm9I/MDzCXMKwDHqzZ+MeYVJZOUmkiX54tlmZ/Yrqqhsf
 8bLyfWnGDhN+5IHlY1nZVbwt4w+/1IM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755514185;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=XadkrTwdTNZR/f4ID8Lrj2WkVCxvKtsABauxJ9Ar6Z4=;
 b=P54mdeCeoPBRBOZ67ktk4rrVEMJLnRIR4Ps30dt4J9EkrgTDHF8MC6IcnHVn9H0OtfFwRR
 DJ0f8V7oCEskEvCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1B7813686;
 Mon, 18 Aug 2025 10:49:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9izBMUgFo2hQVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 10:49:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/6] fbcon: Move bitops callbacks into separate struct
Date: Mon, 18 Aug 2025 12:36:35 +0200
Message-ID: <20250818104655.235001-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 0F8DB1F44E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[ffwll.ch,gmx.de,vger.kernel.org,lists.freedesktop.org];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[6]; FREEMAIL_ENVRCPT(0.00)[gmx.de]
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

Instances of fbcon use a number callbacks to support tile-based
drawing or console rotation. The fields are writeable in struct
fbcon_ops. Each case; unrotated, various rotated and tile-based
drawing; uses a set of related calbacks. Updating these 'bitops'
at runtime is spread throughout various helper functions.

This series puts related callbacks into dedicated instances of the
new type struct fbcon_bitops. Changing the callbacks at runtime
then only requires to pick the correct instance. It further allows
the various struct fbcon_bitops' to be declared 'static const', which
makes them write-protected at runtime.

Makes the fbcon bitops easier and safer to use and modify.

Thomas Zimmermann (6):
  fbcon: Fix empty lines in fbcon.h
  fbcon: Rename struct fbcon_ops to struct fbcon
  fbcon: Set rotate_font callback with related callbacks
  fbcon: Move fbcon callbacks into struct fbcon_bitops
  fbcon: Streamline setting rotated/unrotated bitops
  fbcon: Pass struct fbcon to callbacks in struct fbcon_bitops

 drivers/video/fbdev/core/bitblit.c      | 148 ++++----
 drivers/video/fbdev/core/fb_internal.h  |   2 +
 drivers/video/fbdev/core/fbcon.c        | 459 ++++++++++++------------
 drivers/video/fbdev/core/fbcon.h        |  33 +-
 drivers/video/fbdev/core/fbcon_ccw.c    | 180 +++++-----
 drivers/video/fbdev/core/fbcon_cw.c     | 172 ++++-----
 drivers/video/fbdev/core/fbcon_rotate.c |  47 +--
 drivers/video/fbdev/core/fbcon_rotate.h |  18 +-
 drivers/video/fbdev/core/fbcon_ud.c     | 192 +++++-----
 drivers/video/fbdev/core/softcursor.c   |  18 +-
 drivers/video/fbdev/core/tileblit.c     |  49 +--
 11 files changed, 681 insertions(+), 637 deletions(-)

-- 
2.50.1

