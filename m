Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7951F864
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7CD10E338;
	Mon,  9 May 2022 09:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3C510E338
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652089801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=38FLScGOsd9tKyGqRLnsd/WLdJv8N7MrPUyVC03kxQ8=;
 b=IiO8zmdokd2CgUmpsQqsoo/1JYwklTL0T7RJU4ctezWT5qsdHsK+7bN41AiqzlwhB7i9Li
 2gqHVlEL0WWYZlig23KqbLcaab/1xvenR78IY1jg8ZDBBTZy3+vpER8PFLtAApYNly01QS
 5byMQlJ/nShBmO+A7XkEkh6F8xGcjQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-uBIk1wqHOliKoK1grADntg-1; Mon, 09 May 2022 05:50:00 -0400
X-MC-Unique: uBIk1wqHOliKoK1grADntg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8855803D45;
 Mon,  9 May 2022 09:49:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD30040CF8EC;
 Mon,  9 May 2022 09:49:58 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
	lyude@redhat.com,
	tzimmermann@suse.de
Subject: [PATCH] mgag200: Enable atomic gamma lut update
Date: Mon,  9 May 2022 11:49:30 +0200
Message-Id: <20220509094930.44613-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6e18d3bbd720..9fc688e15db8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -86,6 +86,46 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc)
 	}
 }
 
+static void mga_crtc_update_lut(struct mga_device *mdev,
+				struct drm_crtc_state *state,
+				u8 depth)
+{
+	struct drm_color_lut * lut;
+	int i;
+	
+	if (!state->color_mgmt_changed || !state->gamma_lut)
+		return
+
+	lut = (struct drm_color_lut *) state->gamma_lut->data;
+	WREG8(DAC_INDEX + MGA1064_INDEX, 0);
+
+	if (depth == 15) {
+		/* 16 bits r5g5b5a1 */
+		for (i = 0; i < MGAG200_LUT_SIZE; i += 8) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
+		}
+	} else if (depth == 16) {
+		/* 16 bits r5g6b5, as green has one more bit, 
+		 * add padding with 0 for red and blue. */
+		for (i = 0; i < MGAG200_LUT_SIZE; i += 4) {
+			u8 red = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 : 0;
+			u8 blue = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 : 0;
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, red);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, blue);
+		}
+	} else {
+		/* 24 bits r8g8b8 */
+		for (i = 0; i < MGAG200_LUT_SIZE; i++) {
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
+			WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
+		}
+	}
+}
+
 static inline void mga_wait_vsync(struct mga_device *mdev)
 {
 	unsigned long timeout = jiffies + HZ/10;
@@ -953,6 +993,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 				   struct drm_plane_state *old_state)
 {
 	struct drm_plane *plane = &pipe->plane;
+	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_device *dev = plane->dev;
 	struct mga_device *mdev = to_mga_device(dev);
 	struct drm_plane_state *state = plane->state;
@@ -963,7 +1004,10 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
+	mga_crtc_update_lut(mdev, crtc->state, fb->format->depth);
+
 	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+
 		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
 }
 
@@ -1110,6 +1154,8 @@ int mgag200_modeset_init(struct mga_device *mdev)
 	/* FIXME: legacy gamma tables; convert to CRTC state */
 	drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
 
+	drm_crtc_enable_color_mgmt(&pipe->crtc, 0, false, MGAG200_LUT_SIZE);
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.35.3

