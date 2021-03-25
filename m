Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9E348CE6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576A16ECEB;
	Thu, 25 Mar 2021 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Thu, 25 Mar 2021 09:17:55 UTC
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com
 [115.124.28.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB786ECE6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:17:54 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07634467|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0188312-0.000749819-0.980419;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=liu.xiang@zlingsmart.com; NM=1;
 PH=DS; RN=9; RT=9; SR=0; TI=SMTPD_---.Jq15S-w_1616663568; 
Received: from localhost(mailfrom:liu.xiang@zlingsmart.com
 fp:SMTPD_---.Jq15S-w_1616663568)
 by smtp.aliyun-inc.com(10.194.97.246);
 Thu, 25 Mar 2021 17:12:48 +0800
From: Liu Xiang <liu.xiang@zlingsmart.com>
To: kraxel@redhat.com
Subject: [PATCH] drm/virtio: check the return value of
 virtio_gpu_alloc_cmd_resp()
Date: Thu, 25 Mar 2021 17:12:44 +0800
Message-Id: <20210325091244.25322-1-liu.xiang@zlingsmart.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 25 Mar 2021 09:30:06 +0000
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
Cc: airlied@linux.ie, liuxiang_1999@126.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Liu Xiang <liu.xiang@zlingsmart.com>, liuxiang1999@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now there is no check with the return value of virtio_gpu_alloc_cmd_resp().
If it fails, the following operation will cause a fault.

Signed-off-by: Liu Xiang <liu.xiang@zlingsmart.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 89 +++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cf84d382d..2e59ad55f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -507,6 +507,9 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 	vbuf->objs = objs;
 
@@ -540,6 +543,9 @@ void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
 					virtio_gpu_cmd_unref_cb);
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
@@ -560,6 +566,9 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SET_SCANOUT);
@@ -582,6 +591,9 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_FLUSH);
@@ -612,6 +624,9 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 					    shmem->pages, DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 	vbuf->objs = objs;
 
@@ -637,6 +652,9 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING);
@@ -778,6 +796,11 @@ int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev)
 		(vgdev, &virtio_gpu_cmd_get_display_info_cb, &vbuf,
 		 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_display_info),
 		 resp_buf);
+	if (IS_ERR(cmd_p)) {
+		kfree(resp_buf);
+		return PTR_ERR(cmd_p);
+	}
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	vgdev->display_info_pending = true;
@@ -801,6 +824,11 @@ int virtio_gpu_cmd_get_capset_info(struct virtio_gpu_device *vgdev, int idx)
 		(vgdev, &virtio_gpu_cmd_get_capset_info_cb, &vbuf,
 		 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_capset_info),
 		 resp_buf);
+	if (IS_ERR(cmd_p)) {
+		kfree(resp_buf);
+		return PTR_ERR(cmd_p);
+	}
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET_INFO);
@@ -876,6 +904,13 @@ int virtio_gpu_cmd_get_capset(struct virtio_gpu_device *vgdev,
 		(vgdev, &virtio_gpu_cmd_capset_cb, &vbuf, sizeof(*cmd_p),
 		 sizeof(struct virtio_gpu_resp_capset) + max_size,
 		 resp_buf);
+	if (IS_ERR(cmd_p)) {
+		kfree(resp_buf);
+		kfree(cache_ent->caps_cache);
+		kfree(cache_ent);
+		return PTR_ERR(cmd_p);
+	}
+
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_CAPSET);
 	cmd_p->capset_id = cpu_to_le32(vgdev->capsets[idx].id);
 	cmd_p->capset_version = cpu_to_le32(version);
@@ -905,6 +940,11 @@ int virtio_gpu_cmd_get_edids(struct virtio_gpu_device *vgdev)
 			(vgdev, &virtio_gpu_cmd_get_edid_cb, &vbuf,
 			 sizeof(*cmd_p), sizeof(struct virtio_gpu_resp_edid),
 			 resp_buf);
+		if (IS_ERR(cmd_p)) {
+			kfree(resp_buf);
+			return PTR_ERR(cmd_p);
+		}
+
 		cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_GET_EDID);
 		cmd_p->scanout = cpu_to_le32(scanout);
 		virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
@@ -920,6 +960,9 @@ void virtio_gpu_cmd_context_create(struct virtio_gpu_device *vgdev, uint32_t id,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_CREATE);
@@ -937,6 +980,9 @@ void virtio_gpu_cmd_context_destroy(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_CTX_DESTROY);
@@ -953,6 +999,9 @@ void virtio_gpu_cmd_context_attach_resource(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 	vbuf->objs = objs;
 
@@ -971,6 +1020,9 @@ void virtio_gpu_cmd_context_detach_resource(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 	vbuf->objs = objs;
 
@@ -991,6 +1043,9 @@ virtio_gpu_cmd_resource_create_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 	vbuf->objs = objs;
 
@@ -1034,6 +1089,9 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	}
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	vbuf->objs = objs;
@@ -1064,6 +1122,9 @@ void virtio_gpu_cmd_transfer_from_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	vbuf->objs = objs;
@@ -1090,6 +1151,9 @@ void virtio_gpu_cmd_submit(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	vbuf->data_buf = data;
@@ -1120,6 +1184,8 @@ void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 
 	output->cursor.pos.scanout_id = cpu_to_le32(output->index);
 	cur_p = virtio_gpu_alloc_cursor(vgdev, &vbuf);
+	if (IS_ERR(cur_p))
+		return;
 	memcpy(cur_p, &output->cursor, sizeof(output->cursor));
 	virtio_gpu_queue_cursor(vgdev, vbuf);
 }
@@ -1169,6 +1235,15 @@ virtio_gpu_cmd_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 	cmd_p = virtio_gpu_alloc_cmd_resp
 		(vgdev, virtio_gpu_cmd_resource_uuid_cb, &vbuf, sizeof(*cmd_p),
 		 sizeof(struct virtio_gpu_resp_resource_uuid), resp_buf);
+	if (IS_ERR(cmd_p)) {
+		spin_lock(&vgdev->resource_export_lock);
+		bo->uuid_state = STATE_ERR;
+		spin_unlock(&vgdev->resource_export_lock);
+		virtio_gpu_array_put_free(objs);
+		kfree(resp_buf);
+		return PTR_ERR(cmd_p);
+	}
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID);
@@ -1217,6 +1292,11 @@ int virtio_gpu_cmd_map(struct virtio_gpu_device *vgdev,
 	cmd_p = virtio_gpu_alloc_cmd_resp
 		(vgdev, virtio_gpu_cmd_resource_map_cb, &vbuf, sizeof(*cmd_p),
 		 sizeof(struct virtio_gpu_resp_map_info), resp_buf);
+	if (IS_ERR(cmd_p)) {
+		kfree(resp_buf);
+		return PTR_ERR(cmd_p);
+	}
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB);
@@ -1235,6 +1315,9 @@ void virtio_gpu_cmd_unmap(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB);
@@ -1254,6 +1337,9 @@ virtio_gpu_cmd_resource_create_blob(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB);
@@ -1285,6 +1371,9 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 	uint32_t format = virtio_gpu_translate_format(fb->format->format);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	if (IS_ERR(cmd_p))
+		return;
+
 	memset(cmd_p, 0, sizeof(*cmd_p));
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SET_SCANOUT_BLOB);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
