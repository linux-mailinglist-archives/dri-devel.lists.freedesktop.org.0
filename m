Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21F379C55
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 03:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCD96E99B;
	Tue, 11 May 2021 01:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBDD6E992
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 01:57:05 +0000 (UTC)
IronPort-SDR: PUwaTJB7dXd4y64kWAh0Ex+xULbtUtkl2b6udNId/k3+nvWKsRK/21MFJWJKOW8NxsEDfJsMUl
 S04sZ883pWBA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196239151"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196239151"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 18:57:02 -0700
IronPort-SDR: kb4oFKmtqkc5bPrsff6zOENfbki0lWSYOXq5fqZ0Qn+NltBnx2X7tIlP3Z42IAe5a4fvNDkAy/
 /SsQJMm4nzfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434067405"
Received: from test.bj.intel.com ([10.238.158.204])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 18:56:59 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 2/3] drm/virtio: Add modifier support
Date: Mon, 10 May 2021 21:49:39 -0400
Message-Id: <20210511014940.2067715-3-tina.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511014940.2067715-1-tina.zhang@intel.com>
References: <20210511014940.2067715-1-tina.zhang@intel.com>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a command to get modifier info from the backend.

Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_kms.c   |  3 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 16 ++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 42 ++++++++++++++++++++++++++
 include/uapi/linux/virtio_gpu.h        |  8 +++++
 5 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d9dbc4f258f3..e077ea065558 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -250,6 +250,8 @@ struct virtio_gpu_device {
 	spinlock_t resource_export_lock;
 	/* protects map state and host_visible_mm */
 	spinlock_t host_visible_lock;
+
+	u64 modifiers[VIRTIO_GPU_PLANE_MAX_MODIFIERS];
 };
 
 struct virtio_gpu_fpriv {
@@ -329,6 +331,7 @@ int virtio_gpu_detach_status_page(struct virtio_gpu_device *vgdev);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
+int virtio_gpu_cmd_get_plane_info(struct virtio_gpu_device *vgdev);
 int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx);
 int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 			      int idx, int version,
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index b4ec479c32cd..3ecf36d92c5c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -226,6 +226,9 @@ int virtio_gpu_init(struct drm_device *dev)
 	virtio_gpu_notify(vgdev);
 	wait_event_timeout(vgdev->resp_wq, !vgdev->display_info_pending,
 			   5 * HZ);
+
+	virtio_gpu_cmd_get_plane_info(vgdev);
+
 	return 0;
 
 err_scanouts:
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 42ac08ed1442..1b9b2a7bf0ac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -73,6 +73,20 @@ static void virtio_gpu_plane_destroy(struct drm_plane *plane)
 	kfree(plane);
 }
 
+static bool virtio_plane_format_mod_supported(struct drm_plane *plane,
+					    u32 format, u64 modifier)
+{
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	int i;
+
+	for (i = 0; i < VIRTIO_GPU_PLANE_MAX_MODIFIERS; i++)
+		if (modifier == vgdev->modifiers[i])
+			return true;
+
+	return false;
+}
+
 static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
@@ -80,6 +94,7 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported   = virtio_plane_format_mod_supported,
 };
 
 static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
@@ -348,6 +363,7 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 		nformats = ARRAY_SIZE(virtio_gpu_formats);
 		funcs = &virtio_gpu_primary_helper_funcs;
 	}
+
 	ret = drm_universal_plane_init(dev, plane, 1 << index,
 				       &virtio_gpu_plane_funcs,
 				       formats, nformats,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cf84d382dd41..7a6d6628e167 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -678,6 +678,26 @@ static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 		drm_kms_helper_hotplug_event(vgdev->ddev);
 }
 
+static void virtio_gpu_cmd_get_plane_info_cb(struct virtio_gpu_device *vgdev,
+					       struct virtio_gpu_vbuffer *vbuf)
+{
+	struct drm_device *dev = vgdev->ddev;
+	struct virtio_gpu_output *output = vgdev->outputs;
+	struct drm_crtc *crtc = &output->crtc;
+	struct virtio_gpu_resp_plane_info *resp =
+		(struct virtio_gpu_resp_plane_info *)vbuf->resp_buf;
+	int i;
+
+	for (i = 0; i < VIRTIO_GPU_PLANE_MAX_MODIFIERS; i++) {
+		vgdev->modifiers[i] = resp->modifiers[i];
+		if (vgdev->modifiers[i] == DRM_FORMAT_MOD_INVALID)
+			break;
+	}
+
+	if (i < VIRTIO_GPU_PLANE_MAX_MODIFIERS)
+		drm_plane_add_modifiers(dev, crtc->primary, vgdev->modifiers);
+}
+
 static void virtio_gpu_cmd_get_capset_info_cb(struct virtio_gpu_device *vgdev,
 					      struct virtio_gpu_vbuffer *vbuf)
 {
@@ -786,6 +806,28 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 	return 0;
 }
 
+int virtio_gpu_cmd_get_plane_info(struct virtio_gpu_device *vgdev)
+{
+	struct virtio_gpu_ctrl_hdr *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+	void *resp_buf;
+
+	resp_buf = kzalloc(sizeof(struct virtio_gpu_resp_plane_info),
+			   GFP_KERNEL);
+	if (!resp_buf)
+		return -ENOMEM;
+
+	cmd_p = virtio_gpu_alloc_cmd_resp
+		(vgdev, &virtio_gpu_cmd_get_plane_info_cb, &vbuf,
+		 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_plane_info),
+		 resp_buf);
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->type = cpu_to_le32(VIRTIO_GPU_CMD_GET_PLANE_INFO);
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	return 0;
+}
+
 int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 {
 	struct virtio_gpu_get_capset_info *cmd_p;
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..f853d7672175 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -78,6 +78,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
 	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
+	VIRTIO_GPU_CMD_GET_PLANE_INFO,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -103,6 +104,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 	VIRTIO_GPU_RESP_OK_MAP_INFO,
+	VIRTIO_GPU_RESP_OK_PLANE_INFO,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -232,6 +234,12 @@ struct virtio_gpu_resp_display_info {
 	} pmodes[VIRTIO_GPU_MAX_SCANOUTS];
 };
 
+#define VIRTIO_GPU_PLANE_MAX_MODIFIERS 8
+struct virtio_gpu_resp_plane_info {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le64 modifiers[VIRTIO_GPU_PLANE_MAX_MODIFIERS];
+};
+
 /* data passed in the control vq, 3d related */
 
 struct virtio_gpu_box {
-- 
2.25.1

