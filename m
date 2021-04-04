Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E937F35382E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 15:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71FE6E4A5;
	Sun,  4 Apr 2021 13:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717956E4A5
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Apr 2021 13:10:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id v10so6585552pfn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Apr 2021 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hpP8iuj2W2E0/RJV7xhpUQW/zqPiNVan0e9pCvjPrtQ=;
 b=BjAUMjEn4FzCwiElEg3/+kaGl/m7HWc9qNG9hmk1sn7SSqF7CHC9miFrsYYHXVyIe/
 LKZIH9i2USzppgAUIwiJ4qvm2qf+6E1N8aucrpa5rqjZJg4+puWO3pjv2g7uevOo3Kg3
 gzLdEwtIPIOrVffcpNzvV5cRzW9XKgDEXGhECnx+x2SHRQnOxocgg4TXKRdRS3t5i1Yo
 fEKLO+00KCdlI8XpV6G3sP+1wT4jhe3g9RtHv3J9moxcV+bfQNh3zWhjay5dXraVq5dU
 HD5c0P15r7pZ2PFX3/lQd1tTMwdI08rz+ynK9gXb1ObKe/TVtMkjhsclpk/Rj0PuK3cX
 G5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpP8iuj2W2E0/RJV7xhpUQW/zqPiNVan0e9pCvjPrtQ=;
 b=PCxuOLc7SSL12Z/p2gRNIEtVzIoa1GkYtoVw3YMVB3qqI9LuEimL25ubk6KqlT2Uva
 xHoWaUZGFO6zdSVN3Ocq7i/hIB2dgvVE2QF3VLOJ+X+zVF2x4j104Ae6z9pJNUwJRp4n
 oS+Pvlu2SfcYFsQIPapulhLGaYxdz0G1K80EcxuGvRoJxLjFEeNLnpZYfH6s3Xl0EaiD
 i072LOeHRBYXD+kuVkjwUuZqrIbe4RdD2Tbq3J+mZFq3+tLpqEEtjHaAg56fcycGcrhu
 l5nWIDK6cd83Z+F82AArdC6raPbU/EBg2Vn7UD+9oALlNJsW2ECg7jU0FizZ8fjLfzBh
 KCvw==
X-Gm-Message-State: AOAM533S8GvxY0TY0kyVUGzGbH35CenEd+3r1cl5WK13xgdcahCAyQ0o
 8zRLBTWd/H7B4mv8HyfMCMc=
X-Google-Smtp-Source: ABdhPJxVFzfKOQ4Ql0GqjyWB/1kfYFcr2gtNUiF8Rsm4VBLQTmuvdAVXDcKelqAVvT94GEkXcK1wtw==
X-Received: by 2002:a62:e805:0:b029:1f8:16ba:4518 with SMTP id
 c5-20020a62e8050000b02901f816ba4518mr19404817pfi.37.1617541852107; 
 Sun, 04 Apr 2021 06:10:52 -0700 (PDT)
Received: from adolin ([49.207.202.237])
 by smtp.gmail.com with ESMTPSA id mv9sm364214pjb.29.2021.04.04.06.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 06:10:51 -0700 (PDT)
Date: Sun, 4 Apr 2021 18:40:46 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Subject: [PATCH V3 1/2] drm/vkms: Refactor vkms_composer_worker() to prep for
 virtual_hw mode
Message-ID: <e948dc1de2c7de246c81728248d7c6cdca7b4fd6.1617539357.git.sylphrenadin@gmail.com>
References: <cover.1617539357.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1617539357.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two new functions vkms_composer_common() and vkms_crtc_composer().
The actual plane composition work has been moved to the helper function,
vkms_composer_common() which is called by both vkms_composer_worker()
and vkms_crtc_composer(). vkms_crtc_composer() can be used when we
implement virtual_hw mode.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---

Changes in V3:
- Refactor patchset (Melissa)
Change in V2:
- Add vkms_composer_common() (Daniel)
---
 drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_drv.h      |  3 +
 2 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 66c6842d70db..91b33c9c2f47 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -169,6 +169,44 @@ static int compose_planes(void **vaddr_out,
 	return 0;
 }
 
+int vkms_composer_common(struct vkms_crtc_state *crtc_state,
+			 struct vkms_output *out, bool wb_pending, uint32_t *crc32)
+{
+	struct vkms_composer *primary_composer = NULL;
+	struct vkms_composer *cursor_composer = NULL;
+	void *vaddr_out = NULL;
+	int ret;
+
+	if (crtc_state->num_active_planes >= 1)
+		primary_composer = crtc_state->active_planes[0]->composer;
+	if (crtc_state->num_active_planes == 2)
+		cursor_composer = crtc_state->active_planes[1]->composer;
+	if (!primary_composer)
+		return -EINVAL;
+	if (wb_pending)
+		vaddr_out = crtc_state->active_writeback;
+
+	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
+	if (ret) {
+		if (ret == -EINVAL && !wb_pending)
+			kfree(vaddr_out);
+		return -EINVAL;
+	}
+
+	*crc32 = compute_crc(vaddr_out, primary_composer);
+
+	if (wb_pending) {
+		drm_writeback_signal_completion(&out->wb_connector, 0);
+		spin_lock_irq(&out->composer_lock);
+		crtc_state->wb_pending = false;
+		spin_unlock_irq(&out->composer_lock);
+	} else {
+		kfree(vaddr_out);
+	}
+
+	return 0;
+}
+
 /**
  * vkms_composer_worker - ordered work_struct to compute CRC
  *
@@ -185,12 +223,9 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	struct vkms_composer *primary_composer = NULL;
-	struct vkms_composer *cursor_composer = NULL;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
-	u32 crc32 = 0;
 	u64 frame_start, frame_end;
+	u32 crc32 = 0;
 	int ret;
 
 	spin_lock_irq(&out->composer_lock);
@@ -210,36 +245,9 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1)
-		primary_composer = crtc_state->active_planes[0]->composer;
-
-	if (crtc_state->num_active_planes == 2)
-		cursor_composer = crtc_state->active_planes[1]->composer;
-
-	if (!primary_composer)
-		return;
-
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback;
-
-	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
+	if (ret == -EINVAL)
 		return;
-	}
-
-	crc32 = compute_crc(vaddr_out, primary_composer);
-
-	if (wb_pending) {
-		drm_writeback_signal_completion(&out->wb_connector, 0);
-		spin_lock_irq(&out->composer_lock);
-		crtc_state->wb_pending = false;
-		spin_unlock_irq(&out->composer_lock);
-	} else {
-		kfree(vaddr_out);
-	}
-
 	/*
 	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
 	 */
@@ -247,6 +255,20 @@ void vkms_composer_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
+{
+	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	u32 crc32 = 0;
+	int ret;
+
+	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
+	if (ret == -EINVAL)
+		return;
+
+	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
+}
+
 static const char * const pipe_crc_sources[] = {"auto"};
 
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 35540c7c4416..538315140585 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -125,8 +125,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 			   size_t *values_cnt);
 
 /* Composer Support */
+int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output *out,
+			 bool wb_pending, uint32_t *crcs);
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
 
 /* Writeback */
 int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
