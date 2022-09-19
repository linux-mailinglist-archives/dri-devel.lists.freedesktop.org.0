Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBC75BCC88
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1ADF10E62C;
	Mon, 19 Sep 2022 13:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471610E298
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E60E1F90D;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592653; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpZwDHj3G1JpTd0ml/36q2XRRcPycUJlmTAsrJYpEgM=;
 b=1/aIvgWw2dcaFzcy7XgsjtQdZqjvrdALrwg1Js3i8joCwkKHvw4j41ksCioArqB0hRYy0a
 1XbxuUxfdZr86OrydYUlkVbeDptM8DhWJGc9y+lkOdO9Ljwo3UpcDZeFf3Ydi3sT7Kv3uY
 AL+IntmY8xeb5/AZkPHLkh1VsvdZE8g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592653;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpZwDHj3G1JpTd0ml/36q2XRRcPycUJlmTAsrJYpEgM=;
 b=0lhphWBJp0bA5LLfOPeNLp2LGgADfTCsY/1Jvr2fCif+p9dMyuxUsxweKED5nQjXA3Vsul
 pjLfyYhcYwdfcTBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5278713A96;
 Mon, 19 Sep 2022 13:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YDIAE81oKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 09/16] drm/udl: Support DRM hot-unplugging
Date: Mon, 19 Sep 2022 15:04:01 +0200
Message-Id: <20220919130408.21486-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
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

Add drm_dev_enter() and drm_dev_exit() to the various modesetting
functions that interact with the device. After hot-unplugging the
device, these functions will return early. So far, the udl driver
relied on USB interfaces to handle unplugging of the device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 43 ++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 97d68cf88bd8..aaa828034a04 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -295,14 +296,21 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
 static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						   struct drm_atomic_state *state)
 {
+	struct drm_device *dev = plane->dev;
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_rect rect;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
 		udl_handle_damage(fb, &shadow_plane_state->data[0], &rect);
+
+	drm_dev_exit(idx);
 }
 
 static void udl_primary_plane_helper_atomic_disable(struct drm_plane *plane,
@@ -348,10 +356,14 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct urb *urb;
 	char *buf;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	urb = udl_get_urb(dev);
 	if (!urb)
-		return;
+		goto out;
 
 	buf = (char *)urb->transfer_buffer;
 	buf = udl_vidreg_lock(buf);
@@ -366,6 +378,9 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -373,10 +388,14 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	struct drm_device *dev = crtc->dev;
 	struct urb *urb;
 	char *buf;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	urb = udl_get_urb(dev);
 	if (!urb)
-		return;
+		goto out;
 
 	buf = (char *)urb->transfer_buffer;
 	buf = udl_vidreg_lock(buf);
@@ -385,6 +404,9 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
@@ -471,17 +493,26 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
 
 static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct udl_device *udl = to_udl(connector->dev);
+	struct drm_device *dev = connector->dev;
+	struct udl_device *udl = to_udl(dev);
 	struct udl_connector *udl_connector = to_udl_connector(connector);
+	enum drm_connector_status status = connector_status_disconnected;
+	int idx;
 
 	/* cleanup previous EDID */
 	kfree(udl_connector->edid);
+	udl_connector->edid = NULL;
 
-	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
-	if (!udl_connector->edid)
+	if (!drm_dev_enter(dev, &idx))
 		return connector_status_disconnected;
 
-	return connector_status_connected;
+	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
+	if (udl_connector->edid)
+		status = connector_status_connected;
+
+	drm_dev_exit(idx);
+
+	return status;
 }
 
 static void udl_connector_destroy(struct drm_connector *connector)
-- 
2.37.3

