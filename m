Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7D57A0E8D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 21:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0BA10E0D4;
	Thu, 14 Sep 2023 19:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E3510E0D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694721125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q/dj/LCR0O5gsD/qpCJOxuH/Z8gNXnmeWxnQEV1TNGA=;
 b=Fxf4foWFN1pDDW7eeeKS58gJGSG/Sh0rkrmWUPWy06Fxpx/WYv8XcgJ2l1yK92iB+Bfafq
 GAJvo60ffnrxq1+Fh9rP6H5wEnu4RzkzsiuqK04sJ2jhueI5Nc7wkAnLgzSL+6GjPWPXil
 GNi/uqCHjRJmKZBCi+i2PdPgHsmFaEs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-uLGy3d-OO9CP7SV92PXNEQ-1; Thu, 14 Sep 2023 15:52:03 -0400
X-MC-Unique: uLGy3d-OO9CP7SV92PXNEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so10305205e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 12:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694721122; x=1695325922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q/dj/LCR0O5gsD/qpCJOxuH/Z8gNXnmeWxnQEV1TNGA=;
 b=pLBLzYC01IWDx6IHw2wD4AJuz7mDTKmIv5P1Wp1q+IEnOuf042kF9JDAbXJqA8WxvL
 wfhlx9K3HDjty95pX/uNwdQpYUEb3zisv4alz1xbjkzdcz936VMLchP1AlxrAUbZ8UVm
 yJuckS23OuNJ5rmNgiP25FtHxLQALMEKWvdUnpwdY3Pe81huWDck2Tq1+Q5qc3Z8gbyH
 L9Rw15q2MzTaavctXABLGA2hBSV2dFodFqbGLFb/MbZJiAL+RjUyIM44F0u7rezkWw/G
 jCL5rJtVqrmDZWLkznjFBiRnrNVYhZ9a9b7W1DS6utkIOiZKaERWhZiOvTB1Kq457fup
 rR7A==
X-Gm-Message-State: AOJu0Yy/HmdD8v0wPS+Rd0hswsnNKd8NkwRW0tiJMxHKEV2gTvZ+3WAI
 WL3d4ruloKlul+2xNs9nbPD+WTGEaSXS1kWQ07zOyfRLUWauMc6qSNeU6Otj5vM15lL3lA10G5d
 9vM8X+Aofx4xelwbOaN/e3lbDSuF5
X-Received: by 2002:a05:600c:2210:b0:401:bf56:8ba0 with SMTP id
 z16-20020a05600c221000b00401bf568ba0mr5485519wml.28.1694721121806; 
 Thu, 14 Sep 2023 12:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQSOLQHLT5syA/mgJqXyvs7BJNeTPgNQRbQoKkAnj7HNnkkWxGFLTHIsAcaYufqvs9/KWSzw==
X-Received: by 2002:a05:600c:2210:b0:401:bf56:8ba0 with SMTP id
 z16-20020a05600c221000b00401bf568ba0mr5485511wml.28.1694721121444; 
 Thu, 14 Sep 2023 12:52:01 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 s23-20020a7bc397000000b00403bbe69629sm2773069wmj.31.2023.09.14.12.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 12:52:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Date: Thu, 14 Sep 2023 21:51:24 +0200
Message-ID: <20230914195138.1518065-1-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses a naming convention where functions for struct drm_*_funcs
callbacks are named ssd130x_$object_$operation, while the callbacks for
struct drm_*_helper_funcs are named ssd130x_$object_helper_$operation.

The idea is that this helper_ prefix in the function names denote that are
for struct drm_*_helper_funcs callbacks. This convention was copied from
other drivers, when ssd130x was written but Maxime pointed out that is the
exception rather than the norm.

So let's get rid of the _helper prefixes from the function handlers names.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 46 +++++++++++++++----------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 8ab02724f65f..245e4ba1c041 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -630,8 +630,8 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
 	return ret;
 }
 
-static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						     struct drm_atomic_state *state)
+static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
@@ -667,8 +667,8 @@ static int ssd130x_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						       struct drm_atomic_state *state)
+static void ssd130x_primary_plane_atomic_update(struct drm_plane *plane,
+						struct drm_atomic_state *state)
 {
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
@@ -701,8 +701,8 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	drm_dev_exit(idx);
 }
 
-static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							struct drm_atomic_state *state)
+static void ssd130x_primary_plane_atomic_disable(struct drm_plane *plane,
+						 struct drm_atomic_state *state)
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
@@ -777,9 +777,9 @@ static void ssd130x_primary_plane_destroy_state(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
-	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
-	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
+	.atomic_check = ssd130x_primary_plane_atomic_check,
+	.atomic_update = ssd130x_primary_plane_atomic_update,
+	.atomic_disable = ssd130x_primary_plane_atomic_disable,
 };
 
 static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
@@ -791,8 +791,8 @@ static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
 	.destroy = drm_plane_cleanup,
 };
 
-static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc,
-							   const struct drm_display_mode *mode)
+static enum drm_mode_status ssd130x_crtc_mode_valid(struct drm_crtc *crtc,
+						    const struct drm_display_mode *mode)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(crtc->dev);
 
@@ -807,8 +807,8 @@ static enum drm_mode_status ssd130x_crtc_helper_mode_valid(struct drm_crtc *crtc
 	return MODE_OK;
 }
 
-static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					    struct drm_atomic_state *state)
+static int ssd130x_crtc_atomic_check(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state)
 {
 	struct drm_device *drm = crtc->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
@@ -882,8 +882,8 @@ static void ssd130x_crtc_destroy_state(struct drm_crtc *crtc,
  * the screen in the primary plane's atomic_disable function.
  */
 static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
-	.mode_valid = ssd130x_crtc_helper_mode_valid,
-	.atomic_check = ssd130x_crtc_helper_atomic_check,
+	.mode_valid = ssd130x_crtc_mode_valid,
+	.atomic_check = ssd130x_crtc_atomic_check,
 };
 
 static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
@@ -895,8 +895,8 @@ static const struct drm_crtc_funcs ssd130x_crtc_funcs = {
 	.atomic_destroy_state = ssd130x_crtc_destroy_state,
 };
 
-static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
-						 struct drm_atomic_state *state)
+static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
@@ -921,8 +921,8 @@ static void ssd130x_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 	return;
 }
 
-static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
-						  struct drm_atomic_state *state)
+static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
+					   struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
@@ -935,15 +935,15 @@ static void ssd130x_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs ssd130x_encoder_helper_funcs = {
-	.atomic_enable = ssd130x_encoder_helper_atomic_enable,
-	.atomic_disable = ssd130x_encoder_helper_atomic_disable,
+	.atomic_enable = ssd130x_encoder_atomic_enable,
+	.atomic_disable = ssd130x_encoder_atomic_disable,
 };
 
 static const struct drm_encoder_funcs ssd130x_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static int ssd130x_connector_helper_get_modes(struct drm_connector *connector)
+static int ssd130x_connector_get_modes(struct drm_connector *connector)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(connector->dev);
 	struct drm_display_mode *mode;
@@ -963,7 +963,7 @@ static int ssd130x_connector_helper_get_modes(struct drm_connector *connector)
 }
 
 static const struct drm_connector_helper_funcs ssd130x_connector_helper_funcs = {
-	.get_modes = ssd130x_connector_helper_get_modes,
+	.get_modes = ssd130x_connector_get_modes,
 };
 
 static const struct drm_connector_funcs ssd130x_connector_funcs = {
-- 
2.41.0

