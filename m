Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10601BC4CE6
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EF910E801;
	Wed,  8 Oct 2025 12:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cj0daeMW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CYzMVd8P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cj0daeMW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CYzMVd8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59310E811
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:32:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A31E92293F;
 Wed,  8 Oct 2025 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759926720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JUhmxfFLvL8t9MlKgl4P8RNHzdJMF92tr4beFXYLHmQ=;
 b=cj0daeMWPEjK9CuFL/BuvReokDKjMF0QIMIElP4xYPqPcNXVIzYcs5Z1kYEeVab+xKkLuP
 JNoxfCfN/wnlq4MiRIXrRQbYQGKFKw+RuA9YKsrrpCvdfWN7m2g+BMbbfAwzTpscCa/8x1
 0PJlePprEE4qoswiRYVlfvDM1GjpMcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759926720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JUhmxfFLvL8t9MlKgl4P8RNHzdJMF92tr4beFXYLHmQ=;
 b=CYzMVd8P7e4CBXZ1ehdiRzd6wIxmYhGjUk1OpmCw7wSD4GnXzW1VkExk4bMrqCRLHz41Nj
 JwBnT0q1nakmEwDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759926720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JUhmxfFLvL8t9MlKgl4P8RNHzdJMF92tr4beFXYLHmQ=;
 b=cj0daeMWPEjK9CuFL/BuvReokDKjMF0QIMIElP4xYPqPcNXVIzYcs5Z1kYEeVab+xKkLuP
 JNoxfCfN/wnlq4MiRIXrRQbYQGKFKw+RuA9YKsrrpCvdfWN7m2g+BMbbfAwzTpscCa/8x1
 0PJlePprEE4qoswiRYVlfvDM1GjpMcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759926720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JUhmxfFLvL8t9MlKgl4P8RNHzdJMF92tr4beFXYLHmQ=;
 b=CYzMVd8P7e4CBXZ1ehdiRzd6wIxmYhGjUk1OpmCw7wSD4GnXzW1VkExk4bMrqCRLHz41Nj
 JwBnT0q1nakmEwDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5981813A3D;
 Wed,  8 Oct 2025 12:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FERuFMBZ5mjKPQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Oct 2025 12:32:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/qxl: Use vblank timer
Date: Wed,  8 Oct 2025 14:29:06 +0200
Message-ID: <20251008122911.231674-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Use a vblank timer to simulate the vblank interrupt. The DRM vblank
helpers provide an implementation on top of Linux' hrtimer. Qxl
enables and disables the timer as part of the CRTC. The atomic_flush
callback sets up the event. Like vblank interrupts, the vblank timer
fires at the rate of the display refresh.

Most userspace limits its page flip rate according to the DRM vblank
event. Qxl's virtual hardware does not provide vblank interrupts, so
DRM sends each event ASAP. With the fast access times of virtual display
memory, the event rate is much higher than the display mode's refresh
rate; creating the next page flip almost immediately. This leads to
excessive CPU overhead from even small display updates, such as moving
the mouse pointer.

This problem affects qxl and all other virtual displays. See [1] for
a discussion in the context of hypervdrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]
---
 drivers/gpu/drm/qxl/qxl_display.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index ae7e572b1b4a..b7d0e60c0de2 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -37,6 +37,8 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
@@ -382,7 +384,25 @@ static void qxl_crtc_update_monitors_config(struct drm_crtc *crtc,
 static void qxl_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct drm_pending_vblank_event *event;
+
 	qxl_crtc_update_monitors_config(crtc, "flush");
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
 }
 
 static void qxl_crtc_destroy(struct drm_crtc *crtc)
@@ -401,6 +421,7 @@ static const struct drm_crtc_funcs qxl_crtc_funcs = {
 	.reset = drm_atomic_helper_crtc_reset,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 };
 
 static int qxl_framebuffer_surface_dirty(struct drm_framebuffer *fb,
@@ -455,11 +476,15 @@ static void qxl_crtc_atomic_enable(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
 	qxl_crtc_update_monitors_config(crtc, "enable");
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static void qxl_crtc_atomic_disable(struct drm_crtc *crtc,
 				    struct drm_atomic_state *state)
 {
+	drm_crtc_vblank_off(crtc);
+
 	qxl_crtc_update_monitors_config(crtc, "disable");
 }
 
@@ -1276,6 +1301,10 @@ int qxl_modeset_init(struct qxl_device *qdev)
 
 	qxl_display_read_client_monitors_config(qdev);
 
+	ret = drm_vblank_init(&qdev->ddev, qxl_num_crtc);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(&qdev->ddev);
 	return 0;
 }
-- 
2.51.0

