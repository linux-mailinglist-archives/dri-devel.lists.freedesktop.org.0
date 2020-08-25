Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3CB250F10
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 04:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4046E802;
	Tue, 25 Aug 2020 02:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B006E7F1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 02:31:59 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id k20so4472969qtq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 19:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcHo4i74kj3qxvqHgzH/WtshfHI04sb5YBeB8ltiN6M=;
 b=bXlerMt0OP/DxGB9ODmOPs/BsBN8mhHhuUSoRdd1d4HTrPx3FLeAjDd4EJPq80T3In
 149kAVcKf3Z/q6AIoBqrU/iv61bAPEr9TUolDZ9MjOTJd3cymANVF4WbDCPD91VOjgOd
 ofHJs8Z1WmXm7y9M9lhEn9EJ1o1FKbdr7s9PdxHFebejeQU7rmKa624+3tXWNla4H3H6
 JwZiMAye7nLbWR9ttYmo7qmSUZmRv0fWVqWXp84+D7csnhRooX8P0wuRaaPYOeKq3E4o
 Q7Jp8ArrHyKR/Yr/bHVgy4bsmchRF6nrfBP1R725xMMSrkMIq8u8WT1+RIabtTwTPLjA
 k8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcHo4i74kj3qxvqHgzH/WtshfHI04sb5YBeB8ltiN6M=;
 b=mFlfVuiF5go9QAHUwejBvObMTWnCjRj+ZUCWOfFbkGkw7wTU509AcVMBUwun5axtuX
 PzwJ10mIktAla98LsLVu0UFE6dOJ7gC8t00eb4CUnqINEidtbjU6gIdjVXkyysC5pDRc
 uJkPZhwFeQaM7RSQvWsPacAguxkdNqZ+VQfKpOYny3chYdZ2PHweGNsVbuCHPf9JKsJv
 Qn5GXKKcD+zblZl1AtCI+/CsMQBzGn0QLMaKv+6L5C5+uOH+474ptGW0Leu9isM0Ux8B
 C4QGkFg6ix5ESb0MMB1RQhSuA/4jfBWhQTnoc1faV3FoVSNPZwheYNxDEgqoQIm5PIC5
 fVKw==
X-Gm-Message-State: AOAM533uWifmkTK06cNlJ6SGAtVZmBY4BBCabXCO2UcZr85Or9IezHd5
 vIg2H3T5w+yu0hu+Oy84vrs=
X-Google-Smtp-Source: ABdhPJzVOgmVALB2L78x2p4uLPmykpU+KtBYc2ZqCABjDekUH2FfuaHspH5bqev5/RfMoQZqvzYbCg==
X-Received: by 2002:ac8:4748:: with SMTP id k8mr7535293qtp.114.1598322718750; 
 Mon, 24 Aug 2020 19:31:58 -0700 (PDT)
Received: from atma2.hitronhub.home ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id x137sm11095372qkb.47.2020.08.24.19.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 19:31:58 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/3] drm/vkms: Decouple crc operations from composer
Date: Mon, 24 Aug 2020 22:31:40 -0400
Message-Id: <20200825023142.2561220-2-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
References: <20200825023142.2561220-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
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
Cc: daniels@collabora.com, Liviu Dudau <liviu.dudau@arm.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, melissa.srw@gmail.com,
 Emil Velikov <emil.l.velikov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the vkms_composer.c, some of the functions related to CRC and compose
have interdependence between each other. This patch reworks some
functions inside vkms_composer to make crc and composer computation
decoupled.

This patch is preparation work for making vkms able to support new
features.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4f3b07a32b60..4d8bc04bb6ee 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -108,35 +108,31 @@ static void compose_cursor(struct vkms_composer *cursor_composer,
 	      primary_composer, cursor_composer);
 }
 
-static uint32_t _vkms_get_crc(struct vkms_composer *primary_composer,
-			      struct vkms_composer *cursor_composer)
+static int compose_planes(void **vaddr_out,
+			  struct vkms_composer *primary_composer,
+			  struct vkms_composer *cursor_composer)
 {
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	struct vkms_gem_object *vkms_obj = drm_gem_to_vkms_gem(gem_obj);
-	void *vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
-	u32 crc = 0;
 
-	if (!vaddr_out) {
-		DRM_ERROR("Failed to allocate memory for output frame.");
-		return 0;
+	if (!*vaddr_out) {
+		*vaddr_out = kzalloc(vkms_obj->gem.size, GFP_KERNEL);
+		if (!*vaddr_out) {
+			DRM_ERROR("Cannot allocate memory for output frame.");
+			return -ENOMEM;
+		}
 	}
 
-	if (WARN_ON(!vkms_obj->vaddr)) {
-		kfree(vaddr_out);
-		return crc;
-	}
+	if (WARN_ON(!vkms_obj->vaddr))
+		return -EINVAL;
 
-	memcpy(vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
+	memcpy(*vaddr_out, vkms_obj->vaddr, vkms_obj->gem.size);
 
 	if (cursor_composer)
-		compose_cursor(cursor_composer, primary_composer, vaddr_out);
+		compose_cursor(cursor_composer, primary_composer, *vaddr_out);
 
-	crc = compute_crc(vaddr_out, primary_composer);
-
-	kfree(vaddr_out);
-
-	return crc;
+	return 0;
 }
 
 /**
@@ -157,9 +153,11 @@ void vkms_composer_worker(struct work_struct *work)
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	struct vkms_composer *primary_composer = NULL;
 	struct vkms_composer *cursor_composer = NULL;
+	void *vaddr_out = NULL;
 	u32 crc32 = 0;
 	u64 frame_start, frame_end;
 	bool crc_pending;
+	int ret;
 
 	spin_lock_irq(&out->composer_lock);
 	frame_start = crtc_state->frame_start;
@@ -183,14 +181,25 @@ void vkms_composer_worker(struct work_struct *work)
 	if (crtc_state->num_active_planes == 2)
 		cursor_composer = crtc_state->active_planes[1]->composer;
 
-	if (primary_composer)
-		crc32 = _vkms_get_crc(primary_composer, cursor_composer);
+	if (!primary_composer)
+		return;
+
+	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	if (ret) {
+		if (ret == -EINVAL)
+			kfree(vaddr_out);
+		return;
+	}
+
+	crc32 = compute_crc(vaddr_out, primary_composer);
 
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
 	while (frame_start <= frame_end)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
+
+	kfree(vaddr_out);
 }
 
 static const char * const pipe_crc_sources[] = {"auto"};
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
