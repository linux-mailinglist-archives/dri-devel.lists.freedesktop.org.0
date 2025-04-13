Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512E4A872D4
	for <lists+dri-devel@lfdr.de>; Sun, 13 Apr 2025 19:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F59510E265;
	Sun, 13 Apr 2025 17:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hMbRhy6h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD06B10E265;
 Sun, 13 Apr 2025 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=K+VcCL4qx8pSYukyGX1+g/EjshAoX3GVm+lXm/TDTdg=; b=hMbRhy6hYGQ2Pqwz
 ylvE1VOsByBQt++BLuW9Ox3XbTgXife/0LAcu7B8NGR34Dp+GpnMbSRBvYKjC279AfoNEzY+Tw4h5
 qiwNZ4BQcO74pifwKN6BLFJiAS8b2+ctPnKpYngNS3B35T/kYI3qJvosx6XfcdVlHx2/K6bgMaOXh
 CIsBvrHaKtP4yL0pn9REm4wgFY/ExMUxRBLYfBLMKIbz6SVO/2N2BpD0s/IxRwCZ6ckpExe31pvLo
 fdGaw+tP80VfQNqsgn4w+VC6an7veaKsd87qL6uezPvMthfSDDcthBEyZdm0PUSYX5J/xDifzgM7q
 nhCx98hXon6++MVg5g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1u40rE-00B22s-2k;
 Sun, 13 Apr 2025 17:11:00 +0000
From: linux@treblig.org
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/2] drm: qxl: Remove unused debugfs code
Date: Sun, 13 Apr 2025 18:10:58 +0100
Message-ID: <20250413171058.271234-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413171058.271234-1-linux@treblig.org>
References: <20250413171058.271234-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

qxl_debugfs_add_files() has been unused since 2022's
commit d0719e09264b ("drm/qxl: Use TTM builtin resource manager debugfs
code")

Remove it.

This now leaves the debugfs_count and debugfs members of struct
qxl_device unused.  Remove them.

QXL_DEBUGFS_MAX_COMPONENTS was only used as the size of the debugfs[]
array.  Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/qxl/qxl_debugfs.c | 29 -----------------------------
 drivers/gpu/drm/qxl/qxl_drv.h     | 10 ----------
 2 files changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..bdfce1a8f006 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -95,32 +95,3 @@ qxl_debugfs_init(struct drm_minor *minor)
 	qxl_ttm_debugfs_init(dev);
 #endif
 }
-
-void qxl_debugfs_add_files(struct qxl_device *qdev,
-			   struct drm_info_list *files,
-			   unsigned int nfiles)
-{
-	unsigned int i;
-
-	for (i = 0; i < qdev->debugfs_count; i++) {
-		if (qdev->debugfs[i].files == files) {
-			/* Already registered */
-			return;
-		}
-	}
-
-	i = qdev->debugfs_count + 1;
-	if (i > QXL_DEBUGFS_MAX_COMPONENTS) {
-		DRM_ERROR("Reached maximum number of debugfs components.\n");
-		DRM_ERROR("Report so we increase QXL_DEBUGFS_MAX_COMPONENTS.\n");
-		return;
-	}
-	qdev->debugfs[qdev->debugfs_count].files = files;
-	qdev->debugfs[qdev->debugfs_count].num_files = nfiles;
-	qdev->debugfs_count = i;
-#if defined(CONFIG_DEBUG_FS)
-	drm_debugfs_create_files(files, nfiles,
-				 qdev->ddev.primary->debugfs_root,
-				 qdev->ddev.primary);
-#endif
-}
diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
index a6184aaebf62..ea977c238b27 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.h
+++ b/drivers/gpu/drm/qxl/qxl_drv.h
@@ -59,8 +59,6 @@ struct iosys_map;
 #define DRIVER_MINOR 1
 #define DRIVER_PATCHLEVEL 0
 
-#define QXL_DEBUGFS_MAX_COMPONENTS		32
-
 extern int qxl_num_crtc;
 
 #define QXL_INTERRUPT_MASK (\
@@ -227,10 +225,6 @@ struct qxl_device {
 	wait_queue_head_t io_cmd_event;
 	struct work_struct client_monitors_config_work;
 
-	/* debugfs */
-	struct qxl_debugfs	debugfs[QXL_DEBUGFS_MAX_COMPONENTS];
-	unsigned int debugfs_count;
-
 	struct mutex		update_area_mutex;
 
 	struct idr	surf_id_idr;
@@ -423,10 +417,6 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 /* qxl_irq.c */
 int qxl_irq_init(struct qxl_device *qdev);
 
-void qxl_debugfs_add_files(struct qxl_device *qdev,
-			   struct drm_info_list *files,
-			   unsigned int nfiles);
-
 int qxl_surface_id_alloc(struct qxl_device *qdev,
 			 struct qxl_bo *surf);
 void qxl_surface_id_dealloc(struct qxl_device *qdev,
-- 
2.49.0

