Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A01609B3929
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 19:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0424E10E1F5;
	Mon, 28 Oct 2024 18:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="VBWZosyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4F10E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 18:29:30 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1730140168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ydnssr3n8sPSW3dssobBGKzcYiq5vxNbU7RccfcxEns=;
 b=VBWZosyv1D9zdSYBIq/GDrG/p9LrQjXfyaOauVc60S3bgMXnbF1JLOwXcCJq1ED/KAcT0X
 0FLUkxdYU1pZl03Xtuy3aszxLgJIFSKmMVAU3TGvAU1nGt4T17utH60uAFIrvBgcBwjgH0
 CaXDYxNw7M9CI8FeML5yWtMLwwfDxzs=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org (open list:LIBRARY CODE),
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH] lib/scatterlist: Use sg_phys() helper
Date: Tue, 29 Oct 2024 02:29:20 +0800
Message-Id: <20241028182920.1025819-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This shorten the length of code in horizential direction, therefore is
easier to read.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 lib/scatterlist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 473b2646f71c..5bb6b8aff232 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -474,14 +474,14 @@ int sg_alloc_append_table_from_pages(struct sg_append_table *sgt_append,
 		return -EOPNOTSUPP;
 
 	if (sgt_append->prv) {
-		unsigned long next_pfn = (page_to_phys(sg_page(sgt_append->prv)) +
-			sgt_append->prv->offset + sgt_append->prv->length) / PAGE_SIZE;
+		unsigned long next_pfn;
 
 		if (WARN_ON(offset))
 			return -EINVAL;
 
 		/* Merge contiguous pages into the last SG */
 		prv_len = sgt_append->prv->length;
+		next_pfn = (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
 		if (page_to_pfn(pages[0]) == next_pfn) {
 			last_pg = pfn_to_page(next_pfn - 1);
 			while (n_pages && pages_are_mergeable(pages[0], last_pg)) {
-- 
2.34.1

