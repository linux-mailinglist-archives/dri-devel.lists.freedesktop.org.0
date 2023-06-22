Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93962739E6B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A403210E548;
	Thu, 22 Jun 2023 10:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 841F110E545;
 Thu, 22 Jun 2023 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687429260; x=1718965260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n9z5G10dFEpvSF9s/7DggC7dqDZF2o/8gaNO2uyYJ5k=;
 b=ilI2v4mbJns+prEp1eWu4qOZM+yntxQi92RzNyK4P2MtEAb6rakYsKXZ
 8nVcIxkxUdY6XMKbK8nQLG94yYE5MIIxL8xub1Mo9XwxfHyFMbZcUrg1j
 eRyZz/Bt9h8yhZOAEfBQWHw7rXJvAOmhkWj2DzVrRA6OD00Nt3IIxP2QO
 K3FTVdGwIkWgYBRYz9qFvXiHHb3oVXYOPVByw6DzJDRL3wwW5FP8JP66Q
 vm8JgGi4m4nB7Wv6IjEn3JQcxJ/iyl7qmaH5sWtuZTk/ZW9RioMcgCWuq
 3A6U8ftJBpBxHwyplccG9Rlquy7+I9HFnXUCnxaHHvzc1OOl/HQeb8QDm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345182364"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="345182364"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:15:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692194358"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="692194358"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:14:59 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: Don't leak a resource on eviction error
Date: Thu, 22 Jun 2023 12:14:11 +0200
Message-Id: <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On eviction errors other than -EMULTIHOP we were leaking a resource.
Fix.

Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.15+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 615d30c4262d..89530f2a027f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -462,14 +462,14 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
 	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
 	if (ret == -EMULTIHOP) {
 		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
-		if (ret) {
-			if (ret != -ERESTARTSYS && ret != -EINTR)
-				pr_err("Buffer eviction failed\n");
-			ttm_resource_free(bo, &evict_mem);
-			goto out;
-		}
-		/* try and move to final place now. */
-		goto bounce;
+		if (!ret)
+			/* try and move to final place now. */
+			goto bounce;
+	}
+	if (ret) {
+		ttm_resource_free(bo, &evict_mem);
+		if (ret != -ERESTARTSYS && ret != -EINTR)
+			pr_err("Buffer eviction failed\n");
 	}
 out:
 	return ret;
-- 
2.40.1

