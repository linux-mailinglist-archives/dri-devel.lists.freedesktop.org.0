Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A1569FC1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3995B14A9B9;
	Thu,  7 Jul 2022 10:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F4F14A984;
 Thu,  7 Jul 2022 10:25:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v14so25661259wra.5;
 Thu, 07 Jul 2022 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCwxRN7JFHvQ0Dx/HpsxffzLHabpQf96xA1sjN92HBg=;
 b=LWR9+vqLif8wol8kw/1dOLYpCUYvvsAV7/uYLRZcB9HxY9q1RI9BCrWpVlHNpGwtca
 ljbM5u4AC/0+r9wkerK7eF6+zeQ5tisC8dvaUFy/tyV8/9S5Cs/JK+ePKHE1Z0RnnoQM
 FbqsSD3Sq8I+fMnHqYYYJXM13OrfldEdl3xGyRKX2pJZMFrd8Jfm350SpESC8dvtGQY8
 k5kUOr/hqFSYagUDSMvllhG8trO0Ji11zyNiJbGC+hFa9nnxwHVzQ/uNJXt8RtgNSdUr
 lc+L2RDaM5ienzePztKVwejgCv5We0X1KbuLMelvDga8j4Yb4CE1HebVisn16TFuMb/z
 uIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCwxRN7JFHvQ0Dx/HpsxffzLHabpQf96xA1sjN92HBg=;
 b=8MbGRQQ0m8FfljM7uSyrL4vUQ83ypy92+PqNlcz1ucDIL30RG3V1Cqzd08QYZRhkUz
 uzvmin9rTbDJPuiC+mzzl3/4752pJ5V4VW53lhEHtKuai6BO/TbONsrMEq2vj+nSee46
 Ju//D1P4ckgbjsisrGbtS6xpOFGM6EIGHiQ4UMQrXpvdCLdUgl5+8pZDIWC5nv5Aw9um
 ujfGHF0c9wMJUZJfB0Vk8QAnX/OJZdzlvKvsd4bKsi+QTVPvv0/0IdbrVhAysXxaP55X
 xErxcNhqZcDDc4PmSo1Z39+0QFML/8mvBjtZQU1QcJRv+S+LjKDIO4utThAHTmanXqWR
 +xww==
X-Gm-Message-State: AJIora9V0sxjhmzdguaSBtgX6DPoIvW5PIkeLFEQCppFKPjpRqn4cq8M
 BmGANZUBXeenn+5E1mfh+RNOUGL5oYI=
X-Google-Smtp-Source: AGRyM1tpZkvWc81JkwWZYL84r7TOAtUudxwS7od5C69NUAjDbC8aqftOiu6pA3mAzdKMEb8aeQPCLw==
X-Received: by 2002:a5d:4aca:0:b0:21d:6793:1c11 with SMTP id
 y10-20020a5d4aca000000b0021d67931c11mr21342822wrs.202.1657189500667; 
 Thu, 07 Jul 2022 03:25:00 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:25:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Thu,  7 Jul 2022 12:24:52 +0200
Message-Id: <20220707102453.3633-6-christian.koenig@amd.com>
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
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a2f49bdda8a1..f491be751a2f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -960,7 +960,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -978,12 +977,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 		bo->base.resv = &bo->base._resv;
 	atomic_inc(&ttm_glob.bo_count);
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
-	if (unlikely(ret)) {
-		ttm_bo_put(bo);
-		return ret;
-	}
-
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
-- 
2.25.1

