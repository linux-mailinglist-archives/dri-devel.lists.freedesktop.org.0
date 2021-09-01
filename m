Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D653FE040
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 18:43:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D059C6E213;
	Wed,  1 Sep 2021 16:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4AE6E213
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 16:43:04 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id x16so279174pfh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LyE0QH6lNCVSo0W1WYh5ma87v3T6xS6WMQH4anjXxD8=;
 b=hLBmoaBaCbcq4MvyxjT0txS3dClmupWfLraSUXa87Blj+fBXUpstu5fZGMefAsjWyF
 GaGh/WXcyIhTgVjxST9LNOfr/YvXRIW3jRhIfozyvOrAB/8ZL0Ir2cU8nk//MZu7cmsS
 uY6fbGDumAJKvWObaHteP2TtA8l73i68XsfQCWocTyG/ZQiLd7BgZyMShwwtkcOMLGjt
 lUFxZ6BFleL5n+19+/X5QLITDaT4g0cuI/5clkl1KDsihH2+LRvFTvbbL5Y8LQt8td2Q
 7XBCZY2cgaCemvCom+nXRVSuvw0ukt9QiMntBw1NXc1G39EY9Hyz5lP6WsjXCdyGCrA1
 CWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LyE0QH6lNCVSo0W1WYh5ma87v3T6xS6WMQH4anjXxD8=;
 b=FkAmCo1e4ri8b/UHQVLR1GmBoAYPtdeDd+5HvWe+KVECyjmQJKQGHJeEQpniU5NxO8
 ASK0TwmDyAnDTsTwkhpBPm4IUWkfUlQrPifayj1y5bNZgQsAKA+GErPWVfRLzT7T3h9U
 IBGfuICwhmTgbWVIfbW3F1zLJ2OyYKN82CqEa5SFQfLZFP0mT3Ba+eF/b90Yb0yGsbcb
 FifBS+PfPRXDYb5CBoUTU/U49MYtl3ZJ4OPEmMJFVDw6xgo3LipB9UXU5J4F3cbzszN3
 ZTlKKeAo8Uz2EcEfuC16kpTecQfMvPOjAvuqiB5QhyFbZ0MoDFocJl2BuSu9rBCsdjpC
 43JQ==
X-Gm-Message-State: AOAM532hrs3uvjyRJ8pKIZvTebhD16Ly6hpskakD15xAhOEeWEKYeCzP
 za6eQ0UW+8rKl63lSJ9GhYkzmQiGhZo=
X-Google-Smtp-Source: ABdhPJxgoUhwGeU62bEL9JMVlDAi7AOxd2bi/POtMEyR77uZVO+uc2ombyqI4rMEWiREbcDArP30NQ==
X-Received: by 2002:a63:e40a:: with SMTP id a10mr24243pgi.414.1630514584228;
 Wed, 01 Sep 2021 09:43:04 -0700 (PDT)
Received: from adolin ([49.207.225.208])
 by smtp.gmail.com with ESMTPSA id h4sm254632pgn.6.2021.09.01.09.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 09:43:03 -0700 (PDT)
Date: Wed, 1 Sep 2021 22:11:39 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: melissa.srw@gmail.com
Cc: rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V6 1/2] drm/vkms: Refactor vkms_composer_worker() to prep for
 virtual_hw mode
Message-ID: <2a8e24370f0e5f8df1e103a3aa40aee015e7f874.1630512292.git.sylphrenadin@gmail.com>
References: <cover.1630512292.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1630512292.git.sylphrenadin@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c | 75 ++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +
 2 files changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9e8204be9a14..bca746fb5b53 100644
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
+		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
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
@@ -247,37 +285,10 @@ void vkms_composer_worker(struct work_struct *work)
 	if (!crc_pending)
 		return;
 
-	if (crtc_state->num_active_planes >= 1) {
-		act_plane = crtc_state->active_planes[0];
-		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary_composer = act_plane->composer;
-	}
-
-	if (!primary_composer)
+	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
+	if (ret == -EINVAL)
 		return;
 
-	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
-
-	ret = compose_active_planes(&vaddr_out, primary_composer,
-				    crtc_state);
-	if (ret) {
-		if (ret == -EINVAL && !wb_pending)
-			kfree(vaddr_out);
-		return;
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
index d48c23d40ce5..6f5f63591c20 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -137,6 +137,8 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 			   size_t *values_cnt);
 
 /* Composer Support */
+int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output *out,
+			 bool wb_pending, uint32_t *crcs);
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 
-- 
2.31.1

