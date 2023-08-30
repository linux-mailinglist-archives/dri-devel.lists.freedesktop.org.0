Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F478D354
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 08:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122BB10E4BF;
	Wed, 30 Aug 2023 06:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4B10E4C2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 06:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693376756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Bck91h4ecr3Co3tJzlcq1wsKaOVtegEctcyU5tCF8E=;
 b=IWjPWbghY8jxXarpSxmqfWQnAs16b3NUXBIcgnOm/Wa8WUJ2RdQUB0b26hdO+hWpRr+AtH
 Q3vhaxAmB7jJfcRVuMty8hnBcKeT2X5NEZ/OnDFEJgTva6xyTm4Yz+/J7KMzQYH3Oy0Mar
 usNTC4af8KuHPnyK5P1vBxznGHUSwLo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-2Rk5QaBePdaD59fPc3vDmg-1; Wed, 30 Aug 2023 02:25:52 -0400
X-MC-Unique: 2Rk5QaBePdaD59fPc3vDmg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31adc3ca07aso3154475f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 23:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693376751; x=1693981551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Bck91h4ecr3Co3tJzlcq1wsKaOVtegEctcyU5tCF8E=;
 b=ZvMeL686Z5kV5vrx56MkW8ypqej6INpYGkyZtWeMcffxDivcMjmvO237tl1AkqNxBh
 cavoEwYVPoLh96h1l0zoxlHUNZTfjMTkkg4AiCQ8+P38DIGhcgB0ViYaS9HOmiC/dv63
 6y5y5j5y5Wpwhnei/JvoXQqA5shHz0mmjYtF56busLcv+viY2tptSghH1zQ+klczaoAP
 8SGG5iUcCxqWgT26fT9/1zVivFHmX9eAA/WX1WkgQ4/579Os0N1SvgKe4S0sFa/pL76o
 Rd46+3DO8exzkIgrKknuegIagE1SEMLwkSJDeoEpWMjxU+llvTbi9o/8gGuAetBy9Cnj
 cYPA==
X-Gm-Message-State: AOJu0Yw06z5YcZ4pfV4/C0hRlQti/i7Bd29xVbyemIbpZLeGwNHbBodE
 1KvnPOSyMvYD6GUnQ4nV6jPEGVMJ0+raGiMLIogA+Vp0KvvC3gsrhsvSF5mIz2pr/LAGs+2w4vH
 0mCk1qcSQ9bMFVh5MDGy6h8pQe4fl
X-Received: by 2002:a5d:4c47:0:b0:31d:cf59:8de with SMTP id
 n7-20020a5d4c47000000b0031dcf5908demr877096wrt.19.1693376751135; 
 Tue, 29 Aug 2023 23:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGkjHuOu5s6UltQpdDLgmsZ2+vkqG0rncWb93cDUvjACjGuAGSQurlsw0WrKhuai7PTZUJtg==
X-Received: by 2002:a5d:4c47:0:b0:31d:cf59:8de with SMTP id
 n7-20020a5d4c47000000b0031dcf5908demr877068wrt.19.1693376750276; 
 Tue, 29 Aug 2023 23:25:50 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x16-20020a5d6510000000b003143c9beeaesm15663899wru.44.2023.08.29.23.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 23:25:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/ssd130x: Allocate buffer in the CRTC's
 .atomic_check() callback
Date: Wed, 30 Aug 2023 08:25:08 +0200
Message-ID: <20230830062546.720679-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
.atomic_check() callback") moved the allocation of the intermediate and
HW buffers from the encoder's .atomic_enable callback to primary plane's
.atomic_check callback.

This was suggested by Maxime Ripard because drivers aren't allowed to fail
after drm_atomic_helper_swap_state() has been called, and the encoder's
.atomic_enable happens after the new atomic state has been swapped.

But that change caused a performance regression in very slow platforms,
since now the allocation happens for every plane's atomic state commit.
For example, Geert Uytterhoeven reports that is the case on a VexRiscV
softcore (RISC-V CPU implementation on an FPGA).

To prevent that, move the move the buffers' allocation and free to the
CRTC's .atomic_check and .atomic_destroy_state callbacks, so that only
happens on a modeset. Since the intermediate buffer is only needed when
not using the controller native format (R1), doing the buffer allocation
at that CRTC's .atomic_check time would be enough.

Fixes: 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")
Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
Hello,

This is a RFC because I'm not sure if there is a net benefit after this
change. I find the currect code much cleaner and less error prone, even
when Geert reports that performs worse on his (very slow) platform.

But I'm still posting it to see what others think. I've tested the patch
on an I2C ssd1306 OLED and found no regressions.

