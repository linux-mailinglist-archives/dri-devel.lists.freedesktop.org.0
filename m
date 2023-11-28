Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDAE7FB523
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 10:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1E810E465;
	Tue, 28 Nov 2023 09:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A93910E465
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 09:02:02 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93A861F6E6;
 Tue, 28 Nov 2023 09:02:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FFC5139FC;
 Tue, 28 Nov 2023 09:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mfIpEoisZWWMSQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 09:02:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 hi@alyssa.is, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH v3] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
Date: Tue, 28 Nov 2023 10:01:53 +0100
Message-ID: <20231128090158.15564-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ++++++++++++
X-Spam-Score: 12.18
X-Rspamd-Server: rspamd1
Authentication-Results: smtp-out2.suse.de; dkim=none;
 spf=softfail (smtp-out2.suse.de: 2a07:de40:b281:104:10:150:64:98 is neither
 permitted nor denied by domain of tzimmermann@suse.de)
 smtp.mailfrom=tzimmermann@suse.de; 
 dmarc=fail reason="No valid SPF,
 No valid DKIM" header.from=suse.de (policy=none)
X-Rspamd-Queue-Id: 93A861F6E6
X-Spam-Flag: NO
X-Spam-Level: ************
X-Spamd-Result: default: False [12.18 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(4.60)[~all:c];
 RCVD_COUNT_THREE(0.00)[3]; MX_GOOD(-0.01)[];
 NEURAL_HAM_SHORT(-0.11)[-0.573]; RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,alyssa.is,ffwll.ch,redhat.com];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_SPAM_LONG(3.50)[1.000]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DMARC_POLICY_SOFTFAIL(0.10)[suse.de : No valid SPF, No valid DKIM,none]
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

Fix this by running end_fb_access immediately after updating all planes
in drm_atomic_helper_commit_planes(). The existing clean-up helper
drm_atomic_helper_cleanup_planes() now only handles cleanup_fb.

For aborted commits, roll back from drm_atomic_helper_prepare_planes()
in the new helper drm_atomic_helper_unprepare_planes(). This case is
different from regular cleanup, as we have to release the new state;
regular cleanup releases the old state. The new helper also invokes
cleanup_fb for all planes.

The changes mostly involve DRM's atomic helpers. Only two drivers, i915
and nouveau, implement their own commit function. Update them to invoke
drm_atomic_helper_unprepare_planes(). Drivers with custom commit_tail
function do not require changes.

v3:
	* add drm_atomic_helper_unprepare_planes() for rolling back
	* use correct state for end_fb_access
v2:
	* fix test in drm_atomic_helper_cleanup_planes()

Reported-by: Alyssa Ross <hi@alyssa.is>
Closes: https://lore.kernel.org/dri-devel/87leazm0ya.fsf@alyssa.is/
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Fixes: 94d879eaf7fb ("drm/atomic-helper: Add {begin,end}_fb_access to plane helpers")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/drm_atomic_helper.c          | 78 +++++++++++++-------
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c      |  2 +-
 include/drm/drm_atomic_helper.h              |  2 +
 4 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c3f677130def0..9adec3eb78563 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2012,7 +2012,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 			return ret;
 
 		drm_atomic_helper_async_commit(dev, state);
-		drm_atomic_helper_cleanup_planes(dev, state);
+		drm_atomic_helper_unprepare_planes(dev, state);
 
 		return 0;
 	}
@@ -2072,7 +2072,7 @@ int drm_atomic_helper_commit(struct drm_device *dev,
 	return 0;
 
 err:
-	drm_atomic_helper_cleanup_planes(dev, state);
+	drm_atomic_helper_unprepare_planes(dev, state);
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit);
@@ -2650,6 +2650,39 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_prepare_planes);
 
