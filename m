Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8B908C88
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 15:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7CB10EAEA;
	Fri, 14 Jun 2024 13:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VgximUpZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XwTQcOrs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VgximUpZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XwTQcOrs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F33310E24F;
 Fri, 14 Jun 2024 13:36:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8D9B2053F;
 Fri, 14 Jun 2024 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC/Tz4Yqkhk7cqmPNeNVbm91VWWVkQP9gT8JczO+Fio=;
 b=VgximUpZ2x1TJz948ABxvMKD/SJwpWHH/x0f1Me764J6UpcQHs2wVt0jTtiHCrFDPWCtnb
 xNGTVvRSrKKBFg7HX9Zqi5kfMSyjneZhY1G+UK3w4tE0AsWXcGk4cfGjoQN2w4NiOummgj
 wqQiN4mzxFNYLZtzweTVJkRclkDFFgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC/Tz4Yqkhk7cqmPNeNVbm91VWWVkQP9gT8JczO+Fio=;
 b=XwTQcOrs1/IMIMT+84RlSXpyejo7f0nzQoxZzzOI3wxYV9gOaQXEiXESaGZnfGHNDv6Xd5
 jxUrBo7UviWLMYCQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VgximUpZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XwTQcOrs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1718372160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC/Tz4Yqkhk7cqmPNeNVbm91VWWVkQP9gT8JczO+Fio=;
 b=VgximUpZ2x1TJz948ABxvMKD/SJwpWHH/x0f1Me764J6UpcQHs2wVt0jTtiHCrFDPWCtnb
 xNGTVvRSrKKBFg7HX9Zqi5kfMSyjneZhY1G+UK3w4tE0AsWXcGk4cfGjoQN2w4NiOummgj
 wqQiN4mzxFNYLZtzweTVJkRclkDFFgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1718372160;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DC/Tz4Yqkhk7cqmPNeNVbm91VWWVkQP9gT8JczO+Fio=;
 b=XwTQcOrs1/IMIMT+84RlSXpyejo7f0nzQoxZzzOI3wxYV9gOaQXEiXESaGZnfGHNDv6Xd5
 jxUrBo7UviWLMYCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E8013AB1;
 Fri, 14 Jun 2024 13:36:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4F6AE0BHbGavPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jun 2024 13:36:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, ray.huang@amd.com, christian.koenig@amd.com,
 kraxel@redhat.com, airlied@redhat.com, suijingfeng@loongson.cn
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/6] drm/ttm: Support kmap for single-page mappings in
 ttm_bo_vmap()
Date: Fri, 14 Jun 2024 15:21:58 +0200
Message-ID: <20240614133556.11378-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
References: <20240614133556.11378-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B8D9B2053F
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

In ttm_bo_vmap(), set up single-page mappings with kmap() in certain
cases. The feature is already present in ttm_bo_kmap().

This functionality is require by DRM's xe driver, which claims that
using kmap() is an optimization over vmap(). [1] Reading the commit
at [2] indicates otherwise. It is not possible to use kmap_local_page()
and kunmap_local_page(), as TTM cannot guarantee the requirements for
ordering these calls. [3]

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://elixir.bootlin.com/linux/v6.9/source/drivers/gpu/drm/xe/xe_bo.c#L1870 # 1
Link: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com/T/#u # 2
Link: https://elixir.bootlin.com/linux/v6.9/source/include/linux/highmem.h#L70 # 3
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 33 ++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 31f9772f05dac..c06cfccace39d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -516,6 +516,8 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo,
 			.no_wait_gpu = false
 		};
 		struct ttm_tt *ttm = bo->ttm;
+		struct ttm_resource_manager *man =
+			ttm_manager_type(bo->bdev, bo->resource->mem_type);
 		unsigned long start_page = offset >> PAGE_SHIFT;
 		unsigned long aligned_size = size + (offset - (start_page << PAGE_SHIFT));
 		unsigned long num_pages = DIV_ROUND_UP(aligned_size, PAGE_SIZE);
@@ -527,15 +529,25 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo,
 		if (ret)
 			return ret;
 
-		/*
-		 * We need to use vmap to get the desired page protection
-		 * or to make the buffer object look contiguous.
-		 */
-		prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
-		vaddr = vmap(ttm->pages + start_page, num_pages, 0, prot);
-		if (!vaddr)
-			return -ENOMEM;
-		alloc_flags = ttm_bo_map_vmap;
+		if (num_pages == 1 && ttm->caching == ttm_cached &&
+		    !(man->use_tt && (ttm->page_flags & TTM_TT_FLAG_DECRYPTED))) {
+			/*
+			 * We're mapping a single page, and the desired
+			 * page protection is consistent with the bo.
+			 */
+			vaddr = kmap(ttm->pages[start_page]);
+			alloc_flags = ttm_bo_map_kmap;
+		} else {
+			/*
+			 * We need to use vmap to get the desired page protection
+			 * or to make the buffer object look contiguous.
+			 */
+			prot = ttm_io_prot(bo, mem, PAGE_KERNEL);
+			vaddr = vmap(ttm->pages + start_page, num_pages, 0, prot);
+			if (!vaddr)
+				return -ENOMEM;
+			alloc_flags = ttm_bo_map_vmap;
+		}
 
 		iosys_map_set_vaddr(map, vaddr);
 		map->alloc_flags = alloc_flags;
@@ -567,6 +579,9 @@ void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 	case ttm_bo_map_vmap:
 		vunmap(map->vaddr);
 		break;
+	case ttm_bo_map_kmap:
+		kunmap(kmap_to_page(map->vaddr));
+		break;
 	case ttm_bo_map_premapped:
 		break;
 	default:
-- 
2.45.2

