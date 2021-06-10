Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F371D3A37FA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F916EE1A;
	Thu, 10 Jun 2021 23:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A672D6EE2B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:37:30 +0000 (UTC)
IronPort-SDR: jTVFWLS6WWSclKAVUbDF74XTv1MRf5RVblauPY4RpWnxS193/KmF+iYtrz0sS1bwZASikb5nhz
 +1QW5ux7CGBw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291059216"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="291059216"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
IronPort-SDR: j49XfdFM47tdPLtQADdD7uE09B96zCe3Uk7ZI40CcsP5CKqDdjoFJZALsqDf7/ey2U55xcSJvy
 OCX8Jo0P+mOw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="414275079"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm/virtio: Add fences for Guest blobs
Date: Thu, 10 Jun 2021 16:24:54 -0700
Message-Id: <20210610232456.671905-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610232456.671905-1-vivek.kasireddy@intel.com>
References: <20210610232456.671905-1-vivek.kasireddy@intel.com>
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

Add prepare and cleanup routines for primary planes as well
where a fence is added only if the BO/FB associated with the
plane is a guest blob.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4e1b17548007..dd7a1f2db9ad 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -206,8 +206,8 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	virtio_gpu_notify(vgdev);
 }
 
-static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
-					struct drm_plane_state *new_state)
+static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
+				       struct drm_plane_state *new_state)
 {
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
@@ -219,7 +219,10 @@ static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (bo && bo->dumb && (plane->state->fb != new_state->fb)) {
+	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
+		return 0;
+
+	if (bo->dumb && (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev);
 		if (!vgfb->fence)
 			return -ENOMEM;
@@ -228,8 +231,8 @@ static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
 	return 0;
 }
 
-static void virtio_gpu_cursor_cleanup_fb(struct drm_plane *plane,
-					 struct drm_plane_state *old_state)
+static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
+					struct drm_plane_state *old_state)
 {
 	struct virtio_gpu_framebuffer *vgfb;
 
@@ -321,13 +324,15 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
+	.prepare_fb		= virtio_gpu_plane_prepare_fb,
+	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
-	.prepare_fb		= virtio_gpu_cursor_prepare_fb,
-	.cleanup_fb		= virtio_gpu_cursor_cleanup_fb,
+	.prepare_fb		= virtio_gpu_plane_prepare_fb,
+	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_cursor_plane_update,
 };
-- 
2.30.2

