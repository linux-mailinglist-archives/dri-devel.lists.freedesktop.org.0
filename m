Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C94908C8D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9E10ED45;
	Fri, 14 Jun 2024 13:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZxAw88Zq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z9EV6OR8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZxAw88Zq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z9EV6OR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE2A10E252;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D973D33870;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHX6W35lBy+nLaw7C6R+lHBd02eCMOuRYcEF5LhQb7o=;
 b=ZxAw88ZqvIaujhTO5ePItwkmJEYpFZ5OCgSLsUmCXF+8ZFRMh0MbO9lqwNhPRWmFOBRTrs
 MKKTvQxeG6ZNN9O3c0ZteFML1vkhEFHcPC4xFurbyUa+slilB7H8pxpQjvULOTqGQGtqZs
 yUcVSf70LQqAkFFPdPOuF4OxWbp/v3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHX6W35lBy+nLaw7C6R+lHBd02eCMOuRYcEF5LhQb7o=;
 b=Z9EV6OR8Wp5my78AbIQtuRrh/ResOEbfoYgKed0i6+8kOZqXKFYqugBl5PVNLBKLkvvc9e
 imJ0yseruJqVi8CQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZxAw88Zq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Z9EV6OR8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHX6W35lBy+nLaw7C6R+lHBd02eCMOuRYcEF5LhQb7o=;
 b=ZxAw88ZqvIaujhTO5ePItwkmJEYpFZ5OCgSLsUmCXF+8ZFRMh0MbO9lqwNhPRWmFOBRTrs
 MKKTvQxeG6ZNN9O3c0ZteFML1vkhEFHcPC4xFurbyUa+slilB7H8pxpQjvULOTqGQGtqZs
 yUcVSf70LQqAkFFPdPOuF4OxWbp/v3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372159;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHX6W35lBy+nLaw7C6R+lHBd02eCMOuRYcEF5LhQb7o=;
 b=Z9EV6OR8Wp5my78AbIQtuRrh/ResOEbfoYgKed0i6+8kOZqXKFYqugBl5PVNLBKLkvvc9e
 imJ0yseruJqVi8CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7515713AB1;
 Fri, 14 Jun 2024 13:35:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gEpWGz9HbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:35:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/6] drm/ttm: Store the bo_kmap_type in struct iosys_map
Date: Fri, 14 Jun 2024 15:21:56 +0200
Message-ID: <20240614133556.11378-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D973D33870
X-Spam-Score: -1.72
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.72 / 50.00]; BAYES_HAM(-1.71)[93.21%];
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
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

For each instances of struct iosys_map set up by ttm_bo_vmap(), store
the type of allocation in the instance. Use this information to unmap
the memory in ttm_bo_vunmap(). This change simplifies the unmap code
and puts the complicated logic entirely into the map code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 46 +++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 0b3f4267130c4..a9df0deff2deb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -36,6 +36,7 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_device.h>
 
 struct ttm_transfer_obj {
 	struct ttm_buffer_object base;
@@ -479,24 +480,29 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 
 	if (mem->bus.is_iomem) {
 		void __iomem *vaddr_iomem;
+		u16 alloc_flags;
 
-		if (mem->bus.addr)
+		if (mem->bus.addr) {
 			vaddr_iomem = (void __iomem *)mem->bus.addr;
-		else if (mem->bus.caching == ttm_write_combined)
-			vaddr_iomem = ioremap_wc(mem->bus.offset,
-						 bo->base.size);
+			alloc_flags = ttm_bo_map_premapped;
+		} else if (mem->bus.caching == ttm_write_combined) {
+			vaddr_iomem = ioremap_wc(mem->bus.offset, bo->base.size);
+			alloc_flags = ttm_bo_map_iomap;
 #ifdef CONFIG_X86
-		else if (mem->bus.caching == ttm_cached)
-			vaddr_iomem = ioremap_cache(mem->bus.offset,
-						  bo->base.size);
+		} else if (mem->bus.caching == ttm_cached) {
+			vaddr_iomem = ioremap_cache(mem->bus.offset, bo->base.size);
+			alloc_flags = ttm_bo_map_iomap;
 #endif
-		else
+		} else {
 			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
+			alloc_flags = ttm_bo_map_iomap;
+		}
 
 		if (!vaddr_iomem)
 			return -ENOMEM;
 
 		iosys_map_set_vaddr_iomem(map, vaddr_iomem);
+		map->alloc_flags = alloc_flags;
 
 	} else {
 		struct ttm_operation_ctx ctx = {
@@ -506,6 +512,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		struct ttm_tt *ttm = bo->ttm;
 		pgprot_t prot;
 		void *vaddr;
+		u16 alloc_flags;
 
 		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
 		if (ret)
@@ -519,8 +526,10 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 		vaddr = vmap(ttm->pages, ttm->num_pages, 0, prot);
 		if (!vaddr)
 			return -ENOMEM;
+		alloc_flags = ttm_bo_map_vmap;
 
 		iosys_map_set_vaddr(map, vaddr);
+		map->alloc_flags = alloc_flags;
 	}
 
 	return 0;
@@ -537,20 +546,27 @@ EXPORT_SYMBOL(ttm_bo_vmap);
  */
 void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
-	struct ttm_resource *mem = bo->resource;
-
 	dma_resv_assert_held(bo->base.resv);
 
 	if (iosys_map_is_null(map))
 		return;
 
-	if (!map->is_iomem)
-		vunmap(map->vaddr);
-	else if (!mem->bus.addr)
+	switch (map->alloc_flags) {
+	case ttm_bo_map_iomap:
 		iounmap(map->vaddr_iomem);
-	iosys_map_clear(map);
-
+		break;
+	case ttm_bo_map_vmap:
+		vunmap(map->vaddr);
+		break;
+	case ttm_bo_map_premapped:
+		break;
+	default:
+		drm_err(bo->base.dev, "Unsupported alloc_flags 0x%x\n", map->alloc_flags);
+		return;
+	}
 	ttm_mem_io_free(bo->bdev, bo->resource);
+
+	iosys_map_clear(map);
 }
 EXPORT_SYMBOL(ttm_bo_vunmap);
 
-- 
2.45.2

