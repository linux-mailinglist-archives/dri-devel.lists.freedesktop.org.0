Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF327A8415D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B5F10E958;
	Thu, 10 Apr 2025 11:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ds5VI9hb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H8y4kMJ8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ds5VI9hb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H8y4kMJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFEF10E95A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6EC9F1F444;
 Thu, 10 Apr 2025 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vV4BtY/4wydmZpP5+Js+J15v07gTF9nLNcgjNltTw0=;
 b=Ds5VI9hbWmL/Aw6eEzhuwoRI/XlfkkuSfnam41MC0Mvc5Pw+WtQ/Reeqm7lmHmVoLNzRLd
 8wmFbnOJqO/6lfFwI/uSbgVh8oDGPJ1ZVrMb38tZbYhxB8ruCiGXMLk3HsdaLlUhwnM+FZ
 TacTgnTXfPwk10l91lk43snXnJ1ajrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vV4BtY/4wydmZpP5+Js+J15v07gTF9nLNcgjNltTw0=;
 b=H8y4kMJ864Sfb1aiL38tKdpUJ9GE9CWvZsyWcBht1HrwC5P93i73kTQs1aLc2+sNgTRVmq
 HNfOt+J+qcJFu5Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vV4BtY/4wydmZpP5+Js+J15v07gTF9nLNcgjNltTw0=;
 b=Ds5VI9hbWmL/Aw6eEzhuwoRI/XlfkkuSfnam41MC0Mvc5Pw+WtQ/Reeqm7lmHmVoLNzRLd
 8wmFbnOJqO/6lfFwI/uSbgVh8oDGPJ1ZVrMb38tZbYhxB8ruCiGXMLk3HsdaLlUhwnM+FZ
 TacTgnTXfPwk10l91lk43snXnJ1ajrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282979;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1vV4BtY/4wydmZpP5+Js+J15v07gTF9nLNcgjNltTw0=;
 b=H8y4kMJ864Sfb1aiL38tKdpUJ9GE9CWvZsyWcBht1HrwC5P93i73kTQs1aLc2+sNgTRVmq
 HNfOt+J+qcJFu5Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FB3313A4B;
 Thu, 10 Apr 2025 11:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KFhlBmOl92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:02:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/9] drm/udl: Improve type safety when using struct
 udl_device
Date: Thu, 10 Apr 2025 12:59:00 +0200
Message-ID: <20250410105948.25463-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410105948.25463-1-tzimmermann@suse.de>
References: <20250410105948.25463-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[5];
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

Push upcasts from struct drm_device to struct udl_device outwards
in the call chain; cast earlier and call functions with the upcasted
value. Improves type safety.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.c      |  6 ++++--
 drivers/gpu/drm/udl/udl_drv.h      | 12 ++++++------
 drivers/gpu/drm/udl/udl_main.c     | 28 ++++++++++++----------------
 drivers/gpu/drm/udl/udl_modeset.c  | 21 ++++++++++++---------
 drivers/gpu/drm/udl/udl_transfer.c |  6 +++---
 5 files changed, 37 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index d1bc3f165b27d..1922988625eb0 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -22,13 +22,14 @@ static int udl_usb_suspend(struct usb_interface *interface,
 			   pm_message_t message)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
+	struct udl_device *udl = to_udl(dev);
 	int ret;
 
 	ret = drm_mode_config_helper_suspend(dev);
 	if (ret)
 		return ret;
 
-	udl_sync_pending_urbs(dev);
+	udl_sync_pending_urbs(udl);
 	return 0;
 }
 
@@ -109,9 +110,10 @@ static int udl_usb_probe(struct usb_interface *interface,
 static void udl_usb_disconnect(struct usb_interface *interface)
 {
 	struct drm_device *dev = usb_get_intfdata(interface);
+	struct udl_device *udl = to_udl(dev);
 
 	drm_dev_unplug(dev);
-	udl_drop_usb(dev);
+	udl_drop_usb(udl);
 }
 
 /*
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 1204319fc8e33..918738e549d6d 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -69,22 +69,22 @@ static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
 }
 
 /* modeset */
-int udl_modeset_init(struct drm_device *dev);
+int udl_modeset_init(struct udl_device *udl);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
 
-struct urb *udl_get_urb(struct drm_device *dev);
+struct urb *udl_get_urb(struct udl_device *udl);
 
-int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len);
-void udl_sync_pending_urbs(struct drm_device *dev);
+int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len);
+void udl_sync_pending_urbs(struct udl_device *udl);
 void udl_urb_completion(struct urb *urb);
 
 int udl_init(struct udl_device *udl);
 
