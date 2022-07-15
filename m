Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C593D575FDA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F5D14BBB2;
	Fri, 15 Jul 2022 11:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04E12BDFA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:15:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x91so5878939ede.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hPsgPQujV5ih53XaLx+/Pzm3BQPgFoU/IJrYZRUs+24=;
 b=fpcAROxAr2fFPQsOMH7WoZWgRJCCFjWXZ0mHQG93ttjlxu7fA4Pcth2sGImAdpqIN6
 Z87VN5wkBePKDROI5K6TQDxXynXb39UBWAjaA6qEU8GBQLdWEFk3Pu5iLj9z1SaIZQcV
 XNmdeq//1RbnjiMfvxGEsBEPbWuiHu60XYQqoGuIyYUXiKOPCVmYIwnyduhkdSP8/9DQ
 EmQrjPhHMir2+iKHQJwwjw9bcu1Cnpg8OF4CDkxZhn2mOIFo/hxnpdBGUHH0arD0zrbk
 yO5SCmsw/83Tr22S3mUNTNA5EYMZ3WqboABSZDAjsazpL6c3Dl3/aCw2f97f5wMHXzni
 Vpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hPsgPQujV5ih53XaLx+/Pzm3BQPgFoU/IJrYZRUs+24=;
 b=i4a6ZRSCQ79FoJ+C+OiB/BvqPjwOVg+Iew4o+gHw1gsRLC00gS2whA623MYAoP6huj
 n6Y9JCgXvZ+JZJ+J0hPc4fOT0pQMK1swTXt17RaAEn72o+zufgPpViEOVk6oN0adm29B
 wA83iSjCtebRHoiS1yoPKk9Vyeg0DTUXCucel0YTema4Qerayne3b2eREtNgq0xMv7Fz
 sRZYSWabCIjZamM0PZQBz2PkiRZNf7BuFVHGVTyLvpfXSq98ioclqNIx5gsFpxqpya7e
 UFDMd7MYQhSmlm+QD2Z15DvDChzMV5mywCa136CfjcpW33u2vM43nLZ3gRCLMv+iQTHP
 8X4A==
X-Gm-Message-State: AJIora+20qLcExGRI+mRl2rtaQYbYCi5WYflWdfG1dkkMTXeVvqphReo
 JJk/T72MHX0pVcnKj6GtRu0=
X-Google-Smtp-Source: AGRyM1tMakO+ZqqOlTHKSt5nYf6RCihmquy+97cDJWNUg5ME2FbSRbqMEba62M2cSwwoYbcLZwlwQA==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id
 et15-20020a056402378f00b0043ad3f579f2mr18625615edb.338.1657883736606; 
 Fri, 15 Jul 2022 04:15:36 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a1709066c8500b0071c6dc728b2sm1913543ejr.86.2022.07.15.04.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:15:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/ttm: add dma_resv_assert_held() calls to vmap/vunmap
Date: Fri, 15 Jul 2022 13:15:33 +0200
Message-Id: <20220715111533.467012-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715111533.467012-1-christian.koenig@amd.com>
References: <20220715111533.467012-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's make sure nobody is calling those functions without holding the
appropriate locks.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1530982338e9..497ee1fdbad7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -402,6 +402,8 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 	struct ttm_resource *mem = bo->resource;
 	int ret;
 
+	dma_resv_assert_held(bo->base.resv);
+
 	ret = ttm_mem_io_reserve(bo->bdev, mem);
 	if (ret)
 		return ret;
@@ -460,6 +462,8 @@ void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map)
 {
 	struct ttm_resource *mem = bo->resource;
 
+	dma_resv_assert_held(bo->base.resv);
+
 	if (iosys_map_is_null(map))
 		return;
 
-- 
2.25.1

