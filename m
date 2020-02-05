Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3615256D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7396F471;
	Wed,  5 Feb 2020 03:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3388D6F471;
 Wed,  5 Feb 2020 03:49:22 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id m13so368461pjb.2;
 Tue, 04 Feb 2020 19:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbEYu8dpoDwFHWVT9bHRG8zXCZE9xHAmgc6+mU485r0=;
 b=l7tC4WfS3jZlZsQswfLNcm8HhvJ3sRmOmHtKbm3uQ5s5/TK0YDOPP7JefJ0TBwmriw
 71mcmO6Vdgh39/2D4pfJltaXCILG9BbmegJ+Wve6MGE6ahfZ7pkzDFlw3/1F9leVrPs3
 WUkX1hKeiCLXp1uYwAzfixEmO1Q60qxWnmO9AmveGCqmwqmifCNsXuY+fKLmrxE+jE5v
 JEYqAALv/wRYcelCElGe+AGSH+7DeTq6kSvpqWVGDuGuLGnOkZ1MkDzvSS94PiP1LYzI
 1nG3YcehwnrZSBqkMDSGTX5Xpy9Jv0TM+6S2mHFRYUK+9enzjoEGJONiSXMg288Rhwyw
 xs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbEYu8dpoDwFHWVT9bHRG8zXCZE9xHAmgc6+mU485r0=;
 b=lQH2m0qTMJ3bS7rh8oPl0iB5Vpun82ERuGVviBeRUDXbzQxb/PZTYO+Urcbn5xL1Tl
 lVRUAk4ORbDyG9LhHu33GqRX1lPmJy9o/EyCtdCr4BBk9wgl9i9NEch5uI0iL/ePbQ/Z
 Ccf5XyjuNHUURmq2LWShvOKWQOwDRRbSNDuK2wG+hUBeuIuG0FGM9QSDf+NP3M8lmykT
 MJFypVam19DbyAfEzsxGSnvQM5k7elZRnYSno93+LAZN2La7KPndlc61BAGLkEo6sdVG
 nzKxTRVLCf4e8KHU4VTQgdAogIHf+PFsd+pPq7RiF3SF9jsux3+xbRd2EoISvezURVkN
 JRQA==
X-Gm-Message-State: APjAAAWa6MtdAumV/oDz9hPqZspIXLVZ9qLcuXbEDJV1Vv2U3GKVNunL
 lFS/07jQyK/bEk/aHuG2K5HlcaDu
X-Google-Smtp-Source: APXvYqxTer2aYGDRtOxZTWP627iOIfs22N8VW5pRJvS7TXx4qClG8BZjcKT6oIA5eGEOcDLgp9KT0Q==
X-Received: by 2002:a17:90a:178f:: with SMTP id
 q15mr3250185pja.132.1580874561340; 
 Tue, 04 Feb 2020 19:49:21 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:20 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/14] drm/amdgpu/ring: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:51 -0500
Message-Id: <20200205034852.4157-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200205034852.4157-1-alexander.deucher@amd.com>
References: <20200205034852.4157-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to remove the load and unload drm callbacks,
we need to reorder the init sequence to move all the drm
debugfs file handling.  Do this for rings.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 23 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c    | 15 +++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h    |  4 ++++
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 82d30bae2ba0..a7e6b5de2c62 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1218,7 +1218,7 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
 
 int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
-	int r;
+	int r, i;
 
 	adev->debugfs_preempt =
 		debugfs_create_file("amdgpu_preempt_ib", 0600,
@@ -1266,12 +1266,33 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 			DRM_ERROR("amdgpu: failed initialize dtn debugfs support.\n");
 	}
 
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring)
+			continue;
+
+		if (amdgpu_debugfs_ring_init(adev, ring)) {
+			DRM_ERROR("Failed to register debugfs file for rings !\n");
+		}
+	}
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
 
 void amdgpu_debugfs_fini(struct amdgpu_device *adev)
 {
+	int i;
+
+	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
+		struct amdgpu_ring *ring = adev->rings[i];
+
+		if (!ring)
+			continue;
+
+		amdgpu_debugfs_ring_fini(ring);
+	}
 	amdgpu_ttm_debugfs_fini(adev);
 	debugfs_remove(adev->debugfs_preempt);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index e5c83e164d82..539be138260e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -48,9 +48,6 @@
  * wptr.  The GPU then starts fetching commands and executes
  * them until the pointers are equal again.
  */
-static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
-				    struct amdgpu_ring *ring);
-static void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring);
 
 /**
  * amdgpu_ring_alloc - allocate space on the ring buffer
@@ -334,10 +331,6 @@ int amdgpu_ring_init(struct amdgpu_device *adev, struct amdgpu_ring *ring,
 	for (i = 0; i < DRM_SCHED_PRIORITY_MAX; ++i)
 		atomic_set(&ring->num_jobs[i], 0);
 
-	if (amdgpu_debugfs_ring_init(adev, ring)) {
-		DRM_ERROR("Failed to register debugfs file for rings !\n");
-	}
-
 	return 0;
 }
 
@@ -367,8 +360,6 @@ void amdgpu_ring_fini(struct amdgpu_ring *ring)
 			      &ring->gpu_addr,
 			      (void **)&ring->ring);
 
-	amdgpu_debugfs_ring_fini(ring);
-
 	dma_fence_put(ring->vmid_wait);
 	ring->vmid_wait = NULL;
 	ring->me = 0;
@@ -485,8 +476,8 @@ static const struct file_operations amdgpu_debugfs_ring_fops = {
 
 #endif
 
-static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
-				    struct amdgpu_ring *ring)
+int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
+			     struct amdgpu_ring *ring)
 {
 #if defined(CONFIG_DEBUG_FS)
 	struct drm_minor *minor = adev->ddev->primary;
@@ -507,7 +498,7 @@ static int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 	return 0;
 }
 
-static void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring)
+void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring)
 {
 #if defined(CONFIG_DEBUG_FS)
 	debugfs_remove(ring->ent);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 5134d0dd6dc2..0d098dafd23c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -329,4 +329,8 @@ static inline void amdgpu_ring_write_multiple(struct amdgpu_ring *ring,
 
 int amdgpu_ring_test_helper(struct amdgpu_ring *ring);
 
+int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
+			     struct amdgpu_ring *ring);
+void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring);
+
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
