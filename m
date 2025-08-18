Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF5B29C87
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CB310E3ED;
	Mon, 18 Aug 2025 08:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lc9J8qrH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78aJbRdA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lc9J8qrH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="78aJbRdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8859E10E3ED
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:44:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26055210F4;
 Mon, 18 Aug 2025 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755506678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ChDTJIm+CdJKaw84pMFBSuou82Gt27yyrHFbFT0v0Ww=;
 b=lc9J8qrHwVC66yGjYqAQvdZZpRduKxjhISz6KhLSoY/P/C/c5VtP8PHXN0zairjCt5qWIs
 Y70hX3BXOxwexlAURNxhAsZ3uyEUvKj2aQKFpapkJV88QC678gqCbVLjxXtwCVilQPAu+e
 yz9JhH6rVGTeBLGAaVWJogEyoY0Wzmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755506678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ChDTJIm+CdJKaw84pMFBSuou82Gt27yyrHFbFT0v0Ww=;
 b=78aJbRdA78VwqnTR+ZyIMp3l+mroMJr2OIglUnImaHfpnhD/FP/mt8Dv+sTNaZAE5cI5ok
 eu0GUuCEC1TR0xBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1755506678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ChDTJIm+CdJKaw84pMFBSuou82Gt27yyrHFbFT0v0Ww=;
 b=lc9J8qrHwVC66yGjYqAQvdZZpRduKxjhISz6KhLSoY/P/C/c5VtP8PHXN0zairjCt5qWIs
 Y70hX3BXOxwexlAURNxhAsZ3uyEUvKj2aQKFpapkJV88QC678gqCbVLjxXtwCVilQPAu+e
 yz9JhH6rVGTeBLGAaVWJogEyoY0Wzmk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1755506678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ChDTJIm+CdJKaw84pMFBSuou82Gt27yyrHFbFT0v0Ww=;
 b=78aJbRdA78VwqnTR+ZyIMp3l+mroMJr2OIglUnImaHfpnhD/FP/mt8Dv+sTNaZAE5cI5ok
 eu0GUuCEC1TR0xBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B756B13686;
 Mon, 18 Aug 2025 08:44:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 29FPK/XnomhYLAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Aug 2025 08:44:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, oushixiong@kylinos.cn,
 alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/amdgpu: Pin buffer while vmap'ing exported dma-buf objects
Date: Mon, 18 Aug 2025 10:41:20 +0200
Message-ID: <20250818084148.212443-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[linaro.org,amd.com,kylinos.cn,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[14]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 URIBL_BLOCKED(0.00)[linaro.org:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,lists.freedesktop.org:email,ffwll.ch:email,intel.com:email,kylinos.cn:email,amd.com:email];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, lists.freedesktop.org:email, intel.com:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30
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

Current dma-buf vmap semantics require that the mapped buffer remains
in place until the corresponding vunmap has completed.

For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
an S/G table in import. GEM-SHMEN can now import dma-buf objects without
creating the S/G table, so the pin is missing. Leads to page-fault errors,
such as the one shown below.

[  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
[...]
[  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
[...]
[  102.243250] Call Trace:
[  102.245695]  <TASK>
[  102.2477V95]  ? validate_chain+0x24e/0x5e0
[  102.251805]  ? __lock_acquire+0x568/0xae0
[  102.255807]  udl_render_hline+0x165/0x341 [udl]
[  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
[  102.265379]  ? local_clock_noinstr+0xb/0x100
[  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
[  102.274246]  ? mark_held_locks+0x40/0x70
[  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
[  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
[  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
[  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
[  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
[  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
[  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
[  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
[  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
[  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
[  102.333622]  commit_tail+0x204/0x330
[...]
[  102.529946] ---[ end trace 0000000000000000 ]---
[  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]

In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
mapping.

Provide a custom dma-buf vmap method in amdgpu that pins the object before
mapping it's buffer's pages into kernel address space. Do the opposite in
vunmap.

Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
instead of its GEM code.

A discussion of various approaches to solving the problem is available
at [1].

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
Cc: Shixiong Ou <oushixiong@kylinos.cn>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 36 +++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 5743ebb2f1b7..5b33776eeece 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -285,6 +285,38 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	return ret;
 }
 
+static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	int ret;
+
+	/*
+	 * Pin to keep buffer in place while it's vmap'ed. The actual
+	 * location is not important as long as it's mapable.
+	 *
+	 * This code is required for exporting to GEM-SHMEM without S/G table.
+	 * Once GEM-SHMEM supports dynamic imports, it should be dropped.
+	 */
+	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_MASK);
+	if (ret)
+		return ret;
+	ret = drm_gem_dmabuf_vmap(dma_buf, map);
+	if (ret)
+		amdgpu_bo_unpin(bo);
+
+	return ret;
+}
+
+static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
+{
+	struct drm_gem_object *obj = dma_buf->priv;
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+
+	drm_gem_dmabuf_vunmap(dma_buf, map);
+	amdgpu_bo_unpin(bo);
+}
+
 const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.attach = amdgpu_dma_buf_attach,
 	.pin = amdgpu_dma_buf_pin,
@@ -294,8 +326,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
 	.release = drm_gem_dmabuf_release,
 	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
 	.mmap = drm_gem_dmabuf_mmap,
-	.vmap = drm_gem_dmabuf_vmap,
-	.vunmap = drm_gem_dmabuf_vunmap,
+	.vmap = amdgpu_dma_buf_vmap,
+	.vunmap = amdgpu_dma_buf_vunmap,
 };
 
 /**
-- 
2.50.1

