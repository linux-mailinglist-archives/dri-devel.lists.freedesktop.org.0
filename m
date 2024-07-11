Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2887792E33F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848610E9CA;
	Thu, 11 Jul 2024 09:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nnGgTlLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9A10E9BF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VejI443YtxixA/xjyMAniE9iKJCTzEIRH7QsVttIPgM=; b=nnGgTlLoG0+lB35kIGzWlBLqK8
 nsPhBONvLv7myhc5oJVp8o4vW4PXOY7tVsi/0WTjsluNMKP/NAnj0m5Xq/eMpXfA51YZK/E+1w5yF
 9bpdkCUiEl8N7PhTZQoS8AaMOKc5PAPPSUh//TYC1A2SPYdenTiesJKb1E3RTJPQGa2FBOLDMA2rf
 G1Ueo0J+V0wfzMxR7uR7idPZ9XoSgFgZNAiVy5lsyfWFU7Tb48n984+aHOI+P2U64eZnHufsOHU8O
 ij6ExhA84i2YYxr5nk40rT8H0rMgs0Y+exs5vfjxVx9+stgS9yqJuIQH0uuTnvkXsqowd10hDwFTc
 55KLF8hA==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRptz-00DcKj-N9; Thu, 11 Jul 2024 11:15:47 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 06/11] drm/v3d: Move part of copying of reset/copy performance
 extension to a helper
Date: Thu, 11 Jul 2024 10:15:37 +0100
Message-ID: <20240711091542.82083-7-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240711091542.82083-1-tursulin@igalia.com>
References: <20240711091542.82083-1-tursulin@igalia.com>
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

The only change is replacing copy_from_user with get_user when copying a
scalar.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 152 ++++++++++++++-----------------
 1 file changed, 68 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 3838ebade45d..ce56e31a027d 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -644,15 +644,64 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	return err;
 }
 
+static int
+v3d_copy_query_info(struct v3d_performance_query_info *query_info,
+		    unsigned int count,
+		    unsigned int nperfmons,
+		    u32 __user *syncs,
+		    u64 __user *kperfmon_ids,
+		    struct drm_file *file_priv)
+{
+	unsigned int i, j;
+	int err;
+
+	for (i = 0; i < count; i++) {
+		struct v3d_performance_query *query = &query_info->queries[i];
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
+		query->syncobj = drm_syncobj_find(file_priv, sync);
+		if (!query->syncobj) {
+			err = -ENOENT;
+			goto error;
+		}
+	}
+
+	return 0;
+
+error:
+	v3d_performance_query_info_free(query_info, i);
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
-	unsigned int i, j;
 	int err;
 
 	if (!job) {
@@ -679,50 +728,19 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 	if (!job->performance_query.queries)
 		return -ENOMEM;
 
-	syncs = u64_to_user_ptr(reset.syncs);
-	kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
+	err = v3d_copy_query_info(&job->performance_query,
+				  reset.count,
+				  reset.nperfmons,
+				  u64_to_user_ptr(reset.syncs),
+				  u64_to_user_ptr(reset.kperfmon_ids),
+				  file_priv);
+	if (err)
+		return err;
 
-	for (i = 0; i < reset.count; i++) {
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
-		for (j = 0; j < reset.nperfmons; j++) {
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
-	v3d_performance_query_info_free(&job->performance_query, i);
-	return err;
 }
 
 static int
@@ -730,10 +748,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 					  struct drm_v3d_extension __user *ext,
 					  struct v3d_cpu_job *job)
 {
-	u32 __user *syncs;
-	u64 __user *kperfmon_ids;
 	struct drm_v3d_copy_performance_query copy;
-	unsigned int i, j;
 	int err;
 
 	if (!job) {
@@ -763,42 +778,15 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	if (!job->performance_query.queries)
 		return -ENOMEM;
 
-	syncs = u64_to_user_ptr(copy.syncs);
-	kperfmon_ids = u64_to_user_ptr(copy.kperfmon_ids);
+	err = v3d_copy_query_info(&job->performance_query,
+				  copy.count,
+				  copy.nperfmons,
+				  u64_to_user_ptr(copy.syncs),
+				  u64_to_user_ptr(copy.kperfmon_ids),
+				  file_priv);
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
-		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
-			err = -EFAULT;
-			goto error;
-		}
-
-		ids_pointer = u64_to_user_ptr(ids);
-
-		for (j = 0; j < copy.nperfmons; j++) {
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
@@ -810,10 +798,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 	job->copy.stride = copy.stride;
 
 	return 0;
-
-error:
-	v3d_performance_query_info_free(&job->performance_query, i);
-	return err;
 }
 
 /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
-- 
2.44.0

