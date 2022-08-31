Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE75A7A4D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0336410E2BD;
	Wed, 31 Aug 2022 09:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D5C10E2B4;
 Wed, 31 Aug 2022 09:34:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h5so15601479ejb.3;
 Wed, 31 Aug 2022 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LyzVEZpAcOs03g6cb7ZXFSVg5DeiSEyIliByIbzxjy0=;
 b=XSokJLxe6P7UTrsiWvl1wwt4OOZsbK+5wwsIUk7d8SBFd5X+tY+tObxfxvDLjWEGQn
 dZEjqhI0gtUTuSC1No3ORTG/KYFl7iiSVUVGI3AfG+BLIIQvmclITM0mH7YCP4671FCH
 9BV3j6vsJ01Ue6vYeIHj9Cj1gL9r6FaNzoXHWpev+yF9K/s9/CYHo3EEYTLWS2U5Nbrn
 PBdbULNBmyPPfmE9ryW/6TSjkNPXVa0vUukDG3Lbwo6q9PafLxAYUVUx6WjffYM+fnYt
 E8aho3UKS+uJYC8hyV6xOJc17BtMgJ8cv3cv4ekCnOG1XoPUzh99LWJVNL2BPXqubLf4
 ogzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LyzVEZpAcOs03g6cb7ZXFSVg5DeiSEyIliByIbzxjy0=;
 b=Yd2W/1yO+xZWw78qy+TCfS54qYETOriNpHEolhl4D5M7I1v2wYtDp+WpojnovmXn+A
 6SJzJLaLe7SRtoj1QcAiIwAauJltGdnZjSyIGV1H2ifY7S40cvzrBw2H07XJ/+tVV+ZR
 ldJSNfRoV6xRU9Wb8Wb6aQgDG5mUTCuyItvIuU8ecW6n9DSADkH7dGarBujNJgn8+qh4
 ynHQsnYhb0ZHMD7jbSFt4IBPWT8hYGEs4g8UoQQWnQl7vqPROA5PYHgSvMMAlCbElOo5
 jYYX9HbgFu0bZBgMG2A2SPG9zB/yDsjTpb+/qHwQLfJjx0ItAClej6fDdTUX1TBRGpOs
 v3yg==
X-Gm-Message-State: ACgBeo17Y9pvuMQ9vjf7pHSAnoPC9hUkyfeE9FN8acAImy7i9Btshu8S
 5fo++BH2tyIh4JL/2x5+ld0=
X-Google-Smtp-Source: AA6agR5vjAbum1imghVUmQE8sbTSfHUd+Y9Enu1vC7vpsh+8A7LQQBUb8/xrwYp2QmiGtq3OLiFK2A==
X-Received: by 2002:a17:907:c002:b0:73d:d96c:c632 with SMTP id
 ss2-20020a170907c00200b0073dd96cc632mr18121224ejc.543.1661938472111; 
 Wed, 31 Aug 2022 02:34:32 -0700 (PDT)
Received: from able.fritz.box (p4fc20ad4.dip0.t-ipconnect.de. [79.194.10.212])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056402400500b004466f5375a5sm5608983eda.53.2022.08.31.02.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 02:34:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Wed, 31 Aug 2022 11:34:27 +0200
Message-Id: <20220831093428.1397-2-christian.koenig@amd.com>
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
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f066e8124c50..d7ed891d3887 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -959,7 +959,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -977,12 +976,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
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

