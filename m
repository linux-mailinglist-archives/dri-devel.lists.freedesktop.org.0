Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24BF91AC06
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171CB882B5;
	Thu, 27 Jun 2024 15:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 582 seconds by postgrey-1.36 at gabe;
 Thu, 27 Jun 2024 15:57:53 UTC
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143D710EB08;
 Thu, 27 Jun 2024 15:57:52 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 5/6] drm/amdgpu: Add cgroups implementation
Date: Thu, 27 Jun 2024 17:47:24 +0200
Message-ID: <20240627154754.74828-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
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

Similar to xe, enable some simple management of VRAM only.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h          | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      | 6 ++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 6 ++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f87d53e183c3..9ec55f05bfd5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -43,6 +43,7 @@
 #include "amdgpu_ctx.h"
 
 #include <linux/atomic.h>
+#include <linux/cgroup_drm.h>
 #include <linux/wait.h>
 #include <linux/list.h>
 #include <linux/kref.h>
@@ -836,6 +837,7 @@ struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
 	struct drm_device		ddev;
+	struct drmcgroup_device		cg;
 
 #ifdef CONFIG_DRM_AMD_ACP
 	struct amdgpu_acp		acp;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e785f128411d..1afe28016d40 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1856,6 +1856,12 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 		return r;
 	}
 
+	r = drmmcg_register_device(adev_to_drm(adev), &adev->cg);
+	if (r) {
+		DRM_ERROR("Failed initializing cgroup allocator.\n");
+		return r;
+	}
+
 	/* Change the size here instead of the init above so only lpfn is affected */
 	amdgpu_ttm_set_buffer_funcs_status(adev, false);
 #ifdef CONFIG_64BIT
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 6c30eceec896..b207af0bff3a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -895,6 +895,12 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 		DRM_INFO("Setup dummy vram mgr\n");
 	}
 
+	adev->cg.regions[0].size = adev->gmc.real_vram_size;
+	adev->cg.regions[0].name = "vram";
+	adev->cg.num_regions++;
+	man->cgdev = &adev->cg;
+	man->cgidx = 0;
+
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
 	return 0;
-- 
2.45.2

