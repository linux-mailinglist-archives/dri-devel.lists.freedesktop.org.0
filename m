Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03552CFE1
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889C411B332;
	Thu, 19 May 2022 09:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F77E11B2C0;
 Thu, 19 May 2022 09:55:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n10so8893436ejk.5;
 Thu, 19 May 2022 02:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vMtJyoOWGkplINQgN2LXJLNYL8JAFOQc7afECfFknhc=;
 b=EbmF8HUOYLGK2WRdlUVpNwi6ZlH5uS5IUKxuYEZDxtgcYAD7G8vvVHowdBeITlLebX
 jkmscZRb9aLMTiOxn8uGKsDCe268+wC0A7etNu2WEwS75LKwfvh5nTuMD+sZQW/Vy+T9
 ZehrvjgYIJCkWWZCe4ah7ExJSbrI9/1Vo7IOdjiTig/w+3/WRO0lM6f1Q5sgLCuMCh7M
 IDvIDZOFJHxefc9KViAHqd4FQ+w4P7Is5BFX4iD97xOGZx4du9M/I/6TTCKZf0gAqFbG
 f0jFjEBKb0w6pd0406iC9/0QJ80kpmp/JyNb9SXGD1v0fQW4eGlzSM9CNFP7seyKEgh6
 IpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vMtJyoOWGkplINQgN2LXJLNYL8JAFOQc7afECfFknhc=;
 b=GOOfQeMgTqcbR8xu5b7Rz9OT2UdF0oEzCpUgueIq2T2gjj60gacKW6S691NCubRm8E
 svUthakhy+BhucgtNrwigjvMBPQEAKa5XvOPS1N/EhnBiChwaBg4i2F5gmz/6eNFGuHB
 YT7ZG1Z+OmwHpfqQeHPGp0SUYvpMgHox/mTJ+/X0y2tzkXpllEjmhBiTwFDz1pLiiP0J
 imu026Dci3VQS6EpbVINgG7Wx3j5kTAoJlfcLmpTWbZZze+q/fVRFRSZ1zXzndhTN0SX
 lstzICccLwsvQiGvcm9QlnlwoweNdWUh90kNY5skfzODC+Rq3xfzaaPUiVavHcLzAtHS
 zuxw==
X-Gm-Message-State: AOAM531GQUFNme8vI6VPzk6ZLcMAr5P5QvuTXAsbVbJZz/al0uKBdMZ4
 v/Jb5KX6m5f6+zg1ANjgTLgsDmLYo30=
X-Google-Smtp-Source: ABdhPJzhK6jKL27pHcBMxYMONuY/kY1703konpUhiCeSR1vb6ANXDzsRHrl9grT6xlG5RYNO0SAzAg==
X-Received: by 2002:a17:907:3f0a:b0:6fe:34a2:1368 with SMTP id
 hq10-20020a1709073f0a00b006fe34a21368mr3505874ejc.130.1652954121802; 
 Thu, 19 May 2022 02:55:21 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/11] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Thu, 19 May 2022 11:55:08 +0200
Message-Id: <20220519095508.115203-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
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

