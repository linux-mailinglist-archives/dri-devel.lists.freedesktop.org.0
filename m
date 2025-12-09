Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C65ECB0249
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0310E5DC;
	Tue,  9 Dec 2025 14:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aYV7lO6L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MUlOSYX0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aYV7lO6L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MUlOSYX0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4024410E5D8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:01:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C45AF5BE31;
 Tue,  9 Dec 2025 14:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKwCR81GEaXnLZYrY8/D/szspikjPgTwFuPQ7QUCfBI=;
 b=aYV7lO6LuW/Cdm8QR/RpmW/ZcAem1sKjL0BRftJ7KLazl51tuCtW9Gdlx1Tqm1RHZjYAk9
 uz8tfZ0L9xl6Jg1WVQ6vPsu4RYuL4gfWTzZ/+ZTQMZ2CFCAOFIVbspYEr5PnO6Jw00QEku
 V9+Ru1SUhOgu9kpMoom6FDXK4is1G2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKwCR81GEaXnLZYrY8/D/szspikjPgTwFuPQ7QUCfBI=;
 b=MUlOSYX02N40UH22bpkiJ2lhFaHeCkkCGvS13Yt7LJtP1ykpoH6z9LTSspEHHUk05uL62s
 +OX/NDBIkYDx8FAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765288915; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKwCR81GEaXnLZYrY8/D/szspikjPgTwFuPQ7QUCfBI=;
 b=aYV7lO6LuW/Cdm8QR/RpmW/ZcAem1sKjL0BRftJ7KLazl51tuCtW9Gdlx1Tqm1RHZjYAk9
 uz8tfZ0L9xl6Jg1WVQ6vPsu4RYuL4gfWTzZ/+ZTQMZ2CFCAOFIVbspYEr5PnO6Jw00QEku
 V9+Ru1SUhOgu9kpMoom6FDXK4is1G2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765288915;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKwCR81GEaXnLZYrY8/D/szspikjPgTwFuPQ7QUCfBI=;
 b=MUlOSYX02N40UH22bpkiJ2lhFaHeCkkCGvS13Yt7LJtP1ykpoH6z9LTSspEHHUk05uL62s
 +OX/NDBIkYDx8FAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9236D3EA63;
 Tue,  9 Dec 2025 14:01:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wL/6INIrOGm1OgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:01:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, ogabbay@kernel.org,
 mamin506@gmail.com, lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-doc@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 06/13] drm/lima: Use GEM-UMA helpers for memory management
Date: Tue,  9 Dec 2025 14:42:03 +0100
Message-ID: <20251209140141.94407-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FREEMAIL_TO(0.00)[collabora.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,tomeuvizoso.net,imgtec.com,arm.com,igalia.com,redhat.com,chromium.org,lwn.net];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[29];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 R_RATELIMIT(0.00)[to_ip_from(RLzxzh56npx61idbi11ft8b9pb)];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Convert lima from GEM-SHMEM to GEM-UMA. The latter is just a copy,
so this change it merely renaming symbols. No functional changes.

GEM-SHMEM will become more self-contained for drivers without specific
memory management. GEM-UMA's interfaces will remain flexible for drivers
with UMA hardware, such as lima.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/lima/Kconfig    |  4 ++--
 drivers/gpu/drm/lima/lima_drv.c |  2 +-
 drivers/gpu/drm/lima/lima_gem.c | 30 +++++++++++++++---------------
 drivers/gpu/drm/lima/lima_gem.h |  6 +++---
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index fa1d4f5df31e..ad854acef58d 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -8,9 +8,9 @@ config DRM_LIMA
        depends on MMU
        depends on COMMON_CLK
        depends on OF
+       select DEVFREQ_GOV_SIMPLE_ONDEMAND
+       select DRM_GEM_UMA_HELPER
        select DRM_SCHED
-       select DRM_GEM_SHMEM_HELPER
        select PM_DEVFREQ
