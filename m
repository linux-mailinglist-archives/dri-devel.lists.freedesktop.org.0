Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UONTFPtceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F069BBAD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794F010E5E9;
	Wed, 28 Jan 2026 00:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sl1bG/6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1FE10E5DD;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561329; x=1801097329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OnOQh1Qj33/UNnWPRm4ArdCwn+OnRbMVCy4pH3tEYXA=;
 b=Sl1bG/6HBDTQCq7ZtvezBe3D8ehngPp81IeQoZ3iJlhBS8bTAuencvtb
 46igQwLEIe+jPyKSdJ6PzDQb085K4CorWpmOWUSXlEtS9dR71IY/zOccp
 rUdrHznqSWclkdqUlzUti0MDK+4+a27WT9+KhhVsW7Qie7CwkqAMto9C7
 kvyQE22cJHbTCyLBkfjrmzjJ7+XwWOsERTDpyv8BSY9C9ac83MvvgzDrV
 nE8YZizLGQRd9464ZRfClhQ59jL1/u/tlHmbOfqtC4dMoCCD+gbL1XQ1L
 2dBMsiMX7D1/CsgJaLwrQKAAKpMy6/DNJ8UwAi/6LDAAbqDDl8FTqACbi A==;
X-CSE-ConnectionGUID: uEJxkX6AT525NTrmhGLyCQ==
X-CSE-MsgGUID: M0Q9+/GqTE2iBKoJkSsKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427518"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: lKB6kxkKTtGoQ5dg5tV6sw==
X-CSE-MsgGUID: 0LSlxnlMSpSI6rxqnVN2WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822657"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 05/11] drm/pagemap: Reduce number of IOVA link calls
Date: Tue, 27 Jan 2026 16:48:35 -0800
Message-Id: <20260128004841.2436896-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 01F069BBAD
X-Rspamd-Action: no action

Each IOVA link call results in a page walk, which is relatively
expensive. Reduce the number of IOVA link calls by collapsing
contiguous physical pages into a single IOVA link operation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_pagemap.c | 49 ++++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
index b928c89f4bd1..a167064ce41a 100644
--- a/drivers/gpu/drm/drm_pagemap.c
+++ b/drivers/gpu/drm/drm_pagemap.c
@@ -305,7 +305,8 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 				     struct dma_iova_state *state)
 {
 	struct page *dummy_page = NULL;
-	unsigned long i, psize;
+	unsigned long i, j, psize;
+	phys_addr_t phys = -1;
 	bool try_alloc = false;
 
 	for (i = 0; i < npages;) {
@@ -339,26 +340,50 @@ drm_pagemap_migrate_map_system_pages(struct device *dev,
 
 		if (dma_use_iova(state)) {
 			bool found_dummy = page && !dummy_page;
+			bool phys_match;
 			int err;
 
-			if (found_dummy) {
-				unsigned long j;
+			if (found_dummy && i) {
+				err = dma_iova_link(dev, state,
+						    page_to_phys(page),
+						    0, i * PAGE_SIZE,
+						    dir, 0);
+				if (err)
+					return err;
+			}
+
+			if (phys == -1) {
+				phys = page_to_phys(page);
+				j = i;
+				phys_match = true;
+			} else {
+				phys_match = phys + (i - j) * PAGE_SIZE ==
+					page_to_phys(page);
+			}
 
-				for (j = 0; j < i; ++j) {
+			if (psize != PAGE_SIZE || !phys_match ||
+			    (i + 1) == npages) {
+				err = dma_iova_link(dev, state, phys,
+						    j * PAGE_SIZE,
+						    psize * ((i - j) +
+						    phys_match),
+						    dir, 0);
+				if (err)
+					return err;
+
+				if (!phys_match && (i + 1) == npages) {
 					err = dma_iova_link(dev, state,
 							    page_to_phys(page),
-							    j * PAGE_SIZE,
-							    PAGE_SIZE, dir, 0);
+							    i * PAGE_SIZE,
+							    psize,
+							    dir, 0);
 					if (err)
 						return err;
 				}
-			}
 
-			err = dma_iova_link(dev, state, page_to_phys(page),
-					    i * PAGE_SIZE, psize,
-					    dir, 0);
-			if (err)
-				return err;
+				phys = page_to_phys(page);
+				j = i;
+			}
 
 			if (page != dummy_page)
 				dma_addr = state->addr + i * PAGE_SIZE;
-- 
2.34.1

