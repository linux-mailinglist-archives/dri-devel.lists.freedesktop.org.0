Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF54354C7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 22:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B2D6E3CE;
	Wed, 20 Oct 2021 20:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A116E3CE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:49:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209672645"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="209672645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 13:48:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="444513628"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 13:48:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] io-mapping: remove fallback for writecombine
Date: Wed, 20 Oct 2021 13:48:38 -0700
Message-Id: <20211020204838.1142908-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.33.1
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

The fallback was introduced in commit 80c33624e472 ("io-mapping: Fixup
for different names of writecombine") to fix the build on microblaze.

5 years later, it seems all archs now provide a pgprot_writecombine(),
so just remove the other possible fallbacks. For microblaze,
pgprot_writecombine() is available since commit 97ccedd793ac
("microblaze: Provide pgprot_device/writecombine macros for nommu").

This is build-tested on microblaze with the following hack to always
build mm/io-mapping.o and without diying on a x86-only macro
(_PAGE_CACHE_MASK)

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: linux-mm@kvack.org
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/io-mapping.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index e9743cfd8585..66a774d2710e 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -132,13 +132,7 @@ io_mapping_init_wc(struct io_mapping *iomap,
 
 	iomap->base = base;
 	iomap->size = size;
-#if defined(pgprot_noncached_wc) /* archs can't agree on a name ... */
-	iomap->prot = pgprot_noncached_wc(PAGE_KERNEL);
-#elif defined(pgprot_writecombine)
 	iomap->prot = pgprot_writecombine(PAGE_KERNEL);
-#else
-	iomap->prot = pgprot_noncached(PAGE_KERNEL);
-#endif
 
 	return iomap;
 }
-- 
2.33.1

