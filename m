Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F04BCC7B6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2C110E291;
	Fri, 10 Oct 2025 10:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LpeLmTdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510FE10E287
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760091119;
 bh=ipmNDeuBVugSzlr4I/dvx7S0swvAjSia1UauR57ZsTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LpeLmTdM8auyDNVvFJTLaCWq1R6HM19xUdsP1QZ4QBcGwPEnenZbApcMPTtpSsU2a
 r7bKk/z2hoyq+p5ksHIhHxAmdELdciLRuILTLgQagGBrrP5N332YtIwBmKuWCUHcHy
 uutHHd7VSHL8gKOI3bDMko9pQ/l7lVsat1v3bMvTt7S3MQd9qFbouBt4heP2LLlhxR
 ArcHn/HkJsq/GJzCnUoLr8V77USQuFHnZcka46hC7+FLtN0slnd76ENH5N8f6/6Vko
 W8pWzwPpOhX7edbD2ri3JuW60lSD7JIs0B6k7AzymT1GqBaBcKqio6OtfqKL7WCElg
 CJxUksGV9Hdng==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 81A6317E136C;
 Fri, 10 Oct 2025 12:11:59 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: [PATCH v2 04/13] drm/panthor: Expose the selected coherency protocol
 to the UMD
Date: Fri, 10 Oct 2025 12:11:37 +0200
Message-ID: <20251010101147.3290604-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010101147.3290604-1-boris.brezillon@collabora.com>
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
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

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  6 +++-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  2 +-
 include/uapi/drm/panthor_drm.h           | 39 ++++++++++++++++++++++--
 3 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index c7033d82cef5..afe24a03a71c 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -25,6 +25,8 @@
 
 static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 {
+	/* Start with no coherency, and update it if the device is flagged coherent. */
+	ptdev->gpu_info.selected_coherency = GPU_COHERENCY_NONE;
 	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
 
 	if (!ptdev->coherent)
@@ -34,8 +36,10 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	 * ACE protocol has never been supported for command stream frontend GPUs.
 	 */
 	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
-		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+		      GPU_COHERENCY_PROT_BIT(ACE_LITE))) {
+		ptdev->gpu_info.selected_coherency = GPU_COHERENCY_PROT_BIT(ACE_LITE);
 		return 0;
+	}
 
 	drm_err(&ptdev->base, "Coherency not supported by the device");
 	return -ENOTSUPP;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9d98720ce03f..a95c0b94ef58 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -49,7 +49,7 @@ struct panthor_gpu {
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
 	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+		  ptdev->gpu_info.selected_coherency);
 }
 
 static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 467d365ed7ba..b9e483ff5e21 100644
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
+	DRM_PANTHOR_GPU_COHERENCY_ACE_LITE = 1 << 0,
+
+	/**
+	 * @DRM_PANTHOR_GPU_COHERENCY_ACE_LITE: ACE coherency.
+	 */
+	DRM_PANTHOR_GPU_COHERENCY_ACE = 1 << 1,
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

