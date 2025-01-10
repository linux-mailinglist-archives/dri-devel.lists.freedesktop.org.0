Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D678FA08D33
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:02:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD8A10F041;
	Fri, 10 Jan 2025 10:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="URh6G7Ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE4D10F041;
 Fri, 10 Jan 2025 10:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736503327; x=1768039327;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M9MJRgKLAOXSIzy2ZxTkmeGr7uxans+54Vu/XRS3Wlc=;
 b=URh6G7EwJj7IjBrSDhNdecenR03x+uJ1E1dBXvQc+GlD4s+/5HjjQKpG
 HRNVgCTs/g0XFTyD1Vl0s5K2v15zna8yiQ0eTdn5bnhMv3odgseHi500f
 9wWVjjN0Cp42NNXbMpupZ1BWpsw2pyY8cQ4grq4gNp97J+cqIs/MVzt8a
 s0GYr7LgTSzOiPiiH3x1gbSsv9fUV3yE19/1MqFKtLQMgtvMbVJM7SulR
 unRHnJgMvq2ruYYhAA0NDzHG3NTSYm4qii4sWwA9u3GZgcC8QpOsM7yxw
 SZNtNYi4Ozy5xHEI7IfGkt4cG87yYjFY95llOOVZys5GrgyYwNIlqoOOD A==;
X-CSE-ConnectionGUID: 4yXVPiN1QnKFx0PxtUGybw==
X-CSE-MsgGUID: 83sYwwcyREyrYDaUelizcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62164417"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="62164417"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 02:02:07 -0800
X-CSE-ConnectionGUID: OdA572kkTfmiyLld8M4uYw==
X-CSE-MsgGUID: +h9dOPtBRma2fliOz/a5Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103477308"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.253])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 02:02:05 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Replace kmap with its safer kmap_local_page
 counterpart
Date: Fri, 10 Jan 2025 11:01:55 +0100
Message-ID: <20250110100155.506796-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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
---
 drivers/gpu/drm/i915/gt/shmem_utils.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
2.47.1

