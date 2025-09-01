Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB5EB3E145
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 13:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAB010E423;
	Mon,  1 Sep 2025 11:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1mFQQ4pn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PqcahHCN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1mFQQ4pn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PqcahHCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B87710E423
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 11:15:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3323521186;
 Mon,  1 Sep 2025 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756725330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3iPFv9Z+q9QlqNS7P5EKo+4odSakiuxynMImEIuimc=;
 b=1mFQQ4pnsbakjAQN3A0bk8i6QPX4tF8b03y/ekMdlYLu0c72Tr7o/smFga8bhIQD13Ja+q
 FFXl182Ongurb8BhIK6no/CHA9ugbZN9SyhMHUB5uWzcOV7cCkeioZEXNJKIdD3jcahF7S
 SCwdNtltIiTpuk0Twt01sHHPXr7o9X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756725330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3iPFv9Z+q9QlqNS7P5EKo+4odSakiuxynMImEIuimc=;
 b=PqcahHCNzJ7UNojkNJIOUKukchUOHcP5gSYFg7elSKVIhPJg6WWMNhKzVyG3OTN370hNra
 I9BfYiCb9PGAqvCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756725330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3iPFv9Z+q9QlqNS7P5EKo+4odSakiuxynMImEIuimc=;
 b=1mFQQ4pnsbakjAQN3A0bk8i6QPX4tF8b03y/ekMdlYLu0c72Tr7o/smFga8bhIQD13Ja+q
 FFXl182Ongurb8BhIK6no/CHA9ugbZN9SyhMHUB5uWzcOV7cCkeioZEXNJKIdD3jcahF7S
 SCwdNtltIiTpuk0Twt01sHHPXr7o9X8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756725330;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3iPFv9Z+q9QlqNS7P5EKo+4odSakiuxynMImEIuimc=;
 b=PqcahHCNzJ7UNojkNJIOUKukchUOHcP5gSYFg7elSKVIhPJg6WWMNhKzVyG3OTN370hNra
 I9BfYiCb9PGAqvCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71C631378C;
 Mon,  1 Sep 2025 11:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wMlMGlGAtWj8EAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Sep 2025 11:15:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: louis.chauvet@bootlin.com, drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/4] drm/vblank: Add CRTC helpers for simple use cases
Date: Mon,  1 Sep 2025 13:06:59 +0200
Message-ID: <20250901111241.233875-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901111241.233875-1-tzimmermann@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[11];
 R_RATELIMIT(0.00)[to_ip_from(RLgb6padn6wcu17bxtda1k7h6p)];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -5.30
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

Implement atomic_flush, atomic_enable and atomic_disable of struct
drm_crtc_helper_funcs for vblank handling. Driver with no further
requirements can use these functions instead of adding their own.
Also simplifies the use of vblank timers.

v2:
- fix docs

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_vblank_helper.c | 80 +++++++++++++++++++++++++++++
 include/drm/drm_vblank_helper.h     | 23 +++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
index f94d1e706191..a04a6ba1b0ca 100644
--- a/drivers/gpu/drm/drm_vblank_helper.c
+++ b/drivers/gpu/drm/drm_vblank_helper.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: MIT
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -17,6 +18,12 @@
  * Drivers enable support for vblank timers by setting the vblank callbacks
  * in struct &drm_crtc_funcs to the helpers provided by this library. The
  * initializer macro DRM_CRTC_VBLANK_TIMER_FUNCS does this conveniently.
+ * The driver further has to send the VBLANK event from its atomic_flush
+ * callback and control vblank from the CRTC's atomic_enable and atomic_disable
+ * callbacks. The callbacks are located in struct &drm_crtc_helper_funcs.
+ * The vblank helper library provides implementations of these callbacks
+ * for drivers without further requirements. The initializer macro
+ * DRM_CRTC_HELPER_VBLANK_FUNCS sets them coveniently.
  *
  * Once the driver enables vblank support with drm_vblank_init(), each
  * CRTC's vblank timer fires according to the programmed display mode. By
@@ -25,6 +32,79 @@
  * struct &drm_crtc_helper_funcs.handle_vblank_timeout.
  */
 
+/*
+ * VBLANK helpers
+ */
+
+/**
+ * drm_crtc_vblank_atomic_flush -
+ *	Implements struct &drm_crtc_helper_funcs.atomic_flush
+ * @crtc: The CRTC
+ * @state: The atomic state to apply
+ *
+ * The helper drm_crtc_vblank_atomic_flush() implements atomic_flush of
+ * struct drm_crtc_helper_funcs for CRTCs that only need to send out a
+ * VBLANK event.
+ *
+ * See also struct &drm_crtc_helper_funcs.atomic_flush.
+ */
+void drm_crtc_vblank_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_pending_vblank_event *event;
+
+	spin_lock_irq(&dev->event_lock);
+
+	event = crtc_state->event;
+	crtc_state->event = NULL;
+
+	if (event) {
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+	}
+
+	spin_unlock_irq(&dev->event_lock);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_atomic_flush);
+
+/**
+ * drm_crtc_vblank_atomic_enable - Implements struct &drm_crtc_helper_funcs.atomic_enable
+ * @crtc: The CRTC
+ * @state: The atomic state
+ *
+ * The helper drm_crtc_vblank_atomic_enable() implements atomic_enable
+ * of struct drm_crtc_helper_funcs for CRTCs the only need to enable VBLANKs.
+ *
+ * See also struct &drm_crtc_helper_funcs.atomic_enable.
+ */
+void drm_crtc_vblank_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(crtc);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_atomic_enable);
+
+/**
+ * drm_crtc_vblank_atomic_disable - Implements struct &drm_crtc_helper_funcs.atomic_disable
+ * @crtc: The CRTC
+ * @state: The atomic state
+ *
+ * The helper drm_crtc_vblank_atomic_disable() implements atomic_disable
+ * of struct drm_crtc_helper_funcs for CRTCs the only need to disable VBLANKs.
+ *
+ * See also struct &drm_crtc_funcs.atomic_disable.
+ */
+void drm_crtc_vblank_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_off(crtc);
+}
+EXPORT_SYMBOL(drm_crtc_vblank_atomic_disable);
+
 /*
  * VBLANK timer
  */
diff --git a/include/drm/drm_vblank_helper.h b/include/drm/drm_vblank_helper.h
index 74a971d0cfba..fcd8a9b35846 100644
--- a/include/drm/drm_vblank_helper.h
+++ b/include/drm/drm_vblank_helper.h
@@ -6,8 +6,31 @@
 #include <linux/hrtimer_types.h>
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_crtc;
 
+/*
+ * VBLANK helpers
+ */
+
+void drm_crtc_vblank_atomic_flush(struct drm_crtc *crtc,
+				  struct drm_atomic_state *state);
+void drm_crtc_vblank_atomic_enable(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state);
+void drm_crtc_vblank_atomic_disable(struct drm_crtc *crtc,
+				    struct drm_atomic_state *crtc_state);
+
+/**
+ * DRM_CRTC_HELPER_VBLANK_FUNCS - Default implementation for VBLANK helpers
+ *
+ * This macro initializes struct &drm_crtc_helper_funcs to default helpers
+ * for VBLANK handling.
+ */
+#define DRM_CRTC_HELPER_VBLANK_FUNCS \
+	.atomic_flush = drm_crtc_vblank_atomic_flush, \
+	.atomic_enable = drm_crtc_vblank_atomic_enable, \
+	.atomic_disable = drm_crtc_vblank_atomic_disable
+
 /*
  * VBLANK timer
  */
-- 
2.50.1

