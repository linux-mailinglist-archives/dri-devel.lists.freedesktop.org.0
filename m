Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5F4A67871
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345C510E4AB;
	Tue, 18 Mar 2025 15:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GptJIt4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E74C10E223
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PAt9yeccigKpqHuLr9PM6lHeWkKthPLmxUbcJcP1XTI=; b=GptJIt4Ps1oCVwATW1LfKM0jl3
 NF9w/NgzJlqyElmeAPKaV8rGUp2jLrZDpRs4xiRyEfG74L9bxQUcXyM3QBfBLNCLJPaNJ4BRu5Zue
 nGVa4MJkMzsgkUJpZZEFC6QgBAn1CNi9GSqWl2xplRv8r6zAYQXEu4FOzmDte0nxns9izUDICqIiw
 KkSJDlYGQz3f63YrjzRIbuvVF6W+KZNQGonOsxIWZVmvwN0swHhJr/Ad6GK8ZLjUoFlsPzNUidwbb
 QipDLJzzerjarILAfy88xsARFr0IXcrT5jOlvyfY2TyvmTY3Dwpo+Va4hL2ao+yIBtADmVoiTCN+1
 KQWsSIJA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tuZGu-002ngf-Cw; Tue, 18 Mar 2025 16:54:28 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 3/7] drm/syncobj: Avoid one temporary allocation in
 drm_syncobj_array_find
Date: Tue, 18 Mar 2025 15:54:19 +0000
Message-ID: <20250318155424.78552-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
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

Drm_syncobj_array_find() helper is used from many userspace ioctl entry
points with the task of looking up userspace handles to internal objects.

We can easily avoid one temporary allocation by making it read the handles
as it is looking them up.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_syncobj.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index fd5ba6c89666..cdda2df06bec 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1213,48 +1213,46 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
 EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
 
 static int drm_syncobj_array_find(struct drm_file *file_private,
-				  void __user *user_handles,
-				  uint32_t count_handles,
+				  u32 __user *handles,
+				  uint32_t count,
 				  struct drm_syncobj ***syncobjs_out)
 {
-	uint32_t i, *handles;
 	struct drm_syncobj **syncobjs;
+	uint32_t i;
 	int ret;
 
-	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
-	if (handles == NULL)
+	if (!access_ok(handles, count * sizeof(*handles)))
+		return -EFAULT;
+
+	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
+	if (!syncobjs)
 		return -ENOMEM;
 
-	if (copy_from_user(handles, user_handles,
-			   sizeof(uint32_t) * count_handles)) {
-		ret = -EFAULT;
-		goto err_free_handles;
-	}
+	for (i = 0; i < count; i++) {
+		u64 handle;
 
-	syncobjs = kmalloc_array(count_handles, sizeof(*syncobjs), GFP_KERNEL);
-	if (syncobjs == NULL) {
-		ret = -ENOMEM;
-		goto err_free_handles;
-	}
-
-	for (i = 0; i < count_handles; i++) {
-		syncobjs[i] = drm_syncobj_find(file_private, handles[i]);
+		if (__get_user(handle, handles++)) {
+			ret = -EFAULT;
+			syncobjs[i] = NULL;
+			goto err_put_syncobjs;
+		}
+		syncobjs[i] = drm_syncobj_find(file_private, handle);
 		if (!syncobjs[i]) {
 			ret = -ENOENT;
 			goto err_put_syncobjs;
 		}
 	}
 
-	kfree(handles);
 	*syncobjs_out = syncobjs;
 	return 0;
 
 err_put_syncobjs:
-	while (i-- > 0)
-		drm_syncobj_put(syncobjs[i]);
+	while (i > 0) {
+		if (syncobjs[i])
+			drm_syncobj_put(syncobjs[i]);
+		i--;
+	}
 	kfree(syncobjs);
-err_free_handles:
-	kfree(handles);
 
 	return ret;
 }
-- 
2.48.0

