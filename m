Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231AEA70B1A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2B110E5EF;
	Tue, 25 Mar 2025 20:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0lufSoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0F910E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742933480; x=1774469480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2h9xhTfLDYWGPXKKgS37sRwwxvEjGvYZ87DtQK8CwmI=;
 b=S0lufSooAR1ADQ2YM0jAJbCVG4L+FGAMHiWMMVxQRJE5RbdV54dYQrX5
 v1riBHWUT9OOS0sRKXXGswTSh1C4B4niFx6eoerAEQfP/KvZDi3mujTHR
 f70oW2f1/BPSd+2iScXnLp06DIIp09kQqN5bjjVPEW+OnYURMZo/YtPaw
 w6NXO9qERk1WIvgZ92nCHAojjegYJ9aG4QM/yr+EMIMajB4FKOMR+9/xD
 jlz14Kw3tNqTcDWYvKhCpKGZ0Bb1i8yhOGUirj9fxQy7Kt3pdFqCS8hG7
 a+s4E6yp5gciCNjri6VImECqvr+AYvwWYMEXuY272Hq/gQF337byPvwyW A==;
X-CSE-ConnectionGUID: LB0d9NBESrmkGO+XRnOc9Q==
X-CSE-MsgGUID: iJqmzcjkRSKLvDNkHjGwFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44076800"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44076800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:11:20 -0700
X-CSE-ConnectionGUID: FemwZhsTSa2lC1kU0c5U0A==
X-CSE-MsgGUID: IXmjmJ58RqeWo5WcbcRtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="128630702"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 13:11:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH] drm/virtio: Fix flickering issue seen with imported dmabufs
Date: Tue, 25 Mar 2025 13:10:21 -0700
Message-ID: <20250325201021.1315080-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.48.1
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

We need to save the reservation object pointer associated with the
imported dmabuf in the newly created GEM object to allow
drm_gem_plane_helper_prepare_fb() to extract the exclusive fence
from it and attach it to the plane state during prepare phase.
This is needed to ensure that drm_atomic_helper_wait_for_fences()
correctly waits for the relevant fences (move, etc) associated with
the reservation object, thereby implementing proper synchronization.

Otherwise, artifacts or slight flickering can be seen when apps
are dragged across the screen when running Gnome (Wayland). This
problem is mostly seen with dGPUs in the case where the FBs are
allocated in VRAM but need to be migrated to System RAM as they
are shared with virtio-gpu.

Fixes: ca77f27a2665 ("drm/virtio: Import prime buffers from other devices as guest blobs")
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index fe6a0b018571..ceb0401a000b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -332,6 +332,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 	}
 
 	obj->import_attach = attach;
+	obj->resv = buf->resv;
 	get_dma_buf(buf);
 
 	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
-- 
2.48.1

