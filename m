Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16059BC522C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 15:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210710E805;
	Wed,  8 Oct 2025 13:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jHRnoghz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YEC9QOKM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jHRnoghz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YEC9QOKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1B210E80B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 13:09:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 94FF2336D1;
 Wed,  8 Oct 2025 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759928991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+ABcXT8U8h4isHK8q9kC/TxlJbJmvPrk00/gHXEefp8=;
 b=jHRnoghzyjMtUufFOHO9PfjQ6x4KsmSi3SZBuXRJASOC9qnKl8NGGIZFaR7UppnLbYV1V+
 7VjicQyFjfdBT/2ZxzOOyqxOQ0JZwq+b9V4tdh7SAMXETkblyT7J+bHqTfbyjvbuLh4uA8
 ULb4Difkd15NyuxNo5G5u7zbqLXsxO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759928991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+ABcXT8U8h4isHK8q9kC/TxlJbJmvPrk00/gHXEefp8=;
 b=YEC9QOKMH7t5n0VwNcZzOpk9lm/Noof9hwSmKrrMe0wcJRTAcyjveikPj9MICSu2J+KFj8
 lZcXV9OXIZVyIdDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jHRnoghz;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YEC9QOKM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759928991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+ABcXT8U8h4isHK8q9kC/TxlJbJmvPrk00/gHXEefp8=;
 b=jHRnoghzyjMtUufFOHO9PfjQ6x4KsmSi3SZBuXRJASOC9qnKl8NGGIZFaR7UppnLbYV1V+
 7VjicQyFjfdBT/2ZxzOOyqxOQ0JZwq+b9V4tdh7SAMXETkblyT7J+bHqTfbyjvbuLh4uA8
 ULb4Difkd15NyuxNo5G5u7zbqLXsxO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759928991;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+ABcXT8U8h4isHK8q9kC/TxlJbJmvPrk00/gHXEefp8=;
 b=YEC9QOKMH7t5n0VwNcZzOpk9lm/Noof9hwSmKrrMe0wcJRTAcyjveikPj9MICSu2J+KFj8
 lZcXV9OXIZVyIdDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4089313693;
 Wed,  8 Oct 2025 13:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FHgJDp9i5mhqSgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 08 Oct 2025 13:09:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kraxel@redhat.com, dmitry.osipenko@collabora.com,
 gurchetansingh@chromium.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/virtgpu: Use vblank timer
Date: Wed,  8 Oct 2025 15:06:51 +0200
Message-ID: <20251008130701.246988-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[11]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 94FF2336D1
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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
helpers provide an implementation on top of Linux' hrtimer. Virtgpu
enables and disables the timer as part of the CRTC. The atomic_flush
callback sets up the event. Like vblank interrupts, the vblank timer
fires at the rate of the display refresh.

Most userspace limits its page flip rate according to the DRM vblank
event. Virtgpu's virtual hardware does not provide vblank interrupts, so
DRM sends each event ASAP. With the fast access times of virtual display
memory, the event rate is much higher than the display mode's refresh
rate; creating the next page flip almost immediately. This leads to
excessive CPU overhead from even small display updates, such as moving
the mouse pointer.

This problem affects virtgpu and all other virtual displays. See [1] for
a discussion in the context of hypervdrm.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 29 ++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index c3315935d8bc..ee134e46eeba 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -32,6 +32,8 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_vblank_helper.h>
 
 #include "virtgpu_drv.h"
 
@@ -55,6 +57,7 @@ static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
 	.reset                  = drm_atomic_helper_crtc_reset,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
+	DRM_CRTC_VBLANK_TIMER_FUNCS,
 };
 
 static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs = {
@@ -99,6 +102,7 @@ static void virtio_gpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crtc,
 					  struct drm_atomic_state *state)
 {
+	drm_crtc_vblank_on(crtc);
 }
 
 static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -108,6 +112,8 @@ static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
 
+	drm_crtc_vblank_off(crtc);
+
 	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0, 0);
 	virtio_gpu_notify(vgdev);
 }
@@ -121,9 +127,10 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
 static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 					 struct drm_atomic_state *state)
 {
-	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
-									  crtc);
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
+	struct drm_pending_vblank_event *event;
 
 	/*
 	 * virtio-gpu can't do modeset and plane update operations
@@ -133,6 +140,20 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state))
 		output->needs_modeset = true;
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
 
 static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
@@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
 
+	ret = drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
+	if (ret)
+		return ret;
+
 	drm_mode_config_reset(vgdev->ddev);
 	return 0;
 }
-- 
2.51.0

