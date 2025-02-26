Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527E8A4680A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 18:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF6910E972;
	Wed, 26 Feb 2025 17:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="cqLUIfbR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f4KYlKOh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cqLUIfbR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f4KYlKOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E0810E996
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:28:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 14C9021125;
 Wed, 26 Feb 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BR9STEaDi84ry0HigszEXXz4A51pECHK5F09/pA2K44=;
 b=cqLUIfbRpc1LruMow8TtXioXOwO8Bw976J2SSXohGYOgEaG4BN98i39CNJv1/kLeSa/8Nh
 OaZLlMCn8mGY1iAGU6ffzTiDGtxFNGVCmQshD2hh1rGIzHSlxKYinBXXBO1p/j3z/3Je+k
 aaWwlM/obFrLwpsIbljxhOyBNYe6vM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590894;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BR9STEaDi84ry0HigszEXXz4A51pECHK5F09/pA2K44=;
 b=f4KYlKOhO/ZrkXGMq1fTnGMj64aihslvmiv/H3NdckVH/Sa/ib7caukHhWdAIyiob+mTxL
 R8+bAH9fadyoy/Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1740590894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BR9STEaDi84ry0HigszEXXz4A51pECHK5F09/pA2K44=;
 b=cqLUIfbRpc1LruMow8TtXioXOwO8Bw976J2SSXohGYOgEaG4BN98i39CNJv1/kLeSa/8Nh
 OaZLlMCn8mGY1iAGU6ffzTiDGtxFNGVCmQshD2hh1rGIzHSlxKYinBXXBO1p/j3z/3Je+k
 aaWwlM/obFrLwpsIbljxhOyBNYe6vM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1740590894;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BR9STEaDi84ry0HigszEXXz4A51pECHK5F09/pA2K44=;
 b=f4KYlKOhO/ZrkXGMq1fTnGMj64aihslvmiv/H3NdckVH/Sa/ib7caukHhWdAIyiob+mTxL
 R8+bAH9fadyoy/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7C7F13A53;
 Wed, 26 Feb 2025 17:28:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8KF6Ly1Pv2cWBAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Feb 2025 17:28:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/10] drm/gem-shmem: Test for imported buffers with
 drm_gem_is_imported()
Date: Wed, 26 Feb 2025 18:03:07 +0100
Message-ID: <20250226172457.217725-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226172457.217725-1-tzimmermann@suse.de>
References: <20250226172457.217725-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.950];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,linaro.org,amd.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.79
X-Spam-Flag: NO
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
 drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++------------
 include/drm/drm_gem_shmem_helper.h     |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..7722cd720248 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -160,7 +160,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
 	} else {
 		dma_resv_lock(shmem->base.resv, NULL);
@@ -255,7 +255,7 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	drm_WARN_ON(shmem->base.dev, shmem->base.import_attach);
+	drm_WARN_ON(shmem->base.dev, drm_gem_is_imported(&shmem->base));
 
 	ret = drm_gem_shmem_get_pages(shmem);
 
@@ -286,7 +286,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shmem)
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
 	ret = dma_resv_lock_interruptible(shmem->base.resv, NULL);
 	if (ret)
@@ -309,7 +309,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
 	dma_resv_lock(shmem->base.resv, NULL);
 	drm_gem_shmem_unpin_locked(shmem);
@@ -338,7 +338,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
 			if (drm_WARN_ON(obj->dev, map->is_iomem)) {
@@ -378,7 +378,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	return 0;
 
 err_put_pages:
-	if (!obj->import_attach)
+	if (!drm_gem_is_imported(obj))
 		drm_gem_shmem_put_pages(shmem);
 err_zero_use:
 	shmem->vmap_use_count = 0;
@@ -404,7 +404,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
 		dma_resv_assert_held(shmem->base.resv);
@@ -566,7 +566,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
 	dma_resv_lock(shmem->base.resv, NULL);
 
@@ -618,7 +618,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	struct drm_gem_object *obj = &shmem->base;
 	int ret;
 
-	if (obj->import_attach) {
+	if (drm_gem_is_imported(obj)) {
 		/* Reset both vm_ops and vm_private_data, so we don't end up with
 		 * vm_ops pointing to our implementation if the dma-buf backend
 		 * doesn't set those fields.
@@ -663,7 +663,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
 void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent)
 {
-	if (shmem->base.import_attach)
+	if (drm_gem_is_imported(&shmem->base))
 		return;
 
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
@@ -690,7 +690,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
 	return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >> PAGE_SHIFT);
 }
@@ -705,7 +705,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	if (shmem->sgt)
 		return shmem->sgt;
 
-	drm_WARN_ON(obj->dev, obj->import_attach);
+	drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
 
 	ret = drm_gem_shmem_get_pages(shmem);
 	if (ret)
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d22e3fb53631..cef5a6b5a4d6 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -120,7 +120,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct drm_gem_shmem_object *shmem
 {
 	return (shmem->madv > 0) &&
 		!shmem->vmap_use_count && shmem->sgt &&
-		!shmem->base.dma_buf && !shmem->base.import_attach;
+		!shmem->base.dma_buf && !drm_gem_is_imported(&shmem->base);
 }
 
 void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
-- 
2.48.1

