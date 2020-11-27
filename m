Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DA2C654F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE706ED08;
	Fri, 27 Nov 2020 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B856ED01;
 Fri, 27 Nov 2020 12:11:33 +0000 (UTC)
IronPort-SDR: aCPV1T4d5EblqO6GdjI/aAmbiHu2xEf9zvYJoE5F3lZKbkSk/ewuWLZ/LphZI/uXraugr2/lTp
 EYUdXQfWBqYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092908"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:32 -0800
IronPort-SDR: 2UKWjAZM7WbmYmglnsDKE8pC0Y9EokeSDoKuwRi6O4Tn0ptW49YN4BXE2C6pZIx2+nWe3KwijT
 Z2gUGiIpm8TA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029811"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:31 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 125/162] drm/i915/lmem: Limit block size to 4G
Date: Fri, 27 Nov 2020 12:06:41 +0000
Message-Id: <20201127120718.454037-126-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>

when allocating pages to lmem object of size 4G or greater
we allocate memory blocks from buddy system. In this scenario
buddy sytem can allocate blocks that can have size >= 4G and
these blocks require >32b to represent block size with these
blocks we run into an issue with sg list construction because
sg->length field is only 32b wide.

Hence limit the max allowed block size to less than 4G.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
---
 drivers/gpu/drm/i915/intel_memory_region.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 554fdd7735a8..371cd88ff6d8 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -101,6 +101,7 @@ __intel_memory_region_get_pages_buddy(struct intel_memory_region *mem,
 				      struct list_head *blocks)
 {
 	unsigned int min_order = 0;
+	unsigned int max_order;
 	unsigned long n_pages;
 
 	GEM_BUG_ON(!IS_ALIGNED(size, mem->mm.chunk_size));
@@ -121,6 +122,16 @@ __intel_memory_region_get_pages_buddy(struct intel_memory_region *mem,
 
 	n_pages = size >> ilog2(mem->mm.chunk_size);
 
+	/*
+	 * When allocating pages for an lmem object of size > 4G
+	 * the memory blocks allocated from buddy system could be
+	 * from sizes greater than 4G requiring > 32b to represent
+	 * block size. But those blocks cannot be used in sg list
+	 * construction(in caller) as sg->length is only 32b wide.
+	 * Hence limiting the block size to 4G.
+	 */
+	max_order = (ilog2(SZ_4G) - 1) - ilog2(mem->mm.chunk_size);
+
 	mutex_lock(&mem->mm_lock);
 
 	do {
@@ -128,7 +139,7 @@ __intel_memory_region_get_pages_buddy(struct intel_memory_region *mem,
 		unsigned int order;
 		bool retry = true;
 retry:
-		order = fls(n_pages) - 1;
+		order = min_t(u32, (fls(n_pages) - 1), max_order);
 		GEM_BUG_ON(order > mem->mm.max_order);
 		GEM_BUG_ON(order < min_order);
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
