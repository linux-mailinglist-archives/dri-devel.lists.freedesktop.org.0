Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0369B4084D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 17:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA08410E789;
	Tue,  2 Sep 2025 15:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kbs+vWkT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756EB10E789
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 15:00:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-77269d19280so1270668b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756825253; x=1757430053; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tn6ROBb8evHy9I8BKmFlbvpCLLUKX+yfgDwyfCgLRYg=;
 b=kbs+vWkTqOoR9XKRWvytibbex9n9ECdTBIl44xsOG28C4YVDLxytU3DKsGsXNOxcBo
 AK4KjTdG1SbX7qdxe2gLcC+NxN4uW1KBl88yqP0m8RHvE3HHwzjc5ZwL0HKJ6HOwG06+
 /krg/Ug1w9imzsxiKqfUkCBy3CcfJrJIdmFwi6shNMEb6khuS3FnWv2iUa7X+VPrrgV1
 YkIsiDyCIObU5nHT5ETx6BwBQ5y1J1g6hNE34FDk5OW+ZUZiP5dPp6wFbkMY09DYms7b
 TXfcXrqvb5NKDHr8e8uU0Hj3xXs+36Cywqyv2Yr10rxYbVkLeH12/ZG688VSv3qvDZPE
 6yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756825253; x=1757430053;
 h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tn6ROBb8evHy9I8BKmFlbvpCLLUKX+yfgDwyfCgLRYg=;
 b=lw2TrkvPEgFqbRrYkUTRpRC/UzY9LQb800HwvnQJ3oquHNBjanTRF9qlUmGh0Ia6Yc
 txrimq0GKZFTEGFNddiSajff8getXYablw68zszYCInrMbKWCqyWyPGGCwvksgeOD1Mh
 4ibFrlTp4htquTNaerHEarAO/1PCMgIY/4Ap14stq2uliYZfvNIvlOwxIZQzKHJPie3m
 ZyuOCYsjngcGhaNHfTWx17UBCwsYyn1UZyLAJlG1s1QMFhEJD0lAnUoNOl5p75jHV5XA
 37/0KARzu+pGsNhO1w8OA7jPf2gEviiRn98Muf9m9meBf8HizgE2Bmn+Yzho754PGREb
 IX0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMZILLBVn3Gb/v/Tek+Jo9SCtePtzq8XsA++9Lg6/gAstFxCMJscMGqcBaa4lyjxaZ3UUsRQqvuP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymnSVy9SXvSaLVUsmRi6t0Of80HxcUDiZXCN2RTutf3vLLUFX8
 AbMs1szejer2CbtsHFAxC64aiFtHvInLUh7sirD9525DC0NsqtLC/2NK
X-Gm-Gg: ASbGncupGgV9o564lN65iVaU4Euhisrt87/t4bj/J5oaMOcD7GN87kGrz2hVX6pIO6x
 aDJLOAViJ+RFnJpdzWLvEVnuy4PcmoGAVroVl3ivrCjcrB7OA8aXDD9mMSNdsW5c+kwVeWcftmx
 BX9arBHGoi/y8by+UIQBnSdCidoKDhqUH1FOAvf8eKP1fRBrg16Lm2GiYHrJ8YIlpH4n3Vn75MG
 Fcldi0hujThYf2mQQpMmwusMAutvno2eWMLWG7UQMUjvi0teRQ1qLjv099a5tw1/gcF3mE0bO1X
 8dB+4SSRcf3zpRgxVdfz4FHSkKBtSQbmgdKY97DFgqe7PsKezBUNLVRcIa/JaCzPemXUtVTyIwW
 c1XB+hqYxj/9fEOvudg==
X-Google-Smtp-Source: AGHT+IHHxrc0XwRU+HRTrGA57CaD51yo2yh2p0+QXYYFuVfMz4hoSOXX4R8xNZoi2aFYtFEvwTwhMQ==
X-Received: by 2002:a05:6a20:7fa0:b0:243:9845:4137 with SMTP id
 adf61e73a8af0-243d6e5b2edmr17328160637.26.1756825252323; 
 Tue, 02 Sep 2025 08:00:52 -0700 (PDT)
Received: from Terra ([2001:df0:b240:6cbd:e842:2f6a:96d:9188])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772608b1b5asm5332937b3a.46.2025.09.02.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:00:51 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:30:45 +0530
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: michal.wajdeczko@intel.com, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, krathul3152@gmail.com,
 linux-kernel@vger.kernel.org, simona@ffwll.ch, mripard@kernel.org
Subject: [PATCH v4 RESEND] drm: Replace the deprecated DRM_* logging macros
 in gem helper files
Message-ID: <aLcGnf_wrY5QuZZC@Terra>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Reply-To: 20250816152604.14667-1-krathul3152@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the DRM_* logging macros used in gem helper files with the
appropriate ones specified in /include/drm/drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
Changes in v4:
    - Some codestyle corrections.
    - Remove OOM error logging in drm_gem_init().

Changes in v3:
    - Revert all changes to drm_gem_objects_lookup().
    - Use drm_device from minor.

Changes in v2:
    - Change drm_gem_objects_lookup() to take a drm_device* argument.
    - Make appropriate changes to all calls of drm_gem_objects_lookup().
---
 drivers/gpu/drm/drm_gem.c            | 13 +++++++------
 drivers/gpu/drm/drm_gem_dma_helper.c |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..dc3d6cfa692b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,6 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -783,9 +782,10 @@ static int objects_lookup(struct drm_file *filp, u32 *handle, int count,
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out)
 {
-	int ret;
-	u32 *handles;
+	struct drm_device *dev = filp->minor->dev;
 	struct drm_gem_object **objs;
+	u32 *handles;
+	int ret;
 
 	if (!count)
 		return 0;
@@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(dev, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
@@ -853,12 +853,13 @@ EXPORT_SYMBOL(drm_gem_object_lookup);
 long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
 				    bool wait_all, unsigned long timeout)
 {
-	long ret;
+	struct drm_device *dev = filep->minor->dev;
 	struct drm_gem_object *obj;
+	long ret;
 
 	obj = drm_gem_object_lookup(filep, handle);
 	if (!obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
+		drm_dbg_core(dev, "Failed to look up GEM BO %d\n", handle);
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
 
-- 
2.51.0

