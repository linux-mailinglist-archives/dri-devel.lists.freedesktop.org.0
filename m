Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9C92D30A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169A310E7C1;
	Wed, 10 Jul 2024 13:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="E1j30c55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603C110E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4T4MjHY+OCHVuDQqYU7WhU9bcjjVdjAmjGdYyngyGPg=; b=E1j30c553Zuq1ZvD9fLyBoUSjD
 3n2LPyyRbxdmrhBcmzbwWhSV0MxFux7BOgTCq02aenghhLQqd5j9hiTZGimBBk4qgvVQfOmvzhU1z
 cY/WMgANdR4e6MLJ5TyfVHAWttv1iSTAW8dfr1RJkR0I/CcMbjK+srS4+7yoUzj/spM4pCsSeDce8
 dgDZNZsKk8WqX6CfaKGPAsta+VGQCd+3U+LO1okIbjnQh3h7dtYrReis1ZLqx5Wd2aLtbP2HaKHHR
 71KDXEtMX9q9Nc+29b+6qyJfDR1QDoc2fIO4nQEYFKGqYfgcF3sYVnODDGFnxjhJH3O5LAuvAdFmg
 gzesls9w==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRXZh-00DH1H-L9; Wed, 10 Jul 2024 15:41:37 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 06/12] drm/v3d: Move part of copying of reset/copy performance
 extension to a helper
Date: Wed, 10 Jul 2024 14:41:24 +0100
Message-ID: <20240710134130.17292-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710134130.17292-1-tursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

The loop which looks up the syncobj and copies the kperfmon ids is
identical so lets move it to a helper.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 148 +++++++++++++------------------
 1 file changed, 64 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index b51600e236c8..35682433f75b 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -641,13 +641,63 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	return err;
 }
 
+static int
+copy_query_info(struct v3d_performance_query_info *qinfo,
+		unsigned int count,
+		unsigned int nperfmons,
+		u32 __user *syncs,
+		u64 __user *kperfmon_ids,
+		struct drm_file *fpriv)
+{
+	unsigned int i, j;
+	int err;
+
+	for (i = 0; i < count; i++) {
+		struct v3d_performance_query *query = &qinfo->queries[i];
+		u32 __user *ids_pointer;
+		u32 sync, id;
+		u64 ids;
+
+		if (get_user(sync, syncs++)) {
+			err = -EFAULT;
+			goto error;
+		}
+
+		if (get_user(ids, kperfmon_ids++)) {
+			err = -EFAULT;
+			goto error;
+		}
+
+		ids_pointer = u64_to_user_ptr(ids);
+
+		for (j = 0; j < nperfmons; j++) {
+			if (get_user(id, ids_pointer++)) {
+				err = -EFAULT;
+				goto error;
+			}
+
+			query->kperfmon_ids[j] = id;
+		}
+
+		query->syncobj = drm_syncobj_find(fpriv, sync);
+		if (!query->syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
+	}
+
+	return 0;
+
+error:
+	__v3d_performance_query_info_free(qinfo, i);
+	return err;
+}
+
 static int
 v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 				     struct drm_v3d_extension __user *ext,
 				     struct v3d_cpu_job *job)
 {
-	u32 __user *syncs;
-	u64 __user *kperfmon_ids;
 	struct drm_v3d_reset_performance_query reset;
 	int err;
 
@@ -675,50 +725,17 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	if (!job->performance_query.queries)
 		return -ENOMEM;
 
-	syncs = u64_to_user_ptr(reset.syncs);
-	kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
+	err = copy_query_info(qinfo, reset.count, reset.nperfmons,
+			      u64_to_user_ptr(reset.syncs),
+			      u64_to_user_ptr(reset.kperfmon_ids),
+			      file_priv);
+	if (err)
+		return err;
 
-	for (int i = 0; i < reset.count; i++) {
-		u32 sync;
-		u64 ids;
-		u32 __user *ids_pointer;
-		u32 id;
-
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
-			err = -EFAULT;
-			goto error;
-		}
-
-		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
-			err = -EFAULT;
-			goto error;
-		}
-
-		ids_pointer = u64_to_user_ptr(ids);
-
-		for (int j = 0; j < reset.nperfmons; j++) {
-			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
-				err = -EFAULT;
-				goto error;
-			}
-
-			job->performance_query.queries[i].kperfmon_ids[j] = id;
-		}
-
-		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->performance_query.queries[i].syncobj) {
-			err = -ENOENT;
-			goto error;
-		}
-	}
 	job->performance_query.count = reset.count;
 	job->performance_query.nperfmons = reset.nperfmons;
 
 	return 0;
-
-error:
-	__v3d_performance_query_info_free(qinfo, i);
-	return err;
 }
 
 static int
@@ -726,8 +743,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 					  struct drm_v3d_extension __user *ext,
 					  struct v3d_cpu_job *job)
 {
-	u32 __user *syncs;
-	u64 __user *kperfmon_ids;
 	struct drm_v3d_copy_performance_query copy;
 	int err;
 
@@ -758,44 +773,13 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	if (!job->performance_query.queries)
 		return -ENOMEM;
 
-	syncs = u64_to_user_ptr(copy.syncs);
-	kperfmon_ids = u64_to_user_ptr(copy.kperfmon_ids);
+	err = copy_query_info(qinfo, copy.count, copy.nperfmons,
+			      u64_to_user_ptr(copy.syncs),
+			      u64_to_user_ptr(copy.kperfmon_ids),
+			      file_priv);
+	if (err)
+		return err;
 
-	for (int i = 0; i < copy.count; i++) {
-		u32 sync;
-		u64 ids;
-		u32 __user *ids_pointer;
-		u32 id;
-
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
-			err = -EFAULT;
-			goto error;
-		}
-
-		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-
-		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
-			err = -EFAULT;
-			goto error;
-		}
-
-		ids_pointer = u64_to_user_ptr(ids);
-
-		for (int j = 0; j < copy.nperfmons; j++) {
-			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
-				err = -EFAULT;
-				goto error;
-			}
-
-			job->performance_query.queries[i].kperfmon_ids[j] = id;
-		}
-
-		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
-		if (!job->performance_query.queries[i].syncobj) {
-			err = -ENOENT;
-			goto error;
-		}
-	}
 	job->performance_query.count = copy.count;
 	job->performance_query.nperfmons = copy.nperfmons;
 	job->performance_query.ncounters = copy.ncounters;
@@ -807,10 +791,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	job->copy.stride = copy.stride;
 
 	return 0;
-
-error:
-	__v3d_performance_query_info_free(qinfo, i);
-	return err;
 }
 
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
-- 
2.44.0

