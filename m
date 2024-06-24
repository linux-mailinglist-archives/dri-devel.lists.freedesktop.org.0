Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF19151DF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4139510E481;
	Mon, 24 Jun 2024 15:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JGF79OHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8D410E481;
 Mon, 24 Jun 2024 15:20:05 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3d220039bc6so2512163b6e.2; 
 Mon, 24 Jun 2024 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719242404; x=1719847204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOCAjND5OJytF3iiE7FsJqbOE8iBaZkfj12tePjBSS4=;
 b=JGF79OHdHi0kFnqE6Qfkq2OawHTm21sJ+SOJriqGkseO8IwdpGVQjS5/REgcsN3Rkp
 GDVky8De1a7DHrBfVQAGmNTIzbEZZKg5s4qjhUvKeKD14XRINOtrXboSu/foNMALDr2p
 98pQziWC6A7YIhgiA5JFDjGxZdcm2tKouy+2qFiKdvlECShIaEKi2R9aBgKxuQ0zIH3j
 t+DGzAUkWHekxpucEg3K35kzywcCnf/xqykj9rvN8fAo217FYfdY3PmrvaDaMMUXgdyP
 b0e9wdfPpQ1p2DuoAqLe6dFWxveorXqjyTIKZw4WK1IFZmp/QuVXT8J/F6HbLiPkKKnq
 eCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719242404; x=1719847204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOCAjND5OJytF3iiE7FsJqbOE8iBaZkfj12tePjBSS4=;
 b=QpGFDyKgVFb/b82W/fz+Y/23SLaGySH932kZ/ntiuOQT7/hl5dDU0QkbbBGhxa14HL
 uYV2kqdV1tUSKFaLtVv5vX+HJXb7xYiQ4SAx2lsdCkf/cOmiHPmNR3cGdnNYM9r79FmQ
 QPNgfmjTYi0AhNBCepi3a6fnp3Q2C+hkXdOpWAd2b9vBb40ot3fplNC+8OKXxvchVGOT
 WCehTp2VeQMVeXB2ZeC6zrIMa177pk8UNF4OnyDHx8VI5EnOhBSaEBNCYhigBji7Cur6
 crahSYO4XbIaNW5whBQfrVLnzd/s7V+jRgbbtxdAJxyagnbmxhnt45U80oS998MWrzDq
 otRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgvRiXcJ1J5wkEoCklK2DuCEQlKWQywhsPRKiKhiZOIXsVbTHgqiI0ci/M0eqReyhzGpGNVzSND9zz4keSgoE7NVTMk3wFIR2cRVMhQMM5BMTedT2OMHiPKPLLZ3SBOhV+ZkGM+q+ZmpYRI/P41g==
X-Gm-Message-State: AOJu0YwjxZbiAAfSCK06jFm/Sd35dvHltn5+muQ1RfW4BY5ffMNQr09a
 1+Bw0orlpDiAET2V0TqTs/iH5jCtu1u3WQZ2o3Sb5nir5BrGZ8Zvko+XfQyj
X-Google-Smtp-Source: AGHT+IGJZeIHR3bYjnZt2BJ48CgCThRslXvSl5y4f7Smq6oTjV8wFy4GC+RgRSYhcSELHg5KH2QuUQ==
X-Received: by 2002:a05:6830:2693:b0:6f9:6299:1175 with SMTP id
 46e09a7af769-700af9343c1mr6868586a34.13.1719242001851; 
 Mon, 24 Jun 2024 08:13:21 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b529eb3decsm27243976d6.12.2024.06.24.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:13:21 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 6
Date: Mon, 24 Jun 2024 11:10:51 -0400
Message-ID: <20240624151122.23724-8-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624151122.23724-1-wuhoipok@gmail.com>
References: <20240624151122.23724-1-wuhoipok@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Please refer to patch 1.

Signed-off-by: Wu Hoi Pok <wuhoipok@gmail.com>
---
 drivers/gpu/drm/radeon/rs400.c |  6 +++---
 drivers/gpu/drm/radeon/rs600.c | 14 +++++++-------
 drivers/gpu/drm/radeon/rs690.c |  2 +-
 drivers/gpu/drm/radeon/rv515.c |  4 ++--
 drivers/gpu/drm/radeon/rv770.c |  2 +-
 drivers/gpu/drm/radeon/si.c    |  4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs400.c
index d4d1501e6576..d6c18fd740ec 100644
--- a/drivers/gpu/drm/radeon/rs400.c
+++ b/drivers/gpu/drm/radeon/rs400.c
@@ -379,7 +379,7 @@ DEFINE_SHOW_ATTRIBUTE(rs400_debugfs_gart_info);
 static void rs400_debugfs_pcie_gart_info_init(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("rs400_gart_info", 0444, root, rdev,
 			    &rs400_debugfs_gart_info_fops);
@@ -474,7 +474,7 @@ int rs400_resume(struct radeon_device *rdev)
 			RREG32(R_0007C0_CP_STAT));
 	}
 	/* post */
-	radeon_combios_asic_init(rdev->ddev);
+	radeon_combios_asic_init(rdev_to_drm(rdev));
 	/* Resume clock after posting */
 	r300_clock_startup(rdev);
 	/* Initialize surface registers */
@@ -552,7 +552,7 @@ int rs400_init(struct radeon_device *rdev)
 		return -EINVAL;
 
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* initialize memory controller */
 	rs400_mc_init(rdev);
 	/* Fence driver */
diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
index 5c162778899b..88c8e91ea651 100644
--- a/drivers/gpu/drm/radeon/rs600.c
+++ b/drivers/gpu/drm/radeon/rs600.c
@@ -321,7 +321,7 @@ void rs600_pm_misc(struct radeon_device *rdev)
 
 void rs600_pm_prepare(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -339,7 +339,7 @@ void rs600_pm_prepare(struct radeon_device *rdev)
 
 void rs600_pm_finish(struct radeon_device *rdev)
 {
-	struct drm_device *ddev = rdev->ddev;
+	struct drm_device *ddev = rdev_to_drm(rdev);
 	struct drm_crtc *crtc;
 	struct radeon_crtc *radeon_crtc;
 	u32 tmp;
@@ -408,7 +408,7 @@ void rs600_hpd_set_polarity(struct radeon_device *rdev,
 
 void rs600_hpd_init(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned enable = 0;
 
@@ -435,7 +435,7 @@ void rs600_hpd_init(struct radeon_device *rdev)
 
 void rs600_hpd_fini(struct radeon_device *rdev)
 {
-	struct drm_device *dev = rdev->ddev;
+	struct drm_device *dev = rdev_to_drm(rdev);
 	struct drm_connector *connector;
 	unsigned disable = 0;
 
@@ -797,7 +797,7 @@ int rs600_irq_process(struct radeon_device *rdev)
 		/* Vertical blank interrupts */
 		if (G_007EDC_LB_D1_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
 			if (rdev->irq.crtc_vblank_int[0]) {
-				drm_handle_vblank(rdev->ddev, 0);
+				drm_handle_vblank(rdev_to_drm(rdev), 0);
 				rdev->pm.vblank_sync = true;
 				wake_up(&rdev->irq.vblank_queue);
 			}
@@ -806,7 +806,7 @@ int rs600_irq_process(struct radeon_device *rdev)
 		}
 		if (G_007EDC_LB_D2_VBLANK_INTERRUPT(rdev->irq.stat_regs.r500.disp_int)) {
 			if (rdev->irq.crtc_vblank_int[1]) {
-				drm_handle_vblank(rdev->ddev, 1);
+				drm_handle_vblank(rdev_to_drm(rdev), 1);
 				rdev->pm.vblank_sync = true;
 				wake_up(&rdev->irq.vblank_queue);
 			}
@@ -1133,7 +1133,7 @@ int rs600_init(struct radeon_device *rdev)
 		return -EINVAL;
 
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* initialize memory controller */
 	rs600_mc_init(rdev);
 	r100_debugfs_rbbm_init(rdev);
diff --git a/drivers/gpu/drm/radeon/rs690.c b/drivers/gpu/drm/radeon/rs690.c
index 14fb0819b8c1..016eb4992803 100644
--- a/drivers/gpu/drm/radeon/rs690.c
+++ b/drivers/gpu/drm/radeon/rs690.c
@@ -845,7 +845,7 @@ int rs690_init(struct radeon_device *rdev)
 		return -EINVAL;
 
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* initialize memory controller */
 	rs690_mc_init(rdev);
 	rv515_debugfs(rdev);
diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index bbc6ccabf788..1b4dfb645585 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -255,7 +255,7 @@ DEFINE_SHOW_ATTRIBUTE(rv515_debugfs_ga_info);
 void rv515_debugfs(struct radeon_device *rdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
+	struct dentry *root = rdev_to_drm(rdev)->primary->debugfs_root;
 
 	debugfs_create_file("rv515_pipes_info", 0444, root, rdev,
 			    &rv515_debugfs_pipes_info_fops);
@@ -636,7 +636,7 @@ int rv515_init(struct radeon_device *rdev)
 	if (radeon_boot_test_post_card(rdev) == false)
 		return -EINVAL;
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* initialize AGP */
 	if (rdev->flags & RADEON_IS_AGP) {
 		r = radeon_agp_init(rdev);
diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
index 9ce12fa3c356..7d4b0bf59109 100644
--- a/drivers/gpu/drm/radeon/rv770.c
+++ b/drivers/gpu/drm/radeon/rv770.c
@@ -1935,7 +1935,7 @@ int rv770_init(struct radeon_device *rdev)
 	/* Initialize surface registers */
 	radeon_surface_init(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 	/* Fence driver */
 	radeon_fence_driver_init(rdev);
 	/* initialize AGP */
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 15759c8ca5b7..6c95575ce109 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -6277,7 +6277,7 @@ int si_irq_process(struct radeon_device *rdev)
 				event_name = "vblank";
 
 				if (rdev->irq.crtc_vblank_int[crtc_idx]) {
-					drm_handle_vblank(rdev->ddev, crtc_idx);
+					drm_handle_vblank(rdev_to_drm(rdev), crtc_idx);
 					rdev->pm.vblank_sync = true;
 					wake_up(&rdev->irq.vblank_queue);
 				}
@@ -6839,7 +6839,7 @@ int si_init(struct radeon_device *rdev)
 	/* Initialize surface registers */
 	radeon_surface_init(rdev);
 	/* Initialize clocks */
-	radeon_get_clock_info(rdev->ddev);
+	radeon_get_clock_info(rdev_to_drm(rdev));
 
 	/* Fence driver */
 	radeon_fence_driver_init(rdev);
-- 
2.45.2