The patch is on top on Geert's latest patch-set that adds support for the
DRM_FORMAT_R1 to the ssd130x driver:

https://lore.kernel.org/dri-devel/cover.1692888745.git.geert@linux-m68k.org

Best regards,
Javier

 drivers/gpu/drm/solomon/ssd130x.c | 106 ++++++++++++++++--------------
 1 file changed, 56 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 0d2b36ba4011..60536cd0c42d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -650,46 +650,6 @@ static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
 	return ret;
 }
 
-static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						     struct drm_atomic_state *state)
-{
-	struct drm_device *drm = plane->dev;
-	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
-	unsigned int page_height = ssd130x->device_info->page_height;
-	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
-	const struct drm_format_info *fi;
-	unsigned int pitch;
-	int ret;
-
-	ret = drm_plane_helper_atomic_check(plane, state);
-	if (ret)
-		return ret;
-
-	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
-	if (!ssd130x_state->data_array)
-		return -ENOMEM;
-
-	if (plane_state->fb->format->format != DRM_FORMAT_R1) {
-		fi = drm_format_info(DRM_FORMAT_R1);
-		if (!fi)
-			return -EINVAL;
-
-		pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
-
-		ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
-		if (!ssd130x_state->buffer) {
-			kfree(ssd130x_state->data_array);
-			/* Set to prevent a double free in .atomic_destroy_state() */
-			ssd130x_state->data_array = NULL;
-			return -ENOMEM;
-		}
-	}
-
-	return 0;
-}
-
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 						       struct drm_atomic_state *state)
 {
@@ -762,10 +722,6 @@ static struct drm_plane_state *ssd130x_primary_plane_duplicate_state(struct drm_
 	if (!ssd130x_state)
 		return NULL;
 
-	/* The buffers are not duplicated and are allocated in .atomic_check */
-	ssd130x_state->buffer = NULL;
-	ssd130x_state->data_array = NULL;
-
 	new_shadow_plane_state = &ssd130x_state->base;
 
 	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
@@ -778,9 +734,6 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 {
 	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(state);
 
-	kfree(ssd130x_state->data_array);
-	kfree(ssd130x_state->buffer);
-
 	__drm_gem_destroy_shadow_plane_state(&ssd130x_state->base);
 
 	kfree(ssd130x_state);
@@ -788,7 +741,7 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
+	.atomic_check = drm_plane_helper_atomic_check,
 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
 };
@@ -818,6 +771,59 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
+int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
+{
+	struct drm_device *drm = crtc->dev;
+	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
+	struct drm_plane *plane = crtc->primary;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+	unsigned int page_height = ssd130x->device_info->page_height;
+	unsigned int pages = DIV_ROUND_UP(ssd130x->height, page_height);
+	const struct drm_format_info *fi;
+	unsigned int pitch;
+	int ret;
+
+	ret = drm_crtc_helper_atomic_check(crtc, state);
+	if (ret)
+		return ret;
+
+	ssd130x_state->data_array = kcalloc(ssd130x->width, pages, GFP_KERNEL);
+	if (!ssd130x_state->data_array)
+		return -ENOMEM;
+
+	if (plane_state->fb->format->format != DRM_FORMAT_R1) {
+		fi = drm_format_info(DRM_FORMAT_R1);
+		if (!fi)
+			return -EINVAL;
+
+		pitch = drm_format_info_min_pitch(fi, 0, ssd130x->width);
+
+		ssd130x_state->buffer = kcalloc(pitch, ssd130x->height, GFP_KERNEL);
+		if (!ssd130x_state->buffer) {
+			kfree(ssd130x_state->data_array);
+			/* Set to prevent a double free in .atomic_destroy_state() */
+			ssd130x_state->data_array = NULL;
+			return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
+static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
+				       struct drm_crtc_state *state)
+{
+	struct drm_plane *plane = crtc->primary;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state->state, plane);
+	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
+
+	drm_atomic_helper_crtc_destroy_state(crtc, state);
+
+	kfree(ssd130x_state->data_array);
+	kfree(ssd130x_state->buffer);
+}
+
 /*
  * The CRTC is always enabled. Screen updates are performed by
  * the primary plane's atomic_update function. Disabling clears
@@ -825,7 +831,7 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
  */
 static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
 	.mode_valid = ssd130x_crtc_helper_mode_valid,
-	.atomic_check = drm_crtc_helper_atomic_check,
+	.atomic_check = ssd130x_crtc_helper_atomic_check,
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -834,7 +840,7 @@ static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_destroy_state = ssd130x_crtc_destroy_state,
 };
 
 static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
-- 
2.41.0

