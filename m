Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5F51FD9F
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA32B10F18C;
	Mon,  9 May 2022 13:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8E10F195
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x18so19411853wrc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9obn04yJj9rZ0fYrM+R/7zzmeeRej2X5M8LMjJ0gWi0=;
 b=bGx9H0NmcHHjac+xgre8FWZ62GNWdDjo7j6nm0RtIT3OPFy/Zjtl5NK6+f/BhjQqAp
 cgdIYeBk4fhiCX4XTU3KJVtLRTJIuq+frRxW5TE7/4Sn+osoUomRlX+PG2cq1wA/ZZvW
 N53aqVvjSS2x4kRLm+SQE92n+Crrk1x7+iPhyA6V9OD8uUcJd6XwxzPUyzsnSrhBsUnc
 9dmzEXvDPT4stijwS2pw+npDrNZJ1dFUJMgYJzjKHjM2VQzWjlgo6CTjvyvEHKSPXq0G
 DCpjF5Sf4HbizZcJej6wY0XFGqGGMMETTuHy+MtUo+0p+MZ+HuWPTKwbk8Yl+7W+XFHa
 62Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9obn04yJj9rZ0fYrM+R/7zzmeeRej2X5M8LMjJ0gWi0=;
 b=wYW/3UQYDIMyNsxxjF+P4Dco7cg3iG5/+t4AvZL1055xntjL4tFbevkndx5cUpCMRS
 bDTItN8Vd2EkJNvbjMB0XLEECjrCTgUV+Yq8HDVqjlEudIrqEQm6dw2u8ceWnsHZQmkR
 PWcf+helDYYhx4IHrXeJG1HmzR2PvU9bI3tD3jYKkkOGKEHbJWyf1GqSBby6sXSfKmXH
 zzY90I59QSsE1/JgaHAoDsH3GoPfI3c6qvWccKh0k62VAzoAthUOVRJk6QD1YUO436/5
 QI0zliptTSTRmDTmfp1kAE3je+UZZav0ijjkLxCIBxV3UX7z8kDL0In5cy+BKSCOfv/u
 MzTw==
X-Gm-Message-State: AOAM530P5gDnmk/t96a5sKybM+o10WW/d3qKEOqfgCV4T2jrz0vuLzqA
 By7ZYZuy5T7ZFyWVUWH7urE=
X-Google-Smtp-Source: ABdhPJy2FklS4oxs2g97Y5TvCzq3twg/q2Swf9r12E7pX8ugd2Q5Hw4oPHmSoOLHFG7xINiqfRjMXw==
X-Received: by 2002:adf:e253:0:b0:20a:f176:d928 with SMTP id
 bl19-20020adfe253000000b0020af176d928mr13873155wrb.505.1652101802291; 
 Mon, 09 May 2022 06:10:02 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:10:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 07/11] drm/amdgpu: audit bo->resource usage
Date: Mon,  9 May 2022 15:09:47 +0200
Message-Id: <20220509130951.486344-8-christian.koenig@amd.com>
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

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 116c8d31e646..5cf3a58bc925 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1302,7 +1302,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (bo->base.resv == &bo->base._resv)
 		amdgpu_amdkfd_remove_fence_on_pt_pd_bos(abo);
 
-	if (bo->resource->mem_type != TTM_PL_VRAM ||
+	if (!bo->resource || bo->resource->mem_type != TTM_PL_VRAM ||
 	    !(abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE) ||
 	    adev->in_suspend || adev->shutdown)
 		return;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ec26edd4f4d8..b79c93812342 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -471,7 +471,8 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	adev = amdgpu_ttm_adev(bo->bdev);
 
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
+			 bo->ttm == NULL)) {
 		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
-- 
2.25.1

