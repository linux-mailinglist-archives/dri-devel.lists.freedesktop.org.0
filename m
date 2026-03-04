Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF6EKoktqGk+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE120001F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0FA10E9EA;
	Wed,  4 Mar 2026 13:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uCsnzMuK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xL4QyKjH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uCsnzMuK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xL4QyKjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374D610E9EB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:03:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2E1745BE26;
 Wed,  4 Mar 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHlUgqo5LlLa89h3t9+P5fca2U7bx201Q1DVzi9ZgTw=;
 b=uCsnzMuKTJPHDK5ui8Uj9W5SuPh+WzlgSwC400OC6NaWGaBV0lMBy8TmfSqyBnn0+n/Il7
 Tvub9ig1GGj4Mex0K2iAo7kJ4AtXB65u3jtc1gXeXQZxw3kWfLjdg1dXsOUvnnpmV/rqq1
 a9GjLvGZYJykugGKC6GYlK0Ho6SykyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHlUgqo5LlLa89h3t9+P5fca2U7bx201Q1DVzi9ZgTw=;
 b=xL4QyKjHwRmLnF33mwUf9esHs+rjXc8cH3M2BYCOVsgcXlUi+hJX4dgyQVeMD97EhVO+QL
 JwPr+4sbWAIoLoBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uCsnzMuK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xL4QyKjH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772629375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHlUgqo5LlLa89h3t9+P5fca2U7bx201Q1DVzi9ZgTw=;
 b=uCsnzMuKTJPHDK5ui8Uj9W5SuPh+WzlgSwC400OC6NaWGaBV0lMBy8TmfSqyBnn0+n/Il7
 Tvub9ig1GGj4Mex0K2iAo7kJ4AtXB65u3jtc1gXeXQZxw3kWfLjdg1dXsOUvnnpmV/rqq1
 a9GjLvGZYJykugGKC6GYlK0Ho6SykyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772629375;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHlUgqo5LlLa89h3t9+P5fca2U7bx201Q1DVzi9ZgTw=;
 b=xL4QyKjHwRmLnF33mwUf9esHs+rjXc8cH3M2BYCOVsgcXlUi+hJX4dgyQVeMD97EhVO+QL
 JwPr+4sbWAIoLoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA04E3EA69;
 Wed,  4 Mar 2026 13:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LHuN34tqGmlNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 04 Mar 2026 13:02:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/radeon: Test for fbdev GEM object with generic helper
Date: Wed,  4 Mar 2026 13:58:39 +0100
Message-ID: <20260304130250.59008-3-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 5AAE120001F
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

Replace radeon's test for the fbdev GEM object with a call to the
generic helper.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_device.c |  7 ++++---
 drivers/gpu/drm/radeon/radeon_fbdev.c  | 17 -----------------
 drivers/gpu/drm/radeon/radeon_mode.h   |  5 -----
 3 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 5d523d5dae88..705c012fcf9e 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -37,6 +37,7 @@
 #include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_probe_helper.h>
@@ -1574,7 +1575,6 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 		struct drm_framebuffer *fb = crtc->primary->fb;
-		struct radeon_bo *robj;
 
 		if (radeon_crtc->cursor_bo) {
 			struct radeon_bo *robj = gem_to_radeon_bo(radeon_crtc->cursor_bo);
@@ -1588,9 +1588,10 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 		if (fb == NULL || fb->obj[0] == NULL) {
 			continue;
 		}
-		robj = gem_to_radeon_bo(fb->obj[0]);
 		/* don't unpin kernel fb objects */
-		if (!radeon_fbdev_robj_is_fb(rdev, robj)) {
+		if (!drm_fb_helper_gem_is_fb(dev->fb_helper, fb->obj[0])) {
+			struct radeon_bo *robj = gem_to_radeon_bo(fb->obj[0]);
+
 			r = radeon_bo_reserve(robj, false);
 			if (r == 0) {
 				radeon_bo_unpin(robj);
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 18d61f3f7344..3e243f5e2f44 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -274,20 +274,3 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	radeon_fbdev_destroy_pinned_object(gobj);
 	return ret;
 }
-
-bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
-{
-	struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
-	struct drm_gem_object *gobj;
-
-	if (!fb_helper)
-		return false;
-
-	gobj = drm_gem_fb_get_obj(fb_helper->fb, 0);
-	if (!gobj)
-		return false;
-	if (gobj != &robj->tbo.base)
-		return false;
-
-	return true;
-}
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 088af85902f7..ae1ecdc2e189 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -936,14 +936,9 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes);
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = radeon_fbdev_driver_fbdev_probe
-bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 #else
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = NULL
-static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
-{
-	return false;
-}
 #endif
 
 void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
-- 
2.53.0

