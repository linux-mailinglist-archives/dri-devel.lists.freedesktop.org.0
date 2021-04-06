Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B20355D22
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 22:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508C6E102;
	Tue,  6 Apr 2021 20:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30806E102
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 20:47:00 +0000 (UTC)
IronPort-SDR: AroVTP3odfZ3GlMxCZocxarkNEhrRTBQ3CI6zC+kAlWt31mAHZUj6o4YiM3J93hJh4sk6feEZj
 6KcqSQPcXynA==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="172628770"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="172628770"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 13:47:00 -0700
IronPort-SDR: gnFWYgHE0FVDw+KwO6vk4bBBrE6ULzNQ90Vwa5dYME0jzJer0xnk53R53Cb6D/9mOjhZJCPZ1Y
 wlfzO+xz/kaA==
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="519176269"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 13:46:59 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v2)
Date: Tue,  6 Apr 2021 13:36:25 -0700
Message-Id: <20210406203625.1727955-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
MIME-Version: 1.0
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If support for Blob resources is available, then dumb BOs created
by the driver can be considered as guest Blobs.

v2: Don't skip transfer and flush commands as part of plane update
as the device may have created a shared mapping. (Gerd)

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_gem.c    | 8 ++++++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
index 8502400b2f9c..5f49fb1cce65 100644
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
@@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 {
 	struct drm_gem_object *gobj;
 	struct virtio_gpu_object_params params = { 0 };
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	int ret;
 	uint32_t pitch;
 
@@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
 	params.height = args->height;
 	params.size = args->size;
 	params.dumb = true;
+
+	if (vgdev->has_resource_blob) {
+		params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
+		params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
+		params.blob = true;
+	}
+
 	ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
 				    &args->handle);
 	if (ret)
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 4ff1ec28e630..f648b0e24447 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	}
 
 	if (params->blob) {
+		if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
+			bo->guest_blob = true;
+
 		virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
 						    ents, nents);
 	} else if (params->virgl) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
