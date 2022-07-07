Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12056569FB2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66C311BE67;
	Thu,  7 Jul 2022 10:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9C10FE19;
 Thu,  7 Jul 2022 10:25:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a5so10955584wrx.12;
 Thu, 07 Jul 2022 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kK6ndtBfNyXHqhkSLKg1LtqtVJJfhWr9bEm4kExNfWU=;
 b=kGohQwUbMyh+lZQt7Rj+0+5GqB/QcyLZdJzSC/UubDHHujW1BM8HR2JLZuuCq+BCHO
 aiA/2iUEpDPTD667woVWd6YQgzLnyRWfgyeQaj/K0v+Jrp6Rk0uKdyYUzIXelnaaM7hA
 YuRdNBkiAAgTgd748FRfZiWFlXztBJAGjL67MWg3L/o+Sy5O9UudDUBHl9dsbVirCOQL
 NPt4ZYKOVynnO2atgyGmE6l5388Y+mcK5bi6qinnnLEt1oocr1WwkLMKB9c+mb+8gMCR
 XtwlI8MhsELTtxmtRm88GgMbUTnikRLxX4KxMCbMFzQ5XnAswFDxYFfV+R8lvA3Roi01
 U1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kK6ndtBfNyXHqhkSLKg1LtqtVJJfhWr9bEm4kExNfWU=;
 b=zfE8AYtByrDVy++7rWNj7CqvrkCuS7rq57SnDEVvcbqxqONkwW/RT7bCEpjwZGgkcO
 PmbmBiiqHH5b4Cb/dQ2W28xurY82tluS5Uhds5xb46XhHXqBoCRDpDl0OvLd30nbz+r4
 yyGnZ2EnmB5fB+C8RjR9OYuqsSK7EuAPfWMsFb+PFtMmONI3vaMwhtprieBoJYXq8KXJ
 VCJ3m0AOcDBQ7Iq9uAcfIt3XLt2/JNnCb6OGYaX/XLF8TTJoK5J0lWS4DmDOjyM/0gfq
 T4z63vCeIo2GpB1grzxXqJv0YB+0Y+sCalUM6kKhlYyy48uEcS3i3wDT9ORO42nIN2ha
 94ZA==
X-Gm-Message-State: AJIora9rUna49/f18M3N6ABB5wurud3PtVzK/6ufyTJBNNXKGmAkEjr8
 TEsWBsSLBPUZUQP5c5WMDPCGth1ZXMQ=
X-Google-Smtp-Source: AGRyM1vy2LWZSmeJmS9kr/k4KTJ2MmhGCcH6oHrG0WxnwsiwkZqlkLGHPBrunwy9XZPe5ReRwXkahQ==
X-Received: by 2002:a5d:6d8a:0:b0:21b:a2a3:55f8 with SMTP id
 l10-20020a5d6d8a000000b0021ba2a355f8mr40393270wrs.283.1657189501665; 
 Thu, 07 Jul 2022 03:25:01 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:25:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Thu,  7 Jul 2022 12:24:53 +0200
Message-Id: <20220707102453.3633-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707102453.3633-1-christian.koenig@amd.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
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