-       select DEVFREQ_GOV_SIMPLE_ONDEMAND
        help
 	 DRM driver for ARM Mali 400/450 GPUs.
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 65210ab081bb..9d57d2e002f9 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -276,7 +276,7 @@ static const struct drm_driver lima_drm_driver = {
 	.patchlevel         = 0,
 
 	.gem_create_object  = lima_gem_create_object,
-	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
+	.gem_prime_import_sg_table = drm_gem_uma_prime_import_sg_table,
 };
 
 struct lima_block_reader {
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 9722b847a539..d6f00dde22ac 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -110,16 +110,16 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 {
 	int err;
 	gfp_t mask;
-	struct drm_gem_shmem_object *shmem;
+	struct drm_gem_uma_object *uma;
 	struct drm_gem_object *obj;
 	struct lima_bo *bo;
 	bool is_heap = flags & LIMA_BO_FLAG_HEAP;
 
-	shmem = drm_gem_shmem_create(dev, size);
-	if (IS_ERR(shmem))
-		return PTR_ERR(shmem);
+	uma = drm_gem_uma_create(dev, size);
+	if (IS_ERR(uma))
+		return PTR_ERR(uma);
 
-	obj = &shmem->base;
+	obj = &uma->base;
 
 	/* Mali Utgard GPU can only support 32bit address space */
 	mask = mapping_gfp_mask(obj->filp->f_mapping);
@@ -133,7 +133,7 @@ int lima_gem_create_handle(struct drm_device *dev, struct drm_file *file,
 		if (err)
 			goto out;
 	} else {
-		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(shmem);
+		struct sg_table *sgt = drm_gem_uma_get_pages_sgt(uma);
 
 		if (IS_ERR(sgt)) {
 			err = PTR_ERR(sgt);
@@ -157,7 +157,7 @@ static void lima_gem_free_object(struct drm_gem_object *obj)
 	if (!list_empty(&bo->va))
 		dev_err(obj->dev->dev, "lima gem free bo still has va\n");
 
-	drm_gem_shmem_free(&bo->base);
+	drm_gem_uma_free(&bo->base);
 }
 
 static int lima_gem_object_open(struct drm_gem_object *obj, struct drm_file *file)
@@ -185,7 +185,7 @@ static int lima_gem_pin(struct drm_gem_object *obj)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_pin_locked(&bo->base);
+	return drm_gem_uma_pin_locked(&bo->base);
 }
 
 static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
@@ -195,7 +195,7 @@ static int lima_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_vmap_locked(&bo->base, map);
+	return drm_gem_uma_vmap_locked(&bo->base, map);
 }
 
 static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
@@ -205,21 +205,21 @@ static int lima_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 	if (bo->heap_size)
 		return -EINVAL;
 
-	return drm_gem_shmem_mmap(&bo->base, vma);
+	return drm_gem_uma_mmap(&bo->base, vma);
 }
 
 static const struct drm_gem_object_funcs lima_gem_funcs = {
 	.free = lima_gem_free_object,
 	.open = lima_gem_object_open,
 	.close = lima_gem_object_close,
-	.print_info = drm_gem_shmem_object_print_info,
+	.print_info = drm_gem_uma_object_print_info,
 	.pin = lima_gem_pin,
-	.unpin = drm_gem_shmem_object_unpin,
-	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.unpin = drm_gem_uma_object_unpin,
+	.get_sg_table = drm_gem_uma_object_get_sg_table,
 	.vmap = lima_gem_vmap,
-	.vunmap = drm_gem_shmem_object_vunmap,
+	.vunmap = drm_gem_uma_object_vunmap,
 	.mmap = lima_gem_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.vm_ops = &drm_gem_uma_vm_ops,
 };
 
 struct drm_gem_object *lima_gem_create_object(struct drm_device *dev, size_t size)
diff --git a/drivers/gpu/drm/lima/lima_gem.h b/drivers/gpu/drm/lima/lima_gem.h
index ccea06142f4b..6ad19fda3480 100644
--- a/drivers/gpu/drm/lima/lima_gem.h
+++ b/drivers/gpu/drm/lima/lima_gem.h
@@ -4,13 +4,13 @@
 #ifndef __LIMA_GEM_H__
 #define __LIMA_GEM_H__
 
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_uma_helper.h>
 
 struct lima_submit;
 struct lima_vm;
 
 struct lima_bo {
-	struct drm_gem_shmem_object base;
+	struct drm_gem_uma_object base;
 
 	struct mutex lock;
 	struct list_head va;
@@ -21,7 +21,7 @@ struct lima_bo {
 static inline struct lima_bo *
 to_lima_bo(struct drm_gem_object *obj)
 {
-	return container_of(to_drm_gem_shmem_obj(obj), struct lima_bo, base);
+	return container_of(to_drm_gem_uma_obj(obj), struct lima_bo, base);
 }
 
 static inline size_t lima_bo_size(struct lima_bo *bo)
-- 
2.52.0

