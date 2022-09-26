Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D65EB558
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 01:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C15010E814;
	Mon, 26 Sep 2022 23:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5562D10E810
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 23:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664234250; x=1695770250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KX7ZtnvM3anlqa7soOjUWsNKQa/1dZM/FZ9ooYzUvgM=;
 b=JtcGk6gseJD0seQxfL9D3akRl3RjfLWfORFSUk1gVJGD22JEjdKeX6ho
 EmPCo0d0I1+A2v0xRtApyylbocRtsm994GXxWHaP2IjDhQ/jLMRDx8W9Y
 Kdlfm6ZDZY5VsNXe1Fqfip+4sUd/LC25WoEALbAaIX2d2zeDi351Fa7Sv
 xP81m8YZh+y6gHdnJ9t8x1+jgX1XE6+q663Uz2/RSSt6+xd11UXpiRKVG
 n9QRFVy94b7Ptq2G3O0ymGLDRY2T/EObiyIGnphSN+nmSCmXWiYGBu/oq
 jFn5z0IxeHhq5qvmOBKZOuhgZiBFHVYWVug4GMuMkK0Oh4F2Vr93QI281 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302638886"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="302638886"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 16:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763649737"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="763649737"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2022 16:17:25 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for obj
 synchronization
Date: Mon, 26 Sep 2022 16:06:55 -0700
Message-Id: <20220926230655.2565-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220926230655.2565-1-dongwon.kim@intel.com>
References: <20220926230655.2565-1-dongwon.kim@intel.com>
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
Cc: dongwon.kim@intel.com, vivek.kasireddy@intel.com, kraxel@redhat.com,
 gurchetansingh@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper is needed for framebuffer synchronization. Old framebuffer data
is often displayed on the guest display without this helper.

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 51b14ee4ece9..968afd0029fa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #include "virtgpu_drv.h"
 
@@ -270,6 +271,9 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
 	vgplane_st = to_virtio_gpu_plane_state(new_state);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+
+	drm_gem_plane_helper_prepare_fb(plane, new_state);
+
 	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
 		return 0;
 
-- 
2.20.1

