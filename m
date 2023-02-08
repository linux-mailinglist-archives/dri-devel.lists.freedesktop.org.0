Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9171568F174
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2310E10E7B0;
	Wed,  8 Feb 2023 14:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE0D10E7A7;
 Wed,  8 Feb 2023 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675868243; x=1707404243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=opTd8+G1Y/rtR2GCvHtLEXdoN8IPXeYAezj4yEWDy54=;
 b=gkvdA/xWwJc1xD2u5YmvDGO/oR+sOAuXiXheBwPVoRn/8rQxOlgSSFmZ
 A+92MLOS9dqu4g4aND/S8L8XhflpAI0PRKbtBmym4ScOKk0cHsleMBq1E
 4+85MOkK8j2qTwogrsl6u9SPa5TxypzlHEd1LlNRPrP4r1JD3qAn885GK
 XPyFP3uvXopf6ytD/0MQ/JYbAyvhHHVzkWjF7xUPkRLPHTRIl1jGcyAT3
 iKM7fREJe6vkHiB7nTFsKT9x10/WfKRSSq/Xn5T+1YtQNppDHVCGVxk4L
 LJOT8eKkzHpF7bAflm8DP0FOu2ermS+YiT1i1qBhExcoGXOEMIJySNT4H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328469192"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="328469192"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617233448"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="617233448"
Received: from hassanka-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.252])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/qxl: handle NULL bo->resource in move callback
Date: Wed,  8 Feb 2023 14:53:17 +0000
Message-Id: <20230208145319.397235-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208145319.397235-1-matthew.auld@intel.com>
References: <20230208145319.397235-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm bo now initially has NULL bo->resource, and leaves the driver
the handle that. However it looks like we forgot to handle that for qxl.
It looks like this will just null-ptr-deref in qxl_bo_move(), if
bo->resource is NULL.

Fix this by calling move_null() if the new resource is TTM_PL_SYSTEM,
otherwise do the multi-hop sequence to ensure can safely call into
ttm_bo_move_memcpy(), since it might also need to clear the memory.
This should give the same behaviour as before.

Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index a92a5b0d4c25..1a82629bce3f 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -143,6 +143,17 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 	struct ttm_resource *old_mem = bo->resource;
 	int ret;
 
+	if (!old_mem) {
+		if (new_mem->mem_type != TTM_PL_SYSTEM) {
+			hop->mem_type = TTM_PL_SYSTEM;
+			hop->flags = TTM_PL_FLAG_TEMPORARY;
+			return -EMULTIHOP;
+		}
+
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
 	qxl_bo_move_notify(bo, new_mem);
 
 	ret = ttm_bo_wait_ctx(bo, ctx);
-- 
2.39.1

