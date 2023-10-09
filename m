Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBF7BE223
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 16:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003A110E269;
	Mon,  9 Oct 2023 14:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37110E265
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 14:10:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 676131F381;
 Mon,  9 Oct 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696860621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTB13X2Leul0XPHrAxavB4xib9qywJ/deCFIW4a5yMo=;
 b=dHwqBZDUkp0g8+JAYlqMB8wBacSQmv2o+4JPlmr9aiTqGpDEhFI/whkPULjEojn4O+tojc
 YATcIW7nLJopk1kWwgGCJYTRwcZlygJtSN11OIN7sF38WL5O91Psw70ZzzqL22lrJDCgb7
 aGnG0aySr+5SrIcV6bpI7hx3AW3ypN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696860621;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rTB13X2Leul0XPHrAxavB4xib9qywJ/deCFIW4a5yMo=;
 b=cRZ77+mkxwD7aXq5ylPgS1JyvpEA2wG3ZgJ9ATR9apodfgVUHFI3V4NlaJkQvO8sDHIGSM
 SkLO2Q2k+OMqjPBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F84413905;
 Mon,  9 Oct 2023 14:10:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gGK4Cs0JJGXaBAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Oct 2023 14:10:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, jose.exposito89@gmail.com,
 arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: [PATCH v5 2/7] drm/atomic-helper: Add format-conversion state to
 shadow-plane state
Date: Mon,  9 Oct 2023 16:06:31 +0200
Message-ID: <20231009141018.11291-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009141018.11291-1-tzimmermann@suse.de>
References: <20231009141018.11291-1-tzimmermann@suse.de>
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

Store an instance of struct drm_format_conv_state in the shadow-plane
state struct drm_shadow_plane_state. Many drivers with shadow planes
use DRM's format helpers to copy or convert the framebuffer data to
backing storage in the scanout buffer. The shadow plane provides the
necessary state and manages the conversion's intermediate buffer memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c |  9 +++++++++
 include/drm/drm_gem_atomic_helper.h     | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 5d4b9cd077f7a..e440f458b6633 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -218,7 +218,14 @@ void
 __drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane,
 				       struct drm_shadow_plane_state *new_shadow_plane_state)
 {
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_shadow_plane_state *shadow_plane_state =
+		to_drm_shadow_plane_state(plane_state);
+
 	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
+
+	drm_format_conv_state_copy(&shadow_plane_state->fmtcnv_state,
+				   &new_shadow_plane_state->fmtcnv_state);
 }
 EXPORT_SYMBOL(__drm_gem_duplicate_shadow_plane_state);
 
@@ -266,6 +273,7 @@ EXPORT_SYMBOL(drm_gem_duplicate_shadow_plane_state);
  */
 void __drm_gem_destroy_shadow_plane_state(struct drm_shadow_plane_state *shadow_plane_state)
 {
+	drm_format_conv_state_release(&shadow_plane_state->fmtcnv_state);
 	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
 }
 EXPORT_SYMBOL(__drm_gem_destroy_shadow_plane_state);
@@ -302,6 +310,7 @@ void __drm_gem_reset_shadow_plane(struct drm_plane *plane,
 				  struct drm_shadow_plane_state *shadow_plane_state)
 {
 	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+	drm_format_conv_state_init(&shadow_plane_state->fmtcnv_state);
 }
 EXPORT_SYMBOL(__drm_gem_reset_shadow_plane);
 
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 40b8b039518e0..3e01c619a25e0 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -5,6 +5,7 @@
 
 #include <linux/iosys-map.h>
 
+#include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
 
@@ -49,6 +50,15 @@ struct drm_shadow_plane_state {
 	/** @base: plane state */
 	struct drm_plane_state base;
 
+	/**
+	 * @fmtcnv_state: Format-conversion state
+	 *
+	 * Per-plane state for format conversion.
+	 * Flags for copying shadow buffers into backend storage. Also holds
+	 * temporary storage for format conversion.
+	 */
+	struct drm_format_conv_state fmtcnv_state;
+
 	/* Transitional state - do not export or duplicate */
 
 	/**
-- 
2.42.0

