Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEfsCoUtqGlPpQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC01FFFF7
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E517510E9DA;
	Wed,  4 Mar 2026 13:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Z8JHrCqo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4YHwx+dt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z8JHrCqo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4YHwx+dt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292B910E9E5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:02:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E48255BDF8;
 Wed,  4 Mar 2026 13:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwYj5dgInjh7HBFE6PzMK1TVQxe7Dozs67WoSfIl5f4=;
 b=Z8JHrCqoTZHfwXsswpCJcuAc0fKs3WgdvGAwxZZGIB5PT8y2BicwFZJYatyfTawFT/b/Lv
 IEtVTdeuiBXUsUxVG3Va3EnLAEZZjtwqUWe5CdLK/MDVxnDj+4zbUaUeIVOSdy4f6I0hf8
 eTBNewcBhhZKWZJPj6pzrkjLtfvUAgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwYj5dgInjh7HBFE6PzMK1TVQxe7Dozs67WoSfIl5f4=;
 b=4YHwx+dtZjZ8MFWQC7iYHFx/J9bwC2lVfdv2o2BL0/9Zb138iW0g4lDzPQaeg3GSib3Om3
 gzmDII5c8t+Rs4DQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Z8JHrCqo;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4YHwx+dt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwYj5dgInjh7HBFE6PzMK1TVQxe7Dozs67WoSfIl5f4=;
 b=Z8JHrCqoTZHfwXsswpCJcuAc0fKs3WgdvGAwxZZGIB5PT8y2BicwFZJYatyfTawFT/b/Lv
 IEtVTdeuiBXUsUxVG3Va3EnLAEZZjtwqUWe5CdLK/MDVxnDj+4zbUaUeIVOSdy4f6I0hf8
 eTBNewcBhhZKWZJPj6pzrkjLtfvUAgk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwYj5dgInjh7HBFE6PzMK1TVQxe7Dozs67WoSfIl5f4=;
 b=4YHwx+dtZjZ8MFWQC7iYHFx/J9bwC2lVfdv2o2BL0/9Zb138iW0g4lDzPQaeg3GSib3Om3
 gzmDII5c8t+Rs4DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAB8C3EA6C;
 Wed,  4 Mar 2026 13:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GIZwKH4tqGmlNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Mar 2026 13:02:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/amdgpu: Move test for fbdev GEM object into generic
 helper
Date: Wed,  4 Mar 2026 13:58:38 +0100
Message-ID: <20260304130250.59008-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304130250.59008-1-tzimmermann@suse.de>
References: <20260304130250.59008-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Queue-Id: 75EC01FFFF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:amd-gfx@lists.freedesktop.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Provide a generic helper that tests if fbdev emulation is backed by
a specific GEM object. Not all drivers use client buffers (yet), hence
also test against the first GEM object in the fbdev framebuffer.

Convert amdgpu. The helper will also be useful for radeon.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 21 +++------------
 drivers/gpu/drm/drm_fb_helper.c             | 29 +++++++++++++++++++++
 include/drm/drm_fb_helper.h                 |  9 +++++++
 3 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index bef9dce2e7ea..f5cd68542442 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1738,21 +1738,6 @@ bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 						  stime, etime, mode);
 }
 
-static bool
-amdgpu_display_robj_is_fb(struct amdgpu_device *adev, struct amdgpu_bo *robj)
-{
-	struct drm_device *dev = adev_to_drm(adev);
-	struct drm_fb_helper *fb_helper = dev->fb_helper;
-
-	if (!fb_helper || !fb_helper->buffer)
-		return false;
-
-	if (gem_to_amdgpu_bo(fb_helper->buffer->gem) != robj)
-		return false;
-
-	return true;
-}
-
 int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 {
 	struct drm_device *dev = adev_to_drm(adev);
@@ -1775,7 +1760,6 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
 		struct drm_framebuffer *fb = crtc->primary->fb;
-		struct amdgpu_bo *robj;
 
 		if (amdgpu_crtc->cursor_bo && !adev->enable_virtual_display) {
 			struct amdgpu_bo *aobj = gem_to_amdgpu_bo(amdgpu_crtc->cursor_bo);
@@ -1790,8 +1774,9 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
 		if (!fb || !fb->obj[0])
 			continue;
 
-		robj = gem_to_amdgpu_bo(fb->obj[0]);
-		if (!amdgpu_display_robj_is_fb(adev, robj)) {
+		if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0])) {
+			struct amdgpu_bo *robj = gem_to_amdgpu_bo(fb->obj[0]);
+
 			r = amdgpu_bo_reserve(robj, true);
 			if (r == 0) {
 				amdgpu_bo_unpin(robj);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 845c63ca15b5..214337ebb559 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -37,6 +37,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -1771,3 +1772,31 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	return 0;
 }
 EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
+
+/**
+ * drm_fb_helper_gem_is_fb - Tests if GEM object is framebuffer
+ * @fb_helper: fb_helper instance, can be NULL
+ * @obj: The GEM object to test, can be NULL
+ *
+ * Call drm_fb_helper_gem_is_fb to test is a DRM device's fbdev emulation
+ * uses the specified GEM object for its framebuffer. The result is always
+ * false if either poiner is NULL.
+ *
+ * Returns:
+ * True if fbdev emulation uses the provided GEM object, or false otherwise.
+ */
+bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
+			     const struct drm_gem_object *obj)
+{
+	const struct drm_gem_object *gem = NULL;
+
+	if (!fb_helper || !obj)
+		return false;
+	if (fb_helper->buffer && fb_helper->buffer->gem)
+		gem = fb_helper->buffer->gem;
+	else if (fb_helper->fb)
+		gem = drm_gem_fb_get_obj(fb_helper->fb, 0);
+
+	return gem == obj;
+}
+EXPORT_SYMBOL_GPL(drm_fb_helper_gem_is_fb);
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 15274b8a1d97..c59f16c21723 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -271,6 +271,15 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 
 int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
+
+bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
+			     const struct drm_gem_object *obj);
+#else
+static inline bool drm_fb_helper_gem_is_fb(const struct drm_fb_helper *fb_helper,
+					   const struct drm_gem_object *obj)
+{
+	return false;
+}
 #endif
 
 #endif
-- 
2.53.0

