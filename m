Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2820152555
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 04:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E4C6F458;
	Wed,  5 Feb 2020 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4E6F458;
 Wed,  5 Feb 2020 03:49:06 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 12so361903pjb.5;
 Tue, 04 Feb 2020 19:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+ovo0iYgzOlwPbufM9jSr3DhaQmmbwRK19EzNf16Io=;
 b=iIPqAHtDyIzxKr97V4uI6FMFq41mC55xeQg95oUT3hk4F/ufax5Ac6IFwBUQLHWb8L
 ODlD+CJ6217ZcUHtCc770y19pwfeusm37Vl0vlOfgt4RS4jQm1Yxo9FS3jyaCEMrgLhS
 5pcdonl2mo1ewfwvz0growPxsgEXqwg5A0pXoV1w3xUaQ3pFlysEJ8sFCOSXLdE7Bqra
 HxIIUcQXVwj83WcI5QpwOQyeisXhS9Tyy5qsaStUPAsAKvGAXLV6QsRChBwONYXfr2zz
 vveazpQBAG6LtdTIEaabnvPyA/w9qrP0lCmGiLX5lCUtHb3uv3a85UwNDplG9ezNvXb9
 W0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+ovo0iYgzOlwPbufM9jSr3DhaQmmbwRK19EzNf16Io=;
 b=ag/qbS7bZNbTTnftwPx0ea2gNKeeDdOJGfAmVD0owcPar6AjeHGWLHaUHFBkgMax7E
 cqRpHFIX/nE9QHx4HF96+jyiYtqceuvSaWxhsoOtECR9PpmqFpmQvsjsI4wyrceeIJWx
 lCpo+ynsA11aETgNEH3AwG7OP0g6pU+Mlf+t/Un2SW97JYRz13VtCOzKV6WLNS41sXPe
 I7jyptPDxWvRrydNJsCKnFPFVerL5xCY9nr6wkDcKoG5znfpBILQL5LXq/5Of1twqGXI
 A3nXh1e0J2AfKpojwPTdrg0dYsukg4oFrlpE1vzggPYnjBZSC5YKiv03ep85O0pXZS5n
 U5FA==
X-Gm-Message-State: APjAAAWccD7UUOyxXzZUC4SctJEbem1/avVmftxIfBqckFhqpEIK6S8z
 071Okxu4LiGr9EKBvV3ZD5y1fspq
X-Google-Smtp-Source: APXvYqyZQ2gCLzdYODYGGT0mIOdV1JaLwvaQtPphffR0Hjrdlez3T/5gq/5IVUYcVL2ci3QuaMsLTQ==
X-Received: by 2002:a17:902:b484:: with SMTP id
 y4mr32421152plr.126.1580874545723; 
 Tue, 04 Feb 2020 19:49:05 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id 200sm25320292pfz.121.2020.02.04.19.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 19:49:05 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/14] drm/amdgpu/ttm: move debugfs init into core amdgpu
 debugfs
Date: Tue,  4 Feb 2020 22:48:40 -0500
Message-Id: <20200205034852.4157-3-alexander.deucher@amd.com>
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
debugfs file handling.  Do this for ttm.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 14 ++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  3 +++
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 58b5e1b4f814..f49604c0d0b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1216,6 +1216,8 @@ DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
 
 int amdgpu_debugfs_init(struct amdgpu_device *adev)
 {
+	int r;
+
 	adev->debugfs_preempt =
 		debugfs_create_file("amdgpu_preempt_ib", 0600,
 				    adev->ddev->primary->debugfs_root, adev,
@@ -1225,12 +1227,20 @@ int amdgpu_debugfs_init(struct amdgpu_device *adev)
 		return -EIO;
 	}
 
+	/* Register debugfs entries for amdgpu_ttm */
+	r = amdgpu_ttm_debugfs_init(adev);
+	if (r) {
+		DRM_ERROR("Failed to init debugfs\n");
+		return r;
+	}
+
 	return amdgpu_debugfs_add_files(adev, amdgpu_debugfs_list,
 					ARRAY_SIZE(amdgpu_debugfs_list));
 }
 
 void amdgpu_debugfs_fini(struct amdgpu_device *adev)
 {
+	amdgpu_ttm_debugfs_fini(adev);
 	debugfs_remove(adev->debugfs_preempt);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 56f743698868..0c35978626d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -66,9 +66,6 @@ static int amdgpu_map_buffer(struct ttm_buffer_object *bo,
 			     struct amdgpu_ring *ring,
 			     uint64_t *addr);
 
-static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
-static void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev);
-
 static int amdgpu_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flags)
 {
 	return 0;
@@ -1911,12 +1908,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 		return r;
 	}
 
-	/* Register debugfs entries for amdgpu_ttm */
-	r = amdgpu_ttm_debugfs_init(adev);
-	if (r) {
-		DRM_ERROR("Failed to init debugfs\n");
-		return r;
-	}
 	return 0;
 }
 
@@ -1938,7 +1929,6 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	if (!adev->mman.initialized)
 		return;
 
-	amdgpu_ttm_debugfs_fini(adev);
 	amdgpu_ttm_training_reserve_vram_fini(adev);
 	/* return the IP Discovery TMR memory back to VRAM */
 	amdgpu_bo_free_kernel(&adev->discovery_memory, NULL, NULL);
@@ -2545,7 +2535,7 @@ static const struct {
 
 #endif
 
-static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
+int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	unsigned count;
@@ -2581,7 +2571,7 @@ static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev)
 #endif
 }
 
-static void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev)
+void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev)
 {
 #if defined(CONFIG_DEBUG_FS)
 	unsigned i;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f1ebd424510c..2c4ad5b589d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -133,4 +133,7 @@ uint64_t amdgpu_ttm_tt_pde_flags(struct ttm_tt *ttm, struct ttm_mem_reg *mem);
 uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
 				 struct ttm_mem_reg *mem);
 
+int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
+void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev);
+
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
