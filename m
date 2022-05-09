Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6B51FDA1
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887ED10F190;
	Mon,  9 May 2022 13:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E1110F185
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:05 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e24so19391798wrc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iu5ZtZSiudnSHHsipnlZuPhys4LP3RVmLZVqXqUXCIM=;
 b=VboJO/kmT9r2hPz/JFh6WNb0RfwEl5zd127zK99MpysOckcEhEV1YJ+AxVzbouIV/3
 7AnrZH2Cw/BM1kvm9pEFhUyK3hMRpX7Ms4VqzUkrExUJ0bmdDqOSYd5slvkHS5bKvS4r
 dK0MmMqc5cIKlXk0+TLCk+/9cIQZ0VV+B0sw3lj7GPI/RHiETEY3UPqGbVCCQrDhfLfP
 bDdzYoj20JvS/JEv8YWP/4Jt3NCeDZfyuPd9NYvyRhYc4p4yNQj4dnopBdL+Y/b4atjd
 0hq6FAse5q0HIAJTVpzMHX8nfcBorwhQ0BFGvbnJ+5PPxJxbIOIZAph3bc4ARI3txMOA
 XrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iu5ZtZSiudnSHHsipnlZuPhys4LP3RVmLZVqXqUXCIM=;
 b=S5XiJmZHFsQE6eOJV5HBbUF5s7dgBKYT9dE+rFT4ler2tCOa0yClde7Lmv4aw/vf8k
 GIVE5knXoBnn81IkqqFWKRQxm3wLLnv4yWv4nTkstymCbTMKIMz1ccCsPCqpWI8iHfDg
 xDRyS5m7X424kp3Zxs90N/pZRQ8BntKU56Kr9zbK/Y+c7nm2TFiz7IJk4vRzOWBHIO24
 HWjeKU2FiEIM8JitG9TbnTFbe1htkIwGSW8YGaWmNN0iX0znGwN3ZeFdmeGMze5OsjiY
 mAO4wx7BzKqBmCqTSw2nAVpeCJJRXFw6/6ew/E4ipSCd99rEJ8FEVJT5o51IaeyzxlMA
 aTgA==
X-Gm-Message-State: AOAM531LIuD06vh8GTUNomdCMny0/41fTI99PML4BwMEwqBiaimXlXK0
 kw8FIjK1NBZNQZwxZbpXUspQuxmMXsU=
X-Google-Smtp-Source: ABdhPJwet39xvaGF3r11H8nhpc6zTwbkCdggmAzAfY1EUqXSA9OoG4IQhIAkPjKJ0CNyWDFXQV6GHg==
X-Received: by 2002:a05:6000:1844:b0:20c:566b:ddab with SMTP id
 c4-20020a056000184400b0020c566bddabmr13832297wri.706.1652101805291; 
 Mon, 09 May 2022 06:10:05 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:10:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 10/11] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Mon,  9 May 2022 15:09:50 +0200
Message-Id: <20220509130951.486344-11-christian.koenig@amd.com>
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
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a55564c8b57c..31aa4b040d1e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -954,7 +954,6 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -972,12 +971,6 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
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