-int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
+int udl_render_hline(struct udl_device *udl, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
 		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
 
-int udl_drop_usb(struct drm_device *dev);
+int udl_drop_usb(struct udl_device *udl);
 int udl_select_std_channel(struct udl_device *udl);
 
 #endif
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index f1ffa928d5d9e..47fb6c34bfde3 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -145,9 +145,8 @@ void udl_urb_completion(struct urb *urb)
 	wake_up(&udl->urbs.sleep);
 }
 
-static void udl_free_urb_list(struct drm_device *dev)
+static void udl_free_urb_list(struct udl_device *udl)
 {
-	struct udl_device *udl = to_udl(dev);
 	struct urb_node *unode;
 	struct urb *urb;
 
@@ -172,9 +171,8 @@ static void udl_free_urb_list(struct drm_device *dev)
 	wake_up_all(&udl->urbs.sleep);
 }
 
-static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
+static int udl_alloc_urb_list(struct udl_device *udl, int count, size_t size)
 {
-	struct udl_device *udl = to_udl(dev);
 	struct urb *urb;
 	struct urb_node *unode;
 	char *buf;
@@ -210,7 +208,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 			usb_free_urb(urb);
 			if (size > PAGE_SIZE) {
 				size /= 2;
-				udl_free_urb_list(dev);
+				udl_free_urb_list(udl);
 				goto retry;
 			}
 			break;
@@ -259,9 +257,8 @@ static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout)
 }
 
 #define GET_URB_TIMEOUT	HZ
-struct urb *udl_get_urb(struct drm_device *dev)
+struct urb *udl_get_urb(struct udl_device *udl)
 {
-	struct udl_device *udl = to_udl(dev);
 	struct urb *urb;
 
 	spin_lock_irq(&udl->urbs.lock);
@@ -270,9 +267,8 @@ struct urb *udl_get_urb(struct drm_device *dev)
 	return urb;
 }
 
