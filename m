Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514054A9DF9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A156310EEEB;
	Fri,  4 Feb 2022 17:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9CF10E439;
 Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996710; x=1675532710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0grwmoxsQQuaDGKkgslEV2qlrwuNDJqIX+dOUslQeuk=;
 b=FJxS/HblE7bb9Dc6BowIL1K6Etm3Db9P//ik3weX/LShveDEgiWlys1w
 IpXDTLa64Bmm+glbg1pemKF7qDzlOx2/qdV43yNUTOcCC/ZIMIDVUCuGZ
 dyJ9lJ/0fnuUTFvu3AxG5IBQeoPQyj1eJoXkj18RWh2kM/H/pKwzwoJJw
 hxsVuEydoz8T3d194j2F9Y7bgndu3jtKmSAeB+lYHjw0e3tVb2PN66PTT
 Uh+tMMsRJmkUtQEFjzroHCChDccFpDcKAOE0OvKCWHJNxqCPyGTHecoI8
 j7nFmouCdVNKEX9FttZ8U04UxAuPslMmSbCggzgbqeHuWCpI4eFlT/qhp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242170"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240790"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/19] iosys-map: Add offset to iosys_map_memcpy_to()
Date: Fri,  4 Feb 2022 09:44:19 -0800
Message-Id: <20220204174436.830121-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204174436.830121-1-lucas.demarchi@intel.com>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
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
index f4186f91caa6..edd7fa3be9e9 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -220,22 +220,23 @@ static inline void iosys_map_clear(struct iosys_map *map)
 }
 
 /**
- * iosys_map_memcpy_to - Memcpy into iosys mapping
+ * iosys_map_memcpy_to_offset - Memcpy into offset of iosys_map
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

