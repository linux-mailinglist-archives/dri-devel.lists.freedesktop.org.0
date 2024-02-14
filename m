Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2DB8543D8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 09:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531310E46E;
	Wed, 14 Feb 2024 08:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJhUl3ZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B2310E45C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707898396; x=1739434396;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=44H5J12+HW3H8iq5nXzGAmaCCE7EcAQKRqFEdikLZYI=;
 b=lJhUl3ZOjDEeBu1hxdHu5wvTsEbHEZW2DoZkAGzfdR/1sQUPj4IuPMQ4
 6c/RKFd8M2StdWMZqzCe3v7PCpbPGDVGpJyDxFdwUP8KakvsLQvNrqbaD
 2ivr0PXQcvZPddtOGnkYYNS8l+5tp1HwvZ/a35jlouRqwhiimDO11KRUp
 D67qnFrcNB4ztpfb6TaaPQ7fwuhPAQU0MP2FTK+rICbEDIu3R92gDSEvo
 hfV6azEW83HOxjbL9yPXnZjvD2DnKrSp4XTYVgmxQBYTK/6lwXRfgIvkM
 02ZQ+5zP3/OGWEZSnGCDvU4VMrrXhEsmRW4Orcu2Vn755253CyZJgADi1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12651663"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12651663"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3407416"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:13:14 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>
Subject: [PATCH 5/8] accel/ivpu: Use lazy allocation for doorbell IDs
Date: Wed, 14 Feb 2024 09:13:02 +0100
Message-ID: <20240214081305.290108-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
References: <20240214081305.290108-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

Reserve/allocate and free doorbells for command queues when needed
using xarray. This allows to avoid reserving a doorbell for
a contexts that never issues a job.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  4 ++++
 drivers/accel/ivpu/ivpu_drv.h |  5 +++++
 drivers/accel/ivpu/ivpu_job.c | 16 +++++++++++++---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 9418c73ee8ef..a0461e3caeec 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -533,6 +533,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	atomic64_set(&vdev->unique_id_counter, 0);
 	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
 	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
+	xa_init_flags(&vdev->db_xa, XA_FLAGS_ALLOC1);
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 	INIT_LIST_HEAD(&vdev->bo_list);
 
@@ -606,6 +607,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	if (IVPU_WA(d3hot_after_power_off))
 		pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D3hot);
 err_xa_destroy:
+	xa_destroy(&vdev->db_xa);
 	xa_destroy(&vdev->submitted_jobs_xa);
 	xa_destroy(&vdev->context_xa);
 	return ret;
@@ -641,6 +643,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
 	ivpu_mmu_reserved_context_fini(vdev);
 	ivpu_mmu_global_context_fini(vdev);
 
+	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->db_xa));
+	xa_destroy(&vdev->db_xa);
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->submitted_jobs_xa));
 	xa_destroy(&vdev->submitted_jobs_xa);
 	drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->context_xa));
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 069ace4adb2d..03454f16a535 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -36,6 +36,9 @@
 #define IVPU_USER_CONTEXT_MIN_SSID     2
 #define IVPU_USER_CONTEXT_MAX_SSID     (IVPU_USER_CONTEXT_MIN_SSID + 63)
 
+#define IVPU_MIN_DB 1
+#define IVPU_MAX_DB 255
+
 #define IVPU_NUM_ENGINES 2
 
 #define IVPU_PLATFORM_SILICON 0
@@ -119,6 +122,8 @@ struct ivpu_device {
 	struct xarray context_xa;
 	struct xa_limit context_xa_limit;
 
+	struct xarray db_xa;
+
 	struct mutex bo_list_lock; /* Protects bo_list */
 	struct list_head bo_list;
 
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index 0440bee3ecaf..d01a1a5a272d 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -30,19 +30,26 @@ static void ivpu_cmdq_ring_db(struct ivpu_device *vdev, struct ivpu_cmdq *cmdq)
 
 static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 engine)
 {
+	struct xa_limit db_xa_limit = {.max = IVPU_MAX_DB, .min = IVPU_MIN_DB};
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct vpu_job_queue_header *jobq_header;
 	struct ivpu_cmdq *cmdq;
+	int ret;
 
 	cmdq = kzalloc(sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
 		return NULL;
 
+	ret = xa_alloc(&vdev->db_xa, &cmdq->db_id, NULL, db_xa_limit, GFP_KERNEL);
+	if (ret) {
+		ivpu_err(vdev, "Failed to allocate doorbell id: %d\n", ret);
+		goto err_free_cmdq;
+	}
+
 	cmdq->mem = ivpu_bo_alloc_internal(vdev, 0, SZ_4K, DRM_IVPU_BO_WC);
 	if (!cmdq->mem)
-		goto cmdq_free;
+		goto err_erase_xa;
 
-	cmdq->db_id = file_priv->ctx.id + engine * ivpu_get_context_count(vdev);
 	cmdq->entry_count = (u32)((ivpu_bo_size(cmdq->mem) - sizeof(struct vpu_job_queue_header)) /
 				  sizeof(struct vpu_job_queue_entry));
 
@@ -55,7 +62,9 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv, u16 e
 
 	return cmdq;
 
-cmdq_free:
+err_erase_xa:
+	xa_erase(&vdev->db_xa, cmdq->db_id);
+err_free_cmdq:
 	kfree(cmdq);
 	return NULL;
 }
@@ -66,6 +75,7 @@ static void ivpu_cmdq_free(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *c
 		return;
 
 	ivpu_bo_free_internal(cmdq->mem);
+	xa_erase(&file_priv->vdev->db_xa, cmdq->db_id);
 	kfree(cmdq);
 }
 
-- 
2.43.0

