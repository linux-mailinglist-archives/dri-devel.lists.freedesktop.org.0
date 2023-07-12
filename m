Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D2275141E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3287810E5EA;
	Wed, 12 Jul 2023 23:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98BC10E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 23:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689203226; x=1720739226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ux50yhswqg8S22Fkck5oLgqU1zyJ+ETbzwGMdn/4BSQ=;
 b=aZue2I2lyPmnhQKTZRUG7qlU0fSHCpJLavsq7UainM644RaNX2/knv0i
 fEsEZrsYtx4uaeyBdX0IYrhnZo7aiQzSdaZ7il4Bps5aUmJJ82Hn3OVlI
 Ya02dRhRF7R8vkxChlJp0R6Sx9Hj+9+ACNCm2ZXcYp7LLoH3yyCs+W+yv
 MdcdnZw9tJo37SwAdOVxqTvwdUFpNz6WJymHyzJE5ib7iV1FEYoUT1zID
 rwCnWxv4yR2hhkIBA3gCBIpESlZHhrVerum1QQgQaQkfrBL9xDXIUzcAS
 Ki/vzJXpKF08SmddvRoCBn+dp5TR9WaLFmj88WWmkEDgVwN/L4jQnPREQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="367654223"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="367654223"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 16:07:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895772029"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="895772029"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 16:07:06 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/virtio: drm_gem_plane_helper_prepare_fb for obj
 synchronization
Date: Wed, 12 Jul 2023 15:44:24 -0700
Message-Id: <20230712224424.30158-4-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230712224424.30158-1-dongwon.kim@intel.com>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This helper is needed for framebuffer synchronization. Old framebuffer data
is often displayed on the guest display without this helper.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a063f06ab6c5..e197299489ce 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
 
 #include "virtgpu_drv.h"
 
@@ -271,6 +272,9 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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

