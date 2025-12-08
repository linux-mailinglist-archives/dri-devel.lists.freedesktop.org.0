Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581ACACCF0
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E6810E416;
	Mon,  8 Dec 2025 10:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mDzYzbbp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7ACB10E416
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188537;
 bh=d8WAhJZcai72PrbXxB7SlhOF5zms/8IdQ79m5PCJf+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDzYzbbpHtUCOARh+zv9zUYfvpGyBpbCC5SdamCdwbsFkfXX2hK3UtpHIrEon70PT
 x/ZEAt8sQpqE8AMh5zLPE0/fp6VTlgkTURuDjWarX1jwkEb2EFurUIf8AyzSPaoYcR
 U+qws36aluRJ7fStKee3AMXlLeZ1fODNO/ZIr7SSYpqwQLbF7FOROP0gBaTfnVq8z3
 cct4NFiTPC+S4F609FK1vPJwyf/4dHkmnTu9Hhkdw06N9YNbu4LtHBfBSvxXuB/2jM
 b5sqhQjmGDId7dVbuIKbdi7UVsKGFaLyKaIa8vmCGxpQH6qJ2VMXVbyGidHvgsRdWu
 SfHxC6r1orL+w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 390D717E1216;
 Mon,  8 Dec 2025 11:08:57 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com
Subject: [PATCH v8 11/13] drm/panfrost: Add an ioctl to query BO flags
Date: Mon,  8 Dec 2025 11:08:38 +0100
Message-ID: <20251208100841.730527-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
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

This is useful when importing BOs, so we can know about cacheability
and flush the caches when needed.

v2:
- New commit

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- No changes

v6:
- No changes

v7:
- No changes

v8:
- No changes

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 33 +++++++++++++++++++++++++
 include/uapi/drm/panfrost_drm.h         | 19 ++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 77b0ae5ef000..b191795d88cd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -630,6 +630,38 @@ static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+static int panfrost_ioctl_query_bo_info(struct drm_device *dev, void *data,
+					struct drm_file *file_priv)
+{
+	struct drm_panfrost_query_bo_info *args = data;
+	struct drm_gem_object *gem_obj;
+	struct panfrost_gem_object *bo;
+
+	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
+	if (!gem_obj) {
+		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
+		return -ENOENT;
+	}
+
+	bo = to_panfrost_bo(gem_obj);
+	args->pad = 0;
+	args->create_flags = 0;
+	args->extra_flags = 0;
+
+	if (drm_gem_is_imported(gem_obj)) {
+		args->extra_flags |= DRM_PANFROST_BO_IS_IMPORTED;
+	} else {
+		if (bo->noexec)
+			args->create_flags |= PANFROST_BO_NOEXEC;
+
+		if (bo->is_heap)
+			args->create_flags |= PANFROST_BO_HEAP;
+	}
+
+	drm_gem_object_put(gem_obj);
+	return 0;
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -700,6 +732,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(QUERY_BO_INFO,	query_bo_info,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index e194e087a0c8..36ae48ea50d3 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -25,6 +25,7 @@ extern "C" {
 #define DRM_PANFROST_JM_CTX_CREATE		0x0a
 #define DRM_PANFROST_JM_CTX_DESTROY		0x0b
 #define DRM_PANFROST_SYNC_BO			0x0c
+#define DRM_PANFROST_QUERY_BO_INFO		0x0d
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -37,6 +38,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
 #define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
 #define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SYNC_BO, struct drm_panfrost_sync_bo)
+#define DRM_IOCTL_PANFROST_QUERY_BO_INFO	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_QUERY_BO_INFO, struct drm_panfrost_query_bo_info)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -353,6 +355,23 @@ struct drm_panfrost_sync_bo {
 	__u32 pad;
 };
 
+/** BO comes from a different subsystem. */
+#define DRM_PANFROST_BO_IS_IMPORTED (1 << 0)
+
+struct drm_panfrost_query_bo_info {
+	/** Handle of the object being queried. */
+	__u32 handle;
+
+	/** Extra flags that are not coming from the BO_CREATE ioctl(). */
+	__u32 extra_flags;
+
+	/** Flags passed at creation time. */
+	__u32 create_flags;
+
+	/** Will be zero on return. */
+	__u32 pad;
+};
+
 /* Definitions for coredump decoding in user space */
 #define PANFROSTDUMP_MAJOR 1
 #define PANFROSTDUMP_MINOR 0
-- 
2.51.1

