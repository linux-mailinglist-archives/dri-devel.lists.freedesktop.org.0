Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F442ECA2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB126ECFA;
	Fri, 15 Oct 2021 08:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B01F6E2BC
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:40:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9A2D21A67;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634287255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDl8ZguXuyDbbZiyscWgLIlhsrArfzmqxhg/rr6+6po=;
 b=qDWsyCRZM3E9flwhdt4hYNmGFCsVCAY4H35UqQHyfhDCu4bQZRkHfvKHPiMEKx6xgQ+rcp
 3amV8s9nAgiyzKxdKXDRQTaci+zLabSfYmSxctzYk4SyqUmgmEgTQWJ/eLRSJpliqRvxRi
 6MLeP7pYbqwFMof4P43sTGxm5zUFIgw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634287255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDl8ZguXuyDbbZiyscWgLIlhsrArfzmqxhg/rr6+6po=;
 b=f2eW1BktuFhbZ+VfF9NMGQRXcziM7avbwk0jUdrDc486SWOVHaY6NC0EklSJsBBpLt23M8
 BuR/sMvfAVAHzABA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B785F13B87;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GIDcK5c+aWHBGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 08:40:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 05/10] drm/gma500: Rename psb_gtt_{pin,
 unpin}() to psb_gem_{pin, unpin}()
Date: Fri, 15 Oct 2021 10:40:48 +0200
Message-Id: <20211015084053.13708-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015084053.13708-1-tzimmermann@suse.de>
References: <20211015084053.13708-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Rename psb_gtt_pin() to psb_gem_pin() to reflect the semantics of the
function. Same for psb_gtt_unpin(). No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c         |  8 ++++----
 drivers/gpu/drm/gma500/gem.h         |  4 ++--
 drivers/gpu/drm/gma500/gma_display.c | 12 ++++++------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 97b7f3bdbdc3..1905468924ca 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -52,7 +52,7 @@ static void psb_gtt_detach_pages(struct gtt_range *gt)
 	gt->pages = NULL;
 }
 
-int psb_gtt_pin(struct gtt_range *gt)
+int psb_gem_pin(struct gtt_range *gt)
 {
 	int ret = 0;
 	struct drm_device *dev = gt->gem.dev;
@@ -80,7 +80,7 @@ int psb_gtt_pin(struct gtt_range *gt)
 	return ret;
 }
 
-void psb_gtt_unpin(struct gtt_range *gt)
+void psb_gem_unpin(struct gtt_range *gt)
 {
 	struct drm_device *dev = gt->gem.dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -105,7 +105,7 @@ static void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
 {
 	/* Undo the mmap pin if we are destroying the object */
 	if (gt->mmapping) {
-		psb_gtt_unpin(gt);
+		psb_gem_unpin(gt);
 		gt->mmapping = 0;
 	}
 	WARN_ON(gt->in_gart && !gt->stolen);
@@ -301,7 +301,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 	/* For now the mmap pins the object and it stays pinned. As things
 	   stand that will do us no harm */
 	if (r->mmapping == 0) {
-		err = psb_gtt_pin(r);
+		err = psb_gem_pin(r);
 		if (err < 0) {
 			dev_err(dev->dev, "gma500: pin failed: %d\n", err);
 			ret = vmf_error(err);
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 6b67c58cbed5..21c86df482a6 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -15,7 +15,7 @@ struct drm_device;
 struct gtt_range *
 psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align);
 
-int psb_gtt_pin(struct gtt_range *gt);
-void psb_gtt_unpin(struct gtt_range *gt);
+int psb_gem_pin(struct gtt_range *gt);
+void psb_gem_unpin(struct gtt_range *gt);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 8c95b50034a5..6d0470b27bc5 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -75,7 +75,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 
 	/* We are displaying this buffer, make sure it is actually loaded
 	   into the GTT */
-	ret = psb_gtt_pin(gtt);
+	ret = psb_gem_pin(gtt);
 	if (ret < 0)
 		goto gma_pipe_set_base_exit;
 	start = gtt->offset;
@@ -126,7 +126,7 @@ int gma_pipe_set_base(struct drm_crtc *crtc, int x, int y,
 gma_pipe_cleaner:
 	/* If there was a previous display we can now unpin it */
 	if (old_fb)
-		psb_gtt_unpin(to_gtt_range(old_fb->obj[0]));
+		psb_gem_unpin(to_gtt_range(old_fb->obj[0]));
 
 gma_pipe_set_base_exit:
 	gma_power_end(dev);
@@ -350,7 +350,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 		/* Unpin the old GEM object */
 		if (gma_crtc->cursor_obj) {
 			gt = to_gtt_range(gma_crtc->cursor_obj);
-			psb_gtt_unpin(gt);
+			psb_gem_unpin(gt);
 			drm_gem_object_put(gma_crtc->cursor_obj);
 			gma_crtc->cursor_obj = NULL;
 		}
@@ -378,7 +378,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	gt = to_gtt_range(obj);
 
 	/* Pin the memory into the GTT */
-	ret = psb_gtt_pin(gt);
+	ret = psb_gem_pin(gt);
 	if (ret) {
 		dev_err(dev->dev, "Can not pin down handle 0x%x\n", handle);
 		goto unref_cursor;
@@ -426,7 +426,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 	/* unpin the old bo */
 	if (gma_crtc->cursor_obj) {
 		gt = to_gtt_range(gma_crtc->cursor_obj);
-		psb_gtt_unpin(gt);
+		psb_gem_unpin(gt);
 		drm_gem_object_put(gma_crtc->cursor_obj);
 	}
 
@@ -490,7 +490,7 @@ void gma_crtc_disable(struct drm_crtc *crtc)
 
 	if (crtc->primary->fb) {
 		gt = to_gtt_range(crtc->primary->fb->obj[0]);
-		psb_gtt_unpin(gt);
+		psb_gem_unpin(gt);
 	}
 }
 
-- 
2.33.0

