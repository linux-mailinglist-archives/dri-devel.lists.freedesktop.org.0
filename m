Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0EC20760
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC8F10E98B;
	Thu, 30 Oct 2025 14:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DOTqDklK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE3A10E5D2;
 Thu, 30 Oct 2025 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833137;
 bh=ig914tOllmxqritw+reDtpfBMSJK6WovZuf7421dWPY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DOTqDklKdfpHZf+bDXxF4uevAUHQobdAQzGklXj9ugwrSzmV8UZPHrEDbsKx2FTCQ
 gju/TF64HX9FkU8zvmTdDgykCOvKhHPxobfuVmPyWwe+nNMOtmI+2W4MPRuzazv/V/
 6lt9janj4s1MQEK8VLrrqzGhqitaERBGRjWbdGpati/GMMViDl16LCxdsnIMeKpv6f
 M7XpXu/c3+JXsB5k48nHcm0AlJ6rHS1Z7Qh1kEeLtvDg9/OtvUaM1CpSqZ8iKlsmEI
 VENFd3dZdxP9/fmkMSR4d7wHhAK4WpLv3TRUD0ss4Y3XEaKQesHvqZbDd8fxG/MxGt
 rLySkKnZmnUhQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C80CC17E13DE;
 Thu, 30 Oct 2025 15:05:36 +0100 (CET)
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
Subject: [PATCH v5 01/16] drm/prime: Simplify life of drivers needing custom
 dma_buf_ops
Date: Thu, 30 Oct 2025 15:05:10 +0100
Message-ID: <20251030140525.366636-2-boris.brezillon@collabora.com>
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

drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
driver implements custom dma_buf_ops. Instead of duplicating a bunch
of helpers to work around it, let's provide a way for drivers to
expose their custom dma_buf_ops so the core prime helpers can rely on
that instead of hardcoding &drm_gem_prime_dmabuf_ops.

v5:
- New patch

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_prime.c | 14 +++++++++++---
 include/drm/drm_drv.h       |  8 ++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 43a10b4af43a..3796844af418 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -903,6 +903,15 @@ unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
 }
 EXPORT_SYMBOL(drm_prime_get_contiguous_size);
 
+static const struct dma_buf_ops *
+drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
+{
+	if (dev->driver->gem_prime_get_dma_buf_ops)
+		return dev->driver->gem_prime_get_dma_buf_ops(dev);
+
+	return &drm_gem_prime_dmabuf_ops;
+}
+
 /**
  * drm_gem_prime_export - helper library implementation of the export callback
  * @obj: GEM object to export
@@ -919,7 +928,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 	struct dma_buf_export_info exp_info = {
 		.exp_name = KBUILD_MODNAME, /* white lie for debug */
 		.owner = dev->driver->fops->owner,
-		.ops = &drm_gem_prime_dmabuf_ops,
+		.ops = drm_gem_prime_get_dma_buf_ops(dev),
 		.size = obj->size,
 		.flags = flags,
 		.priv = obj,
@@ -930,7 +939,6 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 }
 EXPORT_SYMBOL(drm_gem_prime_export);
 
-
 /**
  * drm_gem_is_prime_exported_dma_buf -
  * checks if the DMA-BUF was exported from a GEM object belonging to @dev.
@@ -946,7 +954,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev == dev);
+	return (dma_buf->ops == drm_gem_prime_get_dma_buf_ops(dev)) && (obj->dev == dev);
 }
 EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986d..f18da3c0edb8 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -326,6 +326,14 @@ struct drm_driver {
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
 
+	/**
+	 * @gem_prime_get_dma_buf_ops:
+	 *
+	 * Optional hook used by the PRIME helpers to get the custom dma_buf_ops
+	 * used by this driver.
+	 */
+	const struct dma_buf_ops *(*gem_prime_get_dma_buf_ops)(struct drm_device *dev);
+
 	/**
 	 * @dumb_create:
 	 *
-- 
2.51.0

