Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE521BA0147
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D0410E958;
	Thu, 25 Sep 2025 14:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTen3MlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938810E958
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758811990; x=1790347990;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PuZ1misVk7X9LWvV7l1Fx+cAoBzXvf85m2XMVbGPMZc=;
 b=MTen3MlNyi0/kaUEuMjknE4xVkYKzR4mcwexgO2llnfwelM+ZCM39HX6
 2dqk/GkIVdSvCM3OwB8kI0asCOhAcGVRggUGZ0JikV2ybTc4qztb8K/AF
 HyzuT0Av+IOXFrN3kimc2a3Kl9eCrlE42oZtoQL8pOexrjUUD68IPsr6W
 aM95l/KV3UBs7R+exRjRZmGH7BJRehXewUMGkSz2sQG+LSbgu6qMDp3Gj
 kQhF6nFMePG26Ao87eOlq5HInwHWL7+tdT4VlBh9wkkE4FKqnA2bPa2PM
 cT0I6ks95p1oWNvw0e53g1sPBQiOc2zfxtvH51pz7U40S4tEoF7AeEeeD A==;
X-CSE-ConnectionGUID: hKMJA/nTT2mACsrPzlCfzg==
X-CSE-MsgGUID: qGhdWDnMQHSkFkKR3DhDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="71816236"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="71816236"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:10 -0700
X-CSE-ConnectionGUID: 6Gqwqeh0RPeGkocS2quQkg==
X-CSE-MsgGUID: 0LUveHa4RfihltEMEzEq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176926464"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:01 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Fix page fault in
 ivpu_bo_unbind_all_bos_from_context()
Date: Thu, 25 Sep 2025 16:51:14 +0200
Message-ID: <20250925145114.1446283-1-maciej.falkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Don't add BO to the vdev->bo_list in ivpu_gem_create_object().
When failure happens inside drm_gem_shmem_create(), the BO is not
fully created and ivpu_gem_bo_free() callback will not be called
causing a deleted BO to be left on the list.

Fixes: 8d88e4cdce4f ("accel/ivpu: Use GEM shmem helper for all buffers")
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 0cb48aff396c..38ecf933d144 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -194,7 +194,6 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
 
 struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t size)
 {
-	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct ivpu_bo *bo;
 
 	if (size == 0 || !PAGE_ALIGNED(size))
@@ -209,20 +208,17 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
 
 	INIT_LIST_HEAD(&bo->bo_list_node);
 
-	mutex_lock(&vdev->bo_list_lock);
-	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
-	mutex_unlock(&vdev->bo_list_lock);
-
-	ivpu_dbg(vdev, BO, " alloc: bo %8p size %9zu\n", bo, size);
 	return &bo->base.base;
 }
 
 struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 					     struct dma_buf *dma_buf)
 {
+	struct ivpu_device *vdev = to_ivpu_device(dev);
 	struct device *attach_dev = dev->dev;
 	struct dma_buf_attachment *attach;
 	struct drm_gem_object *obj;
+	struct ivpu_bo *bo;
 	int ret;
 
 	attach = dma_buf_attach(dma_buf, attach_dev);
@@ -240,6 +236,14 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
 	obj->import_attach = attach;
 	obj->resv = dma_buf->resv;
 
+	bo = to_ivpu_bo(obj);
+
+	mutex_lock(&vdev->bo_list_lock);
+	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
+	mutex_unlock(&vdev->bo_list_lock);
+
+	ivpu_dbg(vdev, BO, "import: bo %8p size %9zu\n", bo, ivpu_bo_size(bo));
+
 	return obj;
 
 fail_detach:
@@ -270,6 +274,12 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
 	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
 	bo->flags = flags;
 
+	mutex_lock(&vdev->bo_list_lock);
+	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
+	mutex_unlock(&vdev->bo_list_lock);
+
+	ivpu_dbg(vdev, BO, " alloc: bo %8p size %9llu\n", bo, size);
+
 	return bo;
 }
 
-- 
2.43.0

