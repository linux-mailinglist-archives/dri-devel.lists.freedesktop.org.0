Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18AC5AD61D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EE810E60F;
	Mon,  5 Sep 2022 15:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C5010E63F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eULzbfmfnyT2d1MeKBaP6Ap3rVDOs/VsOBler4qqAmU=;
 b=bBpUq1hy3OmudET57UjCfPy/DxGWGJDh8xg8FjBV4qo1IGL5JlMnkzELMoOrSd4ad35zXo
 tXyN6+He9CCjm1gqOU94YWc/yWFtMf9M59NPMMssE8Gbqmz5citsCVAXvkiK/fAkPb4HI8
 F4BdrjXZU85A5qVnoAT7IRq0RVzo7PQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-4PseKyVpO4On-ufuro0wDQ-1; Mon, 05 Sep 2022 11:19:28 -0400
X-MC-Unique: 4PseKyVpO4On-ufuro0wDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so7580528wma.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eULzbfmfnyT2d1MeKBaP6Ap3rVDOs/VsOBler4qqAmU=;
 b=FMPsknC3wi0mL0oYB4ALuq5uHAo35Pql6pGVRyPE1S+q4mVzdByUK4TQCdIDilhC1O
 J2CkBG8ZYy5czINqC1qoNxpIHSSFM0l716awq9Q3Wff3+ohpxNRPeHVqP5iS8sY+21qx
 QOx41xMrZqvPlCJusrhzpwMRl4Y0Ned0b4f6vjae461qczTmZqOKJraXA6rf9THcqi/L
 m8VjiXj4RoHt3gGsCQSpbaNXnm+iCO2yF3OKIyGobB5NOrDkG+UPYjLhJgcPPKwvv90l
 NTgkMyWVcG6zkoPVYSmJxc5LicsHY8dfO8Ik04CpcJ3JNOg4XWBgDTrkcWFz5sRpgSQU
 GuLQ==
X-Gm-Message-State: ACgBeo1suxpeW4vcIpkEwH2iqJS9gSoLrBE6WepWkYHN+IOYf1KHkg2w
 jBSRMhZGH6zg+nV5MtsRqj4jtfcITcQqp3VfmdYgQkrRZznUvTYzD9hqgTSdR4ovvwyexH0kS74
 aRe3eb24jIdbbY/gZ5pnxMao+8uFY
X-Received: by 2002:a05:600c:290a:b0:3a5:515d:4f69 with SMTP id
 i10-20020a05600c290a00b003a5515d4f69mr10953083wmd.127.1662391167195; 
 Mon, 05 Sep 2022 08:19:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7xYW3E2/dKGrGQybWNRmjEQXRIlyGBB+beFjcq1u15evJ3hzay5dMZBpfGjmcYbVGnUOV1Pw==
X-Received: by 2002:a05:600c:290a:b0:3a5:515d:4f69 with SMTP id
 i10-20020a05600c290a00b003a5515d4f69mr10953071wmd.127.1662391166968; 
 Mon, 05 Sep 2022 08:19:26 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b00228aea99efcsm2209641wrx.14.2022.09.05.08.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 4/8] drm/arm/malidp: plane: use drm
 managed resources
Date: Mon,  5 Sep 2022 17:19:06 +0200
Message-Id: <20220905151910.98279-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm managed resource allocation (drmm_universal_plane_alloc()) in
order to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_planes.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 815d9199752f..34547edf1ee3 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -68,14 +68,6 @@
 /* readahead for partial-frame prefetch */
 #define MALIDP_MMU_PREFETCH_READAHEAD		8
 
-static void malidp_de_plane_destroy(struct drm_plane *plane)
-{
-	struct malidp_plane *mp = to_malidp_plane(plane);
-
-	drm_plane_cleanup(plane);
-	kfree(mp);
-}
-
 /*
  * Replicate what the default ->reset hook does: free the state pointer and
  * allocate a new empty object. We just need enough space to store
@@ -260,7 +252,6 @@ static bool malidp_format_mod_supported_per_plane(struct drm_plane *plane,
 static const struct drm_plane_funcs malidp_de_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.destroy = malidp_de_plane_destroy,
 	.reset = malidp_plane_reset,
 	.atomic_duplicate_state = malidp_duplicate_plane_state,
 	.atomic_destroy_state = malidp_destroy_plane_state,
@@ -972,12 +963,6 @@ int malidp_de_planes_init(struct drm_device *drm)
 	for (i = 0; i < map->n_layers; i++) {
 		u8 id = map->layers[i].id;
 
-		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
-		if (!plane) {
-			ret = -ENOMEM;
-			goto cleanup;
-		}
-
 		/* build the list of DRM supported formats based on the map */
 		for (n = 0, j = 0;  j < map->n_pixel_formats; j++) {
 			if ((map->pixel_formats[j].layer & id) == id)
@@ -990,13 +975,14 @@ int malidp_de_planes_init(struct drm_device *drm)
 		/*
 		 * All the layers except smart layer supports AFBC modifiers.
 		 */
-		ret = drm_universal_plane_init(drm, &plane->base, crtcs,
-				&malidp_de_plane_funcs, formats, n,
-				(id == DE_SMART) ? linear_only_modifiers : modifiers,
-				plane_type, NULL);
-
-		if (ret < 0)
+		plane = drmm_universal_plane_alloc(drm, struct malidp_plane, base,
+						   crtcs, &malidp_de_plane_funcs, formats, n,
+						   (id == DE_SMART) ? linear_only_modifiers :
+						   modifiers, plane_type, NULL);
+		if (IS_ERR(plane)) {
+			ret = PTR_ERR(plane);
 			goto cleanup;
+		}
 
 		drm_plane_helper_add(&plane->base,
 				     &malidp_de_plane_helper_funcs);
-- 
2.37.2