-int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
+int udl_submit_urb(struct udl_device *udl, struct urb *urb, size_t len)
 {
-	struct udl_device *udl = to_udl(dev);
 	int ret;
 
 	if (WARN_ON(len > udl->urbs.size)) {
@@ -290,9 +286,9 @@ int udl_submit_urb(struct drm_device *dev, struct urb *urb, size_t len)
 }
 
 /* wait until all pending URBs have been processed */
-void udl_sync_pending_urbs(struct drm_device *dev)
+void udl_sync_pending_urbs(struct udl_device *udl)
 {
-	struct udl_device *udl = to_udl(dev);
+	struct drm_device *dev = &udl->drm;
 
 	spin_lock_irq(&udl->urbs.lock);
 	/* 2 seconds as a sane timeout */
@@ -329,13 +325,13 @@ int udl_init(struct udl_device *udl)
 	if (udl_select_std_channel(udl))
 		DRM_ERROR("Selecting channel failed\n");
 
-	if (!udl_alloc_urb_list(dev, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
+	if (!udl_alloc_urb_list(udl, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
 		DRM_ERROR("udl_alloc_urb_list failed\n");
 		goto err;
 	}
 
 	DRM_DEBUG("\n");
-	ret = udl_modeset_init(dev);
+	ret = udl_modeset_init(udl);
 	if (ret)
 		goto err;
 
@@ -343,14 +339,14 @@ int udl_init(struct udl_device *udl)
 
 err:
 	if (udl->urbs.count)
-		udl_free_urb_list(dev);
+		udl_free_urb_list(udl);
 	DRM_ERROR("%d\n", ret);
 	return ret;
 }
 
-int udl_drop_usb(struct drm_device *dev)
+int udl_drop_usb(struct udl_device *udl)
 {
-	udl_free_urb_list(dev);
+	udl_free_urb_list(udl);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 3b65e93ea0ae8..231e829bd709a 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -205,6 +205,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct drm_rect *clip)
 {
 	struct drm_device *dev = fb->dev;
+	struct udl_device *udl = to_udl(dev);
 	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret;
 	char *cmd;
@@ -216,7 +217,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	urb = udl_get_urb(dev);
+	urb = udl_get_urb(udl);
 	if (!urb)
 		return -ENOMEM;
 	cmd = urb->transfer_buffer;
@@ -226,7 +227,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		const int byte_offset = line_offset + (clip->x1 << log_bpp);
 		const int dev_byte_offset = (fb->width * i + clip->x1) << log_bpp;
 		const int byte_width = drm_rect_width(clip) << log_bpp;
-		ret = udl_render_hline(dev, log_bpp, &urb, (char *)vaddr,
+		ret = udl_render_hline(udl, log_bpp, &urb, (char *)vaddr,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
 		if (ret)
@@ -239,7 +240,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		if (cmd < (char *)urb->transfer_buffer + urb->transfer_buffer_length)
 			*cmd++ = UDL_MSG_BULK;
 		len = cmd - (char *)urb->transfer_buffer;
-		ret = udl_submit_urb(dev, urb, len);
+		ret = udl_submit_urb(udl, urb, len);
 	} else {
 		udl_urb_completion(urb);
 	}
@@ -330,6 +331,7 @@ static const struct drm_plane_funcs udl_primary_plane_funcs = {
 static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct udl_device *udl = to_udl(dev);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct urb *urb;
@@ -339,7 +341,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(dev);
+	urb = udl_get_urb(udl);
 	if (!urb)
 		goto out;
 
@@ -355,7 +357,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	buf = udl_vidreg_unlock(buf);
 	buf = udl_dummy_render(buf);
 
-	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+	udl_submit_urb(udl, urb, buf - (char *)urb->transfer_buffer);
 
 out:
 	drm_dev_exit(idx);
@@ -364,6 +366,7 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_device *dev = crtc->dev;
+	struct udl_device *udl = to_udl(dev);
 	struct urb *urb;
 	char *buf;
 	int idx;
@@ -371,7 +374,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	if (!drm_dev_enter(dev, &idx))
 		return;
 
-	urb = udl_get_urb(dev);
+	urb = udl_get_urb(udl);
 	if (!urb)
 		goto out;
 
@@ -381,7 +384,7 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	buf = udl_vidreg_unlock(buf);
 	buf = udl_dummy_render(buf);
 
-	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+	udl_submit_urb(udl, urb, buf - (char *)urb->transfer_buffer);
 
 out:
 	drm_dev_exit(idx);
@@ -476,9 +479,9 @@ static const struct drm_mode_config_funcs udl_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
-int udl_modeset_init(struct drm_device *dev)
+int udl_modeset_init(struct udl_device *udl)
 {
-	struct udl_device *udl = to_udl(dev);
+	struct drm_device *dev = &udl->drm;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/udl/udl_transfer.c b/drivers/gpu/drm/udl/udl_transfer.c
index 62224992988f2..7d670b3a52939 100644
--- a/drivers/gpu/drm/udl/udl_transfer.c
+++ b/drivers/gpu/drm/udl/udl_transfer.c
@@ -170,7 +170,7 @@ static void udl_compress_hline16(
  * (that we can only write to, slowly, and can never read), and (optionally)
  * our shadow copy that tracks what's been sent to that hardware buffer.
  */
-int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
+int udl_render_hline(struct udl_device *udl, int log_bpp, struct urb **urb_ptr,
 		     const char *front, char **urb_buf_ptr,
 		     u32 byte_offset, u32 device_byte_offset,
 		     u32 byte_width)
@@ -199,10 +199,10 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 
 		if (cmd >= cmd_end) {
 			int len = cmd - (u8 *) urb->transfer_buffer;
-			int ret = udl_submit_urb(dev, urb, len);
+			int ret = udl_submit_urb(udl, urb, len);
 			if (ret)
 				return ret;
-			urb = udl_get_urb(dev);
+			urb = udl_get_urb(udl);
 			if (!urb)
 				return -EAGAIN;
 			*urb_ptr = urb;
-- 
2.49.0

