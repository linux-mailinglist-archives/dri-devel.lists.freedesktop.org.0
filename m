Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBBD98AD72
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 21:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F86C10E58C;
	Mon, 30 Sep 2024 19:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKrC7jjl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0910E586
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727726034; x=1759262034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NDNcoIsyf0sGbqkM7hXXm6hEIRwSAohRi6ymbbaIQm0=;
 b=PKrC7jjlnnDnb2S4eASTSjGDMx3xUBo5BjM2tJ+BCuc8gbqPVqvnNf1e
 s5u5bELC7LwcTBhDbuBklYnTshloG6H7FEbwiZn67zDlAvJahnFOalfsL
 s/mEpAmhOi1ZffNoz4iCmZdGjHhFd8d+eGOdGdFVD/Q2KUwq3pCLmcbrW
 bqQnq8H9cJJD0Zbiut9Z65GVnkLZs7qShxkIECLTk6TN1WFwiUfoHsSYC
 nir+rc/PbXGA4UPBmU/pIWp8FNhESSbRMA1kCVmSXLbhvPkHTVFc3RePS
 D+kdsmERAwxdXwZdIu9MTdkMdEC7MixAQQqWZxus7RUh5qEPURsXxbk8K A==;
X-CSE-ConnectionGUID: Hr8YIukmQL+QX9M7NgQ+Yw==
X-CSE-MsgGUID: 8byeYuf6Qem1p3L26ti5TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="26962345"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="26962345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:54 -0700
X-CSE-ConnectionGUID: iwOC1ELdT5epsAUprC3xVg==
X-CSE-MsgGUID: b/QA2sJfRLydUEi7y2229A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73370125"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 12:53:52 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH v2 18/31] accel/ivpu: Make DB_ID and JOB_ID allocations
 incremental
Date: Mon, 30 Sep 2024 21:53:09 +0200
Message-ID: <20240930195322.461209-19-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
References: <20240930195322.461209-1-jacek.lawrynowicz@linux.intel.com>
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

From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>

Save last used ID and use it to limit the possible values
for the ID. This should decrease the rate at which the IDs
are reused, which will make debugging easier.

Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c |  9 +++++++++
 drivers/accel/ivpu/ivpu_drv.h |  7 +++++++
 drivers/accel/ivpu/ivpu_job.c | 37 +++++++++++++++++++++++++----------
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index fcf26e6d4e9c2..ffb8309a4f657 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -260,6 +260,11 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
 	if (ret)
 		goto err_xa_erase;
 
+	file_priv->default_job_limit.min = FIELD_PREP(IVPU_JOB_ID_CONTEXT_MASK,
+						      (file_priv->ctx.id - 1));
+	file_priv->default_job_limit.max = file_priv->default_job_limit.min | IVPU_JOB_ID_JOB_MASK;
+	file_priv->job_limit = file_priv->default_job_limit;
+
 	mutex_unlock(&vdev->context_list_lock);
 	drm_dev_exit(idx);
 
@@ -614,6 +619,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
 	lockdep_set_class(&vdev->submitted_jobs_xa.xa_lock, &submitted_jobs_xa_lock_class_key);
 	INIT_LIST_HEAD(&vdev->bo_list);
 
+	vdev->default_db_limit.min = IVPU_MIN_DB;
+	vdev->default_db_limit.max = IVPU_MAX_DB;
+	vdev->db_limit = vdev->default_db_limit;
+
 	ret = drmm_mutex_init(&vdev->drm, &vdev->context_list_lock);
 	if (ret)
 		goto err_xa_destroy;
diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
index c4bd8757f8ded..9acef14deab57 100644
--- a/drivers/accel/ivpu/ivpu_drv.h
+++ b/drivers/accel/ivpu/ivpu_drv.h
@@ -45,6 +45,9 @@
 #define IVPU_MIN_DB 1
 #define IVPU_MAX_DB 255
 
+#define IVPU_JOB_ID_JOB_MASK		GENMASK(7, 0)
+#define IVPU_JOB_ID_CONTEXT_MASK	GENMASK(31, 8)
+
 #define IVPU_NUM_ENGINES       2
 #define IVPU_NUM_PRIORITIES    4
 #define IVPU_NUM_CMDQS_PER_CTX (IVPU_NUM_ENGINES * IVPU_NUM_PRIORITIES)
