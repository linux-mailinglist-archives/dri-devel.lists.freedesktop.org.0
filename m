Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35FBCC7D4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 12:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB110E323;
	Fri, 10 Oct 2025 10:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="l9div1yS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4605310E292
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760091122;
 bh=AZG6ahzLRgBWFKPX84UMe6Aqq69+LlNodOgPuV36LdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l9div1ySyIkpu3b0qKk9tzyWf/cw7GYwvjYCJAU2+RNNATuSxsrswBZT1Mp6XyjK2
 5lGZ0n5ypuoaNkZpcPugcD72Aua9l8KUESN7wjTmbbjIw3iM5VyFOmUeFeOwzNQDUl
 hbuUGZX7vQG9643HXpOr6OefyUL0c0/rAc1H37RzPBE7HI/B6JN5o+EHYcdUiXg2QQ
 C+KSh6kqQPGbF4sS++6zJwmY1wSxF2Vu+bWll+uYstV2MM1xKwaSfAiBfvzTWClrRA
 uwzpMq1rUCPhqjCYY3rYkpgbmI05qY9jzrHYCKjNKYOpadJVCdA96fFolGmjUkwWzD
 0gUcfkJsHq3fg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7467C17E13F9;
 Fri, 10 Oct 2025 12:12:02 +0200 (CEST)
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
Subject: [PATCH v2 09/13] drm/panfrost: Expose the selected coherency protocol
 to the UMD
Date: Fri, 10 Oct 2025 12:11:42 +0200
Message-ID: <20251010101147.3290604-10-boris.brezillon@collabora.com>
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

Will be needed if we want to skip CPU cache maintenance operations when
the GPU can snoop CPU caches.

v2:
- New commit

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 18 +++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  2 ++
 include/uapi/drm/panfrost_drm.h            |  7 +++++++
 5 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 1e73efad02a8..bd38b7ae169e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -75,6 +75,7 @@ struct panfrost_features {
 	u32 thread_max_workgroup_sz;
 	u32 thread_max_barrier_sz;
 	u32 coherency_features;
+	u32 selected_coherency;
 	u32 afbc_features;
 	u32 texture_features[4];
 	u32 js_features[16];
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 607a5b8448d0..3ffcd08f7745 100644
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
index 174e190ba40f..fed323e6a307 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -260,7 +260,23 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 	pfdev->features.max_threads = gpu_read(pfdev, GPU_THREAD_MAX_THREADS);
 	pfdev->features.thread_max_workgroup_sz = gpu_read(pfdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
 	pfdev->features.thread_max_barrier_sz = gpu_read(pfdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
+
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_COHERENCY_REG))
+		pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
+	else
+		pfdev->features.coherency_features = COHERENCY_ACE_LITE;
+
+	if (!pfdev->coherent) {
+		pfdev->features.selected_coherency = COHERENCY_NONE;
+	} else if (pfdev->features.coherency_features & COHERENCY_ACE) {
+		pfdev->features.selected_coherency = COHERENCY_ACE;
+	} else if (pfdev->features.coherency_features & COHERENCY_ACE_LITE) {
+		pfdev->features.selected_coherency = COHERENCY_ACE_LITE;
+	} else {
+		drm_WARN(pfdev->ddev, true, "No known coherency protocol supported");
+		pfdev->features.selected_coherency = COHERENCY_NONE;
+	}
+
 	pfdev->features.afbc_features = gpu_read(pfdev, GPU_AFBC_FEATURES);
 	for (i = 0; i < 4; i++)
 		pfdev->features.texture_features[i] = gpu_read(pfdev, GPU_TEXTURE_FEATURES(i));
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 2b8f1617b836..775ad88f7a86 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -103,8 +103,10 @@
 #define GPU_L2_PRESENT_HI		0x124	/* (RO) Level 2 cache present bitmap, high word */
 
 #define GPU_COHERENCY_FEATURES		0x300	/* (RO) Coherency features present */
+#define GPU_COHERENCY_ENABLE		0x304	/* (RW) Coherency protocol selection */
 #define   COHERENCY_ACE_LITE		BIT(0)
 #define   COHERENCY_ACE			BIT(1)
+#define   COHERENCY_NONE		31
 
 #define GPU_STACK_PRESENT_LO		0xE00   /* (RO) Core stack present bitmap, low word */
 #define GPU_STACK_PRESENT_HI		0xE04   /* (RO) Core stack present bitmap, high word */
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index e8b47c9f6976..d3f6c005463c 100644
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
+	DRM_PANFROST_GPU_COHERENCY_ACE_LITE = (1 << 0),
+	DRM_PANFROST_GPU_COHERENCY_ACE = (1 << 1),
+	DRM_PANFROST_GPU_COHERENCY_NONE = 31,
 };
 
 struct drm_panfrost_get_param {
-- 
2.51.0

