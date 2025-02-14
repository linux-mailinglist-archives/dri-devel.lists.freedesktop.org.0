Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8ECA352FF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043210EBD7;
	Fri, 14 Feb 2025 00:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxWiQ9+m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1872D10EBC9;
 Fri, 14 Feb 2025 00:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739493323; x=1771029323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L2anDb97ff129elz/wHsOxHshFjvmYhOhlX70PmEuKI=;
 b=cxWiQ9+mAH818b8buJ5PVPfgTgyLQaSvxn+z0OAC0ZRL7s5CZ1ppgFi7
 6bNwLrLNePRuaNeqtcKcpk7Iwwoj+2rqTyrYEWgr/A+8qVw9OoflGeKcS
 Q/TWlckk++g2gpWrVLqmJnLkqv3ar/IKSMZnCSab4SoXKs2ocrhMjNsC4
 wMx8Xm72y8CmZcvv25AawGEjNTJCRUSy/4UEd62dkEIv2gy4d/0rIBAIE
 IUKVA6ChzhLuAb3UdTYvGRqZw3Yhn2WCi36Or9YRKQD1EPX5vHkDs0Aqq
 8usEwaxYuPSPYeq+K1YikGZFuxo//IRy7no+tHxk4zwlq4hSWqFn6XSfe A==;
X-CSE-ConnectionGUID: oC39AcWHSAy9ZY9XtcFjVQ==
X-CSE-MsgGUID: BDw7UEtKR7+en0uBPhQQ9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="39454578"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="39454578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 16:35:22 -0800
X-CSE-ConnectionGUID: FTdhENm5SC2K7VAm5InCfQ==
X-CSE-MsgGUID: /F0TtGB3TyGN0kRJWrpsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113043426"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.5])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 16:35:20 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v2] drm/i915/gt: Replace kmap with its safer kmap_local_page
 counterpart
Date: Fri, 14 Feb 2025 01:34:37 +0100
Message-ID: <20250214003437.1311476-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

kmap_local_page(), unlike kmap(), performs a contextualized
mapping of pages. This means the pages are mapped locally to the
thread that created them, making them invisible outside the
thread and safer to use.

Replace kmap() and kunmap() with kmap_local_page() and
kunmap_local() counterparts for improved safety.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
---
Cc: Nitin Gote <nitin.r.gote@intel.com>

v1 -> v2:
 - replaced kmap with the _local version also in the
   intel_ggtt_fencing.c file. (Thanks Nitin)

 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
 drivers/gpu/drm/i915/gt/shmem_utils.c        | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 0ffba50981e3..00f7cd6debf3 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -749,7 +749,7 @@ static void swizzle_page(struct page *page)
 	char *vaddr;
 	int i;
 
-	vaddr = kmap(page);
+	vaddr = kmap_local_page(page);
 
 	for (i = 0; i < PAGE_SIZE; i += 128) {
 		memcpy(temp, &vaddr[i], 64);
@@ -757,7 +757,7 @@ static void swizzle_page(struct page *page)
 		memcpy(&vaddr[i + 64], temp, 64);
 	}
 
-	kunmap(page);
+	kunmap_local(vaddr);
 }
 
 /**
diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
index bb696b29ee2c..365c4b8b04f4 100644
--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
@@ -108,7 +108,7 @@ static int __shmem_rw(struct file *file, loff_t off,
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		if (write) {
 			memcpy(vaddr + offset_in_page(off), ptr, this);
 			set_page_dirty(page);
@@ -116,7 +116,7 @@ static int __shmem_rw(struct file *file, loff_t off,
 			memcpy(ptr, vaddr + offset_in_page(off), this);
 		}
 		mark_page_accessed(page);
-		kunmap(page);
+		kunmap_local(vaddr);
 		put_page(page);
 
 		len -= this;
@@ -143,11 +143,11 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		vaddr = kmap(page);
+		vaddr = kmap_local_page(page);
 		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
 				    this);
 		mark_page_accessed(page);
-		kunmap(page);
+		kunmap_local(vaddr);
 		put_page(page);
 
 		len -= this;
-- 
2.47.2