@@ -135,6 +138,8 @@ struct ivpu_device {
 	struct xa_limit context_xa_limit;
 
 	struct xarray db_xa;
+	struct xa_limit db_limit;
+	struct xa_limit default_db_limit;
 
 	struct mutex bo_list_lock; /* Protects bo_list */
 	struct list_head bo_list;
@@ -170,6 +175,8 @@ struct ivpu_file_priv {
 	struct mutex ms_lock; /* Protects ms_instance_list, ms_info_bo */
 	struct list_head ms_instance_list;
 	struct ivpu_bo *ms_info_bo;
+	struct xa_limit job_limit;
+	struct xa_limit default_job_limit;
 	bool has_mmu_faults;
 	bool bound;
 	bool aborted;
diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
index b1abdca5891cd..8798fb2046abc 100644
--- a/drivers/accel/ivpu/ivpu_job.c
+++ b/drivers/accel/ivpu/ivpu_job.c
@@ -21,8 +21,6 @@
 #include "vpu_boot_api.h"
 
 #define CMD_BUF_IDX	     0
-#define JOB_ID_JOB_MASK	     GENMASK(7, 0)
-#define JOB_ID_CONTEXT_MASK  GENMASK(31, 8)
 #define JOB_MAX_BUFFER_COUNT 65535
 
 static void ivpu_cmdq_ring_db(struct ivpu_device *vdev, struct ivpu_cmdq *cmdq)
@@ -77,9 +75,28 @@ static void ivpu_preemption_buffers_free(struct ivpu_device *vdev,
 	ivpu_bo_free(cmdq->secondary_preempt_buf);
 }
 
+static int ivpu_id_alloc(struct xarray *xa, u32 *id, void *entry, struct xa_limit *limit,
+			 const struct xa_limit default_limit)
+{
+	int ret;
+
+	ret = __xa_alloc(xa, id, entry, *limit, GFP_KERNEL);
+	if (ret) {
+		limit->min = default_limit.min;
+		ret = __xa_alloc(xa, id, entry, *limit, GFP_KERNEL);
+		if (ret)
+			return ret;
+	}
+
+	limit->min = *id + 1;
+	if (limit->min > limit->max)
+		limit->min = default_limit.min;
+
+	return ret;
+}
+
 static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 {
-	struct xa_limit db_xa_limit = {.max = IVPU_MAX_DB, .min = IVPU_MIN_DB};
 	struct ivpu_device *vdev = file_priv->vdev;
 	struct ivpu_cmdq *cmdq;
 	int ret;
@@ -88,7 +105,10 @@ static struct ivpu_cmdq *ivpu_cmdq_alloc(struct ivpu_file_priv *file_priv)
 	if (!cmdq)
 		return NULL;
 
-	ret = xa_alloc(&vdev->db_xa, &cmdq->db_id, NULL, db_xa_limit, GFP_KERNEL);
+	xa_lock(&vdev->db_xa); /* lock here to protect db_limit */
+	ret = ivpu_id_alloc(&vdev->db_xa, &cmdq->db_id, NULL, &vdev->db_limit,
+			    vdev->default_db_limit);
+	xa_unlock(&vdev->db_xa);
 	if (ret) {
 		ivpu_err(vdev, "Failed to allocate doorbell id: %d\n", ret);
 		goto err_free_cmdq;
@@ -519,7 +539,6 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 {
 	struct ivpu_file_priv *file_priv = job->file_priv;
 	struct ivpu_device *vdev = job->vdev;
-	struct xa_limit job_id_range;
 	struct ivpu_cmdq *cmdq;
 	bool is_first_job;
 	int ret;
@@ -530,7 +549,7 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 
 	mutex_lock(&file_priv->lock);
 
-	cmdq = ivpu_cmdq_acquire(job->file_priv, job->engine_idx, priority);
+	cmdq = ivpu_cmdq_acquire(file_priv, job->engine_idx, priority);
 	if (!cmdq) {
 		ivpu_warn_ratelimited(vdev, "Failed to get job queue, ctx %d engine %d prio %d\n",
 				      file_priv->ctx.id, job->engine_idx, priority);
@@ -538,12 +557,10 @@ static int ivpu_job_submit(struct ivpu_job *job, u8 priority)
 		goto err_unlock_file_priv;
 	}
 
-	job_id_range.min = FIELD_PREP(JOB_ID_CONTEXT_MASK, (file_priv->ctx.id - 1));
-	job_id_range.max = job_id_range.min | JOB_ID_JOB_MASK;
-
 	xa_lock(&vdev->submitted_jobs_xa);
 	is_first_job = xa_empty(&vdev->submitted_jobs_xa);
-	ret = __xa_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, job_id_range, GFP_KERNEL);
+	ret = ivpu_id_alloc(&vdev->submitted_jobs_xa, &job->job_id, job, &file_priv->job_limit,
+			    file_priv->default_job_limit);
 	if (ret) {
 		ivpu_dbg(vdev, JOB, "Too many active jobs in ctx %d\n",
 			 file_priv->ctx.id);
-- 
2.45.1

