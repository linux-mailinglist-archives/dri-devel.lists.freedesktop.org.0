Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F83D0BDC3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 19:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7371910E925;
	Fri,  9 Jan 2026 18:36:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l/CRJf7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C9810E924
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 18:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOmfpGUVFjiTbeOMawfDgehs0iKflIvzdCSFpqTqmO4=; b=l/CRJf7yauwG1xGVcRDjkgoMUI
 YKQb14zR6dVSvGsFR4gq/w8tUE+9Ll/XAuxlQLL7c0w1ryB2/MpeSK23AttNBmH7fsNCynw5o2RWJ
 RAT+7K0d3/NGVcanjAQz3c0q+KIHV1ifTrf6Qh7goCV195Q3ILNrfwn3/pf8Yu+Rl6JHyem9X6GnX
 JWnRAQqdsuYCQJuBI4bHTwKJk6u3jaVS/SiAOE5Aw7uCvEb2/15XFOPhDmD/lmMd2XkRmFv0NadK6
 2oqmK+0ZR29KNXSVtooyEH5LlXLq8XkuJhFRiy4AXMFNY8/6XRKTMleDz356wBwHNmYQtcTTbZ8W5
 ir5GjEOQ==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1veHLS-003Wwc-Gd; Fri, 09 Jan 2026 19:36:22 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 09 Jan 2026 15:35:51 -0300
Subject: [PATCH 1/2] drm/v3d: Consolidate CPU job validation in a function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-v3d-drm-debug-v1-1-02041c873e4d@igalia.com>
References: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
In-Reply-To: <20260109-v3d-drm-debug-v1-0-02041c873e4d@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8604; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=StqAA+3kgIylrv1Jfe6BX6/lbj1ewnNGsZgCA+JeWHA=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpYUqhRn6u+kq+W4G0vbkZIy0/RhjYezwwZOmey
 WmY0BW6KMaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaWFKoQAKCRA/8w6Kdoj6
 qh8jCACfoW6t3Qzp4UmlD1bID5wXNcJep+JVDkjObCKJu7MdrtQt950xGusX5k5pEqcyuoPPZve
 VhMSiEbs9FVqTJXdfX9P4LKs3Aqz4k4omM/Jtjwe0LuUdHM24dMdGZwluoXd5MkAWUxnNkptvQI
 4e3eHJ6+lB1TRJRDORVhNBYrVMMI8Inm1MKJGtaXEVzMbrhe/yd/BeE3H+UkeFniFHdfRdwQwMM
 sy1eBg4DOmVdkgx4zpSyPML+zeuxqIRNa3FU9xjxqngZxlMLHrqWjZzQdvlSAl92Srbxwu2DZba
 84y4JGO8Bn4tonx31UMEPHpEaJGtCM7r8uJnzmsS5PMgbh4y
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
 drivers/gpu/drm/v3d/v3d_submit.c | 111 ++++++++++++++++-----------------------
 1 file changed, 46 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 7de5a95ee7ca92d480af1f2996c12f2cefa56f34..4eb2aa0c207cd5f41519340a02663cc88b0e12c6 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -404,27 +404,36 @@ v3d_get_multisync_submit_deps(struct drm_file *file_priv,
 	return 0;
 }
 
-/* Get data for the indirect CSD job submission. */
-static int
-v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
-				struct drm_v3d_extension __user *ext,
-				struct v3d_cpu_job *job)
+/* Returns false if the CPU job has an invalid configuration. */
+static bool
+v3d_validate_cpu_job(struct v3d_dev *v3d, struct v3d_cpu_job *job)
 {
-	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
-	struct v3d_dev *v3d = v3d_priv->v3d;
-	struct drm_v3d_indirect_csd indirect_csd;
-	struct v3d_indirect_csd_info *info = &job->indirect_csd;
-
 	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
-		return -EINVAL;
+		drm_dbg(&v3d->drm, "CPU job extension was attached to a GPU job.\n");
+		return false;
 	}
 
 	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
+		drm_dbg(&v3d->drm, "Two CPU job extensions were added to the same CPU job.\n");
+		return false;
 	}
 
