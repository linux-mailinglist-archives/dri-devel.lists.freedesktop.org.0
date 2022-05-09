Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C1E51FDA4
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A93810F1B1;
	Mon,  9 May 2022 13:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFAE10F175
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:06 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v12so19347855wrv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vMtJyoOWGkplINQgN2LXJLNYL8JAFOQc7afECfFknhc=;
 b=EgjrmQnK8FmsqTtFe8h2suHnuCvF4fpdqqXD9kCXjZEkT/RsMjN7lLYbYQHz64eEH/
 zjO3jdswRTrkGwVCoB9XhZZU02tXc3X59+FqtDVnzvptVu42fiLp2ycYm2fpt4bXN8kj
 JWxeiDsNzUiY22l886Q8UkJvLk5AzC9/H6y4ibWXXyR+JHdT9HUhKqTnXUXr0o/8lW2t
 h2/6rlLZtC+j0bGEEx+1IiIg84eXhbnKRrkJjlafqG65aEuWwYku/uqYwk93hWlzzNKE
 vLEsSSAgu2i4nQaWZcrDQM/kBabOm8fwK2HMKd/oRZHRK8bmIiqJ/4Z+RLvZ7UZhiUM9
 2OCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vMtJyoOWGkplINQgN2LXJLNYL8JAFOQc7afECfFknhc=;
 b=xU7+UJAT77gGrj8R9K+wIJZJvCrOQCccJT4XHVTByo2XdokmmKhUFzUbcPcaO91MLL
 0BKUZRUA/kc21YN8/Wi3GdRJPUYm+veVy5FlkbCXNelkKjRHsil9nDYeSTDL/mjhH4fd
 +Hr7L1FHQ1/iJPBdOIc35eZW9Wi2x8pOAzxFol8QmWiuy//LuK1H2pWZm/Vk93ESQ4Ti
 AF7reacEeJnlWp1nPxgmCzolTwLURDNCqZpR7BsaZ5UUGbyL3ecMHvDB/rdkN90eVcHX
 0J3tSuOvz+bI4PHxfLMwFlYZVwqKi+eKq3DOMTazOX2Lo+HFIeNogM1CkKiPwicVGRas
 WMLQ==
X-Gm-Message-State: AOAM530mtgUQ896qqqmSLYSRItKO1gEE4HX4rX0EnGStxlZMxhV3Yqlc
 YInNF3TT1L9i+RbThqvDAr8=
X-Google-Smtp-Source: ABdhPJyTRksqZ3eSPvYY6L3ZYyvb0MSvfkzbkq+Ph9M+bUBc3Icp+97FuFOtbkhOsdw4+uq6orfgqQ==
X-Received: by 2002:a5d:690c:0:b0:20a:d9d1:f5ce with SMTP id
 t12-20020a5d690c000000b0020ad9d1f5cemr13841357wru.295.1652101806274; 
 Mon, 09 May 2022 06:10:06 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:10:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 11/11] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Mon,  9 May 2022 15:09:51 +0200
Message-Id: <20220509130951.486344-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That should not be necessary any more when drivers should at least be
able to handle a move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1cbfb00c1d65..585fc529cc75 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -600,16 +600,10 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
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
@@ -617,14 +611,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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
 
@@ -641,7 +634,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -655,13 +648,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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

