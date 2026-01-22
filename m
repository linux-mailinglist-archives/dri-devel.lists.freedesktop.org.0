Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN7eADcicmmPdQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:12:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44E671B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8E010E0C1;
	Thu, 22 Jan 2026 13:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aCdKwFCT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="exeNAx9G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TTb09fP0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PcJ9F+JU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B0510E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:12:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0D1233717;
 Thu, 22 Jan 2026 13:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769087537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6PLEneN7/qHi7h1Wld0jsWaqgiXUPVpuEcgtslwiTZg=;
 b=aCdKwFCT1YgsPnmgGLyQNB293aO6RrkffG0BVrPQTP9pESCdSkwEqk6AgGmoMGTrli2ikb
 yMXGyRJpBVJkmWme1ceYWhPk8B5Hpomn0HcTmbpCOf9oj+NZl0WUYq8X+VgGoIVgK+kDWD
 PSF6aFS407tAr13u2C2Y6z9D2GMz0tQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769087537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6PLEneN7/qHi7h1Wld0jsWaqgiXUPVpuEcgtslwiTZg=;
 b=exeNAx9GVdpHsE0jiXNzZ80Pv7q9Q65j+gtgBzV4E2RxNzhhrwZumcdsW8nnxXixvhUXyO
 hB3whReCY40facCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1769087536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6PLEneN7/qHi7h1Wld0jsWaqgiXUPVpuEcgtslwiTZg=;
 b=TTb09fP0pbh3hjz8FUOZfplY7SOgSNUQvtZyx8el3+ZeooqHceflhxdgV5qJkiDMw8IjlT
 aTL0xag/l3iJ31/DVg5eOdq9YK1uWjdVEUIumM98mfzt1nHNnNVEC9YauVzh40kqpgIYks
 MS7MKH5vSvv7HEE8Nkg2KjqoY6tNTUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1769087536;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=6PLEneN7/qHi7h1Wld0jsWaqgiXUPVpuEcgtslwiTZg=;
 b=PcJ9F+JUlB5axMf9UcKHFr/cySki4gSCgz8WJ2tFTHpeOQiPvCKkoTov7NX68O6K02x29z
 ZuCknDBcHmlnz1Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4E2313533;
 Thu, 22 Jan 2026 13:12:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yLrwKjAicmlgMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 22 Jan 2026 13:12:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	jayalk@intworks.biz
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] fbdev: defio: Protect against device/module removal
Date: Thu, 22 Jan 2026 14:08:28 +0100
Message-ID: <20260122131213.992810-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:simona@ffwll.ch,m:jayalk@intworks.biz,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,intworks.biz];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Queue-Id: 5E44E671B7
X-Rspamd-Action: no action

There's a long-standing bug in defio where the framebuffer device or
module gets removed while mmap'ed areas of the framebuffer memory
persists in userspace. Page faults in the area then operate on defined
state.

Patches 1 and 2 fix these problems. Patches 3 and 4 build upon the fix
and put defio state into the correct places.

Thomas Zimmermann (4):
  fbdev: defio: Disconnect deferred I/O from the lifetime of struct
    fb_info
  fbdev: defio: Keep module reference from VMAs
  fbdev: defio: Move variable state into struct fb_deferred_io_state
  fbdev: defio: Move pageref array to struct fb_deferred_io_state

 drivers/video/fbdev/core/fb_defio.c | 266 ++++++++++++++++++++--------
 include/linux/fb.h                  |   9 +-
 2 files changed, 195 insertions(+), 80 deletions(-)


base-commit: a3ecd278f9a05323fab7471760a7ea10081251d6
-- 
2.52.0

