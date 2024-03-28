Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B50588FA93
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B27711237B;
	Thu, 28 Mar 2024 09:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gxs5Sy3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3040112374
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616464; x=1743152464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pGMd8TtU3EGogr2eLgRKB7WBGRnzNynqNECm62cTBho=;
 b=gxs5Sy3z5CBfawvbubSJGJgg/SgGUjKpBhwY4l2ZyPqu/nhX/1GPDenU
 4zcgRdBzNVeUdNW6evVPtZbuc4i9bBGkH4IbmJamrn6N5S9Hn03PxxYzS
 WeT1i6EqTKB4hnqr5nDIyiwrW8ZTi/e7ElFdYFNx/Uf+42wfVXUYFEhIX
 W5vqqqZGUv0l1T3QkfSbNOcjJ8Ls1ivA7FhNFTzRJ3BA266OUwKNYkQfa
 R8Gu/vf2Tp5oOcIG+f5rlCpJyERSy/LtFY+lIA9HsEA765OMp7S80GVi6
 Lh3pUAQFUd4oIf9/ku4wdt4rXYqtU349ZW14PhTx50xgFMD6pDVUADpjS w==;
X-CSE-ConnectionGUID: +5tRG/kVQ5OUmYIbYMi5Ig==
X-CSE-MsgGUID: Kenc5iJSROifTfrA02cbFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355691"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355691"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078214"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:02 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 1/7] drm/virtio: Implement
 VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Date: Thu, 28 Mar 2024 01:32:54 -0700
Message-ID: <20240328083615.2662516-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
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

This cmd is useful to let the VMM (i.e, Qemu) know that the backing
store associated with a resource is no longer valid, so that the VMM
can perform any cleanup or unmap operations.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index bb7d86a0c6a1..7347835e4fbe 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -349,6 +349,8 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+			      uint32_t resource_id);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index b1a00c0c25a7..17e2e7ab231a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -645,6 +645,21 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+void virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+					    uint32_t resource_id)
+{
+	struct virtio_gpu_resource_detach_backing *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
+	cmd_p->resource_id = cpu_to_le32(resource_id);
+
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.43.0

