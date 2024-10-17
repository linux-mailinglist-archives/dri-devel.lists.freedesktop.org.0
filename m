Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1E9A25C2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4707D10E348;
	Thu, 17 Oct 2024 14:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kli0z9/X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 262F810E856
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729177112; x=1760713112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qCFeNHyhxbOKLnwcJRyagreVCQZozcnbbACnPeeUSqM=;
 b=kli0z9/X0vyBrZPbphEnBd0jlS5CYb14eQ/7WvJBv07QhzZDfF/9WDia
 /JhUvLzVUFT5flyKSrl2HWYYH4Kk4Kaye/IvyY1MtCRCT9dmvydEeo0Gk
 4V8aac5ZgXnM1Epdyhum9X5W4plV8dMm0xTKM3TfmzkVTyytQsdrCg8MR
 JGDzHjS1qw19Z9nEEhSrQDTCx62GOPbwZt4xHxgwAEhKDXwLie3g+pC+z
 xE9rD/er3O+ktmCrqJhWtEZHnd+cB+4bZmtie+qrOIeYN2vH6mHPfWJ7N
 W7R+3FJBG0HYuxfp1rea7TgQnWtsOsH6QVTFz0DjLaxvwE136Ir/kFoNH Q==;
X-CSE-ConnectionGUID: L0c8LACXTNCJPaDsVEDjVQ==
X-CSE-MsgGUID: 0BIE6mLmS5exER1bkjytfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39790344"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39790344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:32 -0700
X-CSE-ConnectionGUID: fLhXQO8RQaGHi0O5TRJTcw==
X-CSE-MsgGUID: INLLXyVlSumzvn4quEGKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="109374536"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 07:58:31 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 06/11] accel/ivpu: Use xa_alloc_cyclic() instead of custom
 function
Date: Thu, 17 Oct 2024 16:58:12 +0200
Message-ID: <20241017145817.121590-7-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
References: <20241017145817.121590-1-jacek.lawrynowicz@linux.intel.com>
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

From: Karol Wachowski <karol.wachowski@intel.com>

Remove custom ivpu_id_alloc() wrapper used for ID allocations
and replace it with standard xa_alloc_cyclic() API.

The idea behind ivpu_id_alloc() was to have monotonic IDs, so the driver
is easier to debug because same IDs are not reused all over. The same
can be achieved just by using appropriate Linux API.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 11 ++++-------
 drivers/accel/ivpu/ivpu_drv.h |  4 ++--
 drivers/accel/ivpu/ivpu_job.c | 34 ++++++----------------------------
 3 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 34e3e9b1c3f23..383e3eb988983 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -256,10 +256,8 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 
 	ivpu_mmu_context_init(vdev, &file_priv->ctx, ctx_id);
 
-	file_priv->default_job_limit.min = FIELD_PREP(IVPU_JOB_ID_CONTEXT_MASK,
-						      (file_priv->ctx.id - 1));
-	file_priv->default_job_limit.max = file_priv->default_job_limit.min | IVPU_JOB_ID_JOB_MASK;
-	file_priv->job_limit = file_priv->default_job_limit;
+	file_priv->job_limit.min = FIELD_PREP(IVPU_JOB_ID_CONTEXT_MASK, (file_priv->ctx.id - 1));
+	file_priv->job_limit.max = file_priv->job_limit.min | IVPU_JOB_ID_JOB_MASK;
 
 	mutex_unlock(&vdev->context_list_lock);
 	drm_dev_exit(idx);
@@ -618,9 +616,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 	INIT_LIST_HEAD(&vdev->bo_list);
 
-	vdev->default_db_limit.min = IVPU_MIN_DB;
-	vdev->default_db_limit.max = IVPU_MAX_DB;
-	vdev->db_limit = vdev->default_db_limit;
+	vdev->db_limit.min = IVPU_MIN_DB;
+	vdev->db_limit.max = IVPU_MAX_DB;
 
 	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
 	if (ret)
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index 5b4f5104b4708..6774402821706 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -137,7 +137,7 @@ struct ivpu_device {
 
 	struct xarray db_xa;
 	struct xa_limit db_limit;
-	struct xa_limit default_db_limit;
+	u32 db_next;
 
 	struct mutex bo_list_lock; /* Protects bo_list */
 	struct list_head bo_list;
@@ -174,7 +174,7 @@ struct ivpu_file_priv {
 	struct list_head ms_instance_list;
 	struct ivpu_bo *ms_info_bo;
 	struct xa_limit job_limit;
-	struct xa_limit default_job_limit;
+	u32 job_id_next;
 	bool has_mmu_faults;
 	bool bound;
 	bool aborted;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index f580959e87787..9154c2e14245f 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -72,26 +72,6 @@ static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 		ivpu_bo_free(cmdq->secondary_preempt_buf);
 }
 
-static int ivpu_id_alloc(struct xarray *xa, u32 *id, void *entry, struct xa_limit *limit,
-			 const struct xa_limit default_limit)
-{
-	int ret;
-
-	ret = __xa_alloc(xa, id, entry, *limit, GFP_KERNEL);
-	if (ret) {
-		limit->min = default_limit.min;
-		ret = __xa_alloc(xa, id, entry, *limit, GFP_KERNEL);
-		if (ret)
-			return ret;
-	}
-
-	limit->min = *id + 1;
-	if (limit->min > limit->max)
-		limit->min = default_limit.min;
-
-	return ret;
-}
-
 static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 {
 	struct ivpu_device *vdev = file_priv->vdev;
@@ -102,11 +82,9 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 	if (!cmdq)
 		return NULL;
 
-	xa_lock(&vdev->db_xa); /* lock here to protect db_limit */
-	ret = ivpu_id_alloc(&vdev->db_xa, &cmdq->db_id, NULL, &vdev->db_limit,
-			    vdev->default_db_limit);
-	xa_unlock(&vdev->db_xa);
-	if (ret) {
+	ret = xa_alloc_cyclic(&vdev->db_xa, &cmdq->db_id, NULL, vdev->db_limit, &vdev->db_next,
+			      GFP_KERNEL);
+	if (ret < 0) {
 		ivpu_err(vdev, "Failed to allocate doorbell id: %d\n", ret);
 		goto err_free_cmdq;
 	}
@@ -554,9 +532,9 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 
 	xa_lock(&vdev->submitted_jobs_xa);
 	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
-	ret = ivpu_id_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, &file_priv->job_limit,
-			    file_priv->default_job_limit);
-	if (ret) {
+	ret = __xa_alloc_cyclic(&vdev->submitted_jobs_xa, &job->job_id, job, file_priv->job_limit,
+				&file_priv->job_id_next, GFP_KERNEL);
+	if (ret < 0) {
 		ivpu_dbg(vdev, JOB, "Too many active jobs in ctx %d\n",
 			 file_priv->ctx.id);
 		ret = -EBUSY;
-- 
2.45.1

