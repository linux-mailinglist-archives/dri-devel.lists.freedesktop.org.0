Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B9B640741
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D0110E6E9;
	Fri,  2 Dec 2022 12:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D892310E6E8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:56:47 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4D48A1F8B0;
 Fri,  2 Dec 2022 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669985806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9SIEOMrFi203Dc7F1TMvoyNchYeeS+ttljv+w9pwKU=;
 b=rS70ozLWMUqJniCMtJEGeJF++Gy1R0OJ5UEHcS+omi2LxTiQr9OW9wOXJJXSliy8cOCdg4
 akAp+8pq55LPE2kJWBKjvCXRSemKcXoEybfTvzTGzPFB9PqU1zjm8EYMz2rFSrDUdSZkT8
 zE7jM5LUAa4vbShpyHUl3y3w9RRJCSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669985806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9SIEOMrFi203Dc7F1TMvoyNchYeeS+ttljv+w9pwKU=;
 b=l+kM63BVjHCVuiV7ogB5rAKR8YxXU1O6mC9EQsZipYBH7YD/mKETsxXubI/iAV4IUjY3+l
 qyxEEPCRx8h1zDDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 14CC913649;
 Fri,  2 Dec 2022 12:56:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kDIvBA72iWOhOwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Dec 2022 12:56:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, thierry.reding@gmail.com,
 sam@ravnborg.org, emma@anholt.net, david@lechnology.com,
 kamlesh.gurudasani@gmail.com, noralf@tronnes.org, javierm@redhat.com
Subject: [PATCH v2 1/8] drm/simple-kms: Remove
 drm_gem_simple_display_pipe_prepare_fb()
Date: Fri,  2 Dec 2022 13:56:37 +0100
Message-Id: <20221202125644.7917-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202125644.7917-1-tzimmermann@suse.de>
References: <20221202125644.7917-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The helper drm_gem_simple_display_pipe_prepare_fb() is simple-KMS'
default implementation for prepare_fb. Remove the call from drivers
that set it explicitly. Then inline the helper into the only caller
within simple-kms helpers. No functional changes.

Simple-KMS drivers that implement the prepare_fb callback should call
drm_gem_plane_helper_prepare_fb() directly.

v2:
	* fix typo in commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c      | 31 +-------------------
 drivers/gpu/drm/drm_simple_kms_helper.c      |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c |  1 -
 drivers/gpu/drm/tiny/ili9163.c               |  1 -
 include/drm/drm_gem_atomic_helper.h          |  2 --
 include/drm/drm_plane.h                      |  4 +--
 include/drm/drm_simple_kms_helper.h          |  4 +--
 7 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e42800718f51..5d4b9cd077f7 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -26,11 +26,8 @@
  * call drm_gem_plane_helper_prepare_fb() from their implementation of
  * struct &drm_plane_helper.prepare_fb . It sets the plane's fence from
  * the framebuffer so that the DRM core can synchronize access automatically.
- *
  * drm_gem_plane_helper_prepare_fb() can also be used directly as
- * implementation of prepare_fb. For drivers based on
- * struct drm_simple_display_pipe, drm_gem_simple_display_pipe_prepare_fb()
- * provides equivalent functionality.
+ * implementation of prepare_fb.
  *
  * .. code-block:: c
  *
@@ -41,11 +38,6 @@
  *		. prepare_fb = drm_gem_plane_helper_prepare_fb,
  *	};
  *
- *	struct drm_simple_display_pipe_funcs driver_pipe_funcs = {
- *		...,
- *		. prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
- *	};
- *
  * A driver using a shadow buffer copies the content of the shadow buffers
  * into the HW's framebuffer memory during an atomic update. This requires
  * a mapping of the shadow buffer into kernel address space. The mappings
@@ -205,27 +197,6 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane,
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
 
-/**
- * drm_gem_simple_display_pipe_prepare_fb - prepare_fb helper for &drm_simple_display_pipe
- * @pipe: Simple display pipe
- * @plane_state: Plane state
- *
- * This function uses drm_gem_plane_helper_prepare_fb() to extract the fences
- * from &drm_gem_object.resv and attaches them to the plane state for the atomic
- * helper to wait on. This is necessary to correctly implement implicit
- * synchronization for any buffers shared as a struct &dma_buf. Drivers can use
- * this as their &drm_simple_display_pipe_funcs.prepare_fb callback.
- *
- * See drm_gem_plane_helper_prepare_fb() for a discussion of implicit and
- * explicit fencing in atomic modeset updates.
- */
-int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
-					   struct drm_plane_state *plane_state)
-{
-	return drm_gem_plane_helper_prepare_fb(&pipe->plane, plane_state);
-}
-EXPORT_SYMBOL(drm_gem_simple_display_pipe_prepare_fb);
-
 /*
  * Shadow-buffered Planes
  */
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 3ef420ec4534..270523ae36d4 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -267,7 +267,7 @@ static int drm_simple_kms_plane_prepare_fb(struct drm_plane *plane,
 
 		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
 
-		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
+		return drm_gem_plane_helper_prepare_fb(plane, state);
 	}
 
 	return pipe->funcs->prepare_fb(pipe, state);
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index 384a724f2822..be088983aa7c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -581,7 +581,6 @@ static const struct drm_simple_display_pipe_funcs ili9341_dbi_funcs = {
 	.enable = ili9341_dbi_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode ili9341_dbi_mode = {
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index ca0451f79962..835ed12792d5 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -104,7 +104,6 @@ static const struct drm_simple_display_pipe_funcs ili9163_pipe_funcs = {
 	.enable = yx240qv29_enable,
 	.disable = mipi_dbi_pipe_disable,
 	.update = mipi_dbi_pipe_update,
-	.prepare_fb = drm_gem_simple_display_pipe_prepare_fb,
 };
 
 static const struct drm_display_mode yx240qv29_mode = {
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 6970ccb787e2..40b8b039518e 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -15,8 +15,6 @@ struct drm_simple_display_pipe;
  */
 
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state);
-int drm_gem_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
-					   struct drm_plane_state *plane_state);
 
 /*
  * Helpers for planes with shadow buffers
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 447e664e49d5..51291983ea44 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -77,8 +77,8 @@ struct drm_plane_state {
 	 * write this field directly for a driver's implicit fence.
 	 *
 	 * Drivers should store any implicit fence in this from their
-	 * &drm_plane_helper_funcs.prepare_fb callback. See drm_gem_plane_helper_prepare_fb()
-	 * and drm_gem_simple_display_pipe_prepare_fb() for suitable helpers.
+	 * &drm_plane_helper_funcs.prepare_fb callback. See
+	 * drm_gem_plane_helper_prepare_fb() for a suitable helper.
 	 */
 	struct dma_fence *fence;
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index 2298fe3af4cd..b2486d073763 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -117,9 +117,9 @@ struct drm_simple_display_pipe_funcs {
 	 * more details.
 	 *
 	 * For GEM drivers who neither have a @prepare_fb nor @cleanup_fb hook
-	 * set drm_gem_simple_display_pipe_prepare_fb() is called automatically
+	 * set, drm_gem_plane_helper_prepare_fb() is called automatically
 	 * to implement this. Other drivers which need additional plane
-	 * processing can call drm_gem_simple_display_pipe_prepare_fb() from
+	 * processing can call drm_gem_plane_helper_prepare_fb() from
 	 * their @prepare_fb hook.
 	 */
 	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
-- 
2.38.1

