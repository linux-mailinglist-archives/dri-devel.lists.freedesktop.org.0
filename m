Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8F5F63DA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 11:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4548710E09D;
	Thu,  6 Oct 2022 09:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF41010E044
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 09:53:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 62663219A4;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665050038; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDWs45AIpedQ4GR8n1GYH0GQzpEwiMZShC8u8bH13E0=;
 b=s91E2B0hE1sKRH34DCk3yRGEImYZufHwMxvwP4GxBzIQAA9UVvK6nfXnBdH9TZlHyhafgL
 dgfaP0m2ytUlUlxwmjpuyJ9e7qq5E71q5/8yn77VBT56aKvPDvJcqfdngQGpz1w6iTvs4u
 rgx5bwwOlOuBqdL35L6N1Ja7Tg3LGRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665050038;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDWs45AIpedQ4GR8n1GYH0GQzpEwiMZShC8u8bH13E0=;
 b=lkJspWIOr2/493xNYGmzrcUVynaYZMROKs3wJhehHxNQ0c/Jby4dLcCTFYA/bqQb2ctmQo
 PiudZzPt+mQUN2Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3728D13ACC;
 Thu,  6 Oct 2022 09:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sEObDLalPmNnYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Oct 2022 09:53:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch
Subject: [PATCH v2 09/16] drm/udl: Support DRM hot-unplugging
Date: Thu,  6 Oct 2022 11:53:48 +0200
Message-Id: <20221006095355.23579-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006095355.23579-1-tzimmermann@suse.de>
References: <20221006095355.23579-1-tzimmermann@suse.de>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 43 ++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index a1334f4718e0..34c7fb6ecfe9 100644
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
@@ -295,17 +296,24 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
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
 
 	if (!fb)
 		return; /* no framebuffer; plane is disabled */
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &rect))
 		udl_handle_damage(fb, &shadow_plane_state->data[0], &rect);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
@@ -339,10 +347,14 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
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
@@ -357,6 +369,9 @@ static void udl_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atom
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -364,10 +379,14 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
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
@@ -376,6 +395,9 @@ static void udl_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_ato
 	buf = udl_dummy_render(buf);
 
 	udl_submit_urb(dev, urb, buf - (char *)urb->transfer_buffer);
+
+out:
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_helper_funcs udl_crtc_helper_funcs = {
@@ -462,17 +484,26 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t le
 
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

