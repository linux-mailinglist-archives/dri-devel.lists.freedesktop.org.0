Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F667B2B17F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 21:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B72210E05D;
	Mon, 18 Aug 2025 19:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DA7WMsnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454210E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:23:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-24457f3edd4so32080185ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 12:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755544994; x=1756149794; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3oJ/UF4e9DQo9mznCUa/U85D9g9MWf2CIUxQg1XPG8=;
 b=DA7WMsnbyHAjhSWTd8WKasNvo46Oo3111JaMS3gAG6RJWWJZjltlaJIOBthoQYHALR
 VmVjY1RC7Lhy9La8orKmxyPdxc/vurMaGWrlNGR3lMqqWJv/dtTe3YbdgEn6LDkbe6MT
 y1hjjBw8eNdYQduksje6BeiQQKk1DbhYiVTl5IC18eot0AYhmUXFj8Lr3sQkR2DaaUYD
 Bg+kih5Vw8oFCll4UU9se2DjRspikRoXfjk1iPV0KDVXg+eAwC94L9VslUehPFqzsIVB
 8x4IYVVQXAL/e5RYdewbv76PPIRJb99/w+0jtm7JTXJLCxbQE+n+pEHZg/YH0+C0sM3c
 DFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755544994; x=1756149794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v3oJ/UF4e9DQo9mznCUa/U85D9g9MWf2CIUxQg1XPG8=;
 b=xL5X1WViFdcayF/ofeKpjbo4yzxQwMGUqmsW8P9GRR6Kh1AEHcy1GiFWL9xXB0SkOK
 X1OM4lh5+mnwyt3nMTmI14wHNgziTVAlyEV+SDjjBE00CjQc5ElnkYv5DnoEztKlRLtS
 b77fGU4CtYSrJt7Rbspxj3cqX1IcHz6bxaIm2QeXHQEPfS8o91LGepdO7AplP1IyFcK5
 cHq4EcicpeQq/NePtLBjPY04qJ/S97xse2KBJx716JzaKM007WC1xHUs4aCt1/6DenLe
 yJ6zmvWnjL1NF7YCFJRD9OphB5zcfgNqAz1jC+q6Mofoi8foOSD0ct9yqD00Mfp5De7+
 cBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx7cxm0jKD/9wZe6esi8LH+eCky66oe1r/Ww25NAaEwSPwpFs3OOZYjjp9KO1dR4VNAAq088YPTcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmmQBMfCIY5wRYS+Ak5gamoL0gE6Ap+tcfh0gQrahaW188+utb
 Q2atQ2G9U0mKKM9fz2SWKgSYcFSUZBMqsZXRWdA7pFgO7503Ju0DdYF1
X-Gm-Gg: ASbGncuiKOugey3kM3jJsqrKF0jZSqZGr+zhaXwPYrC7QB4mH0NfOuk0CGwhVjSRi8v
 yyOsAnfMa489iC31UNYsJ976OddGWiDzzfc7hPTSTtDbYO0wCH6XptkR6qWhuvefademHVC3B7P
 sCHWeRq1orRRycNxgfckCfUjRzrTw60h6lVVw3XYlTvQyt9efr/h4mL1ncbYX1XgwE6lJTDB/qz
 y4l64sC6aSNtKpjgpM77ztDmBjU08RaFNME6cAIBIUZRPN/j1gcA7fVovWPgp+zNiogHI4r/oRd
 lahI0bu5LMLydDIoJsUKSuFpKh4/DadqAWwqxt/FK869amG4/4kg9U8HBWpAgJpHbjN4VqDBmLo
 iPEK4g3aOzy7J9yX6iyUgNJeFaQc3
X-Google-Smtp-Source: AGHT+IFad2Sv0meNuq0G/aQ1adIBZ0wHYRB79nvho7DFSsLLH3V30hFfbgFPz04e3QED8jj/QbHJuw==
X-Received: by 2002:a17:903:234d:b0:240:90d:468d with SMTP id
 d9443c01a7336-2446d6eeeddmr145151015ad.9.1755544994570; 
 Mon, 18 Aug 2025 12:23:14 -0700 (PDT)
Received: from Terra ([2001:df0:b240:b5e:abe3:8cfd:3fd8:5d8e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446cae02e7sm88178905ad.39.2025.08.18.12.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 12:23:14 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, krathul3152@gmail.com,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org
Subject: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in gem
 helper files
Date: Tue, 19 Aug 2025 00:50:45 +0530
Message-ID: <20250818192247.58322-1-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
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

Replace the DRM_* logging macros used in gem helper files with the appropriate
ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/accel/rocket/rocket_job.c       |  4 ++--
 drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
 drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
 drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
 include/drm/drm_gem.h                   |  5 +++--
 7 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 5d4afd692306..db7c50c9ab90 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
 	if (ret)
 		goto out_cleanup_job;
 
-	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->in_bo_handles),
+	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->in_bo_handles),
 				     job->in_bo_handle_count, &rjob->in_bos);
 	if (ret)
 		goto out_cleanup_job;
 
 	rjob->in_bo_count = job->in_bo_handle_count;
 
-	ret = drm_gem_objects_lookup(file, u64_to_user_ptr(job->out_bo_handles),
+	ret = drm_gem_objects_lookup(dev, file, u64_to_user_ptr(job->out_bo_handles),
 				     job->out_bo_handle_count, &rjob->out_bos);
 	if (ret)
 		goto out_cleanup_job;
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..ee1e5ded6dd6 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+		drm_err(dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 
 /**
  * drm_gem_objects_lookup - look up GEM objects from an array of handles
+ * @dev: corresponding drm_device
  * @filp: DRM file private date
  * @bo_handles: user pointer to array of userspace handle
  * @count: size of handle array
@@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
  * failure. 0 is returned on success.
  *
  */
-int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
-			   int count, struct drm_gem_object ***objs_out)
+int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
+			   void __user *bo_handles, int count,
+			   struct drm_gem_object ***objs_out)
 {
 	int ret;
 	u32 *handles;
@@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(NULL, "Failed to look up GEM BO %d\n", handle);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1ea6c509a5d5..3ffd9d5a9056 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -188,7 +188,7 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
-	ret = drm_gem_objects_lookup(file_priv,
+	ret = drm_gem_objects_lookup(dev, file_priv,
 				     (void __user *)(uintptr_t)args->bo_handles,
 				     job->bo_count, &job->bos);
 	if (ret)
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5171ffe9012d..a3ac8e6a4a72 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -79,7 +79,7 @@ v3d_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	return drm_gem_objects_lookup(file_priv,
+	return drm_gem_objects_lookup(dev, file_priv,
 				      (void __user *)(uintptr_t)bo_handles,
 				      job->bo_count, &job->bo);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 255e5817618e..6ce65611231b 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -692,7 +692,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	ret = drm_gem_objects_lookup(file_priv, u64_to_user_ptr(args->bo_handles),
+	ret = drm_gem_objects_lookup(dev, file_priv, u64_to_user_ptr(args->bo_handles),
 				     exec->bo_count, &exec->bo);
 
 	if (ret)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index d3a7b43e2c63..03cb03f46524 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -544,8 +544,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
 int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
 
-int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
-			   int count, struct drm_gem_object ***objs_out);
+int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
+			   void __user *bo_handles, int count,
+			   struct drm_gem_object ***objs_out);
 struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout);
-- 
2.50.1

