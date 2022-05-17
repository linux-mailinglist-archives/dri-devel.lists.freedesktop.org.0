Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA0152A077
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 13:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DCD10E02F;
	Tue, 17 May 2022 11:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5B010E27B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 11:33:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1AEB71F8D1;
 Tue, 17 May 2022 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652787209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Zv8PWisNwWnol0fE6Afc+KqE+2MIXvAi2e4FtN1bb4=;
 b=jq6pVgnCvVChYu0swb2B+wBuihNkOd7xakJINxsBvsTC90Z/O204Fd/mKWUrR+1fZWetMy
 yVvXJI7GwbnYK7Fg0Kli1NneUUkSh1POh1UTqCoXyr/+pM0kE+nm0nGOK6rKdjP21VwRnD
 FKJIFT9Y9Uhq8rXBa4i4rlnEAc6jT+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652787209;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Zv8PWisNwWnol0fE6Afc+KqE+2MIXvAi2e4FtN1bb4=;
 b=e8bIQP+mjKrhba793AwJnm7q1Zkoh2HcaIZlKptg2Wkxd1YOaJjYcq+XddNVwjmanT/6rL
 JLAF3HNxq2hW+6Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3FE513B12;
 Tue, 17 May 2022 11:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oA7FNgiIg2KqdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 May 2022 11:33:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, noralf@tronnes.org,
 christian.koenig@amd.com
Subject: [PATCH v2 3/5] drm/gem-vram: Share code between GEM VRAM's _{prepare,
 cleanup}_fb()
Date: Tue, 17 May 2022 13:33:25 +0200
Message-Id: <20220517113327.26919-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220517113327.26919-1-tzimmermann@suse.de>
References: <20220517113327.26919-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The error-recovery code in drm_gem_vram_plane_helper_prepare_fb() is of
the same pattern as drm_gem_vram_plane_helper_cleanup_fb(). Implement
both of them using an internal helper. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 37 +++++++++++++++++----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 123045b58fec..566d139f0fa0 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -9,6 +9,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
@@ -630,6 +631,24 @@ EXPORT_SYMBOL(drm_gem_vram_driver_dumb_create);
  * Helpers for struct drm_plane_helper_funcs
  */
 
+static void __drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
+						   struct drm_plane_state *state,
+						   unsigned int num_planes)
+{
+	struct drm_gem_object *obj;
+	struct drm_gem_vram_object *gbo;
+	struct drm_framebuffer *fb = state->fb;
+
+	while (num_planes) {
+		--num_planes;
+		obj = drm_gem_fb_get_obj(fb, num_planes);
+		if (!obj)
+			continue;
+		gbo = drm_gem_vram_of_gem(obj);
+		drm_gem_vram_unpin(gbo);
+	}
+}
+
 /**
  * drm_gem_vram_plane_helper_prepare_fb() - \
  *	Implements &struct drm_plane_helper_funcs.prepare_fb
@@ -671,11 +690,7 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 	return 0;
 
 err_drm_gem_vram_unpin:
-	while (i) {
-		--i;
-		gbo = drm_gem_vram_of_gem(new_state->fb->obj[i]);
-		drm_gem_vram_unpin(gbo);
-	}
+	__drm_gem_vram_plane_helper_cleanup_fb(plane, new_state, i);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_vram_plane_helper_prepare_fb);
@@ -694,18 +709,12 @@ void
 drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 				     struct drm_plane_state *old_state)
 {
-	size_t i;
-	struct drm_gem_vram_object *gbo;
+	struct drm_framebuffer *fb = old_state->fb;
 
-	if (!old_state->fb)
+	if (!fb)
 		return;
 
-	for (i = 0; i < ARRAY_SIZE(old_state->fb->obj); ++i) {
-		if (!old_state->fb->obj[i])
-			continue;
-		gbo = drm_gem_vram_of_gem(old_state->fb->obj[i]);
-		drm_gem_vram_unpin(gbo);
-	}
+	__drm_gem_vram_plane_helper_cleanup_fb(plane, old_state, ARRAY_SIZE(fb->obj));
 }
 EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
 
-- 
2.36.1

