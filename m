Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F04AD595
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4DF10E3FB;
	Tue,  8 Feb 2022 10:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CC910E224;
 Tue,  8 Feb 2022 10:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317111; x=1675853111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mN9K51vTDl0W52W7ywGb05QpC05SBH0LiTQxmYECtEA=;
 b=nvVQpxODBIPorvhWQVGC1QDjJygFK5Qocn3bYPvSctMPdTtUwI53Jh1O
 rUzzddEhjfFrH7hSbhsC93sSyCCk6HpJrIB2VnoMVxX01x7YEhX9fTxVN
 n41Bcf7EfvWmcmusTr4spi5zispno4CTQC6b/Ud9leOdAxiT+6Z57eJ/h
 NMpQrKearOlGMGBhFw6qs/Wtu++y5YF+extc/FG/oYr/Il2jFpGbOwELm
 1c1HjbctWDEkTPLXmdl1wwxkNv0a3dBBP98S+4jtbl14gDw+nzeWRmaSQ
 2v9X5CbpNguRJ65+dJlK8J8TN/JjxOc7ouvziBu9F8P+etcTIvbWUTyDM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="249130464"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="249130464"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804108"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/18] iosys-map: Add offset to iosys_map_memcpy_to()
Date: Tue,  8 Feb 2022 02:45:07 -0800
Message-Id: <20220208104524.2516209-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In certain situations it's useful to be able to write to an
offset of the mapping. Add a dst_offset to iosys_map_memcpy_to().

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_cache.c     |  2 +-
 drivers/gpu/drm/drm_fb_helper.c |  2 +-
 include/linux/iosys-map.h       | 17 +++++++++--------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 66597e411764..c3e6e615bf09 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -218,7 +218,7 @@ static void memcpy_fallback(struct iosys_map *dst,
 	if (!dst->is_iomem && !src->is_iomem) {
 		memcpy(dst->vaddr, src->vaddr, len);
 	} else if (!src->is_iomem) {
-		iosys_map_memcpy_to(dst, src->vaddr, len);
+		iosys_map_memcpy_to(dst, 0, src->vaddr, len);
 	} else if (!dst->is_iomem) {
 		memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
 	} else {
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 238f815cb2a0..bf5cc9a42e5a 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -385,7 +385,7 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
 	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
 
 	for (y = clip->y1; y < clip->y2; y++) {
-		iosys_map_memcpy_to(dst, src, len);
+		iosys_map_memcpy_to(dst, 0, src, len);
 		iosys_map_incr(dst, fb->pitches[0]);
 		src += fb->pitches[0];
 	}
diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index f4186f91caa6..edd730b1e899 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -220,22 +220,23 @@ static inline void iosys_map_clear(struct iosys_map *map)
 }
 
 /**
- * iosys_map_memcpy_to - Memcpy into iosys mapping
+ * iosys_map_memcpy_to - Memcpy into offset of iosys_map
  * @dst:	The iosys_map structure
+ * @dst_offset:	The offset from which to copy
  * @src:	The source buffer
  * @len:	The number of byte in src
  *
- * Copies data into a iosys mapping. The source buffer is in system
- * memory. Depending on the buffer's location, the helper picks the correct
- * method of accessing the memory.
+ * Copies data into a iosys_map with an offset. The source buffer is in
+ * system memory. Depending on the buffer's location, the helper picks the
+ * correct method of accessing the memory.
  */
-static inline void iosys_map_memcpy_to(struct iosys_map *dst, const void *src,
-				       size_t len)
+static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
+				       const void *src, size_t len)
 {
 	if (dst->is_iomem)
-		memcpy_toio(dst->vaddr_iomem, src, len);
+		memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
 	else
-		memcpy(dst->vaddr, src, len);
+		memcpy(dst->vaddr + dst_offset, src, len);
 }
 
 /**
-- 
2.35.1

