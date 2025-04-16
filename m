Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956B6A8B41C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A910E3A6;
	Wed, 16 Apr 2025 08:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="calm0h0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ulET7mtr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UqByA9vq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SSQ3Yofc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645B910E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:42:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03E132115E;
 Wed, 16 Apr 2025 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744792925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4/an8PTPTXnpDWJ4pqiRdLbas9K7aIHlPGUsR84ZNDg=;
 b=calm0h0pYW6x+p3G+msmBUDRw+9sdVTNO3S9Lis8hLDfPLFhC3rtZj2pVIFyvJGbbF9c4C
 m0kQQX/AdRajvcj+nyB31rKpdWql2P26yK6H4oJ2mikdYxtzNAvj4ecAYg8QLsK/6sQ+XF
 Toh435ayeoM83vsZ3YZyGbKJyB4IhAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744792925;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4/an8PTPTXnpDWJ4pqiRdLbas9K7aIHlPGUsR84ZNDg=;
 b=ulET7mtrbxqoqQZnsWVGIKg+3ZpRTzwuxhsM8m9AgCRF65NyqHESRWATqECDyXQTcYRFRm
 nRT3C+cCy2uZRfCQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UqByA9vq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SSQ3Yofc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744792924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4/an8PTPTXnpDWJ4pqiRdLbas9K7aIHlPGUsR84ZNDg=;
 b=UqByA9vqaZy9cmpUc7OGhpbtEuVduKvdttFFa3rOpySpFqb3/hfEJrEvMbeE+PdkPpqyXY
 HUJO5AxZbUIh29TZ9EJlRLimUKoK2cUYg0hzs9lifhlXapnFjYewv90SNjM8tOkQQaFDe3
 PCo1u8NbEQBmBdJ9+pjZ1ZFLwLIQxkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744792924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4/an8PTPTXnpDWJ4pqiRdLbas9K7aIHlPGUsR84ZNDg=;
 b=SSQ3YofcPa/yVBEMWoihjmdduwjAjS16b+nvOHCMIXJzRbGoIKM1m2p8kMEsvOG+S4ZymB
 R2M84ceHacWwP4Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C22FC139A1;
 Wed, 16 Apr 2025 08:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6h8eLltt/2eiYwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Apr 2025 08:42:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com,
	wakko@animx.eu.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?=D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9?= <afmerlord@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/mgag200: Fix value in <VBLKSTR> register
Date: Wed, 16 Apr 2025 10:38:05 +0200
Message-ID: <20250416083847.51764-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 03E132115E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com,vger.kernel.org];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

Fix an off-by-one error when setting the vblanking start in
<VBLKSTR>. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
variables for blanking fields") switched the value from
crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
from the former. The commit missed to subtract one though.

Reported-by: Wakko Warner <wakko@animx.eu.org>
Closes: https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/
Reported-by: Сергей <afmerlord@gmail.com>
Closes: https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/
Closes: https://bbs.archlinux.org/viewtopic.php?id=303819
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fb71658c3117..6067d08aeee3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_device *mdev, const struct drm_display_mod
 	vsyncstr = mode->crtc_vsync_start - 1;
 	vsyncend = mode->crtc_vsync_end - 1;
 	vtotal = mode->crtc_vtotal - 2;
-	vblkstr = mode->crtc_vblank_start;
+	vblkstr = mode->crtc_vblank_start - 1;
 	vblkend = vtotal + 1;
 
 	linecomp = vdispend;
-- 
2.49.0

