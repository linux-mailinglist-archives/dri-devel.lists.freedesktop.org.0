Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9521B422052
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D112A6F5C8;
	Tue,  5 Oct 2021 08:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFAC6F5B7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 08:11:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D88F1223F3;
 Tue,  5 Oct 2021 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633421514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rL41rEAz/kpcrVpzRpIvyDHZOVh+bwwjwlDceL8T9Lg=;
 b=T61VYZfXbPhp+XDkLvNNeCDHCwNhikToeqWryv1bgRUnYbrheDbx6c51KR4d4LiadMUuKu
 0mOQMMb30Ba1matv0VCe8E2mQi6IlaJ82HnhYuKORmn8U4Fz1VyyTOlCNZE+z9zNIxwdS4
 Kfn8ocF+PecJNayphxxbH/hR+55aOYo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633421514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rL41rEAz/kpcrVpzRpIvyDHZOVh+bwwjwlDceL8T9Lg=;
 b=3MqvY64OEDhDJ/CU1xSS3yssnqxF0fjOL76YCsVZ+UV3r9kY7JoNrCguZX2h105pr47nl6
 yJvHTY40dO5ggtCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B174313A78;
 Tue,  5 Oct 2021 08:11:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YHRlKsoIXGEgXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Oct 2021 08:11:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/10] drm/gma500: Inline psb_gtt_{alloc,
 free}_range() into rsp callers
Date: Tue,  5 Oct 2021 10:11:48 +0200
Message-Id: <20211005081151.23612-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005081151.23612-1-tzimmermann@suse.de>
References: <20211005081151.23612-1-tzimmermann@suse.de>
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

psb_gtt_alloc_range() allocates struct gtt_range, create the GTT resource
and performs some half-baked initialization. Inline the function into its
only caller psb_gem_create(). For creating the GTT resource, introduce a
new helper, psb_gtt_alloc_resource() that hides the details of the GTT.

For psb_gtt_free_range(), inline the function into its only caller
psb_gem_free_object(). While at it, remove the explicit invocation of
drm_gem_free_mmap_offset(). The mmap offset is already released by
drm_gem_object_release().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 94 ++++++++++++------------------------
 drivers/gpu/drm/gma500/gtt.c | 27 +++++++++++
 drivers/gpu/drm/gma500/gtt.h |  6 +++
 3 files changed, 65 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 37b61334ade2..425d183c76ca 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -91,30 +91,22 @@ void psb_gem_unpin(struct gtt_range *gt)
 	mutex_unlock(&dev_priv->gtt_mutex);
 }
 
