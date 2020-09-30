Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B522327F4FA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 00:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8E56E832;
	Wed, 30 Sep 2020 22:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7496E832;
 Wed, 30 Sep 2020 22:18:48 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7504140002>; Wed, 30 Sep 2020 15:17:56 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 22:18:43 +0000
Received: from agoins-ThinkPad-P50.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Sep 2020 22:18:42 +0000
From: Alex Goins <agoins@nvidia.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH RFC 1/1] drm-ttm: Allocate transparent huge pages without
 clearing __GFP_COMP
Date: Wed, 30 Sep 2020 17:18:21 -0500
Message-ID: <20200930221821.13719-2-agoins@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930221821.13719-1-agoins@nvidia.com>
References: <20200930221821.13719-1-agoins@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601504276; bh=5Tu6aSNA8HBdBowm9V8TF6LzLVpYCNdFVrzjEC+8uyI=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=SUmoFk353ArZEs2TTynjnuKaSUsMThqArnBLh/fr0z8TAddfcyRrJC4Y/WlLpm/ny
 NfHXFw6OKfaa0lECmiEOmicENmjmgV0puIe07CVrmcPaW7oJL6k5boAj86FWagJ91L
 JMp9c3DtpNEHTmRh9ALUfD3GEYpt+Wpm1Sla98bsH3F9yEKBfJ0KwbkIYAV/fGOOrf
 qI9xvYRbXxd81DE/Gbi7XM10LoKMDCvc4b6mUZXQ/QA/Y4Ljn5+n5Br5sft0I8xvs4
 dtKBWSQcyL63VvGJEaNMRCiky5Z5IVxWF1uPnJ8/Qo8gKHQMt7BR0vEAjrr+j+vWa+
 GALhFdvsQvCIg==
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
Cc: John Hubbard <jhubbard@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TTM currently supports allocating pages with GFP_TRANSHUGE_LIGHT, but with
the __GFP_COMP flag cleared. Instead of being normal transparent huge
pages, these are multiorder non-compound pages that have the same order as
THPs. This interferes with drivers that import DMA-BUFs / SGTs backed by
pages from TTM, as they don't have the TTM-specific context to know how the
pages were allocated.

Change the TTM allocator so that it no longer clears the __GFP_COMP flag
when allocating THPs.

Signed-off-by: Alex Goins <agoins@nvidia.com>
---
 drivers/gpu/drm/ttm/ttm_page_alloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
index 5c8883d7f74a..e72789184398 100644
--- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
+++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
@@ -920,7 +920,6 @@ static int ttm_get_pages(struct page **pages, unsigned npages, int flags,
 				huge_flags |= GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
 					__GFP_KSWAPD_RECLAIM;
 				huge_flags &= ~__GFP_MOVABLE;
-				huge_flags &= ~__GFP_COMP;
 				p = alloc_pages(huge_flags, HPAGE_PMD_ORDER);
 				if (!p)
 					break;
@@ -1057,13 +1056,13 @@ int ttm_page_alloc_init(struct ttm_mem_global *glob, unsigned max_pages)
 	ttm_page_pool_init_locked(&_manager->wc_pool_huge,
 				  (GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
 				   __GFP_KSWAPD_RECLAIM) &
-				  ~(__GFP_MOVABLE | __GFP_COMP),
+				  ~(__GFP_MOVABLE),
 				  "wc huge", order);
 
 	ttm_page_pool_init_locked(&_manager->uc_pool_huge,
 				  (GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
 				   __GFP_KSWAPD_RECLAIM) &
-				  ~(__GFP_MOVABLE | __GFP_COMP)
+				  ~(__GFP_MOVABLE)
 				  , "uc huge", order);
 
 	_manager->options.max_size = max_pages;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
