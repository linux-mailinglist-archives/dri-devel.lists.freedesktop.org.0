Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF98C371D
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 17:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CF810E2B4;
	Sun, 12 May 2024 15:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/w4m01x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9010E29F;
 Sun, 12 May 2024 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715528193; x=1747064193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UpBLsNtwkuXGVcD/TaGHbR2icCa517yQEVl4pgTWrf8=;
 b=J/w4m01x4FVA+MhFym54jYC3/gZATPi/ti33afaaVNguy2wFJ4Cgp60b
 4v/2Qbn/rYdPIWsTSJI7sHZWN9IHr6qSia1R7FMYHFG/Av3RIEBkF9J5u
 lnmK5ZaNuaoxlD5sj8r9RhDxgpP6LGielCMexCyLQrPkgPZgzU0nm+P5E
 ycELFFZ1vDbcTdn44J0E/d8H1XEhj3GzHtN6njw6Qb7ce4CvKYXTBn5yu
 HkSPWCVyJzTV7y8OFeSZvStAArTpqGGJg+RNw3p1vOekr4roKHu7PIu3L
 zjaVMCsJrDOG2u0jcu0VuIt2pnSdXCa7ZjnitEXKr3O5nL4X2AVthYYZz g==;
X-CSE-ConnectionGUID: rtewN1tGTq+wUDH3KLvUVg==
X-CSE-MsgGUID: AJ7Af+wwR4yZFDekfqKElA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11403306"
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="11403306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:33 -0700
X-CSE-ConnectionGUID: xRUy/3fVTKG3IzZ9/ieCOg==
X-CSE-MsgGUID: Xe/sFGcnRIubxVaa9acUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,156,1712646000"; d="scan'208";a="34976572"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.25.139])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2024 08:36:29 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/4] iosys-map: add iosys_map_read_from() helper
Date: Sun, 12 May 2024 17:36:04 +0200
Message-Id: <20240512153606.1996-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240512153606.1996-1-michal.wajdeczko@intel.com>
References: <20240512153606.1996-1-michal.wajdeczko@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It allows to copy data from iosys_map into the user memory,
regardless whether iosys_map points to memory or I/O memory.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/iosys-map.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 4696abfd311c..eb79da976211 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -7,6 +7,7 @@
 #define __IOSYS_MAP_H__
 
 #include <linux/compiler_types.h>
+#include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/string.h>
 
@@ -312,6 +313,29 @@ static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
 		memcpy(dst, src->vaddr + src_offset, len);
 }
 
+/**
+ * iosys_map_read_from - Copy data from iosys_map into user memory
+ * @to: the user space buffer to read to
+ * @count: the maximum number of bytes to read
+ * @ppos: the current position in the buffer
+ * @map: the iosys_map structure to read from
+ * @available: the size of the data in iosys_map
+ *
+ * Copies up to @count bytes from a iosys_map @map at offset @ppos into the user
+ * space address starting at @to.
+ *
+ * Return: On success, the number of bytes read is returned and the offset
+ * @ppos is advanced by this number, or negative value is returned on error.
+ */
+static inline ssize_t iosys_map_read_from(void __user *to, size_t count, loff_t *ppos,
+					  const struct iosys_map *map, size_t available)
+{
+	if (map->is_iomem)
+		return simple_read_from_iomem(to, count, ppos, map->vaddr_iomem, available);
+	else
+		return simple_read_from_buffer(to, count, ppos, map->vaddr, available);
+}
+
 /**
  * iosys_map_incr - Increments the address stored in a iosys mapping
  * @map:	The iosys_map structure
-- 
2.43.0

