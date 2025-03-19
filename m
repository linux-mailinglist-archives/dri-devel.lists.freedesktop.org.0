Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906EBA686E5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 09:34:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0910E2EE;
	Wed, 19 Mar 2025 08:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kf/QqXuZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JfuLXd9/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kf/QqXuZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JfuLXd9/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7479C10E2ED
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 08:34:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5842D1F890;
 Wed, 19 Mar 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3O/o5ACSEd0uAUZkX1hzXCwDcmZjeMZ1XBgy+kE9s4=;
 b=kf/QqXuZ45lMkbEWqlcJiQEIKyYSLFBL6DKl/kTpZ1tqiXt8eec1PO2aTTzkjarbktMUsu
 jQNt7hSJ6iaV3qe1r25YsZzj7MwhirVBQ5JuXYoyNIoYwH3oBNS2Q0kN2Za4FCv9EMo/lA
 oZNxQK26/mVvMu7oiTEgcRq5rWkcln4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3O/o5ACSEd0uAUZkX1hzXCwDcmZjeMZ1XBgy+kE9s4=;
 b=JfuLXd9/lMnDZC7xvnyZl1TDNmfXYgTSNU8jAIuAispq9XMiTCtvJh+o/ohybmRvhk/MVx
 LBAriMopW7vD14Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742373235; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3O/o5ACSEd0uAUZkX1hzXCwDcmZjeMZ1XBgy+kE9s4=;
 b=kf/QqXuZ45lMkbEWqlcJiQEIKyYSLFBL6DKl/kTpZ1tqiXt8eec1PO2aTTzkjarbktMUsu
 jQNt7hSJ6iaV3qe1r25YsZzj7MwhirVBQ5JuXYoyNIoYwH3oBNS2Q0kN2Za4FCv9EMo/lA
 oZNxQK26/mVvMu7oiTEgcRq5rWkcln4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742373235;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k3O/o5ACSEd0uAUZkX1hzXCwDcmZjeMZ1XBgy+kE9s4=;
 b=JfuLXd9/lMnDZC7xvnyZl1TDNmfXYgTSNU8jAIuAispq9XMiTCtvJh+o/ohybmRvhk/MVx
 LBAriMopW7vD14Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5C4D13A38;
 Wed, 19 Mar 2025 08:33:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LnJNnKB2mc+OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Mar 2025 08:33:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/18] drm/sysfb: Maintain CRTC state in struct
 drm_sysfb_crtc_state
Date: Wed, 19 Mar 2025 08:45:08 +0100
Message-ID: <20250319083021.6472-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319083021.6472-1-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Move ofdrm's struct ofdrm_crtc_state plus functions to sysfb
helpers and rename everything to drm_sysfb_crtc_state.

The sysfb CRTC state is a regular CRTC state with information on
the primary plane's color format, as required for color management.
Helpers for sysfb planes will later set this up automatically.

In ofdrm and simpledrm, replace existing code with the new helpers.
Ofdrm continues to use the CRTC state for color management. This
has no effect on simpledrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 59 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h | 29 +++++++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 76 ++----------------------
 drivers/gpu/drm/sysfb/simpledrm.c        |  6 +-
 4 files changed, 95 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index 355e025c7c62..368061b6f514 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -1,7 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/export.h>
+#include <linux/slab.h>
 #include <linux/module.h>
 
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
@@ -33,6 +37,61 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
 }
 EXPORT_SYMBOL(drm_sysfb_mode);
 
+/*
+ * CRTC
+ */
+
+static void drm_sysfb_crtc_state_destroy(struct drm_sysfb_crtc_state *sysfb_crtc_state)
+{
+	__drm_atomic_helper_crtc_destroy_state(&sysfb_crtc_state->base);
+
+	kfree(sysfb_crtc_state);
+}
+
+void drm_sysfb_crtc_reset(struct drm_crtc *crtc)
+{
+	struct drm_sysfb_crtc_state *sysfb_crtc_state;
+
+	if (crtc->state)
+		drm_sysfb_crtc_state_destroy(to_drm_sysfb_crtc_state(crtc->state));
+
+	sysfb_crtc_state = kzalloc(sizeof(*sysfb_crtc_state), GFP_KERNEL);
+	if (sysfb_crtc_state)
+		__drm_atomic_helper_crtc_reset(crtc, &sysfb_crtc_state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+}
+EXPORT_SYMBOL(drm_sysfb_crtc_reset);
+
+struct drm_crtc_state *drm_sysfb_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct drm_sysfb_crtc_state *new_sysfb_crtc_state;
+	struct drm_sysfb_crtc_state *sysfb_crtc_state;
+
+	if (drm_WARN_ON(dev, !crtc_state))
+		return NULL;
+
+	new_sysfb_crtc_state = kzalloc(sizeof(*new_sysfb_crtc_state), GFP_KERNEL);
+	if (!new_sysfb_crtc_state)
+		return NULL;
+
+	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_sysfb_crtc_state->base);
+	new_sysfb_crtc_state->format = sysfb_crtc_state->format;
+
+	return &new_sysfb_crtc_state->base;
+}
+EXPORT_SYMBOL(drm_sysfb_crtc_atomic_duplicate_state);
+
+void drm_sysfb_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	drm_sysfb_crtc_state_destroy(to_drm_sysfb_crtc_state(crtc_state));
+}
+EXPORT_SYMBOL(drm_sysfb_crtc_atomic_destroy_state);
+
 /*
  * Connector
  */
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 7e3fe9fa5cff..91da27405a46 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -6,6 +6,7 @@
 #include <linux/container_of.h>
 #include <linux/iosys-map.h>
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_modes.h>
 
