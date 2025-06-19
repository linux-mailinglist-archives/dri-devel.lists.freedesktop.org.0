Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1AAE0568
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373CF10EA0F;
	Thu, 19 Jun 2025 12:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621E10EA11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:20:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 147F42121F;
 Thu, 19 Jun 2025 12:20:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD2C9139CE;
 Thu, 19 Jun 2025 12:20:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gIezMH8AVGigegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 12:20:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] drm/amdgpu: Test for imported buffers with
 drm_gem_is_imported()
Date: Thu, 19 Jun 2025 14:15:46 +0200
Message-ID: <20250619121635.105329-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619121635.105329-1-tzimmermann@suse.de>
References: <20250619121635.105329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 147F42121F
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 14 ++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  4 ++--
 6 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 35c778426a7c..9e463d3ee927 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1317,7 +1317,7 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
 	bo = gem_to_amdgpu_bo(obj);
 	domains = amdgpu_display_supported_domains(drm_to_adev(dev), bo->flags);
-	if (obj->import_attach && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
+	if (drm_gem_is_imported(obj) && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
 		drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
 		drm_gem_object_put(obj);
 		return ERR_PTR(-EINVAL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 44e120f9f764..5743ebb2f1b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -513,7 +513,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 	if (!adev)
 		return false;
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 
 		if (dma_buf->ops != &amdgpu_dmabuf_ops)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index e5e33a68d935..d1ccbfcf21fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -317,7 +317,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	 */
 	if (!vm->is_compute_context || !vm->process_info)
 		return 0;
-	if (!obj->import_attach ||
+	if (!drm_gem_is_imported(obj) ||
 	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
 		return 0;
 	mutex_lock_nested(&vm->process_info->lock, 1);
@@ -1024,7 +1024,7 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		break;
 	}
 	case AMDGPU_GEM_OP_SET_PLACEMENT:
-		if (robj->tbo.base.import_attach &&
+		if (drm_gem_is_imported(&robj->tbo.base) &&
 		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
 			r = -EINVAL;
 			amdgpu_bo_unreserve(robj);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 73403744331a..989181e5f8e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -62,7 +62,7 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
 
 	amdgpu_bo_kunmap(bo);
 
-	if (bo->tbo.base.import_attach)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		drm_prime_gem_destroy(&bo->tbo.base, bo->tbo.sg);
 	drm_gem_object_release(&bo->tbo.base);
 	amdgpu_bo_unref(&bo->parent);
@@ -939,7 +939,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
 		domain = bo->preferred_domains & domain;
 
 	/* A shared bo cannot be migrated to VRAM */
-	if (bo->tbo.base.import_attach) {
+	if (drm_gem_is_imported(&bo->tbo.base)) {
 		if (domain & AMDGPU_GEM_DOMAIN_GTT)
 			domain = AMDGPU_GEM_DOMAIN_GTT;
 		else
@@ -967,7 +967,7 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
 	 */
 	domain = amdgpu_bo_get_preferred_domain(adev, domain);
 
-	if (bo->tbo.base.import_attach)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		dma_buf_pin(bo->tbo.base.import_attach);
 
 	/* force to pin into visible video ram */
@@ -1018,7 +1018,7 @@ void amdgpu_bo_unpin(struct amdgpu_bo *bo)
 	if (bo->tbo.pin_count)
 		return;
 
-	if (bo->tbo.base.import_attach)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		dma_buf_unpin(bo->tbo.base.import_attach);
 
 	if (bo->tbo.resource->mem_type == TTM_PL_VRAM) {
@@ -1263,7 +1263,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 
 	amdgpu_bo_kunmap(abo);
 
-	if (abo->tbo.base.dma_buf && !abo->tbo.base.import_attach &&
+	if (abo->tbo.base.dma_buf && !drm_gem_is_imported(&abo->tbo.base) &&
 	    old_mem && old_mem->mem_type != TTM_PL_SYSTEM)
 		dma_buf_move_notify(abo->tbo.base.dma_buf);
 
@@ -1576,7 +1576,6 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct dma_buf_attachment *attachment;
 	struct dma_buf *dma_buf;
 	const char *placement;
 	unsigned int pin_count;
@@ -1631,9 +1630,8 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *bo, struct seq_file *m)
 		seq_printf(m, " pin count %d", pin_count);
 
 	dma_buf = READ_ONCE(bo->tbo.base.dma_buf);
-	attachment = READ_ONCE(bo->tbo.base.import_attach);
 
-	if (attachment)
+	if (drm_gem_is_imported(&bo->tbo.base))
 		seq_printf(m, " imported from ino:%lu", file_inode(dma_buf->file)->i_ino);
 	else if (dma_buf)
 		seq_printf(m, " exported as ino:%lu", file_inode(dma_buf->file)->i_ino);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 9c5df35f05b7..6ce45278d69b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1060,7 +1060,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 	/* if the pages have userptr pinning then clear that first */
 	if (gtt->userptr) {
 		amdgpu_ttm_tt_unpin_userptr(bdev, ttm);
-	} else if (ttm->sg && gtt->gobj->import_attach) {
+	} else if (ttm->sg && drm_gem_is_imported(gtt->gobj)) {
 		struct dma_buf_attachment *attach;
 
 		attach = gtt->gobj->import_attach;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 0ff95a56c2ce..04100d4dea03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1271,7 +1271,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	} else {
 		struct drm_gem_object *obj = &bo->tbo.base;
 
-		if (obj->import_attach && bo_va->is_xgmi) {
+		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
 			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 			struct drm_gem_object *gobj = dma_buf->priv;
 			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
@@ -1631,7 +1631,7 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 		 * validation
 		 */
 		if (vm->is_compute_context &&
-		    bo_va->base.bo->tbo.base.import_attach &&
+		    drm_gem_is_imported(&bo_va->base.bo->tbo.base) &&
 		    (!bo_va->base.bo->tbo.resource ||
 		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM))
 			amdgpu_vm_bo_evicted_user(&bo_va->base);
-- 
2.49.0

