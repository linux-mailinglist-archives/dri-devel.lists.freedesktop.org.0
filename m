Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86352B36C30
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B9B10E676;
	Tue, 26 Aug 2025 14:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gQfc9HLJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/2WvKz/q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gQfc9HLJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/2WvKz/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB30110E676
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:53:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 600751F794;
 Tue, 26 Aug 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756220010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YHtY+U/L/pHF5qmLPqAGdjmwP1KB6/cZ8ZUrq/NCQ7Y=;
 b=gQfc9HLJXrK8xmrMWLgWmhaS8fUvPr8iAzyUK3XMG3sBYYBs6GgNTVjiAR6lVV5KHrjF7q
 VSZY0pwOw8dBXudgSUVMSy4Rlq14Uepa46C9gDywQSyC2T0LlaL+12EFDK4/By4W3GEEpZ
 FIHttzjY3MBhRliimBvzMFv80MYqNA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756220010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YHtY+U/L/pHF5qmLPqAGdjmwP1KB6/cZ8ZUrq/NCQ7Y=;
 b=/2WvKz/qTnQPFL56aW0oCUybSpwmE4yb2FCrltfiCu7UQzv+9eXurGihw89OvqLSYBQVPV
 UOUXm3pdze6ABMCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gQfc9HLJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/2WvKz/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756220010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YHtY+U/L/pHF5qmLPqAGdjmwP1KB6/cZ8ZUrq/NCQ7Y=;
 b=gQfc9HLJXrK8xmrMWLgWmhaS8fUvPr8iAzyUK3XMG3sBYYBs6GgNTVjiAR6lVV5KHrjF7q
 VSZY0pwOw8dBXudgSUVMSy4Rlq14Uepa46C9gDywQSyC2T0LlaL+12EFDK4/By4W3GEEpZ
 FIHttzjY3MBhRliimBvzMFv80MYqNA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756220010;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YHtY+U/L/pHF5qmLPqAGdjmwP1KB6/cZ8ZUrq/NCQ7Y=;
 b=/2WvKz/qTnQPFL56aW0oCUybSpwmE4yb2FCrltfiCu7UQzv+9eXurGihw89OvqLSYBQVPV
 UOUXm3pdze6ABMCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2AA5F13A31;
 Tue, 26 Aug 2025 14:53:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id luYNCWrKrWjGTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Aug 2025 14:53:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sysfb: Do not deref unexisting CRTC state in
 atomic_disable
Date: Tue, 26 Aug 2025 16:50:25 +0200
Message-ID: <20250826145044.954396-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_SEVEN(0.00)[7];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 600751F794
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Do not access CRTC state in drm_sysfb_plane_helper_atomic_disable().
Use format from sysfb device for clearing scanout buffer. This is
the behavior from before commit 061963cd9e5b ("drm/sysfb: Blit to
CRTC destination format").

When being disabled, the plane has no associated CRTC. Trying to deref
the format pointer results in a segmentation fault. An example stack
track is shown below.

[   58.948915] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000023: 0000 [#1] SMP KASAN PTI
[   58.959971] KASAN: null-ptr-deref in range [0x0000000000000118-0x000000000000011f]
[...]
[   58.979308] RIP: 0010:drm_sysfb_plane_helper_atomic_disable+0x1af/0x520
[...]
[   59.084227] Call Trace:
[   59.086682]  <TASK>
[   59.088793]  ? __pfx_drm_sysfb_plane_helper_atomic_disable+0x10/0x10
[   59.095155]  ? crtc_disable+0xf2/0x5a0
[   59.098920]  drm_atomic_helper_commit_planes+0x848/0x1030
[   59.104336]  drm_atomic_helper_commit_tail+0x41/0xb0
[   59.109316]  commit_tail+0x204/0x330
[   59.112903]  drm_atomic_helper_commit+0x242/0x2e0
[   59.117618]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[   59.122851]  drm_atomic_commit+0x1e1/0x290
[   59.126957]  ? drm_atomic_add_affected_connectors+0x266/0x330
[   59.132714]  ? __pfx_drm_atomic_commit+0x10/0x10
[   59.137343]  ? __pfx___drm_printfn_info+0x10/0x10
[   59.142058]  ? drm_atomic_set_crtc_for_connector+0x436/0x630
[   59.147729]  atomic_remove_fb+0x631/0x920
[   59.151751]  ? save_trace+0xcf/0x180
[   59.155343]  ? __pfx_atomic_remove_fb+0x10/0x10
[   59.159890]  ? __pfx___drm_dev_dbg+0x10/0x10
[   59.164173]  drm_framebuffer_remove+0x19a/0x710

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 061963cd9e5b ("drm/sysfb: Blit to CRTC destination format")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 0e05345cdeee..963c380fea64 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -281,10 +281,7 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
 	unsigned int dst_pitch = sysfb->fb_pitch;
-	struct drm_crtc_state *crtc_state = crtc_state =
-		drm_atomic_get_new_crtc_state(state, plane_state->crtc);
-	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
-	const struct drm_format_info *dst_format = sysfb_crtc_state->format;
+	const struct drm_format_info *dst_format = sysfb->fb_format;
 	struct drm_rect dst_clip;
 	unsigned long lines, linepixels, i;
 	int idx;
-- 
2.50.1

