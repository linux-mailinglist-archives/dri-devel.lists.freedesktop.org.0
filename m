Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C929E970A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 14:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1410E755;
	Mon,  9 Dec 2024 13:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9AFHsOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82E10E74A;
 Mon,  9 Dec 2024 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733751205; x=1765287205;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o2DMN7Yk52XsBoy5NuqVTqCP071tTp0yUuznqHjHzUQ=;
 b=P9AFHsOuNsXfHuKVChvzX282YfvohbrwCOSWxlNFaJWQBI4T6NwbsToQ
 wDUqpSNYrsUSM0gMPLaGaVpGweHI5ApE1K6sdLVuZUEe5tzQTsowF7yQe
 9Nd4lql2LHI34CziSMryBhG9ATWGUqMEWAoPdnzKhJ87J+J7JEcDc/xTH
 +ahV1qYyNpcNDluyqGYBVjY+Nbu1HgTzThlM/A0kork1Rh24zFNdcPKMM
 DCPKpWc2KG4roWE1E9ENJZ5qxqxnClvNxaqPACYbQ9HGlGONsWP2LLYp7
 RSwUgegHsbcpI7fLNs/+5wHL2ntf12V0dO7qRzCWXNJKuKy0VI3ptlY59 g==;
X-CSE-ConnectionGUID: 1FfzNHIOSzy5KxPkvXID2g==
X-CSE-MsgGUID: gxMrNVciSiCowbqm1cfrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34192052"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34192052"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:25 -0800
X-CSE-ConnectionGUID: 3q81wrA9QdWF8s91FJm7Rw==
X-CSE-MsgGUID: CwqwUASjRM2TxKY6J89c7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99531318"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 05:33:24 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 13/26] drm/xe: add system memory page iterator support to
 xe_res_cursor
Date: Mon,  9 Dec 2024 15:33:04 +0200
Message-ID: <20241209133318.1806472-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
References: <20241209133318.1806472-1-mika.kuoppala@linux.intel.com>
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

From: Andrzej Hajda <andrzej.hajda@intel.com>

Currently xe_res_cursor allows iteration only over DMA side of scatter
gatter tables.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index dca374b6521c..c1f39a680ae0 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 {
 	struct scatterlist *sgl = cur->sgl;
 	u64 start = cur->start;
+	unsigned int len;
 
-	while (start >= sg_dma_len(sgl)) {
-		start -= sg_dma_len(sgl);
+	while (true) {
+		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);
+		if (start < len)
+			break;
+		start -= len;
 		sgl = sg_next(sgl);
 		XE_WARN_ON(!sgl);
 	}
-
 	cur->start = start;
-	cur->size = sg_dma_len(sgl) - start;
+	cur->size = len - start;
 	cur->sgl = sgl;
 }
 
+static inline void __xe_res_first_sg(const struct sg_table *sg,
+				   u64 start, u64 size,
+				   struct xe_res_cursor *cur, u32 mem_type)
+{
+	XE_WARN_ON(!sg);
+	cur->node = NULL;
+	cur->start = start;
+	cur->remaining = size;
+	cur->size = 0;
+	cur->sgl = sg->sgl;
+	cur->mem_type = mem_type;
+	__xe_res_sg_next(cur);
+}
+
 /**
  * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
  *
@@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   u64 start, u64 size,
 				   struct xe_res_cursor *cur)
 {
-	XE_WARN_ON(!sg);
-	cur->node = NULL;
-	cur->start = start;
-	cur->remaining = size;
-	cur->size = 0;
-	cur->sgl = sg->sgl;
-	cur->mem_type = XE_PL_TT;
-	__xe_res_sg_next(cur);
+	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
+}
+
+/**
+ * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
+ *
+ * @sg: scatter gather table to walk
+ * @start: Start of the range
+ * @size: Size of the range
+ * @cur: cursor object to initialize
+ *
+ * Start walking over the range of allocations between @start and @size
+ */
+static inline void xe_res_first_sg_system(const struct sg_table *sg,
+				   u64 start, u64 size,
+				   struct xe_res_cursor *cur)
+{
+	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);
 }
 
 /**
-- 
2.43.0

