Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1E6251C5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 04:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E10B10E02F;
	Fri, 11 Nov 2022 03:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id D234010E02F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 03:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8SnPH
 5Qx6ge1EtKB0f/nVg1sCMMgt2pTaFXFocUqJa8=; b=c5Zqxv7RjLUYIxVx+RVnW
 DwURkjfLUI5XBmNpLX8cpiPNSs3ueEPl19EMAeGrpTlwsJPfVknBFld3Oc4dILfB
 ppgfO/V0tg6DzqCfunszw3zq9IFS9zDZfj2GyBcD4INCR8F/ICS6AxsL9+4FdeDm
 i2hcRxAuX/Qu9K4sQcTd84=
Received: from localhost.localdomain (unknown [114.221.197.143])
 by smtp10 (Coremail) with SMTP id DsCowABH7bG4w21jBvxXMA--.32326S2;
 Fri, 11 Nov 2022 11:38:39 +0800 (CST)
From: ChunyouTang <tangchunyou@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed,
 should release object
Date: Fri, 11 Nov 2022 11:38:17 +0800
Message-Id: <20221111033817.366-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABH7bG4w21jBvxXMA--.32326S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4DXw1ruF43JryxZFW7XFb_yoW5Wryrpa
 nxAry7KrW8KFZFgrZ7XF4kCa43Gw40gF4xWaySq3yakr10yF1DXFn8Cr1DAFW3Jr17Xr1a
 q3sFkFySyrWjkF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_6wuUUUUUU=
X-Originating-IP: [114.221.197.143]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiYwC2UVaEMNUQPwAAsc
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
Cc: linaro-mm-sig@lists.linaro.org, ChunyouTang <tangchunyou@163.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when goto err_free, the object had init, so it should be release when fail.

Signed-off-by: ChunyouTang <tangchunyou@163.com>
---
 drivers/gpu/drm/drm_gem.c              | 19 ++++++++++++++++---
 drivers/gpu/drm/drm_gem_shmem_helper.c |  4 +++-
 include/drm/drm_gem.h                  |  1 +
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 8b68a3c1e6ab..cba32c46bb05 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -169,6 +169,21 @@ void drm_gem_private_object_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
+/**
+ * drm_gem_private_object_fini - Finalize a failed drm_gem_object
+ * @obj: drm_gem_object
+ *
+ * Uninitialize an already allocated GEM object when it initialized failed
+ */
+void drm_gem_private_object_fini(struct drm_gem_object *obj)
+{
+	WARN_ON(obj->dma_buf);
+
+	dma_resv_fini(&obj->_resv);
+	drm_gem_lru_remove(obj);
+}
+EXPORT_SYMBOL(drm_gem_private_object_fini);
+
 /**
  * drm_gem_object_handle_free - release resources bound to userspace handles
  * @obj: GEM object to clean up.
@@ -930,14 +945,12 @@ drm_gem_release(struct drm_device *dev, struct drm_file *file_private)
 void
 drm_gem_object_release(struct drm_gem_object *obj)
 {
-	WARN_ON(obj->dma_buf);
+	drm_gem_private_object_fini(obj);
 
 	if (obj->filp)
 		fput(obj->filp);
 
-	dma_resv_fini(&obj->_resv);
 	drm_gem_free_mmap_offset(obj);
-	drm_gem_lru_remove(obj);
 }
 EXPORT_SYMBOL(drm_gem_object_release);
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..845e3d5d71eb 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -79,8 +79,10 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 	} else {
 		ret = drm_gem_object_init(dev, obj, size);
 	}
-	if (ret)
+	if (ret) {
+		drm_gem_private_object_fini(obj)
 		goto err_free;
+	}
 
 	ret = drm_gem_create_mmap_offset(obj);
 	if (ret)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bd42f25e449c..9b1feb03069d 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -405,6 +405,7 @@ int drm_gem_object_init(struct drm_device *dev,
 			struct drm_gem_object *obj, size_t size);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size);
+void drm_gem_private_object_fini(struct drm_gem_object *obj);
 void drm_gem_vm_open(struct vm_area_struct *vma);
 void drm_gem_vm_close(struct vm_area_struct *vma);
 int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
-- 
2.25.1

