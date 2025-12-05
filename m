Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBCECA8191
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 16:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7242210EB4B;
	Fri,  5 Dec 2025 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GDDLANxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8CD10EB4B;
 Fri,  5 Dec 2025 15:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=woKichvvwZb8tJmvhR8ixLwMeCdQ0P4FXTNQnnEDL4I=; b=GDDLANxJ10K3FkPzFiERzQYtIy
 r98b8QpsHOsvtXxAHAN1DabbVL3Z0XVtr+cSLy5UAEaEttb7Eko0zpjHn0FLR1C8W4wXkzeS4Jnc3
 pZl0PY5tzP3mZXGmitpGXuAESjwDbVtPEe09QMY/DC7otkdg3Tb3CQr3iw9viCxbgQX+/4h6LiMIH
 lmFTXildd1+/r4fSyDRcUng5d6iPYsRvAZcKzW6s2dklqeHgxw0LtaUnhttsfD5CicaAzNA0i8IyF
 NWEZmtbmsY0Zz0YBCJ1HgzWJaq9RnpkGkbVqEH0rMtk9Gr+b8QOB6aj1eDM2hjlvTvvGEmm3NYoPe
 S2mhViWQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vRXQm-0097XR-QC; Fri, 05 Dec 2025 16:09:12 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: Convert syncobj idr to xarray
Date: Fri,  5 Dec 2025 15:09:10 +0000
Message-ID: <20251205150910.92913-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
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

IDR is deprecated and syncobj looks pretty trivial to convert so lets
just do it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
---
 drivers/gpu/drm/drm_syncobj.c | 65 +++++++++++------------------------
 include/drm/drm_file.h        |  7 ++--
 2 files changed, 23 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 0de70c8fbb99..06bb5c6c3f60 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -258,14 +258,14 @@ struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
 {
 	struct drm_syncobj *syncobj;
 
-	spin_lock(&file_private->syncobj_table_lock);
+	xa_lock(&file_private->syncobj_xa);
 
 	/* Check if we currently have a reference on the object */
-	syncobj = idr_find(&file_private->syncobj_idr, handle);
+	syncobj = xa_load(&file_private->syncobj_xa, handle);
 	if (syncobj)
 		drm_syncobj_get(syncobj);
 
-	spin_unlock(&file_private->syncobj_table_lock);
+	xa_unlock(&file_private->syncobj_xa);
 
 	return syncobj;
 }
@@ -606,23 +606,15 @@ int drm_syncobj_get_handle(struct drm_file *file_private,
 {
 	int ret;
 
-	/* take a reference to put in the idr */
+	/* take a reference to put in the xarray */
 	drm_syncobj_get(syncobj);
 
-	idr_preload(GFP_KERNEL);
-	spin_lock(&file_private->syncobj_table_lock);
-	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
-	spin_unlock(&file_private->syncobj_table_lock);
-
-	idr_preload_end();
-
-	if (ret < 0) {
+	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
+		       GFP_NOWAIT);
+	if (ret)
 		drm_syncobj_put(syncobj);
-		return ret;
-	}
 
-	*handle = ret;
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_syncobj_get_handle);
 
@@ -646,10 +638,7 @@ static int drm_syncobj_destroy(struct drm_file *file_private,
 {
 	struct drm_syncobj *syncobj;
 
-	spin_lock(&file_private->syncobj_table_lock);
-	syncobj = idr_remove(&file_private->syncobj_idr, handle);
-	spin_unlock(&file_private->syncobj_table_lock);
-
+	syncobj = xa_erase(&file_private->syncobj_xa, handle);
 	if (!syncobj)
 		return -EINVAL;
 
@@ -730,20 +719,13 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
 	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
 		return -EINVAL;
 
-	/* take a reference to put in the idr */
+	/* take a reference to put in the xarray */
 	syncobj = fd_file(f)->private_data;
 	drm_syncobj_get(syncobj);
 
-	idr_preload(GFP_KERNEL);
-	spin_lock(&file_private->syncobj_table_lock);
-	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
-	spin_unlock(&file_private->syncobj_table_lock);
-	idr_preload_end();
-
-	if (ret > 0) {
-		*handle = ret;
-		ret = 0;
-	} else
+	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
+		       GFP_NOWAIT);
+	if (ret)
 		drm_syncobj_put(syncobj);
 
 	return ret;
@@ -822,17 +804,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
 void
 drm_syncobj_open(struct drm_file *file_private)
 {
-	idr_init_base(&file_private->syncobj_idr, 1);
-	spin_lock_init(&file_private->syncobj_table_lock);
-}
-
-static int
-drm_syncobj_release_handle(int id, void *ptr, void *data)
-{
-	struct drm_syncobj *syncobj = ptr;
-
-	drm_syncobj_put(syncobj);
-	return 0;
+	xa_init_flags(&file_private->syncobj_xa, XA_FLAGS_ALLOC1);
 }
 
 /**
@@ -846,9 +818,12 @@ drm_syncobj_release_handle(int id, void *ptr, void *data)
 void
 drm_syncobj_release(struct drm_file *file_private)
 {
-	idr_for_each(&file_private->syncobj_idr,
-		     &drm_syncobj_release_handle, file_private);
-	idr_destroy(&file_private->syncobj_idr);
+	struct drm_syncobj *syncobj;
+	unsigned long handle;
+
+	xa_for_each(&file_private->syncobj_xa, handle, syncobj)
+		drm_syncobj_put(syncobj);
+	xa_destroy(&file_private->syncobj_xa);
 }
 
 int
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 04cad0c61513..99c71ec3ad44 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -34,6 +34,7 @@
 #include <linux/types.h>
 #include <linux/completion.h>
 #include <linux/idr.h>
+#include <linux/xarray.h>
 
 #include <uapi/drm/drm.h>
 
@@ -320,10 +321,8 @@ struct drm_file {
 	/** @table_lock: Protects @object_idr. */
 	spinlock_t table_lock;
 
-	/** @syncobj_idr: Mapping of sync object handles to object pointers. */
-	struct idr syncobj_idr;
-	/** @syncobj_table_lock: Protects @syncobj_idr. */
-	spinlock_t syncobj_table_lock;
+	/** @syncobj_xa: Mapping of sync object handles to object pointers. */
+	struct xarray syncobj_xa;
 
 	/** @filp: Pointer to the core file structure. */
 	struct file *filp;
-- 
2.51.1

