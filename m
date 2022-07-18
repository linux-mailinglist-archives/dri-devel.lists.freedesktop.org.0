Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EADB577E9F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2896C90335;
	Mon, 18 Jul 2022 09:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE8B961AA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B72F220D3B;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGX1508h9SxWbprGVPMju8RJy9Yf1g8m5TiKYoI68IA=;
 b=pFW9otBIQkuJTfUtTIuEqQukbeRdPP7XhtD9GTnYO5KvnyFfXweQ5s6QyAjOpBNQj/RDhe
 4JOLdya9E+r35IPpVMlosZ1izkHl/51ipYAGKirGioDRSaZj3m/X9X6CAp4BDl3mtwHX9u
 EykCMYoWbBUpWvERTWSV+5c+BOLv9zc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGX1508h9SxWbprGVPMju8RJy9Yf1g8m5TiKYoI68IA=;
 b=k5hI4W/kxCsOreVipSCfdyZXTTRgl4tojzFI1Ht1xLH5VKRsFjnhZ6CZUxQ3Dt85nt55qi
 CV5j24jSdRK0n3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90A1813754;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCtzIpsn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 04/14] drm/mgag200: Acquire I/O-register lock in
 atomic_commit_tail function
Date: Mon, 18 Jul 2022 11:27:43 +0200
Message-Id: <20220718092753.9598-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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

Hold I/O-register lock in atomic_commit_tail to protect all pipeline
updates at once. Protects against concurrent I/O access in get-modes
helper.

Complex modesetting operations involve mode changes, plane updates and
possibly BMC updates. Make all this atomic wrt to reading display modes
via EDID. It's not so much an issue with simple-KMS helpers, but will
become necessary for using regular atomic helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 9bd5d743a87e..0c98742a1b65 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/iosys-map.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc_helper.h>
@@ -703,14 +704,6 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 		.y2 = fb->height,
 	};
 
-	/*
-	 * Concurrent operations could possibly trigger a call to
-	 * drm_connector_helper_funcs.get_modes by trying to read the
-	 * display modes. Protect access to I/O registers by acquiring
-	 * the I/O-register lock.
-	 */
-	mutex_lock(&mdev->rmmio_lock);
-
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_hold_bmc(mdev);
 
@@ -742,8 +735,6 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
-
-	mutex_unlock(&mdev->rmmio_lock);
 }
 
 static void
@@ -813,8 +804,6 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
-	mutex_lock(&mdev->rmmio_lock);
-
 	if (crtc->state->color_mgmt_changed && crtc->state->gamma_lut)
 		mgag200_crtc_set_gamma(mdev, fb->format, crtc->state->gamma_lut->data);
 
@@ -825,8 +814,6 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
 	mgag200_set_offset(mdev, fb);
-
-	mutex_unlock(&mdev->rmmio_lock);
 }
 
 static struct drm_crtc_state *
@@ -904,6 +891,26 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
  * Mode config
  */
 
+static void mgag200_mode_config_helper_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct mga_device *mdev = to_mga_device(state->dev);
+
+	/*
+	 * Concurrent operations could possibly trigger a call to
+	 * drm_connector_helper_funcs.get_modes by trying to read the
+	 * display modes. Protect access to I/O registers by acquiring
+	 * the I/O-register lock.
+	 */
+	mutex_lock(&mdev->rmmio_lock);
+	drm_atomic_helper_commit_tail(state);
+	mutex_unlock(&mdev->rmmio_lock);
+}
+
+static const struct drm_mode_config_helper_funcs mgag200_mode_config_helper_funcs = {
+	.atomic_commit_tail = mgag200_mode_config_helper_atomic_commit_tail,
+};
+
+
 /* Calculates a mode's required memory bandwidth (in KiB/sec). */
 static uint32_t mgag200_calculate_mode_bandwidth(const struct drm_display_mode *mode,
 						 unsigned int bits_per_pixel)
@@ -984,6 +991,7 @@ static int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vra
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.fb_base = mdev->vram_res->start;
 	dev->mode_config.funcs = &mgag200_mode_config_funcs;
+	dev->mode_config.helper_private = &mgag200_mode_config_helper_funcs;
 
 	return 0;
 }
-- 
2.36.1

