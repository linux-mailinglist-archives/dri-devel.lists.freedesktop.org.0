Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C0B3B571
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D0E10EB6E;
	Fri, 29 Aug 2025 08:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IftDNuAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D7A10EB6A;
 Fri, 29 Aug 2025 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756454720; x=1787990720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+rI6DshNVuVHxvxAMJf9lv0sngtwLI+fOufDE1KeYMk=;
 b=IftDNuAEeWjumcZ2WbdpUKxN7Oe621jAGRzUfJhfppg635pP2mNe3Q3B
 2RAs6JGCs2Njvctcf7zGAMf8ThXeRO0sYamXdp7OZPA4xR9AwelcXnqSV
 aAxuRI4OGBC70pc/Byoxf2InDVoaz4EbwpSXIcMohk6fEaertLOYFDTgi
 td5DkKXGEJaYfb0eOuFjiOod8N5c6X059pFLKOG1H3gOKJUurAwZz8NSg
 yJNT7Tu/cAkjpk+LCs1GTQwldU6yAEAPYqIcV20f04OMqbTbTmt5r1oy9
 YMe+fa/ouP2e1W40dp3MHalcWkkjTbUYcYubgRj9ZkTFZlfr1CHW22V1L g==;
X-CSE-ConnectionGUID: UqzWyUA3SMaCb6dPCujVmw==
X-CSE-MsgGUID: AQPBJviyST2S6lXUcH2YLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84142111"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="84142111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 01:05:20 -0700
X-CSE-ConnectionGUID: cFH5exCaQZGX7tzbhQPrfw==
X-CSE-MsgGUID: WUSs0ov1SmmtgspQZSiyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169893626"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.57])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 01:05:16 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: linux-mm@kvack.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] mm/hmm: Populate PFNs from PMD swap entry
Date: Fri, 29 Aug 2025 10:05:05 +0200
Message-ID: <20250829080505.1020155-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Once support for THP migration of zone device pages is enabled, device
private swap entries will be found during the walk not only for PTEs
but also for PMDs.

Therefore, it is necessary to extend to PMDs the special handling which
is already in place for PTEs when device private pages are owned by the
caller: instead of faulting or skipping the range, the correct behavior
is to use the swap entry to populate HMM PFNs.

Even though subsequent PFNs can be inferred when handling large order
PFNs, the PFN list is still fully populated because this is currently
expected by HMM users.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Balbir Singh <balbirs@nvidia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 mm/hmm.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/mm/hmm.c b/mm/hmm.c
index d545e2494994..d449fc4647d7 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -355,6 +355,29 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	}
 
 	if (!pmd_present(pmd)) {
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+		swp_entry_t entry = pmd_to_swp_entry(pmd);
+
+		if (is_device_private_entry(entry) &&
+		    pfn_swap_entry_folio(entry)->pgmap->owner ==
+		    range->dev_private_owner) {
+			unsigned long cpu_flags = HMM_PFN_VALID |
+				hmm_pfn_flags_order(PMD_SHIFT - PAGE_SHIFT);
+			unsigned long pfn = swp_offset_pfn(entry);
+			unsigned long i;
+
+			if (is_writable_device_private_entry(entry))
+				cpu_flags |= HMM_PFN_WRITE;
+
+			for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
+				hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
+				hmm_pfns[i] |= pfn | cpu_flags;
+			}
+
+			return 0;
+		}
+#endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
+
 		if (hmm_range_need_fault(hmm_vma_walk, hmm_pfns, npages, 0))
 			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
-- 
2.43.0

