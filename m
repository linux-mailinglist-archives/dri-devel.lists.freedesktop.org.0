Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B3851072
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56C710E667;
	Mon, 12 Feb 2024 10:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ryzjXKVx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcUi8Fm1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ryzjXKVx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FcUi8Fm1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92BD10EBE1;
 Mon, 12 Feb 2024 10:17:17 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5270F1F460;
 Mon, 12 Feb 2024 10:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
 b=ryzjXKVxVyivz8X+4s04GmNvCMAYSpn/MhtM1FQXRNWg6sd+zNgEskFY29ckMNLqhkOF0k
 1/FqdEWFfkLoTDEavrdM3TIyYr4y7j+RpFLWTB1RzmOmmnE8VmHqvJE41yB33eSI5WLOTl
 HC0ACK32pG7aTDvY5OiwbffAC6ohQZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707733036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
 b=FcUi8Fm1S40Wg4ISOVuq2pgpeJ+0DVfhSraJv91TV3aVMr88DrrqCZN7lhR0IMJuT5fj+L
 AFAJxj8xRsfBGoCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707733036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
 b=ryzjXKVxVyivz8X+4s04GmNvCMAYSpn/MhtM1FQXRNWg6sd+zNgEskFY29ckMNLqhkOF0k
 1/FqdEWFfkLoTDEavrdM3TIyYr4y7j+RpFLWTB1RzmOmmnE8VmHqvJE41yB33eSI5WLOTl
 HC0ACK32pG7aTDvY5OiwbffAC6ohQZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707733036;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AlSDol0ID8BkiAee4D1BJaommVQ+eVsswz4SH2nEE5g=;
 b=FcUi8Fm1S40Wg4ISOVuq2pgpeJ+0DVfhSraJv91TV3aVMr88DrrqCZN7lhR0IMJuT5fj+L
 AFAJxj8xRsfBGoCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 0368D13A0E;
 Mon, 12 Feb 2024 10:17:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id h7YgOyvwyWVdBgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Feb 2024 10:17:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/7] fbdev: Clean up include dependencies in header
Date: Mon, 12 Feb 2024 11:13:12 +0100
Message-ID: <20240212101712.23675-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ryzjXKVx;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FcUi8Fm1
X-Spamd-Result: default: False [2.67 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.02)[52.36%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.67
X-Rspamd-Queue-Id: 5270F1F460
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++
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

Remove unnecessary dependencies in the include statements of the
header file <linux/fb.h>. Several files throughout the kernel include
the fbdev header, so reducing dependencies positively affects other
subsystems as well. Also fix up nouveau, which needs backlight.h in
one of its source files.

Thomas Zimmermann (7):
  drm/nouveau: Include <linux/backlight.h>
  fbdev: Do not include <linux/backlight.h> in header
  fbdev: Do not include <linux/fs.h> in header
  fbdev: Do not include <linux/notifier.h> in header
  fbdev: Do not include <linux/slab.h> in header
  fbdev: Clean up forward declarations in header file
  fbdev: Clean up include statements in header file

 drivers/gpu/drm/nouveau/dispnv50/disp.c |  1 +
 include/linux/fb.h                      | 24 +++++++++++++-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.43.0

