Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9C7B39DC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 20:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4610E1A7;
	Fri, 29 Sep 2023 18:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64E910E172;
 Fri, 29 Sep 2023 18:16:32 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C49A66607349;
 Fri, 29 Sep 2023 19:16:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696011390;
 bh=DJoaVMy8ENkNzQozP+tziMFSLiEKCxJ8BZ8mfkcAcBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgTDB7VaTVIFK/yXJgy3tq2tI1RvDZ/RInfcINl5Amjr4uecWiS/EbWOxKMc+Aw/m
 QaaqDnCQElS4qTfkeCFuh7/WuWQUEJK1HEL6H7Wx5I1vhCcaqkCjy5enMbxKycjRA9
 iiJ6HiUmQUqEgtw5OXVlUwSPa+gVAkHIqPeBx6an+ewWA9IJQg/Xz8PzEXB22No7MD
 gtUx4Cib0xlnHpX48z6jmlfJew5gTJuOOsXnwyYqL3UrZU4ejMZoyyXsPP1bMwk2/6
 6NcCAeNSu/uh+sEepmekIRYbn5HjDjXnxSiH8FsgWc2cXduUU6memnuK0DIJptzxnN
 Xd4pwJ/W4x9ww==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v8 5/5] drm/panfrost: Implement generic DRM object RSS
 reporting function
Date: Fri, 29 Sep 2023 19:14:31 +0100
Message-ID: <20230929181616.2769345-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929181616.2769345-1-adrian.larumbe@collabora.com>
References: <20230929181616.2769345-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tvrtko.ursulin@linux.intel.com, linux-arm-msm@vger.kernel.org,
 adrian.larumbe@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, healych@amazon.com,
 boris.brezillon@collabora.com, kernel@collabora.com,
 freedreno@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BO's RSS is updated every time new pages are allocated on demand and mapped
for the object at GPU page fault's IRQ handler, but only for heap buffers.
The reason this is unnecessary for non-heap buffers is that they are mapped
onto the GPU's VA space and backed by physical memory in their entirety at
BO creation time.

This calculation is unnecessary for imported PRIME objects, since heap
buffers cannot be exported by our driver, and the actual BO RSS size is the
one reported in its attached dmabuf structure.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 15 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
 drivers/gpu/drm/panfrost/panfrost_mmu.c |  1 +
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index de238b71b321..0cf64456e29a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -209,6 +209,20 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
 	return res;
 }
 
+static size_t panfrost_gem_rss(struct drm_gem_object *obj)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+
+	if (bo->is_heap) {
+		return bo->heap_rss_size;
+	} else if (bo->base.pages) {
+		WARN_ON(bo->heap_rss_size);
+		return bo->base.base.size;
+	}
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -221,6 +235,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
 	.status = panfrost_gem_status,
+	.rss = panfrost_gem_rss,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index ad2877eeeccd..13c0a8149c3a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -36,6 +36,11 @@ struct panfrost_gem_object {
 	 */
 	atomic_t gpu_usecount;
 
+	/*
+	 * Object chunk size currently mapped onto physical memory
+	 */
+	size_t heap_rss_size;
+
 	bool noexec		:1;
 	bool is_heap		:1;
 };
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index d54d4e7b2195..846dd697c410 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -522,6 +522,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
 
 	bomapping->active = true;
+	bo->heap_rss_size += SZ_2M;
 
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 
-- 
2.42.0

