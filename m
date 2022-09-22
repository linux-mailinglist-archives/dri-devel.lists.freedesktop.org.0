Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28F5E57BF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 03:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832210E0CA;
	Thu, 22 Sep 2022 01:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8C010E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 01:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663808885; x=1695344885;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GoVg1XlEDYiKPH/kda9YSq5759Nw1rzV/xbFTSu3Hqk=;
 b=R/YNJC8C1MygL+WF89XGJCfDZi9d+dfpUvaTbYQ2fG0ncmGGaEp+7VH9
 Z0usKhdpZbk8LqT4GE2cYHuED+6nT0otmkX1syWqmhATbwVO5gwcNki7J
 3DVxayGbYNJW79D1lABZWcT3eZLtnS/IBoRPYXBkWJ15GZzZQRq8ZWKDT
 CLrq1lZOCCh+9NIqVH820dKcFA/f9cT05QTnItK1iGbrd6yDb43hUhKNq
 e34ObDF8WqJBcZHrYuEQo46I5EzSaHHnLnkvmVmny5d3a8ntHpIbNi5Pb
 gNt5zg/1p1mKEZ5fEBzbYfUrGmY0rLHJjcFlhUWOPq42ATyWPg6eSOiUy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386453955"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="386453955"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 18:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="682006989"
Received: from cliu38-mobl3.sh.intel.com ([10.239.147.124])
 by fmsmga008.fm.intel.com with ESMTP; 21 Sep 2022 18:08:03 -0700
From: Chuansheng Liu <chuansheng.liu@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: clean the redundant assignment
Date: Thu, 22 Sep 2022 08:49:01 +0800
Message-Id: <20220922004901.61424-1-chuansheng.liu@intel.com>
X-Mailer: git-send-email 2.25.0.rc2
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean the redundant assignment of ttm->caching in ttm_tt_init_fields().

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index d505603930a7..e110db86c870 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -136,7 +136,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       unsigned long extra_pages)
 {
 	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
-	ttm->caching = ttm_cached;
 	ttm->page_flags = page_flags;
 	ttm->dma_address = NULL;
 	ttm->swap_storage = NULL;
-- 
2.25.0.rc2

