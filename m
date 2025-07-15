Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C0B054E0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB0710E55C;
	Tue, 15 Jul 2025 08:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AsVyLo51";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PvMDxQSh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AsVyLo51";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PvMDxQSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0D610E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:29:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B3CA81F397;
 Tue, 15 Jul 2025 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752568184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=96tkJpBq9vOnVWRn5QeDTL0n+r72FKMxZ/qCvCd1IYo=;
 b=AsVyLo51tmjHqaHNANvfAg3gC5d5uCiEJhx3LHLb/WrFBYu47bEr153atvDWPhv5rR9aHu
 byW+QS+U7xKz/n90Kxl+HeMRt0DcaWrAYJKUVqhJxaNodOiU7EfAXWAdAa8IFfFogF5ah4
 Q+n3slitgY4/dJSyxOt5HLYB6neqpAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752568184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=96tkJpBq9vOnVWRn5QeDTL0n+r72FKMxZ/qCvCd1IYo=;
 b=PvMDxQShYskwVavy8KRNibsuEpamy71pBvLbKCjQJRNXm0tKloMMmd0Kp30K6boaG2mP5e
 jvT/KES24CVvx+Cw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AsVyLo51;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PvMDxQSh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752568184; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=96tkJpBq9vOnVWRn5QeDTL0n+r72FKMxZ/qCvCd1IYo=;
 b=AsVyLo51tmjHqaHNANvfAg3gC5d5uCiEJhx3LHLb/WrFBYu47bEr153atvDWPhv5rR9aHu
 byW+QS+U7xKz/n90Kxl+HeMRt0DcaWrAYJKUVqhJxaNodOiU7EfAXWAdAa8IFfFogF5ah4
 Q+n3slitgY4/dJSyxOt5HLYB6neqpAk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752568184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=96tkJpBq9vOnVWRn5QeDTL0n+r72FKMxZ/qCvCd1IYo=;
 b=PvMDxQShYskwVavy8KRNibsuEpamy71pBvLbKCjQJRNXm0tKloMMmd0Kp30K6boaG2mP5e
 jvT/KES24CVvx+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7849113306;
 Tue, 15 Jul 2025 08:29:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FDb6G3gRdmjzVAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 08:29:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] Revert "drm/amdgpu: Use dma_buf from GEM object instance"
Date: Tue, 15 Jul 2025 10:26:22 +0200
Message-ID: <20250715082635.34974-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 RCPT_COUNT_SEVEN(0.00)[7];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: B3CA81F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

This reverts commit 515986100d176663d0a03219a3056e4252f729e6.

The dma_buf field in struct drm_gem_object is not stable over the
object instance's lifetime. The field becomes NULL when user space
releases the final GEM handle on the buffer object. This resulted
in a NULL-pointer deref.

Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
Acquire internal references on GEM handles") only solved the problem
partially. They especially don't work for buffer objects without a DRM
framebuffer associated.

Hence, this revert to going back to using .import_attach->dmabuf.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index ff98c87b2e0b..5743ebb2f1b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 		return false;
 
 	if (drm_gem_is_imported(obj)) {
-		struct dma_buf *dma_buf = obj->dma_buf;
+		struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 
 		if (dma_buf->ops != &amdgpu_dmabuf_ops)
 			/* No XGMI with non AMD GPUs */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 6626a6e64ff5..d1ccbfcf21fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -317,7 +317,8 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	 */
 	if (!vm->is_compute_context || !vm->process_info)
 		return 0;
-	if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf))
+	if (!drm_gem_is_imported(obj) ||
+	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
 		return 0;
 	mutex_lock_nested(&vm->process_info->lock, 1);
 	if (!WARN_ON(!vm->process_info->eviction_fence)) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index af0f655dfd5b..b9b4f7d9186e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 		struct drm_gem_object *obj = &bo->tbo.base;
 
 		if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
-			struct dma_buf *dma_buf = obj->dma_buf;
+			struct dma_buf *dma_buf = obj->import_attach->dmabuf;
 			struct drm_gem_object *gobj = dma_buf->priv;
 			struct amdgpu_bo *abo = gem_to_amdgpu_bo(gobj);
 
-- 
2.50.0

