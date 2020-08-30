Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C8F256E91
	for <lists+dri-devel@lfdr.de>; Sun, 30 Aug 2020 16:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1FE6E46C;
	Sun, 30 Aug 2020 14:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725D6E45F
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 14:20:36 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b14so3989304qkn.4
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Aug 2020 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyBQRIpRIUmxpLX99Up9AVw+3VgEJCImZ8A6MyCXh6U=;
 b=KsBGTRO52k++UKESUj3LZEkH1y/FAgcQvgDqfF6MkFB41OmG/SK6RL6Yfk4bvjv+lg
 Y/tkVL17SmyJCm8PXC6FF8Qo+jinAMsR62n8AL77QRSNd0BEYsGPQCzX6/Ar99Kk3YO4
 BVOYmd9ezdHtrjANrO9UHYwGxXenvRZzRJzZovjH3xHbgkPEBOoH9w+DcTd5BNBfeJdB
 YfO5fDf0QWL15CFJj78d0W3LgTzPTDxvr/iAj6rRcf41+/1cwkq2beVauyZEseFf/T6i
 SQZs7OCIwtk0ykxj8LZFshgDl7wsbSa7rCnc2RlwrhisiWWZ7LtNHlNGliMm9+wQTu5e
 l9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyBQRIpRIUmxpLX99Up9AVw+3VgEJCImZ8A6MyCXh6U=;
 b=FXx1wPxkSBXbffI4l1b1CjkDbORi5Y1+ofDjZ/oPWOL8vo9Q59zdZtcMaJ5Yju8zic
 Uh/q+FMdvjnCMp6HasM7yqFTDj4yPzWsszMDvSFd6LdZd3IEyMQcqvvgthL2ISp/FJBh
 Kg2VvnNy3JX17k6QWBGPc1fCSNGKyaC84E2ZwB5BV1cr9ojELcIUSggKtJSCc6y7C/bW
 xm+mcduUJLyfr+4IKrU/S/eEzQqqoMvlv+V/utKZbHp3lcsEHMeAzKLxwAVqiKltH6/+
 rE/vO0sOyBQ7SeeBKmKncz8lNeXq+vmazoOVU9fPZTvnViDW9XKKkk0OktOvBNACBAlr
 9UsA==
X-Gm-Message-State: AOAM532r8oqb0REYSlW42TPLNqtaRldGTMZX4q+d38b8DcK3lyr7fH0t
 PMBL4Dcg4MPG+w90N/ScqMo=
X-Google-Smtp-Source: ABdhPJxsV5fFyQC18a+jfublWGOo9qfN4mYE2R8vdPhzeREJmj4D78nShs3gibfD+qeGT2tAGQQHgg==
X-Received: by 2002:a37:bcc:: with SMTP id 195mr6891348qkl.287.1598797235190; 
 Sun, 30 Aug 2020 07:20:35 -0700 (PDT)
Received: from atma2.hitronhub.home ([2607:fea8:56e0:6d60::2db6])
 by smtp.gmail.com with ESMTPSA id o72sm5884861qka.113.2020.08.30.07.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 07:20:34 -0700 (PDT)
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/3] drm/vkms: Decouple crc operations from composer
Date: Sun, 30 Aug 2020 10:19:58 -0400
Message-Id: <20200830142000.146706-2-rodrigosiqueiramelo@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
References: <20200830142000.146706-1-rodrigosiqueiramelo@gmail.com>
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

Tested-by: Melissa Wen <melissa.srw@gmail.com>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 49 ++++++++++++++++------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index eaecc5a6c5db..f67d1baf1942 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -131,35 +131,31 @@ static void compose_cursor(struct vkms_composer *cursor_composer,
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
@@ -180,9 +176,11 @@ void vkms_composer_worker(struct work_struct *work)
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
@@ -206,14 +204,25 @@ void vkms_composer_worker(struct work_struct *work)
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
