Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA74BA0150
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 16:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A4010E95C;
	Thu, 25 Sep 2025 14:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQ1rGw0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B7310E95C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 14:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758812023; x=1790348023;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gJ9vWyzzQQJ+jt7j/+b3L4nv8I6e/Z4UYayjpl0w2XQ=;
 b=EQ1rGw0dBbsLEGBWpTFSFI59j/+v0XUkUcHbxCgmX8vKAd/K8qFthQeD
 ctciXLunHNA2l3XQSjT58cVS1WuW4wG5hSSoisJcWzmwXTH8qyPOhNueS
 KqRParOP6kh5fCMyUVDRf3HKO3YqRkctbUiTQfzBf0IpSecBKSTP5tvJC
 qv6mAsb7Fa/XoN4MiW/V2zqrhhWfdQDZC1bzavSLt9AnvUcARFFVy/kIb
 9/K8XAxzivZkgir8p5hUEXLChoL95qgad1qIqBpXQJWLYKTX7v0+HylC8
 MDjmTUHPgOEGcWHTUh5LJDKzLdg6PcDIGIx6o9fqh+K/A4t+ik9aj08ZE g==;
X-CSE-ConnectionGUID: 7ZoUCBMuRxqTbd44D71BGQ==
X-CSE-MsgGUID: dxSrpMV2Q8qVosw8+WKtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61241241"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="61241241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:43 -0700
X-CSE-ConnectionGUID: SdcuX+VnQkGX7si8QPJTYQ==
X-CSE-MsgGUID: u6CvJW9kRjSOwTYRUJvRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="176639848"
Received: from try2-8594.igk.intel.com ([10.91.220.58])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 07:53:41 -0700
From: Maciej Falkowski <maciej.falkowski@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 karol.wachowski@linux.intel.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Subject: [PATCH] accel/ivpu: Improve BO alloc/free warnings
Date: Thu, 25 Sep 2025 16:51:54 +0200
Message-ID: <20250925145154.1446427-1-maciej.falkowski@linux.intel.com>
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

Add additional warnings related to allocation and
deallocation of buffer objects to better track possible
memory leaks and generally the BO's lifecycle.

Introduce checks for handle_count to ensure it is zero
before creating a new handle, and exactly one
after successfully creating a handle.

Introduce also a check to warn if the VMA node is not
empty when freeing the buffer object.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 38ecf933d144..e9830ad48d4b 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -332,6 +332,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	drm_WARN_ON(&vdev->drm, bo->ctx);
 
 	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
+	drm_WARN_ON(obj->dev, bo->base.base.vma_node.vm_files.rb_node);
 	drm_gem_shmem_free(&bo->base);
 }
 
@@ -370,12 +371,16 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 		return PTR_ERR(bo);
 	}
 
+	drm_WARN_ON(&vdev->drm, bo->base.base.handle_count != 0);
+
 	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
-	if (ret)
+	if (ret) {
 		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
 			 bo, file_priv->ctx.id, args->size, args->flags);
-	else
+	} else {
 		args->vpu_addr = bo->vpu_addr;
+		drm_WARN_ON(&vdev->drm, bo->base.base.handle_count != 1);
+	}
 
 	drm_gem_object_put(&bo->base.base);
 
-- 
2.43.0

