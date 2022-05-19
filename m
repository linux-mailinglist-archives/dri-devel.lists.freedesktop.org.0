Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7652CFE3
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADF311B316;
	Thu, 19 May 2022 09:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB1911B2C0;
 Thu, 19 May 2022 09:55:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id i40so6317663eda.7;
 Thu, 19 May 2022 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iu5ZtZSiudnSHHsipnlZuPhys4LP3RVmLZVqXqUXCIM=;
 b=etxwIHT96iEvA5w0Mx8iFljE2YXhKkBwmQiacBysP19BfEiKlpPqhuwcqxT2WdT9yd
 t9zp08HJ6uA2f3GeXj5wVd/B7BXX/YhFADDwIUJxu5J5ek3HhM7IhV8ptHpsk8VVGOWk
 nLlUVim5YSIyKwIzWyU3VsWKIt3I4/P/x/fFkDq9P1xWkGyfXAZweHoooIQVJzAc3+Ct
 bePlMRYXRa+eapd34Ml+ibiYKMsi1tPU0tN1vLcVV7HUNaBvjrqGjRrrkac94SLs74Uz
 jSf3GElMrIpqJ195SllNcYSUARWfkYc2JHXecxN5UNufgHHylJvAZAF/o4ylx9I1LT9H
 R7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iu5ZtZSiudnSHHsipnlZuPhys4LP3RVmLZVqXqUXCIM=;
 b=Tn8xTUvf8EkMZXDmlFobPXq823ou/kzuwN+Xn1Gj8QtIZVmGVaKk4pVbbsoOGshD32
 x/x/hA10t5YPaoin8etXjqydAlzH0tkK8MZR5xk7BI5dszHs/ai4pK/1aPVpY0uuStX6
 6js/stCJYZaI5flUWJFKg2Ndy5IgkrOHJSAQx9iXuMHiB7Ql51hvmafkaD4UI33YuLy+
 ezH8AgVaBEj/2BSQEPrCJxq74GUUqaUUl7cJ+SU0nVENFCdZ5DDH3xshsthbK52xldR1
 AKcQb7kbLxkndPqRZM3vzUlyvQTiDMnYUdnFPMYMWTQ0/mTOky0P4SAkZFDcoul7cnYh
 ZgSw==
X-Gm-Message-State: AOAM533uvh+DGUqKtOJKI0DfXztTXY4vj743nuVXhk2caWie5MXlLB8y
 iAKROlWecgS21tVNxCSRG4ZgLYGOkXc=
X-Google-Smtp-Source: ABdhPJzI+Ks7FuXtYPU3DWrzc0p7UyaSmqGgkfU+Vc5xMocGknoeY8aoCO3Y3UimQbYTPwCKCg/55g==
X-Received: by 2002:a50:9344:0:b0:428:635f:b335 with SMTP id
 n4-20020a509344000000b00428635fb335mr4310315eda.300.1652954120807; 
 Thu, 19 May 2022 02:55:20 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/11] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Thu, 19 May 2022 11:55:07 +0200
Message-Id: <20220519095508.115203-11-christian.koenig@amd.com>
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

