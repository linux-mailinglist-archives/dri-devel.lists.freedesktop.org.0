Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07297ECDE
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6F910E1AE;
	Mon, 23 Sep 2024 14:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iGKPphjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8168C10E188
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qFiUn5NfDG0ERtFJb87jzYIupjcozmiCvs7s00RF6aM=; b=iGKPphjhTSeVPQtQeHEjstHooZ
 /k0XA28popCBlJ6/WzC3403s7m7f0pKYkvEXQBY3D/OMeg0wwur87OcY6dwqGforwFbPMczaHCrDi
 MEdYscgX3x+sg9PWpeSeONzw6SWiWjMOnJF009rFhb8F6O/ak892QU/cxQ8AH7DPPg3BzpwW2z3er
 c4Ixjc1mGAbkbraLbuYYZPehlJGdYTo4uxoQY6ckf2pExHwZpjcHQ6J5iM2KhiRPXx5slgCuvzBw0
 VOkAaBURMWa+PWMIeIOXPqOolO1CocMwHwha5KiUIEoxQuti1+7VEAnGAj7HsuHyzjGhjdNNoiUv8
 lrFUKLIA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjpg-00HYyM-Mh; Mon, 23 Sep 2024 16:14:33 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v6 04/11] drm/gem: Create a drm_gem_object_init_with_mnt()
 function
Date: Mon, 23 Sep 2024 10:55:08 -0300
Message-ID: <20240923141348.2422499-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923141348.2422499-1-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/drm_gem.c | 34 ++++++++++++++++++++++++++++++----
 include/drm/drm_gem.h     |  3 +++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 149b8e25da5b..ee811764c3df 100644
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
2.46.0

