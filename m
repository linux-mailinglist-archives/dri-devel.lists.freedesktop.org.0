Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB1E699282
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C9B10ED34;
	Thu, 16 Feb 2023 10:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062610ED2F;
 Thu, 16 Feb 2023 10:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545173; x=1708081173;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QUM037SnX+6+bUI57gXj5vZBxJj3sCZQwdIJxBGM6ZA=;
 b=ZiZeG++0o32DP1QDUAldYCfHRR5rs9zXvtQB+DYrytxHotTmW3LqxZqN
 weQp2EbExyFtnKV0k75r2Hvd43A7aJYUlXELq7nAsftu6vbVI3Rz2pOte
 Xnbv5aEwkBFH9yVK+NS5hxic7MN1d5DM7vCML376dbyMiKKGczaS4ASaP
 K+1md7CF5UUbB9jWUQk/JS5rJzkN/i2t2AKcSKvB0e2xP3bZZJUKqRNjE
 ptBBRIVNulPZETKb49aKNMrULJWBoOaVDJPu5eYueUUeNQhpNLtlhTfq2
 yO0jpecoMeUfLGhVe/yvEa3HFlTX2ki8Hjp/GxX+V4QHM3sMuUalpsYjh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317602"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317602"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917913"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917913"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:32 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 4/9] drm/vmwgfx: Use fence callback initialization helper
Date: Thu, 16 Feb 2023 10:59:16 +0000
Message-Id: <20230216105921.624960-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
References: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Use the previously added initialization helper to ensure correct operation
of the common code.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index 2a0cda324703..0306596765e5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -200,7 +200,7 @@ static long vmw_fence_wait(struct dma_fence *f, bool intr, signed long timeout)
 		goto out;
 	}
 
-	cb.base.func = vmwgfx_wait_cb;
+	__dma_fence_cb_init(&cb.base, vmwgfx_wait_cb);
 	cb.task = current;
 	list_add(&cb.base.node, &f->cb_list);
 
-- 
2.34.1