@@ -37,6 +38,34 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
 	return container_of(dev, struct drm_sysfb_device, dev);
 }
 
+/*
+ * CRTC
+ */
+
+struct drm_sysfb_crtc_state {
+	struct drm_crtc_state base;
+
+	/* Primary-plane format; required for color mgmt. */
+	const struct drm_format_info *format;
+};
+
+static inline struct drm_sysfb_crtc_state *
+to_drm_sysfb_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct drm_sysfb_crtc_state, base);
+}
+
+void drm_sysfb_crtc_reset(struct drm_crtc *crtc);
+struct drm_crtc_state *drm_sysfb_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
+void drm_sysfb_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
+
+#define DRM_SYSFB_CRTC_FUNCS \
+	.reset = drm_sysfb_crtc_reset, \
+	.set_config = drm_atomic_helper_set_config, \
+	.page_flip = drm_atomic_helper_page_flip, \
+	.atomic_duplicate_state = drm_sysfb_crtc_atomic_duplicate_state, \
+	.atomic_destroy_state = drm_sysfb_crtc_atomic_destroy_state
+
 /*
  * Connector
  */
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 85db7441d1bf..faaf35ba17f3 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -725,24 +725,6 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
  * Modesetting
  */
 
-struct ofdrm_crtc_state {
-	struct drm_crtc_state base;
-
-	/* Primary-plane format; required for color mgmt. */
-	const struct drm_format_info *format;
-};
-
-static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
-{
-	return container_of(base, struct ofdrm_crtc_state, base);
-}
-
-static void ofdrm_crtc_state_destroy(struct ofdrm_crtc_state *ofdrm_crtc_state)
-{
-	__drm_atomic_helper_crtc_destroy_state(&ofdrm_crtc_state->base);
-	kfree(ofdrm_crtc_state);
-}
-
 static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_INVALID
@@ -759,7 +741,7 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
-	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
+	struct drm_sysfb_crtc_state *new_sysfb_crtc_state;
 	int ret;
 
 	if (new_crtc)
@@ -786,8 +768,8 @@ static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
 
-	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
-	new_ofdrm_crtc_state->format = new_fb->format;
+	new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
+	new_sysfb_crtc_state->format = new_fb->format;
 
 	return 0;
 }
@@ -920,10 +902,10 @@ static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_ato
 {
 	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
-	struct ofdrm_crtc_state *ofdrm_crtc_state = to_ofdrm_crtc_state(crtc_state);
+	struct drm_sysfb_crtc_state *sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
 
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
-		const struct drm_format_info *format = ofdrm_crtc_state->format;
+		const struct drm_format_info *format = sysfb_crtc_state->format;
 
 		if (crtc_state->gamma_lut)
 			ofdrm_device_set_gamma(odev, format, crtc_state->gamma_lut->data);
@@ -943,55 +925,9 @@ static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
 	.atomic_flush = ofdrm_crtc_helper_atomic_flush,
 };
 
-static void ofdrm_crtc_reset(struct drm_crtc *crtc)
-{
-	struct ofdrm_crtc_state *ofdrm_crtc_state =
-		kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);
-
-	if (crtc->state)
-		ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
-
-	if (ofdrm_crtc_state)
-		__drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
-	else
-		__drm_atomic_helper_crtc_reset(crtc, NULL);
-}
-
-static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	struct drm_crtc_state *crtc_state = crtc->state;
-	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
-	struct ofdrm_crtc_state *ofdrm_crtc_state;
-
-	if (drm_WARN_ON(dev, !crtc_state))
-		return NULL;
-
-	new_ofdrm_crtc_state = kzalloc(sizeof(*new_ofdrm_crtc_state), GFP_KERNEL);
-	if (!new_ofdrm_crtc_state)
-		return NULL;
-
-	ofdrm_crtc_state = to_ofdrm_crtc_state(crtc_state);
-
-	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_ofdrm_crtc_state->base);
-	new_ofdrm_crtc_state->format = ofdrm_crtc_state->format;
-
-	return &new_ofdrm_crtc_state->base;
-}
-
-static void ofdrm_crtc_atomic_destroy_state(struct drm_crtc *crtc,
-					    struct drm_crtc_state *crtc_state)
-{
-	ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc_state));
-}
-
 static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
-	.reset = ofdrm_crtc_reset,
+	DRM_SYSFB_CRTC_FUNCS,
 	.destroy = drm_crtc_cleanup,
-	.set_config = drm_atomic_helper_set_config,
-	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = ofdrm_crtc_atomic_duplicate_state,
-	.atomic_destroy_state = ofdrm_crtc_atomic_destroy_state,
 };
 
 static const struct drm_encoder_funcs ofdrm_encoder_funcs = {
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 6d76d125d126..986177e4a0f0 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -715,12 +715,8 @@ static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
 };
 
 static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	DRM_SYSFB_CRTC_FUNCS,
 	.destroy = drm_crtc_cleanup,
-	.set_config = drm_atomic_helper_set_config,
-	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
 };
 
 static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
-- 
2.48.1