-static void psb_gtt_free_range(struct drm_device *dev, struct gtt_range *gt)
-{
-	/* Undo the mmap pin if we are destroying the object */
-	if (gt->mmapping) {
-		psb_gem_unpin(gt);
-		gt->mmapping = 0;
-	}
-	WARN_ON(gt->in_gart && !gt->stolen);
-	release_resource(&gt->resource);
-	kfree(gt);
-}
-
 static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
 
 static void psb_gem_free_object(struct drm_gem_object *obj)
 {
-	struct gtt_range *gtt = to_gtt_range(obj);
+	struct gtt_range *gt = to_gtt_range(obj);
 
-	/* Remove the list map if one is present */
-	drm_gem_free_mmap_offset(obj);
 	drm_gem_object_release(obj);
 
-	/* This must occur last as it frees up the memory of the GEM object */
-	psb_gtt_free_range(obj->dev, gtt);
+	/* Undo the mmap pin if we are destroying the object */
+	if (gt->mmapping)
+		psb_gem_unpin(gt);
+
+	WARN_ON(gt->in_gart && !gt->stolen);
+
+	release_resource(&gt->resource);
+	kfree(gt);
 }
 
 static const struct vm_operations_struct psb_gem_vm_ops = {
@@ -128,59 +120,35 @@ static const struct drm_gem_object_funcs psb_gem_object_funcs = {
 	.vm_ops = &psb_gem_vm_ops,
 };
 
-static struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
-					     const char *name, int backed, u32 align)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gtt_range *gt;
-	struct resource *r = dev_priv->gtt_mem;
-	int ret;
-	unsigned long start, end;
-
-	if (backed) {
-		/* The start of the GTT is the stolen pages */
-		start = r->start;
-		end = r->start + dev_priv->gtt.stolen_size - 1;
-	} else {
-		/* The rest we will use for GEM backed objects */
-		start = r->start + dev_priv->gtt.stolen_size;
-		end = r->end;
-	}
-
-	gt = kzalloc(sizeof(struct gtt_range), GFP_KERNEL);
-	if (gt == NULL)
-		return NULL;
-	gt->resource.name = name;
-	gt->stolen = backed;
-	gt->in_gart = backed;
-	/* Ensure this is set for non GEM objects */
-	gt->gem.dev = dev;
-	ret = allocate_resource(dev_priv->gtt_mem, &gt->resource,
-				len, start, end, align, NULL, NULL);
-	if (ret == 0) {
-		gt->offset = gt->resource.start - r->start;
-		return gt;
-	}
-	kfree(gt);
-	return NULL;
-}
-
 struct gtt_range *
 psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align)
 {
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gtt_range *gt;
 	struct drm_gem_object *obj;
 	int ret;
 
 	size = roundup(size, PAGE_SIZE);
 
-	gt = psb_gtt_alloc_range(dev, size, name, stolen, align);
-	if (!gt) {
-		dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
-		return ERR_PTR(-ENOSPC);
-	}
+	gt = kzalloc(sizeof(*gt), GFP_KERNEL);
+	if (!gt)
+		return ERR_PTR(-ENOMEM);
 	obj = &gt->gem;
 
+	/* GTT resource */
+
+	ret = psb_gtt_allocate_resource(dev_priv, &gt->resource, name, size, align, stolen,
+					&gt->offset);
+	if (ret)
+		goto err_kfree;
+
+	if (stolen) {
+		gt->stolen = true;
+		gt->in_gart = 1;
+	}
+
+	/* GEM object */
+
 	obj->funcs = &psb_gem_object_funcs;
 
 	if (stolen) {
@@ -188,7 +156,7 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 	} else {
 		ret = drm_gem_object_init(dev, obj, size);
 		if (ret)
-			goto err_psb_gtt_free_range;
+			goto err_release_resource;
 
 		/* Limit the object to 32-bit mappings */
 		mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
@@ -196,8 +164,10 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 
 	return gt;
 
-err_psb_gtt_free_range:
-	psb_gtt_free_range(dev, gt);
+err_release_resource:
+	release_resource(&gt->resource);
+err_kfree:
+	kfree(gt);
 	return ERR_PTR(ret);
 }
 
diff --git a/drivers/gpu/drm/gma500/gtt.c b/drivers/gpu/drm/gma500/gtt.c
index 0aacf7122e32..5d940fdbe6b8 100644
--- a/drivers/gpu/drm/gma500/gtt.c
+++ b/drivers/gpu/drm/gma500/gtt.c
@@ -18,6 +18,33 @@
  *	GTT resource allocator - manage page mappings in GTT space
  */
 
+int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
+			      const char *name, resource_size_t size, resource_size_t align,
+			      bool stolen, u32 offset[static 1])
+{
+	struct resource *root = pdev->gtt_mem;
+	resource_size_t start, end;
+	int ret;
+
+	if (stolen) {
+		/* The start of the GTT is backed by stolen pages. */
+		start = root->start;
+		end = root->start + pdev->gtt.stolen_size - 1;
+	} else {
+		/* The rest is backed by system pages. */
+		start = root->start + pdev->gtt.stolen_size;
+		end = root->end;
+	}
+
+	res->name = name;
+	ret = allocate_resource(root, res, size, start, end, align, NULL, NULL);
+	if (ret)
+		return ret;
+	*offset = res->start - root->start;
+
+	return 0;
+}
+
 /**
  *	psb_gtt_mask_pte	-	generate GTT pte entry
  *	@pfn: page number to encode
diff --git a/drivers/gpu/drm/gma500/gtt.h b/drivers/gpu/drm/gma500/gtt.h
index 36162b545570..459a03141e8b 100644
--- a/drivers/gpu/drm/gma500/gtt.h
+++ b/drivers/gpu/drm/gma500/gtt.h
@@ -10,6 +10,8 @@
 
 #include <drm/drm_gem.h>
 
+struct drm_psb_private;
+
 /* This wants cleaning up with respect to the psb_dev and un-needed stuff */
 struct psb_gtt {
 	uint32_t gatt_start;
@@ -43,6 +45,10 @@ struct gtt_range {
 
 extern int psb_gtt_restore(struct drm_device *dev);
 
+int psb_gtt_allocate_resource(struct drm_psb_private *pdev, struct resource *res,
+			      const char *name, resource_size_t size, resource_size_t align,
+			      bool stolen, u32 offset[static 1]);
+
 int psb_gtt_insert(struct drm_device *dev, struct gtt_range *r, int resume);
 void psb_gtt_remove(struct drm_device *dev, struct gtt_range *r);
 
-- 
2.33.0

