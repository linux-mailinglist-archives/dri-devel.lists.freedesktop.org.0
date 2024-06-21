Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7276F91277D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 16:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989E10F1B4;
	Fri, 21 Jun 2024 14:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S9gyAZOp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BD010F1B4;
 Fri, 21 Jun 2024 14:21:16 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-79550284502so115052285a.2; 
 Fri, 21 Jun 2024 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718979675; x=1719584475; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MjXMle0rO8XpaOjdtO6Igck9jzTHjsyq0tjq0iKq+6k=;
 b=S9gyAZOpUL837aIGJNo/uUQphlrPuWpM+YMbFMniFA2zjB5m5Ny5hCPX8YkzdF2JaM
 WR2fPeJ2D9m+dQAMNR4px+J8ibvKsjn7tc2j7cO56TlhW8e/P/eqs3LBuDcIWDZ94nCB
 UFXlQu/K+Hq4XYZbsDhA+LKW9ilFIPwjlrsrk+cchkKVgFQ86fz7w7SnshL4NzJLtjKH
 zUvw6rZ79cWaT/pYvscPHnIM3mn/HS7YYHLnqkdjMaJq+9oTptwnbDPs3l8vSP9/T5J3
 wo+Ct66O1gDQfKrt35oPwj7uHU0TZDaVkrnZSUW4bJIKo0eCe3FAaxutX+SZo/fTX+4X
 Hc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718979675; x=1719584475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MjXMle0rO8XpaOjdtO6Igck9jzTHjsyq0tjq0iKq+6k=;
 b=u+sBsZvufe2Sxrdh/tmxhKu1ChTUqmq1EBnved7GIwHyYZT+nq+ssXKWVX13VnVVML
 Fh92wkYjz+9c8XvmZUKMF3DIxwLTz6nETGjxL3gDpfW0vtyngpCmSp5Ko5flZWJX6L5R
 Y3NhUkokU0GieXNmwoMcseHr09WnlxNPfP/5Q+53gPtOhEJEbtj1ROYD/a6oYTtHi/9O
 GUEeXNR8jmBjjyY6nlCrKCmO43qiFigOtrMJFBw8Vllgxm5EfoT2O2ZKNbhAuR8MbxB4
 JHEk1PTGrHvVFS5jfMwu6MJK1tq2n+RBZC2c0knuJNk4Ot96+MJXoYKWxKyI36RbFMlM
 zwIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJEfestT1+DN2Q1bEjMI0pbHZ2z4Hry15korMPX7U46DYSs1eAlNOURspLtpIDHYPkSalH0gg84GWEFzSwfFRdddgC84rzqp2YcNSQ0FbGm2tUvNERp+xyuoy04qTvcEr1rEOW2vmITq9JnV/I8w==
X-Gm-Message-State: AOJu0YwyKkaM4PTOLLpAqgz1+vIGVUiCAxIRvPqoswnRrTE/ylxkEQdu
 6Midwa90JxH6dHXXfFBEgJ88zPsTpjIRjFEyy0nFncwcMNtEq+TI
X-Google-Smtp-Source: AGHT+IHTsm5qtIMJT3X14t/FfwytBP6BI2xShJWE3XRYqnh+pQytGVZUlvy0RxH7ZCq8cqLXQDvjJw==
X-Received: by 2002:ad4:5cc2:0:b0:6b2:a333:2abf with SMTP id
 6a1803df08f44-6b50d8e18d8mr83165976d6.51.1718979675153; 
 Fri, 21 Jun 2024 07:21:15 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef312b3sm9164736d6.88.2024.06.21.07.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:21:14 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 7/7] drm/radeon: rdev->ddev to rdev_to_drm(rdev) 6
Date: Fri, 21 Jun 2024 10:20:49 -0400
Message-ID: <20240621142052.20152-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
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

Please see Patch v2 1/7 for details.

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

