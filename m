Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1821C20782
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8154510E9B2;
	Thu, 30 Oct 2025 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="k0vPb7Fq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA78910E9A5;
 Thu, 30 Oct 2025 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833149;
 bh=kMASzq6bbUklUWNCI0vD0XgoK5zDzELpags5F+Ve9Lw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k0vPb7Fq8WUxfO1n1KzcUKvOV28rxia9G06oAad78KHVAt2UuJaFm964xofgW6Yhy
 K14NNZPCLvRS26kYjBPLQBHwFF5DWNV3HGU6keK40/2A1X2Z8ZxW6jZ3ddAF8/0+VQ
 PlVmAI+QNCn37cqP3j2CFJvSlhLZAgX4dQXWF9ZSKiBLDkl/kAp/3rdpA1ocvyB6lk
 Z4zCQtNB6yxFEq6NCgqA5B66T+8aOjCw65tMhduNaBAF5u/PhGlYouDN7Du9e4+kW2
 6iDyCyg6g2K4udPHN5EQZF7SH/ch4s4cMVE69OtYVjpGMlg/qc+AWmT1vRlZK8WxMt
 X5Em69id9/u1g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4137217E35CF;
 Thu, 30 Oct 2025 15:05:48 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v5 12/16] drm/panfrost: Expose the selected coherency protocol
 to the UMD
Date: Thu, 30 Oct 2025 15:05:21 +0100
Message-ID: <20251030140525.366636-13-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030140525.366636-1-boris.brezillon@collabora.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
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

Will be needed if we want to skip CPU cache maintenance operations when
the GPU can snoop CPU caches.

v2:
- New commit

v3:
- Fix the coherency values (enum instead of bitmask)

v4:
- Fix init/test on coherency_features

v5:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 26 +++++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_regs.h   | 10 +++++++--
 include/uapi/drm/panfrost_drm.h            |  7 ++++++
 5 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index e61c4329fd07..0f3992412205 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -79,6 +79,7 @@ struct panfrost_features {
 	u32 thread_max_workgroup_sz;
 	u32 thread_max_barrier_sz;
 	u32 coherency_features;
+	u32 selected_coherency;
 	u32 afbc_features;
 	u32 texture_features[4];
 	u32 js_features[16];
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index e3cdc0c95a56..6c08a4907eea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -94,6 +94,7 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
 		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
 		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
 		PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
+		PANFROST_FEATURE(SELECTED_COHERENCY, selected_coherency);
 
 	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
 		ret = panfrost_ioctl_query_timestamp(pfdev, &param->value);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 8d049a07d393..59e3f25b2dc2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -157,8 +157,8 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 	    pfdev->features.revision >= 0x2000)
 		quirks |= JM_MAX_JOB_THROTTLE_LIMIT << JM_JOB_THROTTLE_LIMIT_SHIFT;
 	else if (panfrost_model_eq(pfdev, 0x6000) &&
-		 pfdev->features.coherency_features == COHERENCY_ACE)
-		quirks |= (COHERENCY_ACE_LITE | COHERENCY_ACE) <<
+		 pfdev->features.coherency_features == BIT(COHERENCY_ACE))
+		quirks |= (BIT(COHERENCY_ACE_LITE) | BIT(COHERENCY_ACE)) <<
 			   JM_FORCE_COHERENCY_FEATURES_SHIFT;
 
 	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_IDVS_GROUP_SIZE))
@@ -261,7 +261,27 @@ static int panfrost_gpu_init_features(struct panfrost_device *pfdev)
 	pfdev->features.max_threads = gpu_read(pfdev, GPU_THREAD_MAX_THREADS);
 	pfdev->features.thread_max_workgroup_sz = gpu_read(pfdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
 	pfdev->features.thread_max_barrier_sz = gpu_read(pfdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
+
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_COHERENCY_REG))
+		pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
+	else
+		pfdev->features.coherency_features = BIT(COHERENCY_ACE_LITE);
+
+	BUILD_BUG_ON(COHERENCY_ACE_LITE != DRM_PANFROST_GPU_COHERENCY_ACE_LITE);
+	BUILD_BUG_ON(COHERENCY_ACE != DRM_PANFROST_GPU_COHERENCY_ACE);
+	BUILD_BUG_ON(COHERENCY_NONE != DRM_PANFROST_GPU_COHERENCY_NONE);
+
+	if (!pfdev->coherent) {
+		pfdev->features.selected_coherency = COHERENCY_NONE;
+	} else if (pfdev->features.coherency_features & BIT(COHERENCY_ACE)) {
+		pfdev->features.selected_coherency = COHERENCY_ACE;
+	} else if (pfdev->features.coherency_features & BIT(COHERENCY_ACE_LITE)) {
+		pfdev->features.selected_coherency = COHERENCY_ACE_LITE;
+	} else {
+		drm_WARN(&pfdev->base, true, "No known coherency protocol supported");
+		pfdev->features.selected_coherency = COHERENCY_NONE;
+	}
+
 	pfdev->features.afbc_features = gpu_read(pfdev, GPU_AFBC_FEATURES);
 	for (i = 0; i < 4; i++)
 		pfdev->features.texture_features[i] = gpu_read(pfdev, GPU_TEXTURE_FEATURES(i));
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 2b8f1617b836..ee15f6bf6e6f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -102,9 +102,15 @@
 #define GPU_L2_PRESENT_LO		0x120	/* (RO) Level 2 cache present bitmap, low word */
 #define GPU_L2_PRESENT_HI		0x124	/* (RO) Level 2 cache present bitmap, high word */
 
+/* GPU_COHERENCY_FEATURES is a bitmask of BIT(COHERENCY_xxx) values encoding the
+ * set of supported coherency protocols. GPU_COHERENCY_ENABLE is passed a
+ * COHERENCY_xxx value.
+ */
 #define GPU_COHERENCY_FEATURES		0x300	/* (RO) Coherency features present */
-#define   COHERENCY_ACE_LITE		BIT(0)
-#define   COHERENCY_ACE			BIT(1)
+#define GPU_COHERENCY_ENABLE		0x304	/* (RW) Coherency protocol selection */
+#define   COHERENCY_ACE_LITE		0
+#define   COHERENCY_ACE			1
+#define   COHERENCY_NONE		31
 
 #define GPU_STACK_PRESENT_LO		0xE00   /* (RO) Core stack present bitmap, low word */
 #define GPU_STACK_PRESENT_HI		0xE04   /* (RO) Core stack present bitmap, high word */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index e8b47c9f6976..9bd8fa401400 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -188,6 +188,13 @@ enum drm_panfrost_param {
 	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
 	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
 	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
+	DRM_PANFROST_PARAM_SELECTED_COHERENCY,
+};
+
+enum drm_panfrost_gpu_coherency {
+	DRM_PANFROST_GPU_COHERENCY_ACE_LITE = 0,
+	DRM_PANFROST_GPU_COHERENCY_ACE = 1,
+	DRM_PANFROST_GPU_COHERENCY_NONE = 31,
 };
 
 struct drm_panfrost_get_param {
-- 
2.51.0

