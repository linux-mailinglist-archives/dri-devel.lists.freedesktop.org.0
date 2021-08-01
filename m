Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD743DCC92
	for <lists+dri-devel@lfdr.de>; Sun,  1 Aug 2021 18:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF6A6E1BD;
	Sun,  1 Aug 2021 16:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9416E18E
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Aug 2021 16:04:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k1so16804150plt.12
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Aug 2021 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qWjHcNc9/cKIzWTM8p61ItynnbVxNw2Lx8bEmqmAetI=;
 b=nE+QduxE8NhfYgjAcdepIT+KzHO6Mq/IoqdxRNSSwCEBZvfdHRRWQtcX3Hc+Jor5P3
 Ofavidc15wIUeDkwgXQrg1cUp19fsaK+L92bB6li95L1O6C4cXVzHP7vhDF/8MvMyR64
 oHc7npopMH4HfjORPUyr8vPmuyc3Oj37PB/QEtet94g98Ph++ft2Ho85zLBQfuWyJ9Eo
 eCezJFfhd4ZHR5dhbrpZabX/5LjXJnokC+BIH5Z+bKNGPZJVNIw3A1CeibtSRx22k1jK
 +YBKa18RoVZuTtCVe470RKEmFmoCA/OnIoEc45KSYpB4Py+guTJMtF/bDMTVsRa7eK21
 JOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qWjHcNc9/cKIzWTM8p61ItynnbVxNw2Lx8bEmqmAetI=;
 b=oVHzE/Oz73igHcMI51jcF23ZOka966WL47BD3SKkRE7zdkQa5+FWAe1Yy+QAH96GoH
 LZK5umzHH+7YOZWmtx87zA4uGij4HufXmSJhChXnX54GFU1vF0HP4p6Vz9s+z7YcZX1u
 +ky2loXQX7uYNzNramKC+bhkW0iHGGh2NNIoWtF1QD2V3XNnx3FrorJQnMrBZLWpcSFu
 Mi8vpaw8fRA7iKKXto5OVE0Hi7Nq+cBLldcIu8r33OcJSjkofQH3nVyP/zIkEOKeih/3
 FRcJYEv766If19AEN5aBAbuE5e6tQj+GgGuBCCYtrKDJNqYJolQoUaxxXGI1OxH+zjw+
 tFxA==
X-Gm-Message-State: AOAM533z4h4VfQyxnN4po/YYBQWRKMFJ449/Ptj6vcVsE/NO6pVRc2zF
 eSy4m7SYzprQ9Spu70yYTq780QZKd8crcfRI
X-Google-Smtp-Source: ABdhPJzfNy1c5HJoUaRcbqftHZkZl+7/2xFDQiwQh/atJajKc6AcevU4q/eYjGT3IXo0Lybf1J478w==
X-Received: by 2002:a17:90a:ba8e:: with SMTP id
 t14mr13385953pjr.176.1627833850298; 
 Sun, 01 Aug 2021 09:04:10 -0700 (PDT)
Received: from adolin ([49.207.203.94])
 by smtp.gmail.com with ESMTPSA id x7sm8581978pfn.70.2021.08.01.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 09:04:10 -0700 (PDT)
Date: Sun, 1 Aug 2021 21:33:00 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Cc: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V5 1/2] drm/vkms: Refactor vkms_composer_worker() to prep for
 virtual_hw mode
Message-ID: <8aadb60b4d4768dc5518f12a5952909a388212c2.1627831087.git.sylphrenadin@gmail.com>
References: <cover.1627831087.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627831087.git.sylphrenadin@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new function vkms_composer_common(). The actual plane
composition work has been moved to the helper function,
vkms_composer_common() which is called by vkms_composer_worker()
and will be called in the implementation of virtual_hw mode
as well.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
Changes in V5:
- Move vkms_crtc_composer() to the patch that introduces
virtual_hw mode (Melissa)
- Fix checkpatch errors(Melissa)
Changes in V4:
- Fix warning
Changes in V3:
- Refactor patchset (Melissa)
Change in V2:
- Add vkms_composer_common() (Daniel)
---
 drivers/gpu/drm/vkms/vkms_composer.c | 76 ++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +
 2 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index ead8fff81f30..bf3d576db225 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -206,6 +206,47 @@ static int compose_active_planes(void **vaddr_out,
 	return 0;
 }
 
+int vkms_composer_common(struct vkms_crtc_state *crtc_state,
+			 struct vkms_output *out, bool wb_pending, uint32_t *crc32)
+{
+	struct vkms_composer *primary_composer = NULL;
+	struct vkms_plane_state *act_plane = NULL;
+	void *vaddr_out = NULL;
+	int ret;
+
+	if (crtc_state->num_active_planes >= 1) {
+		act_plane = crtc_state->active_planes[0];
+		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary_composer = act_plane->composer;
+	}
+
+	if (!primary_composer)
+		return -EINVAL;
+	if (wb_pending)
+		vaddr_out = crtc_state->active_writeback;
+
+	ret = compose_active_planes(&vaddr_out, primary_composer, crtc_state);
+
+	if (ret) {
+		if ((ret == -EINVAL || ret == -ENOMEM) && !wb_pending)
+			kfree(vaddr_out);
+		return ret;
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
@@ -222,10 +263,7 @@ void vkms_composer_worker(struct work_struct *work)
 						composer_work);
 	struct drm_crtc *crtc = crtc_state->base.crtc;
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
-	struct vkms_composer *primary_composer = NULL;
-	struct vkms_plane_state *act_plane = NULL;
 	bool crc_pending, wb_pending;
-	void *vaddr_out = NULL;
 	u32 crc32 = 0;
 	u64 frame_start, frame_end;
 	int ret;
@@ -247,37 +285,9 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1) {
-		act_plane = crtc_state->active_planes[0];
-		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary_composer = act_plane->composer;
-	}
-
-	if (!primary_composer)
-		return;
-
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback;
-
-	ret = compose_active_planes(&vaddr_out, primary_composer,
-				    crtc_state);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
+	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
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
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8c731b6dcba7..01beba424f18 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -132,6 +132,8 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 			   size_t *values_cnt);
 
 /* Composer Support */
+int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output *out,
+			 bool wb_pending, uint32_t *crcs);
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 
-- 
2.31.1

