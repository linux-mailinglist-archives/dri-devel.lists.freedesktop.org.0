Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C541AAE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 10:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04046E886;
	Tue, 28 Sep 2021 08:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DEC89F4F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 08:44:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B331922298;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632818688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpcLf/FRXTiBNjGTa2mowr2IRwRalJeecllqsXIJt8Y=;
 b=nJvYs8RqAdNsZJQ/ycfBpt1FvrFmqFOhKszWh4jKf7T+RFzJEnpkkfInbLYJIiEuNnKOMR
 e9wLgFCnaeRJ/a5f/w3xyifZkolyt+GVupaKt9Xdz9G1pSIchP3jq6UtBPRHbfPiDS9pn6
 gwZ5zsREEqpcGFlDE3pNMEz5x4cDBH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632818688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpcLf/FRXTiBNjGTa2mowr2IRwRalJeecllqsXIJt8Y=;
 b=p8PhBsFkMtdYgGM3obh7m0cgG1HofXN4Kp5WeRZO5qHwabZCgcEmA8GW5NsOD1in1UrtbT
 vJ/CMZuST1YOUODg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 927A013BA5;
 Tue, 28 Sep 2021 08:44:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QAXZIgDWUmEIDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Sep 2021 08:44:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/10] drm/gma500: Reimplement psb_gem_create()
Date: Tue, 28 Sep 2021 10:44:39 +0200
Message-Id: <20210928084446.22580-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928084446.22580-1-tzimmermann@suse.de>
References: <20210928084446.22580-1-tzimmermann@suse.de>
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

Implement psb_gem_create() for general use. Create the GEM handle in
psb_gem_create_dumb(). Allows to use psb_gem_create() for creating all
of the GEM objects.

While at it, clean-up drm_gem_dumb_create() to make it more readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/gem.c | 93 ++++++++++++++++++++++--------------
 drivers/gpu/drm/gma500/gem.h |  4 +-
 2 files changed, 59 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index ff2c1d64689e..8f4bcf9cf912 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -164,45 +164,36 @@ struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
 	return NULL;
 }
 
-int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
-		   u32 *handlep, int stolen, u32 align)
+struct gtt_range *
+psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align)
 {
-	struct gtt_range *r;
+	struct gtt_range *gt;
+	struct drm_gem_object *obj;
 	int ret;
-	u32 handle;
 
 	size = roundup(size, PAGE_SIZE);
 
-	/* Allocate our object - for now a direct gtt range which is not
-	   stolen memory backed */
-	r = psb_gtt_alloc_range(dev, size, "gem", 0, PAGE_SIZE);
-	if (r == NULL) {
+	gt = psb_gtt_alloc_range(dev, size, name, stolen, align);
+	if (!gt) {
 		dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
-		return -ENOSPC;
+		return ERR_PTR(-ENOSPC);
 	}
-	r->gem.funcs = &psb_gem_object_funcs;
-	/* Initialize the extra goodies GEM needs to do all the hard work */
-	if (drm_gem_object_init(dev, &r->gem, size) != 0) {
-		psb_gtt_free_range(dev, r);
-		/* GEM doesn't give an error code so use -ENOMEM */
-		dev_err(dev->dev, "GEM init failed for %lld\n", size);
-		return -ENOMEM;
-	}
-	/* Limit the object to 32bit mappings */
-	mapping_set_gfp_mask(r->gem.filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
-	/* Give the object a handle so we can carry it more easily */
-	ret = drm_gem_handle_create(file, &r->gem, &handle);
-	if (ret) {
-		dev_err(dev->dev, "GEM handle failed for %p, %lld\n",
-							&r->gem, size);
-		drm_gem_object_release(&r->gem);
-		psb_gtt_free_range(dev, r);
-		return ret;
-	}
-	/* We have the initial and handle reference but need only one now */
-	drm_gem_object_put(&r->gem);
-	*handlep = handle;
-	return 0;
+	obj = &gt->gem;
+
+	obj->funcs = &psb_gem_object_funcs;
+
+	ret = drm_gem_object_init(dev, obj, size);
+	if (ret)
+		goto err_psb_gtt_free_range;
+
+	/* Limit the object to 32-bit mappings */
+	mapping_set_gfp_mask(obj->filp->f_mapping, GFP_KERNEL | __GFP_DMA32);
+
+	return gt;
+
+err_psb_gtt_free_range:
+	psb_gtt_free_range(dev, gt);
+	return ERR_PTR(ret);
 }
 
 /**
@@ -218,10 +209,40 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
 int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args)
 {
-	args->pitch = ALIGN(args->width * ((args->bpp + 7) / 8), 64);
-	args->size = args->pitch * args->height;
-	return psb_gem_create(file, dev, args->size, &args->handle, 0,
-			      PAGE_SIZE);
+	size_t pitch, size;
+	struct gtt_range *gt;
+	struct drm_gem_object *obj;
+	u32 handle;
+	int ret;
+
+	pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
+	pitch = ALIGN(pitch, 64);
+
+	size = pitch * args->height;
+	size = roundup(size, PAGE_SIZE);
+	if (!size)
+		return -EINVAL;
+
+	gt = psb_gem_create(dev, size, "gem", false, PAGE_SIZE);
+	if (IS_ERR(gt))
+		return PTR_ERR(gt);
+	obj = &gt->gem;
+
+	ret = drm_gem_handle_create(file, obj, &handle);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	drm_gem_object_put(obj);
+
+	args->pitch = pitch;
+	args->size = size;
+	args->handle = handle;
+
+	return 0;
+
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
+	return ret;
 }
 
 /**
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 275494aedd4c..ad76127dc719 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -14,8 +14,8 @@ struct drm_device;
 
 extern const struct drm_gem_object_funcs psb_gem_object_funcs;
 
-extern int psb_gem_create(struct drm_file *file, struct drm_device *dev,
-			  u64 size, u32 *handlep, int stolen, u32 align);
+struct gtt_range *
+psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen, u32 align);
 
 struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len, const char *name,
 				      int backed, u32 align);
-- 
2.33.0

