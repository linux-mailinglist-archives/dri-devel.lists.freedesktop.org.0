Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1969A3BB81F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FEF89A75;
	Mon,  5 Jul 2021 07:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1F089A75
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 07:46:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA7D01FE2E;
 Mon,  5 Jul 2021 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625471194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXjmmfRqsrvSnwve7VZ6ACEZIVgAaBLu//M+yjdm1Kg=;
 b=crJwEF3FH3PYqgfh+tFLRNv9mwBTqBQFcRWSFtW0Rgh6bqrn8xBRgN0Hecvc5xaJ6Hvhhg
 g/Jjk7gfb2TCJ0ZYYj3d+dpTc6NWhsy4TCi/gaUHzNxEGibhZnsTRXIgTX/iu3dO5Whx6R
 popRhg37Djmz1A1TSGa9j3+u3+6LJx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625471194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXjmmfRqsrvSnwve7VZ6ACEZIVgAaBLu//M+yjdm1Kg=;
 b=5pzM0ukknTO8YvhR7C+MwfQ+1orQZcHXBlGpeVO4/8JJof6hz/F7v8MVmL91YWVcZVNfDl
 emLwMs6aSW+a9ADQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7CB713A47;
 Mon,  5 Jul 2021 07:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4Kb2J9q44mBNDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 07:46:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/4] drm/gem: Export implementation of shadow-plane helpers
Date: Mon,  5 Jul 2021 09:46:30 +0200
Message-Id: <20210705074633.9425-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705074633.9425-1-tzimmermann@suse.de>
References: <20210705074633.9425-1-tzimmermann@suse.de>
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

Export the implementation of duplicate, destroy and reset helpers for
shadow-buffered plane state. Useful for drivers that subclass struct
drm_shadow_plane_state.

The exported functions are wrappers around plane-state implementation,
but using them is the correct thing to do for drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 55 +++++++++++++++++++++++--
 include/drm/drm_gem_atomic_helper.h     |  6 +++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index bc9396f2a0ed..26af09b959d4 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -182,6 +182,27 @@ EXPORT_SYMBOL(drm_gem_simple_display_pipe_prepare_fb);
  * Shadow-buffered Planes
  */
 
+/**
+ * __drm_gem_duplicate_shadow_plane_state - duplicates shadow-buffered plane state
+ * @plane: the plane
+ * @new_shadow_plane_state: the new shadow-buffered plane state
+ *
+ * This function duplicates shadow-buffered plane state. This is helpful for drivers
+ * that subclass struct drm_shadow_plane_state.
+ *
+ * The function does not duplicate existing mappings of the shadow buffers.
+ * Mappings are maintained during the atomic commit by the plane's prepare_fb
+ * and cleanup_fb helpers. See drm_gem_prepare_shadow_fb() and drm_gem_cleanup_shadow_fb()
+ * for corresponding helpers.
+ */
+void
+__drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane,
+				       struct drm_shadow_plane_state *new_shadow_plane_state)
+{
+	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
+}
+EXPORT_SYMBOL(__drm_gem_duplicate_shadow_plane_state);
+
 /**
  * drm_gem_duplicate_shadow_plane_state - duplicates shadow-buffered plane state
  * @plane: the plane
@@ -211,12 +232,25 @@ drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
 	new_shadow_plane_state = kzalloc(sizeof(*new_shadow_plane_state), GFP_KERNEL);
 	if (!new_shadow_plane_state)
 		return NULL;
-	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
 
 	return &new_shadow_plane_state->base;
 }
 EXPORT_SYMBOL(drm_gem_duplicate_shadow_plane_state);
 
+/**
+ * __drm_gem_destroy_shadow_plane_state - cleans up shadow-buffered plane state
+ * @shadow_plane_state: the shadow-buffered plane state
+ *
+ * This function cleans up shadow-buffered plane state. Helpful for drivers that
+ * subclass struct drm_shadow_plane_state.
+ */
+void __drm_gem_destroy_shadow_plane_state(struct drm_shadow_plane_state *shadow_plane_state)
+{
+	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
+}
+EXPORT_SYMBOL(__drm_gem_destroy_shadow_plane_state);
+
 /**
  * drm_gem_destroy_shadow_plane_state - deletes shadow-buffered plane state
  * @plane: the plane
@@ -232,11 +266,26 @@ void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
 	struct drm_shadow_plane_state *shadow_plane_state =
 		to_drm_shadow_plane_state(plane_state);
 
-	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
+	__drm_gem_destroy_shadow_plane_state(shadow_plane_state);
 	kfree(shadow_plane_state);
 }
 EXPORT_SYMBOL(drm_gem_destroy_shadow_plane_state);
 
+/**
+ * __drm_gem_reset_shadow_plane - resets a shadow-buffered plane
+ * @plane: the plane
+ * @shadow_plane_state: the shadow-buffered plane state
+ *
+ * This function resets state for shadow-buffered planes. Helpful
+ * for drivers that subclass struct drm_shadow_plane_state.
+ */
+void __drm_gem_reset_shadow_plane(struct drm_plane *plane,
+				  struct drm_shadow_plane_state *shadow_plane_state)
+{
+	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+}
+EXPORT_SYMBOL(__drm_gem_reset_shadow_plane);
+
 /**
  * drm_gem_reset_shadow_plane - resets a shadow-buffered plane
  * @plane: the plane
@@ -258,7 +307,7 @@ void drm_gem_reset_shadow_plane(struct drm_plane *plane)
 	shadow_plane_state = kzalloc(sizeof(*shadow_plane_state), GFP_KERNEL);
 	if (!shadow_plane_state)
 		return;
-	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+	__drm_gem_reset_shadow_plane(plane, shadow_plane_state);
 }
 EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
 
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index cfc5adee3d13..d82c23622156 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -53,6 +53,12 @@ to_drm_shadow_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct drm_shadow_plane_state, base);
 }
 
+void __drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane,
+					    struct drm_shadow_plane_state *new_shadow_plane_state);
+void __drm_gem_destroy_shadow_plane_state(struct drm_shadow_plane_state *shadow_plane_state);
+void __drm_gem_reset_shadow_plane(struct drm_plane *plane,
+				  struct drm_shadow_plane_state *shadow_plane_state);
+
 void drm_gem_reset_shadow_plane(struct drm_plane *plane);
 struct drm_plane_state *drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane);
 void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
-- 
2.32.0

