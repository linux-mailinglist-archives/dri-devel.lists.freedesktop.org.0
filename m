Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355845A7A4F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16AC10E2CA;
	Wed, 31 Aug 2022 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040CE10E2B4;
 Wed, 31 Aug 2022 09:34:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kk26so27138329ejc.11;
 Wed, 31 Aug 2022 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Pm2PIhgkaQI0IQXl/jfQ/qZntTY2KRA5ZgN/UOEW2eM=;
 b=SDhcJuyu00n4FttfDffQcpRJ7ILf4g4As3QfzKrYw7HtOvGvTu9uErhpo8ZRo9VDKW
 r9f6np/c5J90s33gO9nTWa6KSxNSg/9TBqygQ+4f6BrzOhpICEaGOsAEBXbHDFxOs3qa
 whlNAhnt9AsFxSu/VBixPN7yV7Qic4huIVPJLelGOfamArlMwL4ZO968xNv6wQ+tQp4o
 y5oZHuU0MBrVOmP4khj/kavI4TUQjND+s6MYUEtyj0x98cq5wbtMRQbF91K9CDpXeca3
 ssW6qblkf4DWmlNfElUF0oSiQnCNvybQ/IW6ctGOcprtgaJUn90xDO0hLNb7J1S03mv7
 FDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Pm2PIhgkaQI0IQXl/jfQ/qZntTY2KRA5ZgN/UOEW2eM=;
 b=6xth/nKHYKHsl70xzZHPRA5oDJZQLO5Nk8aCiH/LOehYXtufchrb1GX69B2I9Se4vE
 A3miaZNxfJ3diO5C08onSr+BgiNeBI4RLhxN/fr6+vAWxQQMB0C3aI5nV+iIMx9+i+uR
 JxQGx9iy9JmKZfTLy+oG1HZkDZtPSPORIqaK3WIFoUHyAAasY9VTKh9vnlWSmUy73Rgr
 jz/tT6Nv2uCSD1BMUHxrRyL4gGBbPGqDEKBDiAxYWW7sJgTqKV0cqKnWGZHlrQynWVYe
 Y1RfPMmZstXN9RjiKc6rFdDg/exZD3WlYF/aZlY7wq7esnkC3AzUhu/DUSAqzjuYxCGw
 q9Qw==
X-Gm-Message-State: ACgBeo2GzCx9GHUXAluqarIKmRO7UbBUbNOYjCDwp4jVJUgKLI4cWU5D
 sxUgRRFdvAPgAdint5JsxFI=
X-Google-Smtp-Source: AA6agR6RVplwAUonaZw4sIT64EaGUTW5iSY5vI58OT7E8J5zc0VBOk0J0Szb2rQBRlke3ku8GSK7IA==
X-Received: by 2002:a17:907:75c6:b0:741:75a0:b82b with SMTP id
 jl6-20020a17090775c600b0074175a0b82bmr11099539ejc.465.1661938473470; 
 Wed, 31 Aug 2022 02:34:33 -0700 (PDT)
Received: from able.fritz.box (p4fc20ad4.dip0.t-ipconnect.de. [79.194.10.212])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056402400500b004466f5375a5sm5608983eda.53.2022.08.31.02.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 02:34:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ttm: stop allocating a dummy resource for pipelined
 gutting
Date: Wed, 31 Aug 2022 11:34:28 +0200
Message-Id: <20220831093428.1397-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831093428.1397-1-christian.koenig@amd.com>
References: <20220831093428.1397-1-christian.koenig@amd.com>
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
index 497ee1fdbad7..a1c4dc031cae 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -607,16 +607,10 @@ EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
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
@@ -624,14 +618,13 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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
 
@@ -648,7 +641,7 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
 	ret = ttm_tt_create(bo, true);
 	swap(bo->ttm, ttm);
 	if (ret)
-		goto error_free_sys_mem;
+		return ret;
 
 	ret = ttm_buffer_object_transfer(bo, &ghost);
 	if (ret)
@@ -662,13 +655,9 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
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

