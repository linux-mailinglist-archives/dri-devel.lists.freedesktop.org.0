Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C853D522847
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8DB10E47D;
	Wed, 11 May 2022 00:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5DD10E4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652227843; x=1683763843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qypx/lrMAjQjVjtfmRKPIbXo2skHPhcxneMs7mE91Ro=;
 b=c0Et0bj77DSZHUk6bqqabYEYTpqrinuSDQYGF2ZG5jYvg73aifE0PAgP
 n+XIHss9BdtCGRdaf+8JuN3aHDw5FGwL/lhugdKigKhmtITMbebwLqX13
 sDDXS4t2gXD9PYLmgqa+SfGoAO+iYa52whcGkTj+Oe7pR86M3e/SYh8Ol
 EGOsWEhmzoVKl/mr3L7q9QoySbW16L3EP0EBQiGnxKdgViPBa5VOp78An
 WeBAL92HftLgZtqhw4L6D5aLfAh9yn1ngHvZXC33f4Dd5d49PlPoswasb
 fOxxpoFHWEwSSebFGiIafHvLJi5VdydGaMOLJb0x3iivbvZDrxo7E0THv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269203216"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="269203216"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="623707923"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2022 17:10:43 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: use the fence for every plane update
Date: Tue, 10 May 2022 17:06:23 -0700
Message-Id: <20220511000623.12938-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220511000623.12938-1-dongwon.kim@intel.com>
References: <20220511000623.12938-1-dongwon.kim@intel.com>
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
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Trying to use the fence to make plane update to wait for the host to
consume the buffer for better synchronization in all cases

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 9856e9941e37..0333181e9dbf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -142,12 +142,7 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-
-	if (bo && bo->dumb && (plane->state->fb != new_state->fb) &&
-	    ((plane->type == DRM_PLANE_TYPE_PRIMARY && bo->guest_blob) ||
-	    plane->type != DRM_PLANE_TYPE_PRIMARY))
-		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
-					       0);
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 
 	if (fence) {
 		objs = virtio_gpu_array_alloc(1);
-- 
2.20.1

