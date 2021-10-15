Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4942ECA0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CC76E8F1;
	Fri, 15 Oct 2021 08:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC256E29D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:40:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64F9A21A65;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634287255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHb4FktbkDSNUnXgBWGwJ2b3rCnFpJjncQOmBTQVCIU=;
 b=M+329a1BUTKUnjTPR3l/waY6BksT2qxzx8CrAcBpgJegtC6v8/VX3wyC2nIkLDHm8c9Vpt
 nB3jXbgRfX5WNQQwCMJiJa9E1CB+6RCbBzbIurRPrsSyMxS22hO/So/0TaYQmPLUGZIwJ1
 +g6Vlb38wPRyQL3koW0d44obn9bjn24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634287255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZHb4FktbkDSNUnXgBWGwJ2b3rCnFpJjncQOmBTQVCIU=;
 b=BnR+KlA5tBCjPA5RcHV0sEhbvmJgZbhRRlfoiOFJ+NWxtuBB7t9+mXvHcmvU6fFQ8Ceyit
 L1Xe4R85tr+uZADA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42F0713EE2;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aEVhD5c+aWHBGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 08:40:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/10] drm/gma500: Use to_gtt_range() everywhere
Date: Fri, 15 Oct 2021 10:40:45 +0200
Message-Id: <20211015084053.13708-3-tzimmermann@suse.de>
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

Convert upcasts from struct drm_gem_object to struct gtt_range to
to_gtt_range(). Some places used container_of() directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c         | 4 ++--
 drivers/gpu/drm/gma500/gma_display.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index a41990dbcc0e..b52908313ee5 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -117,7 +117,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
 
 static void psb_gem_free_object(struct drm_gem_object *obj)
 {
-	struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
+	struct gtt_range *gtt = to_gtt_range(obj);
 
 	/* Remove the list map if one is present */
 	drm_gem_free_mmap_offset(obj);
@@ -267,7 +267,7 @@ static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 	dev = obj->dev;
 	dev_priv = to_drm_psb_private(dev);
 
-	r = container_of(obj, struct gtt_range, gem);	/* Get the gtt range */
+	r = to_gtt_range(obj);
 
 	/* Make sure we don't parallel update on a fault, nor move or remove
 	   something from beneath our feet */
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index ecf8153416ac..8285358fac01 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -349,8 +349,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 		/* Unpin the old GEM object */
 		if (gma_crtc->cursor_obj) {
-			gt = container_of(gma_crtc->cursor_obj,
-					  struct gtt_range, gem);
+			gt = to_gtt_range(gma_crtc->cursor_obj);
 			psb_gtt_unpin(gt);
 			drm_gem_object_put(gma_crtc->cursor_obj);
 			gma_crtc->cursor_obj = NULL;
@@ -376,7 +375,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 		goto unref_cursor;
 	}
 
-	gt = container_of(obj, struct gtt_range, gem);
+	gt = to_gtt_range(obj);
 
 	/* Pin the memory into the GTT */
 	ret = psb_gtt_pin(gt);
@@ -426,7 +425,7 @@ int gma_crtc_cursor_set(struct drm_crtc *crtc,
 
 	/* unpin the old bo */
 	if (gma_crtc->cursor_obj) {
-		gt = container_of(gma_crtc->cursor_obj, struct gtt_range, gem);
+		gt = to_gtt_range(gma_crtc->cursor_obj);
 		psb_gtt_unpin(gt);
 		drm_gem_object_put(gma_crtc->cursor_obj);
 	}
-- 
2.33.0

