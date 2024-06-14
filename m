Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52234908C8A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F387A10ED5D;
	Fri, 14 Jun 2024 13:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="t+3+5ycK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ryMEyGPY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CW8MLZ7F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Mrb2B2sD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120D210E746;
 Fri, 14 Jun 2024 13:36:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96C9E20542;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFRnd/qhxpPmZMYDORcvPtacx3rDNVTHZIGudbT0oRI=;
 b=t+3+5ycKXBTaVbcfR0TQE40/enH13hPXxkDrXgniq+YvyJsaiTLE6iF6uHOlxNsOaE/5eo
 2Or5AEZwMkFns80o9ZXs/Gi0uUpnYWBDSWQtJP1eAFd7DwtVW1w++QX7JoalLbfnA9iNPN
 J4z8JPwVDMRmXbhLsc+ONJbcOPn5LvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372162;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFRnd/qhxpPmZMYDORcvPtacx3rDNVTHZIGudbT0oRI=;
 b=ryMEyGPYsDscFnDO6WZCTVfChulzukEDO354XesdUB1Ba7PhwsHxwMMUBeS7dUwAxLU/63
 QqB0EpVprbgY2pAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CW8MLZ7F;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Mrb2B2sD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFRnd/qhxpPmZMYDORcvPtacx3rDNVTHZIGudbT0oRI=;
 b=CW8MLZ7F3RDCLXX4GsI1Jjb/3I/Dc6+v9NLB8ci+JkVmR1Wg7Twezjn/dZakYOFuRq6jw+
 H4/ChZMynxJoETKcIuGAyHA7iceNckvlGIsFvWDB6sgMGpiUClIBLhFfY93SBBooFUliJv
 4uttpYEMMAp8bVhiaYupXPvN01ksRhQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372161;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFRnd/qhxpPmZMYDORcvPtacx3rDNVTHZIGudbT0oRI=;
 b=Mrb2B2sD3qoVGMzRwOYOOodGnHneFgSgyCmvwvy0WO/uBeFmBYnT7Xz6gv1vRx0e/VWKMi
 rcZJcxWeh2Q+//Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33D2C13AB1;
 Fri, 14 Jun 2024 13:36:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GPtPC0FHbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:36:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] drm/xe: Replace ttm_bo_kmap() with ttm_bo_vmap()
Date: Fri, 14 Jun 2024 15:22:00 +0200
Message-ID: <20240614133556.11378-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 96C9E20542
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spam-Flag: NO
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
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

Use the newer ttm_bo_vmap() instead of ttm_bo_kmap(). The new interface
uses struct iomap_map, which helps with pointer setup and memcpy() ops.
Removes a TODO item and quite a bit of workarounds from the code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../compat-i915-headers/gem/i915_gem_object.h | 17 +++-------
 drivers/gpu/drm/xe/xe_bo.c                    | 32 ++++---------------
 drivers/gpu/drm/xe/xe_bo_types.h              |  2 --
 3 files changed, 10 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
index 777c20ceabab1..25ae56d700431 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
@@ -34,28 +34,19 @@ static inline bool i915_gem_object_is_userptr(const struct xe_bo *bo)
 static inline int i915_gem_object_read_from_page(struct xe_bo *bo,
 					  u32 ofs, u64 *ptr, u32 size)
 {
-	struct ttm_bo_kmap_obj map;
-	void *src;
-	bool is_iomem;
+	struct iosys_map src;
 	int ret;
 
 	ret = xe_bo_lock(bo, true);
 	if (ret)
 		return ret;
 
-	ret = ttm_bo_kmap(&bo->ttm, ofs >> PAGE_SHIFT, 1, &map);
+	ret = ttm_bo_vmap(&bo->ttm, ofs, size, &src);
 	if (ret)
 		goto out_unlock;
+	iosys_map_memcpy_from(ptr, &src, ofs & ~PAGE_MASK, size);
+	ttm_bo_vunmap(&bo->ttm, &src);
 
-	ofs &= ~PAGE_MASK;
-	src = ttm_kmap_obj_virtual(&map, &is_iomem);
-	src += ofs;
-	if (is_iomem)
-		memcpy_fromio(ptr, (void __iomem *)src, size);
-	else
-		memcpy(ptr, src, size);
-
-	ttm_bo_kunmap(&map);
 out_unlock:
 	xe_bo_unlock(bo);
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a98d857ff1e5a..6158e1a959cd4 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1888,10 +1888,6 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
 
 int xe_bo_vmap(struct xe_bo *bo)
 {
-	void *virtual;
-	bool is_iomem;
-	int ret;
-
 	xe_bo_assert_held(bo);
 
 	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
@@ -1900,32 +1896,16 @@ int xe_bo_vmap(struct xe_bo *bo)
 	if (!iosys_map_is_null(&bo->vmap))
 		return 0;
 
-	/*
-	 * We use this more or less deprecated interface for now since
-	 * ttm_bo_vmap() doesn't offer the optimization of kmapping
-	 * single page bos, which is done here.
-	 * TODO: Fix up ttm_bo_vmap to do that, or fix up ttm_bo_kmap
-	 * to use struct iosys_map.
-	 */
-	ret = ttm_bo_kmap(&bo->ttm, 0, bo->size >> PAGE_SHIFT, &bo->kmap);
-	if (ret)
-		return ret;
-
-	virtual = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
-	if (is_iomem)
-		iosys_map_set_vaddr_iomem(&bo->vmap, (void __iomem *)virtual);
-	else
-		iosys_map_set_vaddr(&bo->vmap, virtual);
-
-	return 0;
+	return ttm_bo_vmap(&bo->ttm, 0, bo->size, &bo->vmap);
 }
 
 static void __xe_bo_vunmap(struct xe_bo *bo)
 {
-	if (!iosys_map_is_null(&bo->vmap)) {
-		iosys_map_clear(&bo->vmap);
-		ttm_bo_kunmap(&bo->kmap);
-	}
+	if (iosys_map_is_null(&bo->vmap))
+		return;
+
+	ttm_bo_vunmap(&bo->ttm, &bo->vmap);
+	iosys_map_clear(&bo->vmap);
 }
 
 void xe_bo_vunmap(struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 86422e113d396..5cba681ba73c2 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -42,8 +42,6 @@ struct xe_bo {
 	struct drm_mm_node ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
-	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
-	struct ttm_bo_kmap_obj kmap;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
 #ifdef CONFIG_PROC_FS
-- 
2.45.2

