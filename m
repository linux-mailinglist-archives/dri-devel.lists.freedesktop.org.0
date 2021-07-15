Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9256C3CA4ED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA7E6E895;
	Thu, 15 Jul 2021 18:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9966E88E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:01:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CAB8822AE6;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626372096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuUoPjuf5zELzxU0Fkx3MhXx83K4DxoaLdZelrymvC4=;
 b=YGyN838tF+SjByTxoThtp2qkF40tDdnXjgkiEtKGFAKV72AqOAsBGuBHqZzjan/4L/xYCN
 3UY822G4ex7D3xI49CnZSFyupnhd70QIzzTnxk9e9Ba4k8K5XjXnsOUpb+gbYsNSjS73Y+
 D3GAdc9juBemw8dIadHEzSiA11wSoeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626372096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuUoPjuf5zELzxU0Fkx3MhXx83K4DxoaLdZelrymvC4=;
 b=H+rdkWwBzgaXhj+8y5XiUfgg3ilbl6WxdUqRIj7AGPzXExNk0TQ5DTwxSLsNq/ERqG8iap
 hRQ+piW2ViU293CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 950C013C41;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8D9/IwB48GBoIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 18:01:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH 4/5] drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
Date: Thu, 15 Jul 2021 20:01:32 +0200
Message-Id: <20210715180133.3675-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715180133.3675-1-tzimmermann@suse.de>
References: <20210715180133.3675-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abstract the framebuffer details by mapping its BOs with a call
to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunmap().

The call to drm_gem_fb_vmap() ensures that all BOs are mapped
correctly. Gud still only supports single-plane formats.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gud/gud_pipe.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8f56bf618ac2..8243c8682366 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -15,7 +15,8 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -152,7 +153,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 {
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	u8 compression = gdrm->compression;
-	struct dma_buf_map map;
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	void *vaddr, *buf;
 	size_t pitch, len;
 	int ret = 0;
@@ -162,11 +163,11 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	if (len > gdrm->bulk_len)
 		return -E2BIG;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = drm_gem_fb_vmap(fb, map);
 	if (ret)
 		return ret;
 
-	vaddr = map.vaddr + fb->offsets[0];
+	vaddr = map[0].vaddr + fb->offsets[0];
 
 	if (import_attach) {
 		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
@@ -228,7 +229,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	if (import_attach)
 		dma_buf_end_cpu_access(import_attach->dmabuf, DMA_FROM_DEVICE);
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+	drm_gem_fb_vunmap(fb, map);
 
 	return ret;
 }
-- 
2.32.0

