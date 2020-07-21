Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1F2281BF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 16:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EFC6E4E6;
	Tue, 21 Jul 2020 14:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647906E4F9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 14:17:12 +0000 (UTC)
IronPort-SDR: e8lFxL/xYAo6qTguCIpLh0PG33nfKeXAYWFr2nCIksMhx4nSHfI3BHl8MhuS/qqwOPeKdhsOQL
 5TcYCkwqlDTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9688"; a="148066431"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="148066431"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 07:17:05 -0700
IronPort-SDR: kUGuur520vYHG+MsEvUzPNTsy0P8FILd150pEgw4W2aUP/1TtgNEEq2xqkMVXbXHtjI4yDZJ/f
 VnIqoj7BHqUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="432011539"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2020 07:17:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] io-mapping: Indicate mapping failure
Date: Tue, 21 Jul 2020 10:16:41 -0400
Message-Id: <20200721141641.81112-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721141641.81112-1-michael.j.ruhl@intel.com>
References: <20200721141641.81112-1-michael.j.ruhl@intel.com>
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

Sometimes it is good to know when your mapping failed.

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
