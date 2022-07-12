Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CB5718D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 13:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97EC8B474;
	Tue, 12 Jul 2022 11:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1C82B8D3;
 Tue, 12 Jul 2022 11:46:10 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id bp15so3552888ejb.6;
 Tue, 12 Jul 2022 04:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0VCybhQfKwqy44xprkmnNFSfB9HpKWe+eVeaEdRJWPE=;
 b=bAt+DuNnGkpegEUPBHgSAOYrxZm7443GmDC7k8qyaLUtloam41NSvxNmQs0bmagjva
 5tVTTYev7xbHHHh/jilaUTUCu6jgBiOGhI1bjVw4uWozR6HO8wNOzaTPafmAP6WONsOd
 pGlfjIutwRZN9HpAqFScXjWECHRKO72znlO1RMqkwHlGQMzStkp/0TFYftsyD0LobbAj
 j3bhjsG4cEeDslGC85UDDHzwC2eDXPicL/25Bjrpe33BBjC04faARkNJOtBmEwGfiM/t
 d98dK3+KNPN5yfHnmgFv80XRPl3q1XJKNyXUKeCZMeQqvJokzaRHV2+79TVi43kWRlFs
 ChMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0VCybhQfKwqy44xprkmnNFSfB9HpKWe+eVeaEdRJWPE=;
 b=z+NzfEdRvy4mNMV5j2HQGnpdto6hB+ZwH7zcbzGv/itpYFRxS/C/oalUugh3Eddfv0
 0MzFzD57ityQza/JwtBC2h2HfPI89+GtZEWcJ/y5eNqJwJOtclOYms98/QV0MYfZLITy
 JD9rixwALGTSTBxm8PMiLWacYWZknZK1tUbGUTQ8Yu26/CBXVhfljgh/AsE7BrpBk4/U
 07WCOPtHTzyZlWpxHrgCVua7XvTtCkzNBbri47iw46LB04rHbriS4KQOepkcdwaGOccN
 YnVWHjJEYA1WoeIvyjM001H6F4HpTGF6DWpWJWKyUqY64O/XM2h/VJgEyL9e/pN0Dg42
 SnMw==
X-Gm-Message-State: AJIora90IoN6xe5lXkiX9iwe0d3azC//VUQQdBGhtuAei8YHLIonUuZY
 YDmLO3lLO8tEWzl4QtK2mu90MCd9MMw=
X-Google-Smtp-Source: AGRyM1sl4gVHpUvTMY3UuMPj3pztEPcYLX3cLueljPYkX/uaoPvPDzecd0nkerSNsWtr9QjgH0qWmw==
X-Received: by 2002:a17:907:3e13:b0:726:eebc:3461 with SMTP id
 hp19-20020a1709073e1300b00726eebc3461mr22986782ejc.528.1657626369009; 
 Tue, 12 Jul 2022 04:46:09 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906494a00b006fe9f9d0938sm3767200ejt.175.2022.07.12.04.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 04:46:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Tue, 12 Jul 2022 13:46:05 +0200
Message-Id: <20220712114605.52369-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712114605.52369-1-christian.koenig@amd.com>
References: <20220712114605.52369-1-christian.koenig@amd.com>
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That should not be necessary any more when drivers should at least be
able to handle a move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1530982338e9..1e76149c62ff 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -603,16 +603,10 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
  */
 int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	struct ttm_buffer_object *ghost;
-	struct ttm_resource *sys_res;
 	struct ttm_tt *ttm;
 	int ret;
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &sys_res);
-	if (ret)
-		return ret;
-
 	/* If already idle, no need for ghost object dance. */
 	ret = ttm_bo_wait(bo, false, true);
 	if (ret != -EBUSY) {
@@ -620,14 +614,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 			/* See comment below about clearing. */
 			ret = ttm_tt_create(bo, true);
 			if (ret)
-				goto error_free_sys_mem;
+				return ret;
 		} else {
 			ttm_tt_unpopulate(bo->bdev, bo->ttm);
 			if (bo->type == ttm_bo_type_device)
 				ttm_tt_mark_for_clear(bo->ttm);
 		}
 		ttm_resource_free(bo, &bo->resource);
-		ttm_bo_assign_mem(bo, sys_res);
 		return 0;
 	}
 
@@ -644,7 +637,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -658,13 +651,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	dma_resv_unlock(&ghost->base._resv);
 	ttm_bo_put(ghost);
 	bo->ttm = ttm;
-	ttm_bo_assign_mem(bo, sys_res);
 	return 0;
 
 error_destroy_tt:
 	ttm_tt_destroy(bo->bdev, ttm);
-
-error_free_sys_mem:
-	ttm_resource_free(bo, &sys_res);
 	return ret;
 }
-- 
2.25.1

