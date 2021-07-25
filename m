Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF93D4F3C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB326E441;
	Sun, 25 Jul 2021 17:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079A76E43D
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:44:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 899BB21F10;
 Sun, 25 Jul 2021 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627235083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdYI3K9dplkcuNR4JgZCy3iNdt6iBCOLvhyJd5iMtag=;
 b=R/ol0dDYwwSSGa6Hgxx6ZtddL5/UeW7BLnTZskMUbumaIPmSHd00awYaf6X2UKOPdoo0nf
 qPpm7iIp/rhpdvqzZ20mxN6HcE7Qxx1eEy0eI375fwJFO9s0zjRGpfiqoalbbxzOrsoLMn
 WEa0v5qy5cem/MIOEesTmI9zP+lP4hQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627235083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fdYI3K9dplkcuNR4JgZCy3iNdt6iBCOLvhyJd5iMtag=;
 b=hd50HxgBTq8e0H336Iw8GKLLqTv3ZHhDJC0h2IV0iIwGCDh9uwRa8TaKDKP42UHGzFtXv0
 vOHDaNrd+vbqADAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5600113A1A;
 Sun, 25 Jul 2021 17:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oDP/Ewuj/WCmMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 25 Jul 2021 17:44:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v2 4/5] drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
Date: Sun, 25 Jul 2021 19:44:37 +0200
Message-Id: <20210725174438.24493-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725174438.24493-1-tzimmermann@suse.de>
References: <20210725174438.24493-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 4d7a26b68a2e..7e009f562b30 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -14,8 +14,8 @@
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -152,7 +152,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 {
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	u8 compression = gdrm->compression;
-	struct dma_buf_map map;
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	void *vaddr, *buf;
 	size_t pitch, len;
 	int ret = 0;
@@ -162,11 +162,11 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 	if (len > gdrm->bulk_len)
 		return -E2BIG;
 
-	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
+	ret = drm_gem_fb_vmap(fb, map);
 	if (ret)
 		return ret;
 
-	vaddr = map.vaddr + fb->offsets[0];
+	vaddr = map[0].vaddr + fb->offsets[0];
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
@@ -225,7 +225,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
 end_cpu_access:
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 vunmap:
-	drm_gem_shmem_vunmap(fb->obj[0], &map);
+	drm_gem_fb_vunmap(fb, map);
 
 	return ret;
 }
-- 
2.32.0

