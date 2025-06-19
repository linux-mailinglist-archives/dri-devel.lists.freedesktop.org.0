Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D792EAE056D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B358D10EA16;
	Thu, 19 Jun 2025 12:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RkeIs8sU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h0Uy3UU1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RkeIs8sU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h0Uy3UU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8824B10EA13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:20:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 581051F7BE;
 Thu, 19 Jun 2025 12:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750335616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnG2DB6v1ouMsAKa5ZwQ00aI+K7ufgWjT0bRPr25F6Y=;
 b=RkeIs8sUkMbRNUAFMsljSBle10gmAupzcduRI2CsA9+obW6VTFh00WrjhPY3RJA80BuNO3
 FJjn+eDNjnuJ7mB6L9CuzXwAsUrLaUHrAb/Tg6jEvpiJW/HoWYXMozNad2Oz3PIqH3n7mQ
 ZUGyuW6BbsTmORjnPwXUAUcbatjHImw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750335616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnG2DB6v1ouMsAKa5ZwQ00aI+K7ufgWjT0bRPr25F6Y=;
 b=h0Uy3UU1p1Pe+mZDdhYzrGjLGvOv0/++JeLrJ/HuqCzUSFdE+fzzn40A8jCYykdBHhYrDh
 thHl9sx0HPfzKGDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750335616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnG2DB6v1ouMsAKa5ZwQ00aI+K7ufgWjT0bRPr25F6Y=;
 b=RkeIs8sUkMbRNUAFMsljSBle10gmAupzcduRI2CsA9+obW6VTFh00WrjhPY3RJA80BuNO3
 FJjn+eDNjnuJ7mB6L9CuzXwAsUrLaUHrAb/Tg6jEvpiJW/HoWYXMozNad2Oz3PIqH3n7mQ
 ZUGyuW6BbsTmORjnPwXUAUcbatjHImw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750335616;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnG2DB6v1ouMsAKa5ZwQ00aI+K7ufgWjT0bRPr25F6Y=;
 b=h0Uy3UU1p1Pe+mZDdhYzrGjLGvOv0/++JeLrJ/HuqCzUSFdE+fzzn40A8jCYykdBHhYrDh
 thHl9sx0HPfzKGDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B4ED136CC;
 Thu, 19 Jun 2025 12:20:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kONKBYAAVGigegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 19 Jun 2025 12:20:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, sumit.semwal@linaro.org
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/amdgpu: Use dma_buf from GEM object instance
Date: Thu, 19 Jun 2025 14:15:47 +0200
Message-ID: <20250619121635.105329-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619121635.105329-1-tzimmermann@suse.de>
References: <20250619121635.105329-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linaro.org];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach an implementation
detail of PRIME.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5743ebb2f1b7..ff98c87b2e0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 		return false;
 
 	if (drm_gem_is_imported(obj)) {
-		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
+		struct dma_buf *dma_buf = obj->dma_buf;
 
 		if (dma_buf->ops != &amdgpu_dmabuf_ops)
 			/* No XGMI with non AMD GPUs */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d1ccbfcf21fa..6626a6e64ff5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -317,8 +317,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	 */
 	if (!vm->is_compute_context || !vm->process_info)
 		return 0;
-	if (!drm_gem_is_imported(obj) ||
-	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
+	if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf))
 		return 0;
 	mutex_lock_nested(&vm->process_info->lock, 1);
 	if (!WARN_ON(!vm->process_info->eviction_fence)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 04100d4dea03..4f8b122ba7f8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 		struct drm_gem_object *obj = &bo->tbo.base;
 
 		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
-			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
+			struct dma_buf *dma_buf = obj->dma_buf;
 			struct drm_gem_object *gobj = dma_buf->priv;
 			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
 
-- 
2.49.0

