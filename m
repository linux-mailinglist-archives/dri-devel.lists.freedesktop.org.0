Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C735A908C84
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE7A10E27A;
	Fri, 14 Jun 2024 13:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PF2thHKd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AFUO5oQW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PF2thHKd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AFUO5oQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A940B10E746;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4EE4B33872;
 Fri, 14 Jun 2024 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaNx5tqAjaiAhSizfBYzjoCWc6At7tuq/F7DXXxrZUI=;
 b=PF2thHKdPo2R5mQRADdfg2/U2EPXIhcE9/dQfmOAv1cGuq340wcWsB+T5HT0kUgByGa072
 MMXo97v82qhd0d1Ry2FmxD9uGeuV6LZq/XHmtL6kxRr3mFg5Gphs/2hucSiEUxG1uYfapU
 a5PY99sADp2wKtkmLYmTZcEj/PJ2a+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaNx5tqAjaiAhSizfBYzjoCWc6At7tuq/F7DXXxrZUI=;
 b=AFUO5oQWfd7T2q/P6N9bHcGPOAiHKRlw//g1kqcjJb4RZmRB5VZe6KLgahZz0GwEdyzV6y
 JBj+Bml9scEDcHDw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PF2thHKd;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AFUO5oQW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaNx5tqAjaiAhSizfBYzjoCWc6At7tuq/F7DXXxrZUI=;
 b=PF2thHKdPo2R5mQRADdfg2/U2EPXIhcE9/dQfmOAv1cGuq340wcWsB+T5HT0kUgByGa072
 MMXo97v82qhd0d1Ry2FmxD9uGeuV6LZq/XHmtL6kxRr3mFg5Gphs/2hucSiEUxG1uYfapU
 a5PY99sADp2wKtkmLYmTZcEj/PJ2a+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SaNx5tqAjaiAhSizfBYzjoCWc6At7tuq/F7DXXxrZUI=;
 b=AFUO5oQWfd7T2q/P6N9bHcGPOAiHKRlw//g1kqcjJb4RZmRB5VZe6KLgahZz0GwEdyzV6y
 JBj+Bml9scEDcHDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF79013AB5;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wDhUNT9HbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:35:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/6] drm/ttm: Support partial buffer mappings for ttm_bo_vmap()
Date: Fri, 14 Jun 2024 15:21:57 +0200
Message-ID: <20240614133556.11378-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch,intel.com,amd.com,redhat.com,loongson.cn];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4EE4B33872
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
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

Add offset and size parameters to ttm_bo_vmap() to allow for partial
mappings of a buffer object. This brings the functionality on par with
ttm_bo_kmap().

Callers pass the byte offset and size within the buffer object and
receive a page-aligned mapping of the buffer object's memory for the
specified area.

Also update all callers of ttm_bo_vmap() for the new parameters. As
before, existing callers map the buffer object's complete memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_ttm_helper.c  |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c |  2 +-
 drivers/gpu/drm/loongson/lsdc_gem.c   |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c      |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c     | 21 +++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc.c           |  2 +-
 drivers/gpu/drm/xe/xe_vm.c            |  2 +-
 include/drm/ttm/ttm_bo.h              |  4 +++-
 8 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index 3734aa2d1c5b5..f26b7c9077a68 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -67,7 +67,7 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
 
-	return ttm_bo_vmap(bo, map);
+	return ttm_bo_vmap(bo, 0, gem->size, map);
 }
 EXPORT_SYMBOL(drm_gem_ttm_vmap);
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 6027584406af6..1670f9a459a9d 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -398,7 +398,7 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
 	 * no mapping present.
 	 */
 	if (iosys_map_is_null(&gbo->map)) {
-		ret = ttm_bo_vmap(&gbo->bo, &gbo->map);
+		ret = ttm_bo_vmap(&gbo->bo, 0, gbo->bo.base.size, &gbo->map);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index a720d8f532093..f709960c781b9 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -77,7 +77,7 @@ static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct iosys_map *ma
 		return ret;
 	}
 
-	ret = ttm_bo_vmap(tbo, &lbo->map);
+	ret = ttm_bo_vmap(tbo, 0, tbo->base.size, &lbo->map);
 	if (ret) {
 		drm_err(obj->dev, "ttm bo vmap failed\n");
 		lsdc_bo_unpin(lbo);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 5893e27a7ae50..9f06d5e26a32c 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -164,7 +164,7 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		goto out;
 	}
 
