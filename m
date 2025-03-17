Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBABA650BB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF8610E409;
	Mon, 17 Mar 2025 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b6OW7YO9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRVIYul/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b6OW7YO9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jRVIYul/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054AF10E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:23:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 542392001F;
 Mon, 17 Mar 2025 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFeISSWmL4kwK41CRh01WtejS3evCCkoY+0WyvgB0I0=;
 b=b6OW7YO9MxmkEODZPfdi2lhAaPUoitxVa3qmVqeEM8Tnpj/p2Mqq0xumH9kRx7h2/xFvqD
 O07YulAQMUBsTlYPIEP5xYPQDgJmEpbU6TiD7XMFIuP0vsHR8ShSCeaZkzvgsL4sLVmKuV
 Nhf1rkdOuibJ6x0/8oXNxyj68Yt8er4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFeISSWmL4kwK41CRh01WtejS3evCCkoY+0WyvgB0I0=;
 b=jRVIYul/el4vYJ+IpbyJPnORxNKsgXe+uTI/ZlF3NLvrfeGss+am9CMpxbKaaNaZB0bECI
 /1TJW5JixBr4N1AA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=b6OW7YO9;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="jRVIYul/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFeISSWmL4kwK41CRh01WtejS3evCCkoY+0WyvgB0I0=;
 b=b6OW7YO9MxmkEODZPfdi2lhAaPUoitxVa3qmVqeEM8Tnpj/p2Mqq0xumH9kRx7h2/xFvqD
 O07YulAQMUBsTlYPIEP5xYPQDgJmEpbU6TiD7XMFIuP0vsHR8ShSCeaZkzvgsL4sLVmKuV
 Nhf1rkdOuibJ6x0/8oXNxyj68Yt8er4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFeISSWmL4kwK41CRh01WtejS3evCCkoY+0WyvgB0I0=;
 b=jRVIYul/el4vYJ+IpbyJPnORxNKsgXe+uTI/ZlF3NLvrfeGss+am9CMpxbKaaNaZB0bECI
 /1TJW5JixBr4N1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A57113A2C;
 Mon, 17 Mar 2025 13:22:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kPBLASEi2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 09/15] drm/panthor: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:47 +0100
Message-ID: <20250317131923.238374-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 542392001F
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..fd014ccc3bfc 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -155,7 +155,7 @@ static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	enum drm_gem_object_status res = 0;
 
-	if (bo->base.base.import_attach || bo->base.pages)
+	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
 		res |= DRM_GEM_OBJECT_RESIDENT;
 
 	return res;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 12a02e28f50f..3e123159ac10 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1103,7 +1103,7 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
 	/* If the vm_bo object was destroyed, release the pin reference that
 	 * was hold by this object.
 	 */
-	if (unpin && !bo->base.base.import_attach)
+	if (unpin && !drm_gem_is_imported(&bo->base.base))
 		drm_gem_shmem_unpin(&bo->base);
 
 	drm_gpuvm_put(vm);
@@ -1234,7 +1234,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	if (ret)
 		goto err_cleanup;
 
-	if (!bo->base.base.import_attach) {
+	if (!drm_gem_is_imported(&bo->base.base)) {
 		/* Pre-reserve the BO pages, so the map operation doesn't have to
 		 * allocate.
 		 */
@@ -1245,7 +1245,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
 	if (IS_ERR(sgt)) {
-		if (!bo->base.base.import_attach)
+		if (!drm_gem_is_imported(&bo->base.base))
 			drm_gem_shmem_unpin(&bo->base);
 
 		ret = PTR_ERR(sgt);
@@ -1256,7 +1256,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
-		if (!bo->base.base.import_attach)
+		if (!drm_gem_is_imported(&bo->base.base))
 			drm_gem_shmem_unpin(&bo->base);
 
 		ret = -ENOMEM;
@@ -1282,7 +1282,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	 * which will be released in panthor_vm_bo_put().
 	 */
 	if (preallocated_vm_bo != op_ctx->map.vm_bo &&
-	    !bo->base.base.import_attach)
+	    !drm_gem_is_imported(&bo->base.base))
 		drm_gem_shmem_unpin(&bo->base);
 
 	op_ctx->map.bo_offset = offset;
-- 
2.48.1

