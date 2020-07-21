Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEB2283E5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F246E419;
	Tue, 21 Jul 2020 15:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CE26E598
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:34:43 +0000 (UTC)
IronPort-SDR: LD/fyue904YV388Nos8/fCmLiuzL5rSopPC0NXo5N2W7bewbY9pQoQ+B7NAKXx4LnivLXY+UVA
 O1LMGC6LSmgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="168297490"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="168297490"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:34:43 -0700
IronPort-SDR: wHglbF5x5PyjdIyWNZNfB5iI89F+BqEcfsL60nl0itNDur3qx0ej+FYMGwWFrWKzCYEL0EDZ9c
 ZCEL9eopH6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="271747921"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2020 08:34:43 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1] io-mapping: Indicate mapping failure
Date: Tue, 21 Jul 2020 11:34:26 -0400
Message-Id: <20200721153426.81239-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721153426.81239-1-michael.j.ruhl@intel.com>
References: <20200721153426.81239-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
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
Cc: Mike Rapoport <rppt@linux.ibm.com>, stable@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The !ATOMIC_IOMAP version of io_maping_init_wc will always return
success, even when the ioremap fails.

Since the ATOMIC_IOMAP version returns NULL when the init fails, and
callers check for a NULL return on error this is unexpected.

Return NULL on ioremap failure.

Fixes: cafaf14a5d8f ("io-mapping: Always create a struct to hold metadata about the io-mapping"
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: stable@vger.kernel.org
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 include/linux/io-mapping.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/io-mapping.h b/include/linux/io-mapping.h
index 0beaa3eba155..5641e06cbcf7 100644
--- a/include/linux/io-mapping.h
+++ b/include/linux/io-mapping.h
@@ -118,7 +118,7 @@ io_mapping_init_wc(struct io_mapping *iomap,
 	iomap->prot = pgprot_noncached(PAGE_KERNEL);
 #endif
 
-	return iomap;
+	return iomap->iomem ? iomap : NULL;
 }
 
 static inline void
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
