Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E76445BDF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 22:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7673899;
	Thu,  4 Nov 2021 21:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD287388F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 21:57:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231647517"
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="231647517"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 14:57:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,209,1631602800"; d="scan'208";a="579056880"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 14:57:27 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Fix NULL dereference error in virtio_gpu_poll
Date: Thu,  4 Nov 2021 14:42:49 -0700
Message-Id: <20211104214249.1802789-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
References: <15731ad7-83ff-c7ef-e4a1-8b11814572c2@xenosoft.de>
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
 Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When virgl is not enabled, vfpriv pointer would not be allocated.
Therefore, check for a valid value before dereferencing.

Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 749db18dcfa2..d86e1ad4a972 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -163,10 +163,11 @@ static __poll_t virtio_gpu_poll(struct file *filp,
 	struct drm_file *drm_file = filp->private_data;
 	struct virtio_gpu_fpriv *vfpriv = drm_file->driver_priv;
 	struct drm_device *dev = drm_file->minor->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct drm_pending_event *e = NULL;
 	__poll_t mask = 0;
 
-	if (!vfpriv->ring_idx_mask)
+	if (!vgdev->has_virgl_3d || !vfpriv || !vfpriv->ring_idx_mask)
 		return drm_poll(filp, wait);
 
 	poll_wait(filp, &drm_file->event_wait, wait);
-- 
2.31.1

