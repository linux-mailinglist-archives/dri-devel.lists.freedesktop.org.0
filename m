Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9840252374D
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D712B10E325;
	Wed, 11 May 2022 15:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C4C10FB77
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652282907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ygD2vALHe3nnqiQIaClPVMMmRLS5aaIGD+GHsQ0q1bw=;
 b=Q26q7O0z/GuPvpP4VSOUEMRRAPgfKzMQcv1jX0qkHSqkACaJPkQ56EroTFjGu9eo/KS3Wp
 dK0n2kE1Ya/3KVFyRtoWO0yEInuFpmhjhOlAxLH18AJqmh3PcAFaWbdNFYvLxsRtszF9if
 TrH3mQlBvLUzbVg976Og3FbcapaEaUU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-LxHscFGGM2CyN_ze7ho5Qg-1; Wed, 11 May 2022 11:28:25 -0400
X-MC-Unique: LxHscFGGM2CyN_ze7ho5Qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EE352A2AD4C;
 Wed, 11 May 2022 15:28:24 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A899C28122;
 Wed, 11 May 2022 15:28:22 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
	lyude@redhat.com,
	tzimmermann@suse.de
Subject: [PATCH v2] mgag200: Enable atomic gamma lut update
Date: Wed, 11 May 2022 17:28:15 +0200
Message-Id: <20220511152815.892562-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: michel@daenzer.net, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for atomic update of gamma lut.
With this patch the "Night light" feature of gnome3
is working properly on mgag200.

v2:
 - Add a default linear gamma function
 - renamed functions with mgag200 prefix
 - use format's 4cc code instead of bit depth
 - use better interpolation for 16bits gamma
 - remove legacy function mga_crtc_load_lut()
 - can't remove the call to drm_mode_crtc_set_gamma_size()
    because it doesn't work with userspace.
 - other small refactors

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 125 ++++++++++++++++---------
 1 file changed, 81 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6e18d3bbd720..b748bc5b0e93 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -32,57 +32,76 @@
  * This file contains setup code for the CRTC.
  */
 
-static void mga_crtc_load_lut(struct drm_crtc *crtc)
+static void mgag200_crtc_set_gamma_linear(struct mga_device *mdev,
+					  uint32_t format)
 {
-	struct drm_device *dev = crtc->dev;
-	struct mga_device *mdev = to_mga_device(dev);
-	struct drm_framebuffer *fb;
-	u16 *r_ptr, *g_ptr, *b_ptr;
 	int i;
 
-	if (!crtc->enabled)
-		return;
-
-	if (!mdev->display_pipe.plane.state)
-		return;
+	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
 
-	fb = mdev->display_pipe.plane.state->fb;
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from 0 to 255 */
+		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 8 + i / 4);
+		}
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i * 4 + i / 16);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
+		}
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, i);
+		}
+		break;
+	default:
+		drm_warn_once(&mdev->base, "Unsupported format for gamma %d\n", format);
+		break;
+	}
+}
 
-	r_ptr = crtc->gamma_store;
-	g_ptr = r_ptr + crtc->gamma_size;
-	b_ptr = g_ptr + crtc->gamma_size;
+static void mgag200_crtc_set_gamma(struct mga_device *mdev,
+				   struct drm_color_lut *lut,
+				   uint32_t format)
+{
+	int i;
 
 	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
 
-	if (fb && fb->format->cpp[0] * 8 == 16) {
-		int inc = (fb->format->depth == 15) ? 8 : 4;
-		u8 r, b;
-		for (i = 0; i < MGAG200_LUT_SIZE; i += inc) {
-			if (fb->format->depth == 16) {
-				if (i > (MGAG200_LUT_SIZE >> 1)) {
-					r = b = 0;
-				} else {
-					r = *r_ptr++ >> 8;
-					b = *b_ptr++ >> 8;
-					r_ptr++;
-					b_ptr++;
-				}
-			} else {
-				r = *r_ptr++ >> 8;
-				b = *b_ptr++ >> 8;
-			}
-			/* VGA registers */
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, r);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, *g_ptr++ >> 8);
-			WREG8(DAC_INDEX + MGA1064_COL_PAL, b);
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		/* Use better interpolation, to take 32 values from lut[0] to lut[255] */
+		for (i = 0; i < MGAG200_LUT_SIZE / 8; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].red >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 8 + i / 4].blue >> 8);
 		}
-		return;
-	}
-	for (i = 0; i < MGAG200_LUT_SIZE; i++) {
-		/* VGA registers */
-		WREG8(DAC_INDEX + MGA1064_COL_PAL, *r_ptr++ >> 8);
-		WREG8(DAC_INDEX + MGA1064_COL_PAL, *g_ptr++ >> 8);
-		WREG8(DAC_INDEX + MGA1064_COL_PAL, *b_ptr++ >> 8);
+		/* Green has one more bit, so add padding with 0 for red and blue. */
+		for (i = MGAG200_LUT_SIZE / 8; i < MGAG200_LUT_SIZE / 4; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i * 4 + i / 16].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, 0);
+		}
+		break;
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_XRGB8888:
+		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
+		}
+		break;
+	default:
+		drm_warn_once(&mdev->base, "Unsupported format for gamma %d\n", format);
+		break;
 	}
 }
 
@@ -900,7 +919,11 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (mdev->type == G200_WB || mdev->type == G200_EW3)
 		mgag200_g200wb_release_bmc(mdev);
 
-	mga_crtc_load_lut(crtc);
+	if (crtc_state->gamma_lut)
+		mgag200_crtc_set_gamma(mdev, crtc_state->gamma_lut->data, fb->format->format);
+	else
+		mgag200_crtc_set_gamma_linear(mdev, fb->format->format);
+
 	mgag200_enable_display(mdev);
 
 	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
@@ -945,6 +968,14 @@ mgag200_simple_display_pipe_check(struct drm_simple_display_pipe *pipe,
 			return ret;
 	}
 
+	if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
+		if (crtc_state->gamma_lut->length !=
+		    MGAG200_LUT_SIZE * sizeof(struct drm_color_lut)) {
+			drm_err(dev, "Wrong size for gamma_lut %ld\n",
+				crtc_state->gamma_lut->length);
+			return -EINVAL;
+		}
+	}
 	return 0;
 }
 
@@ -953,6 +984,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 				   struct drm_plane_state *old_state)
 {
 	struct drm_plane *plane = &pipe->plane;
+	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_plane_state *state = plane->state;
@@ -963,6 +995,9 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
+	if (crtc->state->color_mgmt_changed && crtc->state->gamma_lut)
+		mgag200_crtc_set_gamma(mdev, crtc->state->gamma_lut->data, fb->format->format);
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
 		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
 }
@@ -1107,9 +1142,11 @@ int mgag200_modeset_init(struct mga_device *mdev)
 		return ret;
 	}
 
-	/* FIXME: legacy gamma tables; convert to CRTC state */
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
 	drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
 
+	drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, MGAG200_LUT_SIZE);
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.35.3

