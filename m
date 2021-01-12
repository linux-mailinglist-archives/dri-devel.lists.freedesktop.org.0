Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE1F2F29C1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF876E118;
	Tue, 12 Jan 2021 08:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E37A6E0EA;
 Tue, 12 Jan 2021 08:10:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3DB36B7D3;
 Tue, 12 Jan 2021 08:10:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 4/6] drm: Merge CONFIG_DRM_VM into CONFIG_DRM_LEGACY
Date: Tue, 12 Jan 2021 09:10:33 +0100
Message-Id: <20210112081035.6882-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112081035.6882-1-tzimmermann@suse.de>
References: <20210112081035.6882-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_DRM_VM gets selected by CONFIG_DRM_LEGACY, but nothing else. So
remove it and build drm_vm.o as part of CONFIG_DRM_LEGACY.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig      | 5 -----
 drivers/gpu/drm/Makefile     | 3 +--
 drivers/gpu/drm/drm_legacy.h | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 0973f408d75f..8bf103de1594 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -214,10 +214,6 @@ config DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions
 
-config DRM_VM
-	bool
-	depends on DRM && MMU
-
 config DRM_SCHED
 	tristate
 	depends on DRM
@@ -391,7 +387,6 @@ source "drivers/gpu/drm/xlnx/Kconfig"
 menuconfig DRM_LEGACY
 	bool "Enable legacy drivers (DANGEROUS)"
 	depends on DRM && MMU
-	select DRM_VM
 	help
 	  Enable legacy DRI1 drivers. Those drivers expose unsafe and dangerous
 	  APIs to user-space, which can be used to circumvent access
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index ba0ecb7756c6..926adef289db 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -21,9 +21,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
 		drm_managed.o drm_vblank_work.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_bufs.o drm_context.o drm_dma.o drm_legacy_misc.o drm_lock.o \
-		drm_memory.o drm_scatter.o
+		drm_memory.o drm_scatter.o drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
-drm-$(CONFIG_DRM_VM) += drm_vm.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
 drm-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_gem_shmem_helper.o
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index 1be3ea320474..f71358f9eac9 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -127,7 +127,7 @@ static inline void drm_legacy_master_rmmaps(struct drm_device *dev,
 static inline void drm_legacy_rmmaps(struct drm_device *dev) {}
 #endif
 
-#if IS_ENABLED(CONFIG_DRM_VM) && IS_ENABLED(CONFIG_DRM_LEGACY)
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
 void drm_legacy_vma_flush(struct drm_device *d);
 #else
 static inline void drm_legacy_vma_flush(struct drm_device *d)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
