Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA15ACB04B9
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D7110E649;
	Tue,  9 Dec 2025 14:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mcfHt5gA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGObzS8+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mcfHt5gA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oGObzS8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3B10E649
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:33:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E8AA3381A;
 Tue,  9 Dec 2025 14:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765290815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvwbKxkIk6RguNhFHJWp7//UYd8KPZEUhA4j8Xi/fzg=;
 b=mcfHt5gAok82oQliYWin6KFIGpCt4VPYx+nKTxAmr6QdkE10P/wkZAGv1f54bLg6FBo4fJ
 rlht4ZNOOBJtMJn7f4hr2IoKfw7Y7L7QuHkK3WbGMQqB664rDUTCeJuUP5bfIITrlUPSsH
 Dl4NW6yIiawsaOnF8X4uXO3/NrpI8x8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765290815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvwbKxkIk6RguNhFHJWp7//UYd8KPZEUhA4j8Xi/fzg=;
 b=oGObzS8+3U/gO+JnfViwjHgmLoSwxy1uw8bFrX2TAfhqnndlrfHgSqXMZlacyinXkkM2fc
 aVRZDt5Ie6DeUMDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765290815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvwbKxkIk6RguNhFHJWp7//UYd8KPZEUhA4j8Xi/fzg=;
 b=mcfHt5gAok82oQliYWin6KFIGpCt4VPYx+nKTxAmr6QdkE10P/wkZAGv1f54bLg6FBo4fJ
 rlht4ZNOOBJtMJn7f4hr2IoKfw7Y7L7QuHkK3WbGMQqB664rDUTCeJuUP5bfIITrlUPSsH
 Dl4NW6yIiawsaOnF8X4uXO3/NrpI8x8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765290815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=TvwbKxkIk6RguNhFHJWp7//UYd8KPZEUhA4j8Xi/fzg=;
 b=oGObzS8+3U/gO+JnfViwjHgmLoSwxy1uw8bFrX2TAfhqnndlrfHgSqXMZlacyinXkkM2fc
 aVRZDt5Ie6DeUMDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 431CC3EA63;
 Tue,  9 Dec 2025 14:33:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id R8AfDz8zOGmNVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:33:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: chintanlike@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
Subject: [PATCH] drm/atomic: Increase timeout in
 drm_atomic_helper_wait_for_vblanks()
Date: Tue,  9 Dec 2025 15:33:18 +0100
Message-ID: <20251209143325.102056-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[fcede535e7eb57cf5b43];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,appspotmail.com:email];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Increase the timeout for vblank events from 100 ms to 1000 ms. This
is the same fix as in commit f050da08a4ed ("drm/vblank: Increase
timeout in drm_wait_one_vblank()") for another vblank timeout.

After merging generic DRM vblank timers [1] and converting several
DRM drivers for virtual hardware, these drivers synchronize their
vblank events to the display refresh rate. This can trigger timeouts
within the DRM framework.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/20250904145806.430568-1-tzimmermann@suse.de/ # [1]
Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.0017.GAE@google.com/
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e641fcf8c568..e108f91bc3dd 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1839,7 +1839,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 		ret = wait_event_timeout(*queue,
 					 state->crtcs[i].last_vblank_count !=
 						drm_crtc_vblank_count(crtc),
-					 msecs_to_jiffies(100));
+					 msecs_to_jiffies(1000));
 
 		WARN(!ret, "[CRTC:%d:%s] vblank wait timed out\n",
 		     crtc->base.id, crtc->name);
-- 
2.52.0

