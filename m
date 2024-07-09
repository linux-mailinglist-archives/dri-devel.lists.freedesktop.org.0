Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962392C042
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D0C10E5F5;
	Tue,  9 Jul 2024 16:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IoLxkR/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47710E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pe8qLXKb4yUucXgdgauPrXmTrAS7zzDlwoQ4pvEUJ9Y=; b=IoLxkR/r8Xw7N+ejo8pS0EQZrA
 vLTWE4kuR5QRZLzj0m50kGTZ/Z+TjBYO1IQsLcLUWv6ExMBgVpeM16tR3ARDksOrUrbzxJGvybIeK
 a6/iqwBDFpPhmQ+5MNDJGQr20XT/7cSC43f1pMJApEX5kyINM4WHNs2dCsv2MMxOQPTjBOXEyE/fI
 3KZBHsgIwL+K5MyJ7vn5U/VF0ePA/YxIxLPocGw3kifYGegruglbF5gA7SE582F1zi4RrHqxi6qTH
 xr/0ItDEbKviZ5BeQZL67fbhkom++TKgzQxSEcbQ4UExL5siycEJxCqpEQlGsUPkmV+4Kb5FWiwOY
 aREdjSQg==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sRDnU-00Cso6-LE; Tue, 09 Jul 2024 18:34:32 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 02/12] drm/v3d: Prefer get_user for scalar types
Date: Tue,  9 Jul 2024 17:34:15 +0100
Message-ID: <20240709163425.58276-3-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240709163425.58276-1-tursulin@igalia.com>
References: <20240709163425.58276-1-tursulin@igalia.com>
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

It makes it just a tiny bit more obvious what is going on.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 263fefc1d04f..5c71e9adfc65 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -483,14 +483,14 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
 	for (int i = 0; i < timestamp.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			kvfree(job->timestamp_query.queries);
 			return -EFAULT;
 		}
 
 		job->timestamp_query.queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			kvfree(job->timestamp_query.queries);
 			return -EFAULT;
 		}
@@ -538,7 +538,7 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
 
 		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			kvfree(job->timestamp_query.queries);
 			return -EFAULT;
 		}
@@ -590,14 +590,14 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
 	for (i = 0; i < copy.count; i++) {
 		u32 offset, sync;
 
-		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
+		if (get_user(offset, offsets++)) {
 			kvfree(job->timestamp_query.queries);
 			return -EFAULT;
 		}
 
 		job->timestamp_query.queries[i].offset = offset;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			kvfree(job->timestamp_query.queries);
 			return -EFAULT;
 		}
@@ -657,14 +657,14 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 		u32 __user *ids_pointer;
 		u32 id;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			kvfree(job->performance_query.queries);
 			return -EFAULT;
 		}
 
 		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 
-		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
+		if (get_user(ids, kperfmon_ids++)) {
 			kvfree(job->performance_query.queries);
 			return -EFAULT;
 		}
@@ -672,7 +672,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
 		ids_pointer = u64_to_user_ptr(ids);
 
 		for (int j = 0; j < reset.nperfmons; j++) {
-			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
+			if (get_user(id, ids_pointer++)) {
 				kvfree(job->performance_query.queries);
 				return -EFAULT;
 			}
@@ -731,14 +731,14 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 		u32 __user *ids_pointer;
 		u32 id;
 
-		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
+		if (get_user(sync, syncs++)) {
 			kvfree(job->performance_query.queries);
 			return -EFAULT;
 		}
 
 		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
 
-		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
+		if (get_user(ids, kperfmon_ids++)) {
 			kvfree(job->performance_query.queries);
 			return -EFAULT;
 		}
@@ -746,7 +746,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
 		ids_pointer = u64_to_user_ptr(ids);
 
 		for (int j = 0; j < copy.nperfmons; j++) {
-			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
+			if (get_user(id, ids_pointer++)) {
 				kvfree(job->performance_query.queries);
 				return -EFAULT;
 			}
-- 
2.44.0

