Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B26FC0CC75
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4577110E42A;
	Mon, 27 Oct 2025 09:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="e3XAZrkc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7utOYG02";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="e3XAZrkc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7utOYG02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966ED10E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:55:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3102921A06;
 Mon, 27 Oct 2025 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761558954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o/X2axDzX+ivr1meW29W28xsNkDBcfjbOaZzwberrxE=;
 b=e3XAZrkcEcR5BgvSEz/h82Yika0pKnJoMpNX4dFNxbMTLc8Ar0TtPQ8Sbu5agYEH/+wH/E
 ex3f/C7rxBqIXUCqf0BI2nUNSg1qPPyh7yvrFgmkqmrX/8RojlPdPkSXvQNScuFTGIjx91
 XaT0E3M2yUm9mU4Uxv0TjnfdH8Tux34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761558954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o/X2axDzX+ivr1meW29W28xsNkDBcfjbOaZzwberrxE=;
 b=7utOYG026erpDq+H+bOruApeFx+MGDPpgsZAk/kTQXgdRB0IJL/6Df016EobF7d7TLgtJA
 B0fL9Iwk10/RUfCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=e3XAZrkc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7utOYG02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761558954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o/X2axDzX+ivr1meW29W28xsNkDBcfjbOaZzwberrxE=;
 b=e3XAZrkcEcR5BgvSEz/h82Yika0pKnJoMpNX4dFNxbMTLc8Ar0TtPQ8Sbu5agYEH/+wH/E
 ex3f/C7rxBqIXUCqf0BI2nUNSg1qPPyh7yvrFgmkqmrX/8RojlPdPkSXvQNScuFTGIjx91
 XaT0E3M2yUm9mU4Uxv0TjnfdH8Tux34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761558954;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=o/X2axDzX+ivr1meW29W28xsNkDBcfjbOaZzwberrxE=;
 b=7utOYG026erpDq+H+bOruApeFx+MGDPpgsZAk/kTQXgdRB0IJL/6Df016EobF7d7TLgtJA
 B0fL9Iwk10/RUfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E220C13A9A;
 Mon, 27 Oct 2025 09:55:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q79CNalB/2iQeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 09:55:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dmitry.osipenko@collabora.com, vivek.kasireddy@intel.com,
 gurchetansingh@chromium.org, kraxel@redhat.com, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4] drm/virtgpu: Make vblank event dependent on the external
 sync
Date: Mon, 27 Oct 2025 10:52:01 +0100
Message-ID: <20251027095550.110562-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3102921A06
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_TLS_ALL(0.00)[];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

For each plane, store the buffer object's sync status in the state
of the plane's respective CRTC. During the CRTC's atomic flush,
ignore the vblank timer if any of the CRTC's plane's buffer object
is synchronized to an external source. Instead send the vblank event
immediately. Avoids corner cases where a vblank event happens too
late for the next frame to be page flipped in time.

Exporters of GEM objects sometimes interfere with the vblank timer;
resulting in framerate drops. Hence detect this case and handle it
as outlined above.

The vblank timer is still active and fires in regular intervals
according to the guest display refresh. This rate limits clients
that only wait for the next vblank to occur, such as fbcon. These
clients would otherwise produce a very high number of frames per
second.

v4:
- only handle imported GEM buffer objects (Dmitri, Vivek)
- fix test for plane visibility (Vivek)
- always enable vblank timer to make waiting clients happy
v3:
- disable vblank unconditionally
- compute status on each commit
v2:
- enable/disable vblank timer according to buffer setup

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
This patch was previously called "drm/virtgpu: Make vblank event
dependent on the host resource". Earlier versions where meant for
testing, rather than being merged. See [1] for a discussion of when
the fixed problem happens.

[1] https://lore.kernel.org/dri-devel/20251016145230.79270-1-tzimmermann@suse.de/
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 67 ++++++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 ++++++
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 28 +++++++++-
 3 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e972d9b015a9..a4fa948023da 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -49,14 +49,71 @@
 #define drm_connector_to_virtio_gpu_output(x) \
 	container_of(x, struct virtio_gpu_output, conn)
 
