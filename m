Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A47D0A391
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 14:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6D10E8BD;
	Fri,  9 Jan 2026 13:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FfQtSNxw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7A210E2C8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767964099;
 bh=XTrSRKE0VZtDp7ZpDYXbfWRVRZL5aSVTNyvZkdax3QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FfQtSNxw6NwFpcKg9ftORju/E10N8wZYEg8dblqDSTaR/MCJ7tXK8TNeD2bGgzKX7
 pueMjmkLuk1tPvHPbOftXh0Se12MfAAtatU/tqqiga2m00C1afSnDJ0m6gbhDNCbrj
 LoCjAPWmWWppdda8gIz4oVbE4QYTp0Me7ShJ5uqpTp46WV5bRnXBMY/oKCinKdws45
 ME5Uxr8YJMWjmM3gSv8WNReCtrx/w9SwhaBBkDYLIuBXVs7lgDeTTXNJviGjy6AmxU
 0r1x2PFZFr6QBg0bzT1fcJIasIL94arusnpNPfwHvJzFTbxN0Nn6Vq01Ue94c4jPtj
 GSMkBsm5WYQEg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C5A9417E13F9;
 Fri,  9 Jan 2026 14:08:18 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
Date: Fri,  9 Jan 2026 14:08:00 +0100
Message-ID: <20260109130801.1239558-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130801.1239558-1-boris.brezillon@collabora.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
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

This will be used to order things by reclaimability.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 44f05bd957e7..458d22380e96 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -484,6 +484,7 @@ static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
 	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
 			  refcount_read(&bo->cmap.vaddr_use_count));
 	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
+	drm_printf_indent(p, indent, "mmap_count=%u\n", refcount_read(&bo->cmap.mmap_count));
 }
 
 static int panthor_gem_pin_locked(struct drm_gem_object *obj)
@@ -600,6 +601,13 @@ static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *v
 	if (is_cow_mapping(vma->vm_flags))
 		return -EINVAL;
 
+	if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
+		dma_resv_lock(obj->resv, NULL);
+		if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
+			refcount_set(&bo->cmap.mmap_count, 1);
+		dma_resv_unlock(obj->resv);
+	}
+
 	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 	if (should_map_wc(bo))
@@ -732,10 +740,42 @@ static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
 	return blocking_page_setup(vmf, bo, page_offset, true);
 }
 
+static void panthor_gem_vm_open(struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+
+	/* mmap_count must have been incremented at mmap time, so it can't be
+	 * zero here.
+	 */
+	if (!drm_gem_is_imported(&bo->base))
+		drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cmap.mmap_count));
+
+	drm_gem_vm_open(vma);
+}
+
+static void panthor_gem_vm_close(struct vm_area_struct *vma)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
+
+	if (drm_gem_is_imported(&bo->base))
+		goto out;
+
+	if (refcount_dec_not_one(&bo->cmap.mmap_count))
+		goto out;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	if (!refcount_dec_not_one(&bo->cmap.mmap_count))
+		refcount_set(&bo->cmap.mmap_count, 0);
+	dma_resv_unlock(bo->base.resv);
+
+out:
+	drm_gem_object_put(&bo->base);
+}
+
 const struct vm_operations_struct panthor_gem_vm_ops = {
 	.fault = panthor_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
+	.open = panthor_gem_vm_open,
+	.close = panthor_gem_vm_close,
 };
 
 static const struct drm_gem_object_funcs panthor_gem_funcs = {
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index b66478c9590c..c0a18dca732c 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -80,6 +80,9 @@ struct panthor_gem_cpu_map {
 
 	/** @vaddr_use_count: Number of active vmap() requests on this GEM */
 	refcount_t vaddr_use_count;
+
+	/** @mmap_count: Number of active mmap() requests on this GEM */
+	refcount_t mmap_count;
 };
 
 /**
-- 
2.52.0

