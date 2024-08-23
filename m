Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E420E95CCB4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968E10E5B5;
	Fri, 23 Aug 2024 12:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4971410E586
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:44:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F0CCB22681;
 Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B15D01333E;
 Fri, 23 Aug 2024 12:44:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gIkwKiqEyGbKVwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Aug 2024 12:44:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/10] drm/gem-vram: Remove support for simple display
 pipelines
Date: Fri, 23 Aug 2024 14:28:53 +0200
Message-ID: <20240823124422.286989-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823124422.286989-1-tzimmermann@suse.de>
References: <20240823124422.286989-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: F0CCB22681
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

There are no more drivers that use GEM VRAM helpers with a simple
display pipeline. Remove the respective code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 45 ---------------------------
 include/drm/drm_gem_vram_helper.h     | 13 --------
 2 files changed, 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 6027584406af..22b1fe9c03b8 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -16,7 +16,6 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_prime.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_tt.h>
@@ -686,50 +685,6 @@ drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 }
 EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
 
-/*
- * Helpers for struct drm_simple_display_pipe_funcs
- */
-
-/**
- * drm_gem_vram_simple_display_pipe_prepare_fb() - Implements &struct
- *				   drm_simple_display_pipe_funcs.prepare_fb
- * @pipe:	a simple display pipe
- * @new_state:	the plane's new state
- *
- * During plane updates, this function pins the GEM VRAM
- * objects of the plane's new framebuffer to VRAM. Call
- * drm_gem_vram_simple_display_pipe_cleanup_fb() to unpin them.
- *
- * Returns:
- *	0 on success, or
- *	a negative errno code otherwise.
- */
-int drm_gem_vram_simple_display_pipe_prepare_fb(
-	struct drm_simple_display_pipe *pipe,
-	struct drm_plane_state *new_state)
-{
-	return drm_gem_vram_plane_helper_prepare_fb(&pipe->plane, new_state);
-}
-EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_prepare_fb);
-
-/**
- * drm_gem_vram_simple_display_pipe_cleanup_fb() - Implements &struct
- *						   drm_simple_display_pipe_funcs.cleanup_fb
- * @pipe:	a simple display pipe
- * @old_state:	the plane's old state
- *
- * During plane updates, this function unpins the GEM VRAM
- * objects of the plane's old framebuffer from VRAM. Complements
- * drm_gem_vram_simple_display_pipe_prepare_fb().
- */
-void drm_gem_vram_simple_display_pipe_cleanup_fb(
-	struct drm_simple_display_pipe *pipe,
-	struct drm_plane_state *old_state)
-{
-	drm_gem_vram_plane_helper_cleanup_fb(&pipe->plane, old_state);
-}
-EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_cleanup_fb);
-
 /*
  * PRIME helpers
  */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 9a73f786f4ad..00830b49a3ff 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -17,7 +17,6 @@
 struct drm_mode_create_dumb;
 struct drm_plane;
 struct drm_plane_state;
-struct drm_simple_display_pipe;
 struct filp;
 struct vm_area_struct;
 
@@ -137,18 +136,6 @@ drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 	.prepare_fb = drm_gem_vram_plane_helper_prepare_fb, \
 	.cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb
 
-/*
- * Helpers for struct drm_simple_display_pipe_funcs
- */
-
-int drm_gem_vram_simple_display_pipe_prepare_fb(
-	struct drm_simple_display_pipe *pipe,
-	struct drm_plane_state *new_state);
-
-void drm_gem_vram_simple_display_pipe_cleanup_fb(
-	struct drm_simple_display_pipe *pipe,
-	struct drm_plane_state *old_state);
-
 /**
  * define DRM_GEM_VRAM_DRIVER - default callback functions for
  *				&struct drm_driver
-- 
2.46.0

