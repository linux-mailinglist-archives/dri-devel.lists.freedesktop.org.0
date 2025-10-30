Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B11C20777
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7155C10E9A0;
	Thu, 30 Oct 2025 14:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M9gY20nh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258E210E993;
 Thu, 30 Oct 2025 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833140;
 bh=OApMC2x3u66jQhYZBd1Ll0oCsVL5EoecjsnTqHCFvD4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M9gY20nhLWDsq6lkI3xh8mefqsyaVD3IAsBf1NZLCsWzRQPX1+JIZjd7WI7CalzuR
 iGXuNK94TQCWTfCGNqiFQI+yrCel92d4WukewYofPXZWGRsp77eKGZU9ckkd/syUEo
 2IO1mMtVghgyRJudIP6JEg1OkKWLUCmd0mHQGgevg1GFk++om+dUMx1WRy+V/zirZ0
 +Zmf5asrBuwqdahyxSyp31LcKDqJZyub1WUJjKYVpifXv1HHyk9B8uFRXoXlUC1/Zy
 Z0ivmCwx9epZ03vXvcRbxuyoKvXmRBalDPEw2Uzz9tSxRJTAx0+nPaYCtN+wb6eSMB
 PSHa4HleJUYTA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E2BB317E141E;
 Thu, 30 Oct 2025 15:05:39 +0100 (CET)
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
Subject: [PATCH v5 04/16] drm/panthor: Provide a custom dma_buf implementation
Date: Thu, 30 Oct 2025 15:05:13 +0100
Message-ID: <20251030140525.366636-5-boris.brezillon@collabora.com>
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

Before we introduce cached CPU mappings, we want a dma_buf
implementation satisfying synchronization requests around CPU
accesses coming from a dma_buf exported by our driver. Let's
provide our own implementation relying on the default
gem_shmem_prime helpers designed for that purpose.

v5:
- New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  1 +
 drivers/gpu/drm/panthor/panthor_gem.c | 19 +++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb4b293f17f0..99a4534c0074 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1618,6 +1618,7 @@ static const struct drm_driver panthor_drm_driver = {
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_get_dma_buf_ops = panthor_gem_prime_get_dma_buf_ops,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panthor_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 156c7a0b62a2..160692e45f44 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -191,6 +191,25 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	return ERR_PTR(ret);
 }
 
+static const struct dma_buf_ops panthor_dma_buf_ops = {
+	.attach = drm_gem_map_attach,
+	.detach = drm_gem_map_detach,
+	.map_dma_buf = drm_gem_shmem_prime_map_dma_buf,
+	.unmap_dma_buf = drm_gem_shmem_prime_unmap_dma_buf,
+	.release = drm_gem_dmabuf_release,
+	.mmap = drm_gem_dmabuf_mmap,
+	.vmap = drm_gem_dmabuf_vmap,
+	.vunmap = drm_gem_dmabuf_vunmap,
+	.begin_cpu_access = drm_gem_shmem_prime_begin_cpu_access,
+	.end_cpu_access = drm_gem_shmem_prime_end_cpu_access,
+};
+
+const struct dma_buf_ops *
+panthor_gem_prime_get_dma_buf_ops(struct drm_device *dev)
+{
+	return &panthor_dma_buf_ops;
+}
+
 static struct dma_buf *
 panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
 {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 80c6e24112d0..528088839468 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -147,6 +147,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 
+const struct dma_buf_ops *
+panthor_gem_prime_get_dma_buf_ops(struct drm_device *dev);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
-- 
2.51.0