+static void virtio_gpu_crtc_state_destroy(struct virtio_gpu_crtc_state *vgcrtc_state)
+{
+	__drm_atomic_helper_crtc_destroy_state(&vgcrtc_state->base);
+
+	kfree(vgcrtc_state);
+}
+
+static bool virtio_gpu_crtc_state_send_event_on_flush(struct virtio_gpu_crtc_state *vgcrtc_state)
+{
+	struct drm_crtc_state *crtc_state = &vgcrtc_state->base;
+
+	/*
+	 * The CRTC's output is sync'ed if at least one plane's output
+	 * is sync'ed to an external source. Send out vlbank event in
+	 * atomic_flush instead of vblank timeout.
+	 */
+	return vgcrtc_state->plane_synced_to_ext & crtc_state->plane_mask;
+}
+
+static void virtio_gpu_crtc_reset(struct drm_crtc *crtc)
+{
+	struct virtio_gpu_crtc_state *vgcrtc_state;
+
+	if (crtc->state)
+		virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc->state));
+
+	vgcrtc_state = kzalloc(sizeof(*vgcrtc_state), GFP_KERNEL);
+	if (vgcrtc_state)
+		__drm_atomic_helper_crtc_reset(crtc, &vgcrtc_state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+}
+
+static struct drm_crtc_state *virtio_gpu_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct virtio_gpu_crtc_state *new_vgcrtc_state;
+
+	if (drm_WARN_ON(dev, !crtc_state))
+		return NULL;
+
+	new_vgcrtc_state = kzalloc(sizeof(*new_vgcrtc_state), GFP_KERNEL);
+	if (!new_vgcrtc_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_vgcrtc_state->base);
+
+	return &new_vgcrtc_state->base;
+}
+
+static void virtio_gpu_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+						 struct drm_crtc_state *crtc_state)
+{
+	virtio_gpu_crtc_state_destroy(to_virtio_gpu_crtc_state(crtc_state));
+}
+
 static const struct drm_crtc_funcs virtio_gpu_crtc_funcs = {
 	.set_config             = drm_atomic_helper_set_config,
 	.destroy                = drm_crtc_cleanup,
 
 	.page_flip              = drm_atomic_helper_page_flip,
-	.reset                  = drm_atomic_helper_crtc_reset,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_crtc_destroy_state,
+	.reset                  = virtio_gpu_crtc_reset,
+	.atomic_duplicate_state = virtio_gpu_crtc_atomic_duplicate_state,
+	.atomic_destroy_state   = virtio_gpu_crtc_atomic_destroy_state,
 	DRM_CRTC_VBLANK_TIMER_FUNCS,
 };
 
@@ -129,7 +186,9 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct virtio_gpu_crtc_state *vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
+	bool send_event_on_flush = virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state);
 	struct drm_pending_vblank_event *event;
 
 	/*
@@ -147,7 +206,7 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	crtc_state->event = NULL;
 
 	if (event) {
-		if (drm_crtc_vblank_get(crtc) == 0)
+		if (!send_event_on_flush && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..acf0a62d1d73 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -195,6 +195,21 @@ struct virtio_gpu_framebuffer {
 #define to_virtio_gpu_framebuffer(x) \
 	container_of(x, struct virtio_gpu_framebuffer, base)
 
+struct virtio_gpu_crtc_state {
+	struct drm_crtc_state base;
+
+	/*
+	 * Set from each plane's atomic check and depends on the plane's GEM
+	 * buffer objects. The bit shows is the corresponding plane is already
+	 * synchronized to an external source. Used by the CRTC for vblank
+	 * handling. Only valid during mode setting.
+	 */
+	u32 plane_synced_to_ext;
+};
+
+#define to_virtio_gpu_crtc_state(x) \
+	container_of(x, struct virtio_gpu_crtc_state, base)
+
 struct virtio_gpu_plane_state {
 	struct drm_plane_state base;
 	struct virtio_gpu_fence *fence;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 29e4b458ae57..634e1a930783 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -27,6 +27,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <linux/virtio_dma_buf.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
@@ -104,7 +105,8 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 										 plane);
 	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
 	struct drm_crtc_state *crtc_state;
-	int ret;
+	struct virtio_gpu_crtc_state *vgcrtc_state;
+	int ret, i;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
@@ -126,7 +128,29 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  is_cursor, true);
-	return ret;
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
+	vgcrtc_state->plane_synced_to_ext &= ~drm_plane_mask(plane);
+
+	for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
+		struct drm_gem_object *obj = drm_gem_fb_get_obj(new_plane_state->fb, i);
+
+		/*
+		 * Exporters of GEM buffer objects sometimes interfere with the
+		 * vblank timer. Mark the plane as externally synchronized if we
+		 * find an imported GEM buffer object.
+		 */
+		if (drm_gem_is_imported(obj)) {
+			vgcrtc_state->plane_synced_to_ext |= drm_plane_mask(plane);
+			break; /* only need to find one */
+		}
+	}
+
+	return 0;
 }
 
 /* For drm panic */
-- 
2.51.1

