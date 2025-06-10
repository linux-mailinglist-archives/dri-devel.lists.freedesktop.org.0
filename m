Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5279AD3052
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242C110E4A4;
	Tue, 10 Jun 2025 08:30:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aJ9Gg+Z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD4810E4B7;
 Tue, 10 Jun 2025 08:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WP5Q62L9bd0NFMZSbmJImhy1XHd14aKpY7d1ho9XWjc=; b=aJ9Gg+Z9TCZABjsy5lgkdCeEPd
 fv8gPf3UxWL+zBH0W+Grn1sAVsaEf9hcwq8uUsVTnZq3XMRPZsZ7ErpPJCu79/fM9Zc87tyv+1Ch7
 eLrQbL3zh21LR0aNs9ZcYt8Vwo5RqPkHa1V+ipTAgDa0EzOiBJfAryWGC4YvXJeQAwDauN9vhkL22
 OMdeIz8cBrZCSrHkyN4ftObedn0OguuEIYsKBaNvnWEGv4sSHO6A6TMdqEEi2nDKo4vZDD4ASrmpl
 P2TKk7wolQSpy1NwJ44sZgSOUv3mmrOg1gyaXxkImecLijhRAbPSWLF7o2U+bKcwyR8lyNGmNVxTk
 tBfvlyjg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOuMw-001jmo-B7; Tue, 10 Jun 2025 10:30:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 3/6] drm/syncobj: Avoid one temporary allocation in
 drm_syncobj_array_find
Date: Tue, 10 Jun 2025 09:29:58 +0100
Message-ID: <20250610083001.4120-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
References: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2:
 * Fix handle type.
 * Undo pointless unwind change.
---
 drivers/gpu/drm/drm_syncobj.c | 36 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 67efdd22f9bc..3aa5edaebdf9 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1237,39 +1237,35 @@ signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec)
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
+		u32 handle;
 
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
 
@@ -1277,8 +1273,6 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	while (i-- > 0)
 		drm_syncobj_put(syncobjs[i]);
 	kfree(syncobjs);
-err_free_handles:
-	kfree(handles);
 
 	return ret;
 }
-- 
2.48.0

