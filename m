Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6877BE4044
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 16:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9D10EA00;
	Thu, 16 Oct 2025 14:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="G9rb/QvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QhVvHPe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G9rb/QvQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QhVvHPe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C47710E9FD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 14:52:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DA601F8AA;
 Thu, 16 Oct 2025 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760626354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=leLfPfyhj2vgyhlchDjgg+pci9qdA8IThxOXI8+lpDc=;
 b=G9rb/QvQNgMzI1IsGeyBeGciTPWoxug/LAov4nf4wtgpP6SYeZRXiyLToOi/Du0L1FcHoE
 aYaKL6N+KUeJa1URN5i+ID1KcOYS56nEoYwaOdlLjO2UOrYxLhEcaOeWbJEBP3KNg9IDYS
 pTUgskVEYgNp6PwxlGSz2UgPgCLvmNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760626354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=leLfPfyhj2vgyhlchDjgg+pci9qdA8IThxOXI8+lpDc=;
 b=9QhVvHPekdNjbnr+Vjbf3e8vBkn+qR5Gxol1Dc7r18kcZQaAe+g9u99p9nxNleBka3Enp+
 rkLz0dkMajQanjDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="G9rb/QvQ";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9QhVvHPe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760626354; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=leLfPfyhj2vgyhlchDjgg+pci9qdA8IThxOXI8+lpDc=;
 b=G9rb/QvQNgMzI1IsGeyBeGciTPWoxug/LAov4nf4wtgpP6SYeZRXiyLToOi/Du0L1FcHoE
 aYaKL6N+KUeJa1URN5i+ID1KcOYS56nEoYwaOdlLjO2UOrYxLhEcaOeWbJEBP3KNg9IDYS
 pTUgskVEYgNp6PwxlGSz2UgPgCLvmNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760626354;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=leLfPfyhj2vgyhlchDjgg+pci9qdA8IThxOXI8+lpDc=;
 b=9QhVvHPekdNjbnr+Vjbf3e8vBkn+qR5Gxol1Dc7r18kcZQaAe+g9u99p9nxNleBka3Enp+
 rkLz0dkMajQanjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D26BA1376E;
 Thu, 16 Oct 2025 14:52:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aGnjMbEG8WhIGQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Oct 2025 14:52:33 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 kraxel@redhat.com, airlied@redhat.com, vivek.kasireddy@intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC][PATCH] drm/virtgpu: Make vblank event dependent on the host
 resource
Date: Thu, 16 Oct 2025 16:48:33 +0200
Message-ID: <20251016145230.79270-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1DA601F8AA
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
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

For each plane, store the buffer object's host backing in the state
of the plane's respective CRTC. The host synchronizes output of buffer
objects with a host resource to its own refresh cycle; thus avoiding
tearing. During the CRTC's atomic flush, ignore the vblank timer if
any of the CRTC's plane's buffer object has a host resource. Instead
send the vblank event immdiatelly. Avoids corner cases where a vblank
event happens too late for the next frame to be page flipped in time.

The host synchronizes a plane's output to the host repaint cycle if
the plane's buffer object has an associated host resource. An atomic
commit blocks until the host cycle completes and then arms the vblank
event. The guest compositor is thereby synchronized to the host's
output rate.

To avoid delays, send out the vblank event immediately instead of
just arming it. Otherwise the event might be too late to page flip
the compositor's next frame.

The vblank timer is still active and fires in regular intervals
according to the guest display refresh. This rate limits clients
that only wait for the next vblank to occur, such as fbcon. These
clients would otherwise produce a very high number of frames per
second.

For commits without host resource, the vblank timer rate-limits the
guest output by generating vblank events at the guest display refresh
rate as before.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
There was a discussion about interference between vblank timers and
the host repaint cycle at [1]. This patch address a possible corner
case were the timing gets bad.

[1] https://lore.kernel.org/dri-devel/IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com/
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 72 ++++++++++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_drv.h     | 15 +++++
 drivers/gpu/drm/virtio/virtgpu_plane.c   | 16 +++++-
 3 files changed, 98 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e972d9b015a9..43df1fa7d629 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -49,14 +49,76 @@
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
+	 * The CRTC's output is vsync'ed if at least one plane's output is
+	 * sync'ed to the host refresh.
+	 */
+	return vgcrtc_state->send_event_on_flush & crtc_state->plane_mask;
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
+	if (vgcrtc_state) {
+		vgcrtc_state->send_event_on_flush = 0ul;
+		__drm_atomic_helper_crtc_reset(crtc, &vgcrtc_state->base);
+	} else {
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+	}
+}
+
+static struct drm_crtc_state *virtio_gpu_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct virtio_gpu_crtc_state *new_vgcrtc_state;
+	struct virtio_gpu_crtc_state *vgcrtc_state;
+
+	if (drm_WARN_ON(dev, !crtc_state))
+		return NULL;
+
+	new_vgcrtc_state = kzalloc(sizeof(*new_vgcrtc_state), GFP_KERNEL);
+	if (!new_vgcrtc_state)
+		return NULL;
+
+	vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_vgcrtc_state->base);
+	vgcrtc_state->send_event_on_flush = vgcrtc_state->send_event_on_flush;
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
 
@@ -129,7 +191,9 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	struct virtio_gpu_crtc_state *vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
 	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
+	bool send_event_on_flush = virtio_gpu_crtc_state_send_event_on_flush(vgcrtc_state);
 	struct drm_pending_vblank_event *event;
 
 	/*
@@ -147,7 +211,7 @@ static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	crtc_state->event = NULL;
 
 	if (event) {
-		if (drm_crtc_vblank_get(crtc) == 0)
+		if (!send_event_on_flush && drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e..671fc3b61bc6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -195,6 +195,21 @@ struct virtio_gpu_framebuffer {
 #define to_virtio_gpu_framebuffer(x) \
 	container_of(x, struct virtio_gpu_framebuffer, base)
 
+struct virtio_gpu_crtc_state {
+	struct drm_crtc_state base;
+
+	/*
+	 * Send vblank event immediately from atomic_flush. Set from each
+	 * plane's atomic check and depends on the buffer object. Buffers
+	 * with host backing are vsync'd already and should send immediately;
+	 * others should wait for the VBLANK timer.
+	 */
+	u32 send_event_on_flush;
+};
+
+#define to_virtio_gpu_crtc_state(x) \
+	container_of(x, struct virtio_gpu_crtc_state, base)
+
 struct virtio_gpu_plane_state {
 	struct drm_plane_state base;
 	struct virtio_gpu_fence *fence;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 29e4b458ae57..d04721c5d505 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -104,7 +104,8 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 										 plane);
 	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
 	struct drm_crtc_state *crtc_state;
-	int ret;
+	struct virtio_gpu_crtc_state *vgcrtc_state;
+	int ret, i;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
@@ -126,6 +127,19 @@ static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
 						  DRM_PLANE_NO_SCALING,
 						  DRM_PLANE_NO_SCALING,
 						  is_cursor, true);
+
+	vgcrtc_state = to_virtio_gpu_crtc_state(crtc_state);
+	vgcrtc_state->send_event_on_flush &= ~drm_plane_mask(plane);
+
+	for (i = 0; i < new_plane_state->fb->format->num_planes; ++i) {
+		struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(new_plane_state->fb->obj[i]);
+
+		if (bo->host3d_blob || bo->guest_blob) {
+			vgcrtc_state->send_event_on_flush |= drm_plane_mask(plane);
+			break; /* only need to find one */
+		}
+	}
+
 	return ret;
 }
 
-- 
2.51.0