+	return true;
+}
+
+/* Get data for the indirect CSD job submission. */
+static int
+v3d_get_cpu_indirect_csd_params(struct v3d_dev *v3d,
+				struct drm_file *file_priv,
+				struct drm_v3d_extension __user *ext,
+				struct v3d_cpu_job *job)
+{
+	struct drm_v3d_indirect_csd indirect_csd;
+	struct v3d_indirect_csd_info *info = &job->indirect_csd;
+
+	if (!v3d_validate_cpu_job(v3d, job))
+		return -EINVAL;
+
 	if (copy_from_user(&indirect_csd, ext, sizeof(indirect_csd)))
 		return -EFAULT;
 
@@ -448,7 +457,8 @@ v3d_get_cpu_indirect_csd_params(struct drm_file *file_priv,
 
 /* Get data for the query timestamp job submission. */
 static int
-v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
+v3d_get_cpu_timestamp_query_params(struct v3d_dev *v3d,
+				   struct drm_file *file_priv,
 				   struct drm_v3d_extension __user *ext,
 				   struct v3d_cpu_job *job)
 {
@@ -458,15 +468,8 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(v3d, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&timestamp, ext, sizeof(timestamp)))
 		return -EFAULT;
@@ -517,7 +520,8 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 }
 
 static int
-v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
+v3d_get_cpu_reset_timestamp_params(struct v3d_dev *v3d,
+				   struct drm_file *file_priv,
 				   struct drm_v3d_extension __user *ext,
 				   struct v3d_cpu_job *job)
 {
@@ -527,15 +531,8 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(v3d, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&reset, ext, sizeof(reset)))
 		return -EFAULT;
@@ -578,7 +575,8 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 /* Get data for the copy timestamp query results job submission. */
 static int
-v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
+v3d_get_cpu_copy_query_results_params(struct v3d_dev *v3d,
+				      struct drm_file *file_priv,
 				      struct drm_v3d_extension __user *ext,
 				      struct v3d_cpu_job *job)
 {
@@ -588,15 +586,8 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	unsigned int i;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(v3d, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&copy, ext, sizeof(copy)))
 		return -EFAULT;
@@ -716,7 +707,8 @@ v3d_copy_query_info(struct v3d_performance_query_info *query_info,
 }
 
 static int
-v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
+v3d_get_cpu_reset_performance_params(struct v3d_dev *v3d,
+				     struct drm_file *file_priv,
 				     struct drm_v3d_extension __user *ext,
 				     struct v3d_cpu_job *job)
 {
@@ -724,15 +716,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	struct drm_v3d_reset_performance_query reset;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(v3d, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&reset, ext, sizeof(reset)))
 		return -EFAULT;
@@ -762,7 +747,8 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 }
 
 static int
-v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
+v3d_get_cpu_copy_performance_query_params(struct v3d_dev *v3d,
+					  struct drm_file *file_priv,
 					  struct drm_v3d_extension __user *ext,
 					  struct v3d_cpu_job *job)
 {
@@ -770,15 +756,8 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	struct drm_v3d_copy_performance_query copy;
 	int err;
 
-	if (!job) {
-		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
+	if (!v3d_validate_cpu_job(v3d, job))
 		return -EINVAL;
-	}
-
-	if (job->job_type) {
-		DRM_DEBUG("Two CPU job extensions were added to the same CPU job.\n");
-		return -EINVAL;
-	}
 
 	if (copy_from_user(&copy, ext, sizeof(copy)))
 		return -EFAULT;
@@ -826,6 +805,8 @@ v3d_get_extensions(struct drm_file *file_priv,
 		   struct v3d_submit_ext *se,
 		   struct v3d_cpu_job *job)
 {
+	struct v3d_file_priv *v3d_priv = file_priv->driver_priv;
+	struct v3d_dev *v3d = v3d_priv->v3d;
 	struct drm_v3d_extension __user *user_ext;
 	int ret;
 
@@ -843,22 +824,22 @@ v3d_get_extensions(struct drm_file *file_priv,
 			ret = v3d_get_multisync_submit_deps(file_priv, user_ext, se);
 			break;
 		case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
-			ret = v3d_get_cpu_indirect_csd_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_indirect_csd_params(v3d, file_priv, user_ext, job);
 			break;
 		case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
-			ret = v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_timestamp_query_params(v3d, file_priv, user_ext, job);
 			break;
 		case DRM_V3D_EXT_ID_CPU_RESET_TIMESTAMP_QUERY:
-			ret = v3d_get_cpu_reset_timestamp_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_reset_timestamp_params(v3d, file_priv, user_ext, job);
 			break;
 		case DRM_V3D_EXT_ID_CPU_COPY_TIMESTAMP_QUERY:
-			ret = v3d_get_cpu_copy_query_results_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_copy_query_results_params(v3d, file_priv, user_ext, job);
 			break;
 		case DRM_V3D_EXT_ID_CPU_RESET_PERFORMANCE_QUERY:
-			ret = v3d_get_cpu_reset_performance_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_reset_performance_params(v3d, file_priv, user_ext, job);
 			break;
 		case DRM_V3D_EXT_ID_CPU_COPY_PERFORMANCE_QUERY:
-			ret = v3d_get_cpu_copy_performance_query_params(file_priv, user_ext, job);
+			ret = v3d_get_cpu_copy_performance_query_params(v3d, file_priv, user_ext, job);
 			break;
 		default:
 			DRM_DEBUG_DRIVER("Unknown extension id: %d\n", ext.id);

-- 
2.52.0

