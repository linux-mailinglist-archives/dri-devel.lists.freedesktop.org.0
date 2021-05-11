Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE237A276
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6326A6E9FB;
	Tue, 11 May 2021 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3376E9FB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:48:22 +0000 (UTC)
IronPort-SDR: o8Bs2i3m9CUYr76Ovyy7i5e7rILjmik1/mTN7E/Zz/i55k7GbHaaO+VHIG0kwrj/RLk2qd6a7O
 77N61Ft1V9ow==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199458707"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199458707"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:21 -0700
IronPort-SDR: /fCGEUGQGybL5JQuZ5U7ll7ird3t7q/slhAp7gwJI0pGyFJ7VfFEdNiHbRD+NdQamduWokPogJ
 Vd9U49gKiGpA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="541571687"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:21 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH feature
Date: Tue, 11 May 2021 01:36:08 -0700
Message-Id: <20210511083610.367541-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
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

This feature enables the Guest to wait until a flush has been
performed on a buffer it has submitted to the Host.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/uapi/linux/virtio_gpu.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..8fe58657a473 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -60,6 +60,11 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_BLOB       3
 
+/*
+ * VIRTIO_GPU_CMD_WAIT_FLUSH
+ */
+#define VIRTIO_GPU_F_EXPLICIT_FLUSH      4
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -78,6 +83,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
 	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
+	VIRTIO_GPU_CMD_WAIT_FLUSH,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -441,4 +447,10 @@ struct virtio_gpu_resource_unmap_blob {
 	__le32 padding;
 };
 
+/* VIRTIO_GPU_CMD_WAIT_FLUSH */
+struct virtio_gpu_wait_flush {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+};
+
 #endif
-- 
2.30.2

