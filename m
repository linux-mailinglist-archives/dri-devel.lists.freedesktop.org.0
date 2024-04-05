Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50B89A592
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC3A10E915;
	Fri,  5 Apr 2024 20:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="HRRkUl3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4210E912
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AqgdciGzy4lNCgAtM9KHHl30Ox9bV/vR2omL2OylUd4=; b=HRRkUl3qpMA/a0yGlJWWZw4dbZ
 18JhTpSK2OGSv92cNurcX2Qv80VLosZXviPtu4NX9EDDPmwKeualci4c2FnEm/vjaQ7X4AszKRIbT
 DjCFpqo9CIiAJ7BwiEtS/w6OKh/W2p1KkvVw1WKbixyS7TQI/MWGucA1nW77MMa9JvpdzUfPXPlVK
 r+STgBcRRiIJuU5CegrF3eBx1MNOzQVVunx6n9BCH6c/smFXeonftOn5ynwz2f5xqW0KtgmHJW/KC
 hGLIF0zcqap2VSykbUQf3E0isKIpcLO6OP9rASMxAeS2/uIQyU8cPPkSYJG67W2Lt+Nlm7RuBfbYW
 peQS2SPQ==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rsq1A-001kwR-Th; Fri, 05 Apr 2024 22:18:33 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 2/6] drm/gem: Create a drm_gem_object_init_with_mnt()
 function
Date: Fri,  5 Apr 2024 15:29:05 -0300
Message-ID: <20240405201753.1176914-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240405201753.1176914-1-mcanal@igalia.com>
References: <20240405201753.1176914-1-mcanal@igalia.com>
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

For some applications, such as applications that uses huge pages, we might
want to have a different mountpoint, for which we pass mount flags that
better match our usecase.

Therefore, create a new function `drm_gem_object_init_with_mnt()` that
allow us to define the tmpfs mountpoint where the GEM object will be
created. If this parameter is NULL, then we fallback to `shmem_file_setup()`.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_gem.c | 34 ++++++++++++++++++++++++++++++----
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d4bbc5d109c8..74ebe68e3d61 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -114,22 +114,32 @@ drm_gem_init(struct drm_device *dev)
 }

 /**
- * drm_gem_object_init - initialize an allocated shmem-backed GEM object
+ * drm_gem_object_init_with_mnt - initialize an allocated shmem-backed GEM
+ * object in a given shmfs mountpoint
+ *
  * @dev: drm_device the object should be initialized for
  * @obj: drm_gem_object to initialize
  * @size: object size
+ * @gemfs: tmpfs mount where the GEM object will be created. If NULL, use
+ * the usual tmpfs mountpoint (`shm_mnt`).
  *
  * Initialize an already allocated GEM object of the specified size with
  * shmfs backing store.
  */
-int drm_gem_object_init(struct drm_device *dev,
-			struct drm_gem_object *obj, size_t size)
+int drm_gem_object_init_with_mnt(struct drm_device *dev,
+				 struct drm_gem_object *obj, size_t size,
+				 struct vfsmount *gemfs)
 {
 	struct file *filp;

 	drm_gem_private_object_init(dev, obj, size);

-	filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
+	if (gemfs)
+		filp = shmem_file_setup_with_mnt(gemfs, "drm mm object", size,
+						 VM_NORESERVE);
+	else
+		filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
+
 	if (IS_ERR(filp))
 		return PTR_ERR(filp);

@@ -137,6 +147,22 @@ int drm_gem_object_init(struct drm_device *dev,

 	return 0;
 }
+EXPORT_SYMBOL(drm_gem_object_init_with_mnt);
+
+/**
+ * drm_gem_object_init - initialize an allocated shmem-backed GEM object
+ * @dev: drm_device the object should be initialized for
+ * @obj: drm_gem_object to initialize
+ * @size: object size
+ *
+ * Initialize an already allocated GEM object of the specified size with
+ * shmfs backing store.
+ */
+int drm_gem_object_init(struct drm_device *dev, struct drm_gem_object *obj,
+			size_t size)
+{
+	return drm_gem_object_init_with_mnt(dev, obj, size, NULL);
+}
 EXPORT_SYMBOL(drm_gem_object_init);

 /**
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bae4865b2101..2ebf6e10cc44 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -472,6 +472,9 @@ void drm_gem_object_release(struct drm_gem_object *obj);
 void drm_gem_object_free(struct kref *kref);
 int drm_gem_object_init(struct drm_device *dev,
 			struct drm_gem_object *obj, size_t size);
+int drm_gem_object_init_with_mnt(struct drm_device *dev,
+				 struct drm_gem_object *obj, size_t size,
+				 struct vfsmount *gemfs);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size);
 void drm_gem_private_object_fini(struct drm_gem_object *obj);
--
2.44.0

