Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB15D12670
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D625310E39F;
	Mon, 12 Jan 2026 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iylbdie6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF0710E057
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 11:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uA6RWFe51GZQQm0rn+tbbd4xhduY4H1DsjDK5KHXJXM=; b=iylbdie6UKSYQAZ2nz/TjARCfL
 Zi14xUTf9JUkevVucsTlMWiss7tGwmrcy0tPMwMAK5EcqlCRasSjJUXrIj05fyMW9qWNJtAFdJ7Y0
 NVdsV/NQUr+Cen2+d8lMhs6goWh2V0prlq639oPGxjxw3Oy60BRybx3btTfydJghI/zaSAgLlAVLi
 sq0Yj2sKvO6wEdtY9OgW5tq9JrfH3cZODN0HxRCxNc9iQSkb3+bjAs0Bd66kbrwrD84Hemqg2GyK+
 85YfPRVzCbOqt2GBrPw4mR45PFoJomgBv/sxeRZpTCXSHNNgUJxOhY/zGcoqA0TVFGbJCM/L7Hcft
 bTzzi4bg==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vfGTk-004Nyi-RR; Mon, 12 Jan 2026 12:53:01 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 12 Jan 2026 08:51:36 -0300
Subject: [PATCH v2 1/2] drm/v3d: Consolidate CPU job validation in a function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-v3d-drm-debug-v2-1-8ef6244c97bb@igalia.com>
References: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
In-Reply-To: <20260112-v3d-drm-debug-v2-0-8ef6244c97bb@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4625; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=izswUbUt8u+/Hhi8mzdbX5TOkZQLKm4zTr0NPqi8G1Y=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpZOCWaQJfwP5H8YXnZ68oUAiwCdmBBqaNdaJFn
 Pei305ov/6JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWTglgAKCRA/8w6Kdoj6
 qn8gCACkAbUPGITEn08TWyMLiEFay5b8q2KyA3pHSiX8v/SfYE2h5iwcP6GDnoFEx8P7IbQKQtP
 Hnhd+XTcekO8M+8XKV1dcxXrhhWuwyn4fxwQ8OG/4i8ymrwJYfA5aehpv4HVgj0bYdKLw8ji4MA
 et77YyFxTQwLU+YXa2wRHFSiJsVYi1kzE+ibwlBD84wy8vf92QtalvYO+ryR5ZbCHGq4BqkxtB3
 teHKZIA+3aFosmtI2Z9LdFZrq27rFz4HnuZ7+j+QMrvGijrjzfnjhU6zSnxnaxUcp4z+x+IoEd3
 b+Rtjr5WRke694UAlryE6Ka6H2rrrAjcmrF6dQKxTVXKFSqn
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

All CPU job extension parsers duplicate the same validation procedure:
ensure the extension is attached to a CPU job (not a GPU job) and that
only a single CPU job extension is associated with a given job.

Create a function to consolidate these checks and reduce the boilerplate
across the various CPU job extension handlers. While here, convert the
legacy DRM_DEBUG with a more appropriate drm_dbg().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 74 ++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 7de5a95ee7ca92d480af1f2996c12f2cefa56f34..55e810b7417dc673a0625473d9369c814c18bec6 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -404,6 +404,26 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	return 0;
 }
 
+/* Returns false if the CPU job has an invalid configuration. */
+static bool
+v3d_validate_cpu_job(struct drm_file *file_priv, struct v3d_cpu_job *job)
+{
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct v3d_dev *v3d = v3d_priv->v3d;
+
+	if (!job) {
+		drm_dbg(&v3d->drm, "CPU job extension was attached to a GPU job.\n");
+		return false;
+	}
+
+	if (job->job_type) {
+		drm_dbg(&v3d->drm, "Two CPU job extensions were added to the same CPU job.\n");
+		return false;
+	}
+
+	return true;
+}
+
 /* Get data for the indirect CSD job submission. */
 static int
 v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
@@ -415,15 +435,8 @@ v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
 	struct drm_v3d_indirect_csd indirect_csd;
 	struct v3d_indirect_csd_info *info = &job->indirect_csd;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&indirect_csd, ext, sizeof(indirect_csd)))
 		return -EFAULT;
@@ -458,15 +471,8 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&timestamp, ext, sizeof(timestamp)))
 		return -EFAULT;
@@ -527,15 +533,8 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&reset, ext, sizeof(reset)))
 		return -EFAULT;
@@ -588,15 +587,8 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&copy, ext, sizeof(copy)))
 		return -EFAULT;
@@ -724,15 +716,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	struct drm_v3d_reset_performance_query reset;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&reset, ext, sizeof(reset)))
 		return -EFAULT;
@@ -770,15 +755,8 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	struct drm_v3d_copy_performance_query copy;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(file_priv, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&copy, ext, sizeof(copy)))
 		return -EFAULT;

-- 
2.52.0

