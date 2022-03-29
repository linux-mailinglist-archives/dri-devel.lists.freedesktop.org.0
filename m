Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A64EABDB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63BC10EFFD;
	Tue, 29 Mar 2022 11:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C3010EFF2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:03:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y10so20224855edv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oh+0SWKuOIQeRZ9O3zOCeHmM8PwxjqSjdwNHmc1FdG4=;
 b=FAKyvj40ubfIpiT6jks7mj+qcyI4K0enDXjF4Wf8ZT+pVOsoAvXzymHBJKyeDLBxhz
 V7CEc1IMWrx0yKlQ4PXQEqorKSw3dxI2/fSVHbLtw/8OsmncPS3mQ16U00rmcHIFTvXI
 xzr338qzCPxtNK2Xc9vZry24L3OP2y8BO5H/pETwvdTouDZuArkpOOudkQwxPA+JPv8l
 wUIG14xn+8RiqETG9Tm+7aZNz5kkOiJ7KwgJyJWPY/xGXFlCohjOAp92S0b5opwhcI97
 87gNMQvHnRZ0RaMLbXP3gCH60SdoEe6Jh5L9Di1YXueSrBZb7GI3S68Ru4KsY5NTOyvU
 LfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oh+0SWKuOIQeRZ9O3zOCeHmM8PwxjqSjdwNHmc1FdG4=;
 b=nV07dM+5HLjN5/wdfYBgP8Cm1jAUJPppAEyrSQZp8wbgiGOWzVc7jl/ZAuhWc39pvu
 rnKvWpowEmshNceHiwJluQG2mnNeco6xXwFySrXxA2FQSN/kz6ufJlP61d0bVIQyC/Xs
 m9ghWXSww5blfMQprbTHnrQ+vOfelI1VmY9OwdPgXU3vEYpyDaJlFzD48XAWISKsX1KO
 bNtdnuDqNw4PMgC9zbsFoZULKMGt+YODs5D/vhoUoOus/i9ZfaQ1SgW1AgUEI2Ea7b0Z
 OmEryg3fFWg1hpOc2jYuEEJUsEgrL3G0j94Y0KZRd+Kedhe6UsApCx4M6cYoyny7KgUw
 K3rA==
X-Gm-Message-State: AOAM531pZNKMrqRjsbQVnk2xanHGRvqdiMy1DAooWGZRNvlJHP0/ZXD2
 X35pgwFr8whKlGTsSEKZtAg=
X-Google-Smtp-Source: ABdhPJwQCUIRqOsFrEBMRzUPdZDxUw7XrGAW86piUANWOTaEY32owjF9woojjStGvloI4iKHypSVxA==
X-Received: by 2002:a05:6402:2142:b0:413:6531:bd9e with SMTP id
 bq2-20020a056402214200b004136531bd9emr3832468edb.5.1648551782708; 
 Tue, 29 Mar 2022 04:03:02 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:03:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/11] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Tue, 29 Mar 2022 13:02:43 +0200
Message-Id: <20220329110243.6335-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
index 0163e92b57af..979abe095f42 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -585,16 +585,10 @@ EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
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
@@ -602,14 +596,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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
 
@@ -626,7 +619,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -640,13 +633,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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