-	r = ttm_bo_vmap(&bo->tbo, &bo->map);
+	r = ttm_bo_vmap(&bo->tbo, 0, bo->tbo.base.size, &bo->map);
 	if (r) {
 		qxl_bo_unpin_locked(bo);
 		return r;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index a9df0deff2deb..31f9772f05dac 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -457,17 +457,23 @@ EXPORT_SYMBOL(ttm_bo_kunmap);
  * ttm_bo_vmap
  *
  * @bo: The buffer object.
+ * @offset: Byte offset into the buffer.
+ * @size: Number of bytes to map.
  * @map: pointer to a struct iosys_map representing the map.
  *
  * Sets up a kernel virtual mapping, using ioremap or vmap to the
  * data in the buffer object. The parameter @map returns the virtual
  * address as struct iosys_map. Unmap the buffer with ttm_bo_vunmap().
+ * The address stored in @map will be aligned to the next lower page
+ * boundaries.
  *
  * Returns
  * -ENOMEM: Out of memory.
  * -EINVAL: Invalid range.
  */
-int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
+int ttm_bo_vmap(struct ttm_buffer_object *bo,
+		unsigned long offset, unsigned long size,
+		struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
 	int ret;
@@ -483,18 +489,18 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		u16 alloc_flags;
 
 		if (mem->bus.addr) {
-			vaddr_iomem = (void __iomem *)mem->bus.addr;
+			vaddr_iomem = (u8 __iomem *)mem->bus.addr + offset;
 			alloc_flags = ttm_bo_map_premapped;
 		} else if (mem->bus.caching == ttm_write_combined) {
-			vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
+			vaddr_iomem = ioremap_wc(mem->bus.offset + offset, size);
 			alloc_flags = ttm_bo_map_iomap;
 #ifdef CONFIG_X86
 		} else if (mem->bus.caching == ttm_cached) {
-			vaddr_iomem = ioremap_cache(mem->bus.offset, bo->base.size);
+			vaddr_iomem = ioremap_cache(mem->bus.offset + offset, size);
 			alloc_flags = ttm_bo_map_iomap;
 #endif
 		} else {
-			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
+			vaddr_iomem = ioremap(mem->bus.offset + offset, size);
 			alloc_flags = ttm_bo_map_iomap;
 		}
 
@@ -510,6 +516,9 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 			.no_wait_gpu = false
 		};
 		struct ttm_tt *ttm = bo->ttm;
+		unsigned long start_page = offset >> PAGE_SHIFT;
+		unsigned long aligned_size = size + (offset - (start_page << PAGE_SHIFT));
+		unsigned long num_pages = DIV_ROUND_UP(aligned_size, PAGE_SIZE);
 		pgprot_t prot;
 		void *vaddr;
 		u16 alloc_flags;
@@ -523,7 +532,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		 * or to make the buffer object look contiguous.
 		 */
 		prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
-		vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
+		vaddr = vmap(ttm->pages + start_page, num_pages, 0, prot);
 		if (!vaddr)
 			return -ENOMEM;
 		alloc_flags = ttm_bo_map_vmap;
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index c1bb85d2e243f..3a68fe6d592ed 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1595,7 +1595,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
 		goto put_bo;
 
 	xe_bo_lock(bo, false);
-	if (!ttm_bo_vmap(&bo->ttm, &src)) {
+	if (!ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src)) {
 		xe_map_memcpy_from(xe_bo_device(bo),
 				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
 				   snapshot->lrc_size);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 99bf7412475c0..81306c32f5d09 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3485,7 +3485,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
 
 		if (bo) {
 			xe_bo_lock(bo, false);
-			err = ttm_bo_vmap(&bo->ttm, &src);
+			err = ttm_bo_vmap(&bo->ttm, 0, bo->ttm.base.size, &src);
 			if (!err) {
 				xe_map_memcpy_from(xe_bo_device(bo),
 						   snap->snap[i].data,
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 6ccf96c91f3ae..c421ffe3563b1 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -375,7 +375,9 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
 		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
 void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
-int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
+int ttm_bo_vmap(struct ttm_buffer_object *bo,
+		unsigned long offset, unsigned long size,
+		struct iosys_map *map);
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
-- 
2.45.2

