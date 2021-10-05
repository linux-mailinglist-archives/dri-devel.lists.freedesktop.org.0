Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B13442204F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7286F5BF;
	Tue,  5 Oct 2021 08:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7DF6EB3A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 08:11:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 252B6223F0;
 Tue,  5 Oct 2021 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633421514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izQ7/Niglej56bO/Ez3Dbgcv2dhtVBnoNmhEthMUpuc=;
 b=mi9aBUCK7NCc4UX4RLDz/xtAinqCTza9cjhPD4IPMBgW1awRdUQUHJ+eBqUD8aV5iiw0Vr
 OPzgFMo2+7NKLyl1AkpTyl6qL0MJsReA8ZRF6wQMSKkqNEAmTtPlO4DlNPfKIzEQgUX7sm
 IatpOcHm43HxMIu7WxbLfysHd2W9gTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633421514;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izQ7/Niglej56bO/Ez3Dbgcv2dhtVBnoNmhEthMUpuc=;
 b=/WQWq//jwLvRyPh8dEUPq6+iM4VO3RjYgOAmvpy69NXxmUN+a3cDbjbx8tppiMPzTf+Ecn
 ZHYSN+lnWtSmtuCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F28A013A78;
 Tue,  5 Oct 2021 08:11:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QJRGOskIXGEgXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Oct 2021 08:11:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/10] drm/gma500: Reimplement psb_gem_create()
Date: Tue,  5 Oct 2021 10:11:44 +0200
Message-Id: <20211005081151.23612-4-tzimmermann@suse.de>
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

Implement psb_gem_create() for general use. Create the GEM handle in
psb_gem_create_dumb(). Allows to use psb_gem_create() for creating all
of the GEM objects.

While at it, clean-up drm_gem_dumb_create() to make it more readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/gem.c | 93 ++++++++++++++++++++++--------------
 drivers/gpu/drm/gma500/gem.h |  4 +-
 2 files changed, 59 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index b52908313ee5..0c094d4e3f1c 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -175,45 +175,36 @@ struct gtt_range *psb_gtt_alloc_range(struct drm_device *dev, int len,
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
@@ -229,10 +220,40 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
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

