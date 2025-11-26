Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30DC89D84
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 13:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6624910E5E3;
	Wed, 26 Nov 2025 12:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F1Z1H7bf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DED10E5DE;
 Wed, 26 Nov 2025 12:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764161119;
 bh=cN8IKPpCv7X2AeKmgTZz5Ltp3svAgs0cIdrwjYCTuqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F1Z1H7bfxGnJ3VVbWLgpPjkcTvi97TU/ScGVLk/wh/CHF5QifslL8GD3uk+NO24Ig
 0hTxXmZpGrSSREtL0Qzubqnk8+UHHR0UYMcjkAlE4YY2ffssUUersDxrERWLO1D5QP
 bGBWTYs97EdMZ1oDex4X4jnvRFiSEZ3f4DnlI5dkrK+tasm4TQtbNNVLQ49Jl7ITyA
 VnHGH03kiHttOnp4elmVhfhwr4blrN5mdN02zEmXaLnsBn7gIwdAFNYNHalV6uf76I
 zAiu0oARVMzu41hMMM666YbO8X1W8k6QhboFGtf1CbMXTMIp95UkKJtbWCEJ61PyHT
 xZaA0xKYpxkTg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6564D17E129C;
 Wed, 26 Nov 2025 13:45:18 +0100 (CET)
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
Subject: [PATCH v6 11/16] drm/panfrost: Provide a custom dma_buf implementation
Date: Wed, 26 Nov 2025 13:44:50 +0100
Message-ID: <20251126124455.3656651-12-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126124455.3656651-1-boris.brezillon@collabora.com>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
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

v6:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c | 13 +++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..3c62cdd43069 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -853,6 +853,7 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+	.dma_buf_ops = &panfrost_dma_buf_ops,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = panfrost_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8041b65c6609..292f3ce6287f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -324,6 +324,19 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	return bo;
 }
 
+const struct dma_buf_ops panfrost_dma_buf_ops = {
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
 struct drm_gem_object *
 panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8de3e76f2717..9ad35e2d99fc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -131,6 +131,8 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 				   struct dma_buf_attachment *attach,
 				   struct sg_table *sgt);
 
+extern const struct dma_buf_ops panfrost_dma_buf_ops;
+
 struct panfrost_gem_object *
 panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);
 
-- 
2.51.1