+/**
+ * drm_atomic_helper_unprepare_planes - release plane resources on aborts
+ * @dev: DRM device
+ * @old_state: atomic state object with old state structures
+ *
+ * This function cleans up plane state, specifically framebuffers, from the
+ * atomic state. It undoes the effects of drm_atomic_helper_prepare_planes()
+ * when aborting an atomic commit. For cleaning up after a successful commit
+ * use drm_atomic_helper_cleanup_planes().
+ */
+void drm_atomic_helper_unprepare_planes(struct drm_device *dev,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state;
+	int i;
+
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->end_fb_access)
+			funcs->end_fb_access(plane, new_plane_state);
+	}
+
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->cleanup_fb)
+			funcs->cleanup_fb(plane, new_plane_state);
+	}
+}
+EXPORT_SYMBOL(drm_atomic_helper_unprepare_planes);
+
 static bool plane_crtc_active(const struct drm_plane_state *state)
 {
 	return state->crtc && state->crtc->state->active;
@@ -2784,6 +2817,17 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
 
 		funcs->atomic_flush(crtc, old_state);
 	}
+
+	/*
+	 * Signal end of framebuffer access here before hw_done. After hw_done,
+	 * a later commit might have already released the plane state.
+	 */
+	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
+
+		if (funcs->end_fb_access)
+			funcs->end_fb_access(plane, old_plane_state);
+	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
 
@@ -2911,40 +2955,22 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_planes_on_crtc);
  * configuration. Hence the old configuration must be perserved in @old_state to
  * be able to call this function.
  *
- * This function must also be called on the new state when the atomic update
- * fails at any point after calling drm_atomic_helper_prepare_planes().
+ * This function may not be called on the new state when the atomic update
+ * fails at any point after calling drm_atomic_helper_prepare_planes(). Use
+ * drm_atomic_helper_unprepare_planes() in this case.
  */
 void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
 				      struct drm_atomic_state *old_state)
 {
 	struct drm_plane *plane;
-	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct drm_plane_state *old_plane_state;
 	int i;
 
-	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
+	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
-		if (funcs->end_fb_access)
-			funcs->end_fb_access(plane, new_plane_state);
-	}
-
-	for_each_oldnew_plane_in_state(old_state, plane, old_plane_state, new_plane_state, i) {
-		const struct drm_plane_helper_funcs *funcs;
-		struct drm_plane_state *plane_state;
-
-		/*
-		 * This might be called before swapping when commit is aborted,
-		 * in which case we have to cleanup the new state.
-		 */
-		if (old_plane_state == plane->state)
-			plane_state = new_plane_state;
-		else
-			plane_state = old_plane_state;
-
-		funcs = plane->helper_private;
-
 		if (funcs->cleanup_fb)
-			funcs->cleanup_fb(plane, plane_state);
+			funcs->cleanup_fb(plane, old_plane_state);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_cleanup_planes);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5cf162628b95e..ace834c9e8f9f 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7354,7 +7354,7 @@ int intel_atomic_commit(struct drm_device *dev, struct drm_atomic_state *_state,
 		for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 			intel_color_cleanup_commit(new_crtc_state);
 
-		drm_atomic_helper_cleanup_planes(dev, &state->base);
+		drm_atomic_helper_unprepare_planes(dev, &state->base);
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 11fe75b68e95c..8d37a694b7724 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2476,7 +2476,7 @@ nv50_disp_atomic_commit(struct drm_device *dev,
 
 err_cleanup:
 	if (ret)
-		drm_atomic_helper_cleanup_planes(dev, state);
+		drm_atomic_helper_unprepare_planes(dev, state);
 done:
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3a..006b5c977ad77 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -97,6 +97,8 @@ void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 
 int drm_atomic_helper_prepare_planes(struct drm_device *dev,
 				     struct drm_atomic_state *state);
+void drm_atomic_helper_unprepare_planes(struct drm_device *dev,
+					struct drm_atomic_state *state);
 
 #define DRM_PLANE_COMMIT_ACTIVE_ONLY			BIT(0)
 #define DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET	BIT(1)
-- 
2.43.0

