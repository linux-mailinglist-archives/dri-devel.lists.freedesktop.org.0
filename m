Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D787FA275
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECAD10E2B4;
	Mon, 27 Nov 2023 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8234310E2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:20:45 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0519121C51;
 Mon, 27 Nov 2023 14:20:44 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C339913440;
 Mon, 27 Nov 2023 14:20:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cllGLrulZGXaPwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 14:20:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 hi@alyssa.is, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH v2] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
Date: Mon, 27 Nov 2023 15:20:36 +0100
Message-ID: <20231127142042.17815-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ********
X-Spamd-Bar: ++++++++
Authentication-Results: smtp-out1.suse.de; dkim=none;
 dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.de
 (policy=none); 
 spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [8.79 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(4.60)[~all:c]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,suse.de:email,alyssa.is:email]; 
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,alyssa.is,ffwll.ch,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 R_DKIM_NA(2.20)[]; MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
X-Spam-Score: 8.79
X-Rspamd-Queue-Id: 0519121C51
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
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invoke drm_plane_helper_funcs.end_fb_access before
drm_atomic_helper_commit_hw_done(). The latter function hands over
ownership of the plane state to the following commit, which might
free it. Releasing resources in end_fb_access then operates on undefined
state. This bug has been observed with non-blocking commits when they
are being queued up quickly.

Here is an example stack trace from the bug report. The plane state has
been free'd already, so the pages for drm_gem_fb_vunmap() are gone.

Unable to handle kernel paging request at virtual address 0000000100000049
[...]
 drm_gem_fb_vunmap+0x18/0x74
 drm_gem_end_shadow_fb_access+0x1c/0x2c
 drm_atomic_helper_cleanup_planes+0x58/0xd8
 drm_atomic_helper_commit_tail+0x90/0xa0
 commit_tail+0x15c/0x188
 commit_work+0x14/0x20

For aborted commits, it is still ok to run end_fb_access as part of the
plane's cleanup. Add a test to drm_atomic_helper_cleanup_planes().

v2:
	* fix test in drm_atomic_helper_cleanup_planes()

Reported-by: Alyssa Ross <hi@alyssa.is>
Closes: https://lore.kernel.org/dri-devel/87leazm0ya.fsf@alyssa.is/
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Fixes: 94d879eaf7fb ("drm/atomic-helper: Add {begin,end}_fb_access to plane helpers")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c3f677130def0..bedb42ddd1341 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2784,6 +2784,17 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 
 		funcs->atomic_flush(crtc, old_state);
 	}
+
+	/*
+	 * Signal end of framebuffer access here before hw_done. After hw_done,
+	 * a later commit might have already released the plane state.
+	 */
+	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->end_fb_access)
+			funcs->end_fb_access(plane, new_plane_state);
+	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
 
@@ -2924,6 +2935,12 @@ void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
 	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
+		/*
+		 * Only clean up here if we're aborting the commit.
+		 */
+		if (old_plane_state == plane->state)
+			continue;
+
 		if (funcs->end_fb_access)
 			funcs->end_fb_access(plane, new_plane_state);
 	}
-- 
2.43.0

