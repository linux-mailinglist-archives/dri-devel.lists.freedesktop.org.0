Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C988908C8F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9072410E24F;
	Fri, 14 Jun 2024 13:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LT1Pb7ys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lx2sBrbF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LT1Pb7ys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lx2sBrbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A1810E252;
 Fri, 14 Jun 2024 13:36:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CB9433873;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfNtw5Nm4AZDZ+Hc/tZxBivEuvk7CEMf16k5ZsG0+G4=;
 b=LT1Pb7ysssOtXmruS7VcmSly/Ax6CVVgY9JdS4VH6DiKCAcXoR2R1k5ArO1Y+Sog79f9Pg
 1RzncF71gFVu06LOVjAVt62M/IUFvh5nEYjqDi3FIP6RQAOzpjYH6ruSi7Dn0O/FfO/3wC
 acyV2Biw2bvegDDxPVf0N1LJyaTbPQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfNtw5Nm4AZDZ+Hc/tZxBivEuvk7CEMf16k5ZsG0+G4=;
 b=lx2sBrbFSDm4acjsvc6sf6/lv7tDfztJoLRLbnm7swRD5fs5ztsPGatFG5DIXSKmayscPK
 i8dLm9Nxf8defkCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfNtw5Nm4AZDZ+Hc/tZxBivEuvk7CEMf16k5ZsG0+G4=;
 b=LT1Pb7ysssOtXmruS7VcmSly/Ax6CVVgY9JdS4VH6DiKCAcXoR2R1k5ArO1Y+Sog79f9Pg
 1RzncF71gFVu06LOVjAVt62M/IUFvh5nEYjqDi3FIP6RQAOzpjYH6ruSi7Dn0O/FfO/3wC
 acyV2Biw2bvegDDxPVf0N1LJyaTbPQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfNtw5Nm4AZDZ+Hc/tZxBivEuvk7CEMf16k5ZsG0+G4=;
 b=lx2sBrbFSDm4acjsvc6sf6/lv7tDfztJoLRLbnm7swRD5fs5ztsPGatFG5DIXSKmayscPK
 i8dLm9Nxf8defkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF5A013AB5;
 Fri, 14 Jun 2024 13:36:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AJp5LUBHbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:36:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/6] drm/xe: Remove vunmap calls object-freeing code
Date: Fri, 14 Jun 2024 15:21:59 +0200
Message-ID: <20240614133556.11378-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,amd.com,redhat.com,loongson.cn];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Move calls to unmap the buffer-object memory from the object-release
code in xe_gem_object_free() to the caller of the release.

Doing an unmap for a BO requires holding the reservation lock, which
is not allowed while releasing a GEM object. Without the reservation
lock, TTM can concurrently evict the buffer object that is to be
released; making the mapping invalid.

Pushing the unmap calls, namely xe_bo_vunmap(), releases the mapped
pages before the buffer object.

While at it, add a warning about buffer mappings to the GEM-object
release code. The warning message and unmap code can be removed after
the driver has been audited to not release mapped buffer objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/xe/display/intel_fb_bo.c | 12 +++++++-----
 drivers/gpu/drm/xe/xe_bo.c               | 14 +++++++++++++-
 drivers/gpu/drm/xe/xe_bo.h               | 23 ++++++++++++-----------
 drivers/gpu/drm/xe/xe_lrc.c              |  1 +
 4 files changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index f835492f73fb4..cf2720dbdd51f 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -12,12 +12,14 @@
 
 void intel_fb_bo_framebuffer_fini(struct xe_bo *bo)
 {
-	if (bo->flags & XE_BO_FLAG_PINNED) {
-		/* Unpin our kernel fb first */
-		xe_bo_lock(bo, false);
+	xe_bo_lock(bo, false);
+	xe_bo_vunmap(bo);
+
+	/* Unpin our kernel fb first */
+	if (bo->flags & XE_BO_FLAG_PINNED)
 		xe_bo_unpin(bo);
-		xe_bo_unlock(bo);
-	}
+
+	xe_bo_unlock(bo);
 	xe_bo_put(bo);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bae01ce4e5b9..a98d857ff1e5a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1093,6 +1093,19 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 static void xe_gem_object_free(struct drm_gem_object *obj)
 {
+	struct xe_bo *bo = gem_to_xe_bo(obj);
+
+	/*
+	 * Trying to free the object with a mapping in place. Resolve
+	 * this warning by calling xe_bo_vunmap() in the code that leads
+	 * ot this object release.
+	 *
+	 * TODO: Audit the driver to not release mapped buffer objects and
+	 *       then remove this block.
+	 */
+	if (drm_WARN_ON(obj->dev, !iosys_map_is_null(&bo->vmap)))
+		__xe_bo_vunmap(bo);
+
 	/* Our BO reference counting scheme works as follows:
 	 *
 	 * The gem object kref is typically used throughout the driver,
@@ -1106,7 +1119,6 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
 	 * driver ttm callbacks is allowed to use the ttm_buffer_object
 	 * refcount directly if needed.
 	 */
-	__xe_bo_vunmap(gem_to_xe_bo(obj));
 	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f54..5d1f8f13fbf13 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -170,17 +170,6 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 	return bo->ttm.pin_count;
 }
 
-static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
-{
-	if (likely(bo)) {
-		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
-		xe_bo_unlock(bo);
-
-		xe_bo_put(bo);
-	}
-}
-
 bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
 dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
 dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
@@ -202,6 +191,18 @@ xe_bo_ggtt_addr(struct xe_bo *bo)
 int xe_bo_vmap(struct xe_bo *bo);
 void xe_bo_vunmap(struct xe_bo *bo);
 
+static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
+{
+	if (likely(bo)) {
+		xe_bo_lock(bo, false);
+		xe_bo_vunmap(bo);
+		xe_bo_unpin(bo);
+		xe_bo_unlock(bo);
+
+		xe_bo_put(bo);
+	}
+}
+
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 3a68fe6d592ed..8a52797fe79bb 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -812,6 +812,7 @@ static void xe_lrc_finish(struct xe_lrc *lrc)
 {
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	xe_bo_lock(lrc->bo, false);
+	xe_bo_vunmap(lrc->bo);
 	xe_bo_unpin(lrc->bo);
 	xe_bo_unlock(lrc->bo);
 	xe_bo_put(lrc->bo);
-- 
2.45.2

