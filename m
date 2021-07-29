Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B83D9F9B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 10:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043006ECE0;
	Thu, 29 Jul 2021 08:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3656ECE8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 08:29:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="276612149"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="276612149"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="507013882"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 01:29:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 2/4] virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
Date: Thu, 29 Jul 2021 01:16:57 -0700
Message-Id: <20210729081659.2255499-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This feature enables the Guest to wait to know when a resource
is completely consumed by the Host.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/uapi/linux/virtio_gpu.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..0526157905b5 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -60,6 +60,11 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE
+ */
+#define VIRTIO_GPU_F_OUT_FENCE  4
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -78,6 +83,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
 	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
+	VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -441,4 +447,10 @@ struct virtio_gpu_resource_unmap_blob {
 	__le32 padding;
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE */
+struct virtio_gpu_resource_out_fence {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+};
+
 #endif
-- 
2.30.2

