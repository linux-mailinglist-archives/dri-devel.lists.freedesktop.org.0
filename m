Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5D680AA5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 11:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7323110E1E0;
	Mon, 30 Jan 2023 10:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BBC10E0DA;
 Mon, 30 Jan 2023 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675073875; x=1706609875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfOfAFj5gf+/AQiEluoe6T0Y7igC1cO9ZymBBcN0xrM=;
 b=IgL8CQarCGD3/rmeFUNABICs6EqtFJX5om+vQclda1becrlua0cWc63H
 VCqIk4Dm5tnT8wN9qcbGrel2+oIFft6eiHzs5/9o4SQ0+9eoZ7zZ9ULKq
 zOh0daivz2uiEsbhvmte7uvZk4zfJRLNS8SgFETXP7HMmDS2ZIQc6NzRt
 8ifnkZJZ9Otkg5aSwzt/xipk2A56Elc3zZH36ouU3trt6LxWhygpqUawv
 sEMT6NiwksFsiUzP5CZCOG15HgpFBsnwiKHaf1dp8bJsTNoNdPHXYNNeM
 AdGo+1f6RWEjuwqtfUU2gWegBTRJpY+r5NLJdfWoCJZAD3nZln97IoFs9 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="328798967"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="328798967"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:17:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696348856"
X-IronPort-AV: E=Sophos;i="5.97,257,1669104000"; d="scan'208";a="696348856"
Received: from dscheepe-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.1.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 02:14:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: clear the ttm_tt when bo->resource is NULL
Date: Mon, 30 Jan 2023 10:12:27 +0000
Message-Id: <20230130101230.25347-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130101230.25347-1-matthew.auld@intel.com>
References: <20230130101230.25347-1-matthew.auld@intel.com>
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

