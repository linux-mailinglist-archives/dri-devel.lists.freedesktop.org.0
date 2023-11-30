Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C8A7FF69F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3724810E73B;
	Thu, 30 Nov 2023 16:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03B810E735
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TwSjfJS74t0A3hbDuy5BWZ/zgHuKemzueEp/VFBcWOM=; b=etY1aAoHJY5UNxutOpLI3cNz0y
 JD0nMplRtZZSw0edoFtxGlOnJ71FkbhfT7jCCh3vH6t3z8Nn/17vEkvPNm7S7lSTX4iL4sjaWLhwp
 wi3H57t1cmtEZX+h9gBsZkSLY0KZsEfw6JvI1eUpsCmdEM5fh18pB0TPzv+qLD1RggOuTjjF8D0FA
 ws31k/lYNqdllxA/eKsBgLqg5pEcVEItYrgMcGZ0+rbiQ2fs2UfK6Kjq1tim9ghQ/NWifEDpTN7TR
 no9RVSkn0p7uM3l6me5tIm8scVEVp2fbDccRuiqYLc/cYvXui64FK+KplsRAHrwnq3Wr9POiK7JoT
 mRN7i3QA==;
Received: from [177.34.169.138] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8kAY-008scY-Ih; Thu, 30 Nov 2023 17:45:43 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 11/17] drm/v3d: Enable BO mapping
Date: Thu, 30 Nov 2023 13:40:34 -0300
Message-ID: <20231130164420.932823-13-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130164420.932823-2-mcanal@igalia.com>
References: <20231130164420.932823-2-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the indirect CSD CPU job, we will need to access the internal
contents of the BO with the dispatch parameters. Therefore, create
methods to allow the mapping and unmapping of the BO.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c  | 18 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_drv.h |  4 ++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 357a0da7e16a..1bdfac8beafd 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -33,6 +33,9 @@ void v3d_free_object(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 
+	if (bo->vaddr)
+		v3d_put_bo_vaddr(bo);
+
 	v3d_mmu_remove_ptes(bo);
 
 	mutex_lock(&v3d->bo_lock);
@@ -134,6 +137,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	if (IS_ERR(shmem_obj))
 		return ERR_CAST(shmem_obj);
 	bo = to_v3d_bo(&shmem_obj->base);
+	bo->vaddr = NULL;
 
 	ret = v3d_bo_create_finish(&shmem_obj->base);
 	if (ret)
@@ -167,6 +171,20 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 	return obj;
 }
 
+void v3d_get_bo_vaddr(struct v3d_bo *bo)
+{
+	struct drm_gem_shmem_object *obj = &bo->base;
+
+	bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
+			 pgprot_writecombine(PAGE_KERNEL));
+}
+
+void v3d_put_bo_vaddr(struct v3d_bo *bo)
+{
+	vunmap(bo->vaddr);
+	bo->vaddr = NULL;
+}
+
 int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 2246a0e29955..39d62915cdd6 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -202,6 +202,8 @@ struct v3d_bo {
 	 * v3d_render_job->unref_list
 	 */
 	struct list_head unref_head;
+
+	void *vaddr;
 };
 
 static inline struct v3d_bo *
@@ -391,6 +393,8 @@ struct drm_gem_object *v3d_create_object(struct drm_device *dev, size_t size);
 void v3d_free_object(struct drm_gem_object *gem_obj);
 struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 			     size_t size);
+void v3d_get_bo_vaddr(struct v3d_bo *bo);
+void v3d_put_bo_vaddr(struct v3d_bo *bo);
 int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv);
 int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
-- 
2.42.0

