Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24C69804E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038F10E82D;
	Wed, 15 Feb 2023 16:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC41E10EB15;
 Wed, 15 Feb 2023 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477676; x=1708013676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+jziJqtg2tHO1sm8YICg4x70AohpDQ+/WN+2ra+cxA=;
 b=hGzxEyCoRV9XSb+cgq05kFe2dsTNMKFXnyxk5+fNKTWL7L7gVDAE+BPX
 DTv5Sq3rv9SSFfBdueRHl9sQ1+jHaTmoLSe8jqO4JJ2Ow+EvzqIK1T2Z2
 uLTho31N3bEPMaG0yd+MD62kQpKI4vIasrE46dmYa9pDSGpu4S4e4GQKQ
 XLb26qMmpVSfR2yhQuzACjLjzwwQCwEcDgvV5S0diYxjLe4BRr4ZGOufO
 QajVgroHb/uRBHaRwJq/Vreu/LJXzzcJctbXUW2eWP/21QECq6zMeUsK1
 aVy3EpRuxOd+55iRAAMuZxG439Jeadazqht+U8fJn+f2nKutZ9vfO1uMy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393870669"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393870669"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758471994"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758471994"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:14:27 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 01/16] drm/ttm: Fix a NULL pointer dereference
Date: Wed, 15 Feb 2023 17:13:50 +0100
Message-Id: <20230215161405.187368-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Philip Yang <Philip.Yang@amd.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, Huang Rui <ray.huang@amd.com>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-graphics-maintainer@vmware.com, Matthew Auld <matthew.auld@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Qiang Yu <qiang.yu@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LRU mechanism may look up a resource in the process of being removed
from an object. The locking rules here are a bit unclear but it looks
currently like res->bo assignment is protected by the LRU lock, whereas
bo->resource is protected by the object lock, while *clearing* of
bo->resource is also protected by the LRU lock. This means that if
we check that bo->resource points to the LRU resource under the LRU
lock we should be safe.
So perform that check before deciding to swap out a bo. That avoids
dereferencing a NULL bo->resource in ttm_bo_swapout().

Fixes: 6a9b02899402 ("drm/ttm: move the LRU into resource handling v4")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Qiang Yu <qiang.yu@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index c7a1862f322a..ae2f19dc9f81 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -158,7 +158,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			struct ttm_buffer_object *bo = res->bo;
 			uint32_t num_pages;
 
-			if (!bo)
+			if (!bo || bo->resource != res)
 				continue;
 
 			num_pages = PFN_UP(bo->base.size);
-- 
2.34.1

