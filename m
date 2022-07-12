Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B6F5718D6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 13:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74158A186;
	Tue, 12 Jul 2022 11:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862492B40B;
 Tue, 12 Jul 2022 11:46:09 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h23so13786477ejj.12;
 Tue, 12 Jul 2022 04:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GDVXf57lCe0NyeriLUBibCB0wZv0NmHVTlMjtAkbPS0=;
 b=Ru3Wa60S7ExC95v0jy4JdEgpIdyB/6kdRetyQKUju31cH14omGL55Bmg8xoOy+J4Hs
 nN9RZ3IhvBGnkPi2g30aJPBialf2+mBdb/TOY2/L5PT/oM2FLkGskPXEWm4C32kmBgjd
 5F/shs3TKGLg8mBo8jPC3F85uSicaBWax+/ArEDZ2ihmMB1KXGmgGPuznb7OeUYVPt1n
 MYHQUwDAxWrDij9o6oj5GpBrOGlmBSctJtGt7bSMInxEQjdMglt3LLVI3bS6hmePYPdP
 GxDIp2DgO/fxDr1xj8/3NiGTURzBPlCtufj5dWtlBbvzy08G0wrn1337S0a1jLVqt6WA
 TMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GDVXf57lCe0NyeriLUBibCB0wZv0NmHVTlMjtAkbPS0=;
 b=G5zUAUE15N9cxrz/2cQ8U5awCA3jKQmneX5ynT/WRjNRq6CxG/wv4gAf2yf2dmcyRk
 Oq5lyRjkJ2lLRXQa1N+DCiXUXJf2JruFpuPo3gvzz67wtBmyNsGF9kyq5j8wt59F5lKy
 oS0pqRToHyPsi9SEMriiZ/Eqcd6kTDeatVGJa6FXdmbgdaXOy3ohVeHSgJdSKDGHSFj1
 0VquF6th0Mcz7/0P8xSgcSZd/3XnR/MXHqXiE1UC+rAXRjDPSwpsne+K6UBFCFnitshY
 nVdCEyKHrgdBdq6FuIQnczbbT/w4BKnvRjrG+wbOqQ0rpxQyrcV4g5lLztsKKljXkLUn
 fumQ==
X-Gm-Message-State: AJIora+WFXbqmySc/6ef1vTa6+lhLeSysz0cDuKV0JbUhfBHRXcUoWG3
 b5Z0jDUTo9/TlRlEimtlhLOnV6o/Zj4=
X-Google-Smtp-Source: AGRyM1s+o1Sf8VwJ6rz/N+nTLZJNxdGWUhKF/Jq+CCcb5BPTKGhU560AoBOQdIWXuzI0TJTRTXFtOQ==
X-Received: by 2002:a17:906:106:b0:722:d84c:6df0 with SMTP id
 6-20020a170906010600b00722d84c6df0mr23452573eje.203.1657626368100; 
 Tue, 12 Jul 2022 04:46:08 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906494a00b006fe9f9d0938sm3767200ejt.175.2022.07.12.04.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 04:46:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Tue, 12 Jul 2022 13:46:04 +0200
Message-Id: <20220712114605.52369-2-christian.koenig@amd.com>
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
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c1bd006a5525..a95826be8048 100644
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

