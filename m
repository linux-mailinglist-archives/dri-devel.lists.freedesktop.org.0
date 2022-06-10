Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AC546FF8
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 01:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290711AFB1;
	Fri, 10 Jun 2022 23:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5E11AFAF;
 Fri, 10 Jun 2022 23:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654903268; x=1686439268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIQGghf/MmQhFdNpCCB1glb7uOI0L+bi2eEDmid2NtI=;
 b=E6qpNxn64uTrwCiIvlmJ0oETbBypu5VnxCiPZj3JcEFLdLMlG9hkSdSf
 9wKWKWQ+uHT9fubsJZalwzFq8zLT/gkntkDExA4eZNN65IuRbkt3gHj6+
 rfY2ADl9ZT3B+L3EObw4DX7Ux87dq4UBp62Oz7L2DbFLNQmZgnGzMpFCh
 7EPUjzo618Bwl0ZL3hpAuu3SWZFYUJq7lgvqRJR7oYJq2BTPD9Q/K9Pxu
 zKdtdJUyN7FBBLzUAt8WAtJzbnDIuxy0W4Lu/6RqKhjGb7uoAZ2PPgKhE
 qpv2F+XPd6R26XrL5VMlckVx/nlvp0bS6L3Z3/tncmy4t82AZq0u29YGU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="258210105"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="258210105"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:21:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="610919571"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:21:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] iosys-map: Add per-word write
Date: Fri, 10 Jun 2022 16:21:29 -0700
Message-Id: <20220610232130.2865479-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610232130.2865479-1-lucas.demarchi@intel.com>
References: <20220610232130.2865479-1-lucas.demarchi@intel.com>
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
Cc: daniel.vetter@ffwll.ch, Lucas De Marchi <lucas.demarchi@intel.com>,
 christian.koenig@amd.com, tzimmermann@suse.de, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like was done for read, provide the equivalent for write. Even if
current users are not in the hot path, this should future-proof it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/iosys-map.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index cd28c7a1b79c..793e5cd50dbf 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -336,8 +336,11 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 #ifdef CONFIG_64BIT
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)			\
 	u64: val_ = readq(vaddr_iomem_),
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
+	u64: writeq(val_, vaddr_iomem_),
 #else
 #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)
+#define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)
 #endif
 
 #define __iosys_map_rd_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
@@ -347,6 +350,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
 	__iosys_map_rd_io_u64_case(val__, vaddr_iomem__)		\
 	default: memcpy_fromio(&(val__), vaddr_iomem__, sizeof(val__)))
 
+#define __iosys_map_wr_io(val__, vaddr_iomem__, type__) _Generic(val__,	\
+	u8: writeb(val__, vaddr_iomem__),				\
+	u16: writew(val__, vaddr_iomem__),				\
+	u32: writel(val__, vaddr_iomem__),				\
+	__iosys_map_wr_io_u64_case(val__, vaddr_iomem__)		\
+	default: memcpy_toio(vaddr_iomem__, &val, sizeof(val)))
+
 /**
  * iosys_map_rd - Read a C-type value from the iosys_map
  *
@@ -381,9 +391,13 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  * Write a C-type value to the iosys_map, handling possible un-aligned accesses
  * to the mapping.
  */
-#define iosys_map_wr(map__, offset__, type__, val__) ({			\
-	type__ val = (val__);						\
-	iosys_map_memcpy_to(map__, offset__, &val, sizeof(val));	\
+#define iosys_map_wr(map__, offset__, type__, val__) ({				\
+	type__ val = (val__);							\
+	if ((map__)->is_iomem) {						\
+		__iosys_map_wr_io(val, (map__)->vaddr_iomem + offset__, type__);\
+	} else {								\
+		memcpy((map__)->vaddr + offset__, &val, sizeof(val));		\
+	}									\
 })
 
 /**
-- 
2.36.1

