Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF0C20783
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8310E9BA;
	Thu, 30 Oct 2025 14:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bK/0jh1c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3681010E98B;
 Thu, 30 Oct 2025 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833142;
 bh=G6Jverd7TNyaRPc0r8UoWEn49n5SOIwGDLD7r/nUJE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bK/0jh1cXPPUEMbFavCqQFPZR52lxCnX4MWUmvLwnQ6yJa8Nu7mFt3BJE9SI34RY8
 q4MeCtWtLEamg+YIQP4ObVpuFBNMVIGevRAfo+J4vUKB02BFjqZEoq2BXVp3QTcA9R
 iac6nWPEfBTq6XuOh/MHqCKeY5/YYW4Dq+LY1W7ItcUjwHwpBFsRlprlw1IQ4IW45W
 qsVtFIyL1UJ9xXDVXuQR/sytKgISujDSjSkLcwc2BJB2p3rMFt9MzQABzoGma7ykSx
 qt2BsBFT1GrLvkTIm5nbFQrbOP+c2QjoHb/9/wYQR5oW7ldeRqmhN8B2t/Tsam2Mb4
 nle5liL7hCN1w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 06E9C17E1550;
 Thu, 30 Oct 2025 15:05:41 +0100 (CET)
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
Subject: [PATCH v5 06/16] drm/panthor: Expose the selected coherency protocol
 to the UMD
Date: Thu, 30 Oct 2025 15:05:15 +0100
Message-ID: <20251030140525.366636-7-boris.brezillon@collabora.com>
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

If we want to be able to skip CPU cache maintenance operations on
CPU-cached mappings, the UMD needs to know the kind of coherency
in place. Add a field to drm_panthor_gpu_info to do that. We can re-use
a padding field for that since this object is write-only from the
KMD perspective, and the UMD should just ignore it.

v2:
- New commit

v3:
- Make coherency protocol a real enum, not a bitmask
- Add BUILD_BUG_ON()s to make sure the values in panthor_regs.h and
  those exposed through the uAPI match

v4:
- Add Steve's R-b

v5:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 10 +++++-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
 include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index c7033d82cef5..492585014e9f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -25,6 +25,12 @@
 
 static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 {
+	BUILD_BUG_ON(GPU_COHERENCY_NONE != DRM_PANTHOR_GPU_COHERENCY_NONE);
+	BUILD_BUG_ON(GPU_COHERENCY_ACE_LITE != DRM_PANTHOR_GPU_COHERENCY_ACE_LITE);
+	BUILD_BUG_ON(GPU_COHERENCY_ACE != DRM_PANTHOR_GPU_COHERENCY_ACE);
+
+	/* Start with no coherency, and update it if the device is flagged coherent. */
+	ptdev->gpu_info.selected_coherency = GPU_COHERENCY_NONE;
 	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
 
 	if (!ptdev->coherent)
@@ -34,8 +40,10 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	 * ACE protocol has never been supported for command stream frontend GPUs.
 	 */
 	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
-		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+		      GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
+		ptdev->gpu_info.selected_coherency = GPU_COHERENCY_ACE_LITE;
 		return 0;
+	}
 
 	drm_err(&ptdev->base, "Coherency not supported by the device");
 	return -ENOTSUPP;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 7f9a28e90409..a95c0b94ef58 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -49,7 +49,7 @@ struct panthor_gpu {
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
 	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		  ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_NONE);
+		  ptdev->gpu_info.selected_coherency);
 }
 
 static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 467d365ed7ba..f0f637e0631d 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -245,6 +245,26 @@ enum drm_panthor_dev_query_type {
 	DRM_PANTHOR_DEV_QUERY_GROUP_PRIORITIES_INFO,
 };
 
+/**
+ * enum drm_panthor_gpu_coherency: Type of GPU coherency
+ */
+enum drm_panthor_gpu_coherency {
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE Lite coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 0,
+
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_ACE = 1,
+
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_NONE: No coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_NONE = 31,
+};
+
 /**
  * struct drm_panthor_gpu_info - GPU information
  *
@@ -301,7 +321,16 @@ struct drm_panthor_gpu_info {
 	 */
 	__u32 thread_max_barrier_size;
 
-	/** @coherency_features: Coherency features. */
+	/**
+	 * @coherency_features: Coherency features.
+	 *
+	 * Combination of drm_panthor_gpu_coherency flags.
+	 *
+	 * Note that this is just what the coherency protocols supported by the
+	 * GPU, but the actual coherency in place depends on the SoC
+	 * integration and is reflected by
+	 * drm_panthor_gpu_info::selected_coherency.
+	 */
 	__u32 coherency_features;
 
 	/** @texture_features: Texture features. */
@@ -310,8 +339,12 @@ struct drm_panthor_gpu_info {
 	/** @as_present: Bitmask encoding the number of address-space exposed by the MMU. */
 	__u32 as_present;
 
-	/** @pad0: MBZ. */
-	__u32 pad0;
+	/**
+	 * @select_coherency: Coherency selected for this device.
+	 *
+	 * One of drm_panthor_gpu_coherency.
+	 */
+	__u32 selected_coherency;
 
 	/** @shader_present: Bitmask encoding the shader cores exposed by the GPU. */
 	__u64 shader_present;
-- 
2.51.0

