Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99B680CEB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 13:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AD110E217;
	Mon, 30 Jan 2023 12:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7AB10E217;
 Mon, 30 Jan 2023 12:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675080430; x=1706616430;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfOfAFj5gf+/AQiEluoe6T0Y7igC1cO9ZymBBcN0xrM=;
 b=fvZ/qbNNOM9oRtA7ik5tRuoxi65QrhTpQS2zRRGeM5Jemk/MWfDnEePL
 W4fMxikzLgdPcu0rUwA96gC+qrLpLVAJPBsytHrOpv2otWZMaSPeEDCLp
 UXvqftu+yl8CAEDZo6Q7N0lNPcSrDUnptXGGTwhjonez+qfmf8BR/9v7T
 /jS7594LdRv7aw+XkqbhsxEq74jWH0/NvPJJktRwBF9Hbc/sdhgVr9h35
 JJQDzJ75slDyk/gftxDWxBcoFtF1ijJXyrWqR2Q8/b1WNVPuWuNsMO7bg
 4rbPx87kq3W3TEGZS9mk8OHL//OqAFAUWv1vE6MqrX2iBTM86bDwEiHaM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328816292"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328816292"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="641521122"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="641521122"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 04:07:06 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/ttm: clear the ttm_tt when bo->resource is NULL
Date: Mon, 30 Jan 2023 12:06:33 +0000
Message-Id: <20230130120636.63765-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120636.63765-1-matthew.auld@intel.com>
References: <20230130120636.63765-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the next few patches, when initially creating a ttm BO, the
bo->resource is NULL, and the driver is then expected to handle the
initial dummy move.  However, if this is created as a system resource
the first ttm_tt we create will always have the clear value set to
false. Previously the initial ttm_tt would be created in
ttm_bo_validate() with the clear parameter always set to true.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Reviewed-by: Christian König <ckoenig.leichtzumerken@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 326a3d13a829..773080f48864 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -120,8 +120,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	bool old_use_tt, new_use_tt;
 	int ret;
 
-	old_use_tt = bo->resource &&
-		ttm_manager_type(bdev, bo->resource->mem_type)->use_tt;
+	old_use_tt = !bo->resource || ttm_manager_type(bdev, bo->resource->mem_type)->use_tt;
 	new_use_tt = ttm_manager_type(bdev, mem->mem_type)->use_tt;
 
 	ttm_bo_unmap_virtual(bo);
-- 
2.39.1

