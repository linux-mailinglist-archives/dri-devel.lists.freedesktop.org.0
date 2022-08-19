Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3BA5A01FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993D511AB67;
	Wed, 24 Aug 2022 19:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB0110E6D3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eULzbfmfnyT2d1MeKBaP6Ap3rVDOs/VsOBler4qqAmU=;
 b=XyeTVGzcokJ7yV8i5ohYpHWycFIjR/cBBg6GV7gKZVyTzPXoRcBu9dXY0Ze77i/iJs1Nhd
 OcnRTABwlTFoYao38vu5M4rnAzHMcA9LSQGi0t3HFGGFssarfQBBMcPm6ybMuvROtxI7pc
 rgrC8BAbJ2pKOQah+vtxY/QekXUjqwA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-288-LP1M9hNRNFiTwNSX_b9PJQ-1; Fri, 19 Aug 2022 17:24:51 -0400
X-MC-Unique: LP1M9hNRNFiTwNSX_b9PJQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r12-20020a05640251cc00b00440647ec649so3399947edd.21
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eULzbfmfnyT2d1MeKBaP6Ap3rVDOs/VsOBler4qqAmU=;
 b=gtzKyRsHEaXBQMbhwmn0p/0S6Ci/lpJyMPO5nhb7vKJYu4u1mWVk/KFYOHp0DzJM8P
 AWgHI/SwTQmdoAgV5yOd55XpQd3A1v4GvO5vK+eOQ8mJ8mgdXCJItuvA6QcpDaJgx/6S
 OrsX+2T42XVD/ynKXDqJF5DBqplH4hf0ncp8EeP2YHu26bpMo/SEQdLfr8p+g4ubY+FQ
 Z16V0pjdIUAqLBENlj53MjoIzP3rTXnL44h0MWo3byAaXuOSlWIMyjJ566K+2tOXZXaO
 LlE8AM76zD3MNeoZWEaY8kEXP7QqnDtY/ht0NUtzfAiQUDdPIc2IAlp0xdGRe7s5p+EU
 e9zQ==
X-Gm-Message-State: ACgBeo0UPzv2shZmUo9uAsg0FPVD1KAvelo8jaYWuaFg15VnlLo6pqWI
 65CYdbNGCOh4kf/N0Sn7L/AekFcPj/uh0LW42r3nYnNrgXuc2+o8bBwv6UPFT36PT4JkbJ3fiiy
 sNzVzXKKOl1hEV9kJGkCSY1H9Dd/+
X-Received: by 2002:a17:907:2724:b0:730:da23:5b60 with SMTP id
 d4-20020a170907272400b00730da235b60mr5944565ejl.43.1660944289772; 
 Fri, 19 Aug 2022 14:24:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5B90eHkyeTMFNC1i1+2xlqmaYUYa8XOKjU4q8gW3qKpLANgXl3OH3z13tEU4BMI6rGHaZNcQ==
X-Received: by 2002:a17:907:2724:b0:730:da23:5b60 with SMTP id
 d4-20020a170907272400b00730da235b60mr5944561ejl.43.1660944289613; 
 Fri, 19 Aug 2022 14:24:49 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906579500b0072fa24c2ecbsm2842999ejq.94.2022.08.19.14.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:24:49 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 4/8] drm/arm/malidp: plane: use drm managed
 resources
Date: Fri, 19 Aug 2022 23:24:41 +0200
Message-Id: <20220819212445.559790-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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

