Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7137B7E74D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1E410E824;
	Wed, 17 Sep 2025 12:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="sbPRnCzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76ECD10E6CC
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 12:48:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1758113335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TiaWWMmA4l2mfP0OCdPgQRCb3x/JTIPqidsTLh1XN9s=;
 b=sbPRnCzSsxxCrzazynSe3H4/b8rEeOMKddP2ipR3Tp80bBarLrRs44lF8/Y6AUeDSLcZ26
 v++lr0DMKLkvgujFYOzfLWo45B2DPQkLl95HuPxipNSGbG6O/yUQ/IOZM5tD4V9KiHt7XD
 hl5hMNfLdMhlgfTbZl/+rObFa9FeeJ4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] accel/qaic: Replace kcalloc + copy_from_user with
 memdup_array_user
Date: Wed, 17 Sep 2025 14:48:06 +0200
Message-ID: <20250917124805.90395-4-thorsten.blum@linux.dev>
In-Reply-To: <20250917124805.90395-2-thorsten.blum@linux.dev>
References: <20250917124805.90395-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Replace kcalloc() followed by copy_from_user() with memdup_array_user()
to improve and simplify both __qaic_execute_bo_ioctl() and
qaic_perf_stats_bo_ioctl().

In __qaic_execute_bo_ioctl(), return early if an error occurs and remove
the obsolete 'free_exec' label.

Since memdup_array_user() already checks for multiplication overflow,
remove the manual check in __qaic_execute_bo_ioctl(). Remove any unused
local variables accordingly.

Since 'ret = copy_from_user()' has been removed, initialize 'ret = 0' to
preserve the same return value on success.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/accel/qaic/qaic_data.c | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 202bdca58847..adabc4028bb2 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1295,8 +1295,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	int usr_rcu_id, qdev_rcu_id;
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
-	u8 __user *user_data;
-	unsigned long n;
 	u64 received_ts;
 	u32 queue_level;
 	u64 submit_ts;
@@ -1309,20 +1307,12 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	received_ts = ktime_get_ns();
 
 	size = is_partial ? sizeof(struct qaic_partial_execute_entry) : sizeof(*exec);
-	n = (unsigned long)size * args->hdr.count;
-	if (args->hdr.count == 0 || n / args->hdr.count != size)
+	if (args->hdr.count == 0)
 		return -EINVAL;
 
-	user_data = u64_to_user_ptr(args->data);
-
-	exec = kcalloc(args->hdr.count, size, GFP_KERNEL);
-	if (!exec)
-		return -ENOMEM;
-
-	if (copy_from_user(exec, user_data, n)) {
-		ret = -EFAULT;
-		goto free_exec;
-	}
+	exec = memdup_array_user(u64_to_user_ptr(args->data), args->hdr.count, size);
+	if (IS_ERR(exec))
+		return PTR_ERR(exec);
 
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -1383,7 +1373,6 @@ static int __qaic_execute_bo_ioctl(struct drm_device *dev, void *data, struct dr
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 unlock_usr_srcu:
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
-free_exec:
 	kfree(exec);
 	return ret;
 }
@@ -1736,7 +1725,8 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 	struct qaic_device *qdev;
 	struct qaic_user *usr;
 	struct qaic_bo *bo;
-	int ret, i;
+	int ret = 0;
+	int i;
 
 	usr = file_priv->driver_priv;
 	usr_rcu_id = srcu_read_lock(&usr->qddev_lock);
@@ -1757,18 +1747,12 @@ int qaic_perf_stats_bo_ioctl(struct drm_device *dev, void *data, struct drm_file
 		goto unlock_dev_srcu;
 	}
 
-	ent = kcalloc(args->hdr.count, sizeof(*ent), GFP_KERNEL);
-	if (!ent) {
-		ret = -EINVAL;
+	ent = memdup_array_user(u64_to_user_ptr(args->data), args->hdr.count, sizeof(*ent));
+	if (IS_ERR(ent)) {
+		ret = PTR_ERR(ent);
 		goto unlock_dev_srcu;
 	}
 
-	ret = copy_from_user(ent, u64_to_user_ptr(args->data), args->hdr.count * sizeof(*ent));
-	if (ret) {
-		ret = -EFAULT;
-		goto free_ent;
-	}
-
 	for (i = 0; i < args->hdr.count; i++) {
 		obj = drm_gem_object_lookup(file_priv, ent[i].handle);
 		if (!obj) {
-- 
2.51.0

