Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6735C4EABD4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B868010EFF5;
	Tue, 29 Mar 2022 11:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715AE10EFEF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:56 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id lr4so25893424ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eNHQkRETV3SZglaR9U1HwjWoLi3sr0o4JKTQm6mFT6g=;
 b=RhEacFpTDBtAYFkbmTFboXXqZOqdW6aprKTFkVgWV6Bu5NEjXYM2Rb4r3rdQVnTG14
 tgLt5POFWn0oaTShUt7dyyUodRB9+N8TwwBDj3Qh5FuIJwEeX7vuyShPqKyvpGr+mU1L
 RZK8naHusfh8evNEXIadpVtuqHTl/n04J7O1+Uxz0lwj5jSexXX5HmE/0Em1lewJEkn3
 vRWAT4D8cGv2LxQtPRTukrxAMJZmXOpJbMxFyrFt4/vcCo7QhJQiSINQI7kFlF2MxI/k
 zu0Zn413ncxkLvkdQ5lZ+4gHS0DPRBkhy44enD1tp60cuwGLZvNnh1M8zZyU0IMKWp5F
 WnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNHQkRETV3SZglaR9U1HwjWoLi3sr0o4JKTQm6mFT6g=;
 b=O9nB9k9NF6eZqSZVINNogVJr/C2PmK6eEWW9R1CQURJA/jvu0H4qH3tFdyED3PMtce
 8X95zvvto2dp/dT/D5VXOj3uBzpacTuWYBd0GU+m6ttCol6QOhqQf6T94DYY8f5K+i+K
 kRFHZ0rdjOy6JLtPtaanbmpIZX/wVqNq8ImDuT6rRdsbTcokVRzxVvl8p7+xglpXUQ73
 iuprcL05PUp4JOj3PYbayae8oJR1NrJUSIN94mCdWzyMeqp+1TAz6iKjQa9F9gP5MG4g
 CqnyM4+ORrWBRA5iQtOZf8Ji7AR4qOjhbJH0ih3xYM3vYyB3bgKuMgVmWZbuctHwShKy
 ElLg==
X-Gm-Message-State: AOAM532YYN0j8Mlir3Ht06E8vxEMwJd3eSh8LVbx0PZHN8Fw89H9mJnR
 vkhsmE1ltyGbGjDXKuPdbTA=
X-Google-Smtp-Source: ABdhPJzmWyCD1qSdy5xuSIxWAiwowzqunL6jwJQ3HeKYQUSOALRAZs3gb+b4KtTSjDFKc0iBH9fObw==
X-Received: by 2002:a17:907:a422:b0:6e0:238c:4f44 with SMTP id
 sg34-20020a170907a42200b006e0238c4f44mr33691025ejc.257.1648551774916; 
 Tue, 29 Mar 2022 04:02:54 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/11] drm/ttm: drop ttm_bo_init
Date: Tue, 29 Mar 2022 13:02:37 +0200
Message-Id: <20220329110243.6335-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 26 ---------------------
 include/drm/ttm/ttm_bo_api.h | 44 ------------------------------------
 2 files changed, 70 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 7598d59423bf..37f68e710247 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -988,32 +988,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_bo_init_reserved);
 
-int ttm_bo_init(struct ttm_device *bdev,
-		struct ttm_buffer_object *bo,
-		size_t size,
-		enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment,
-		bool interruptible,
-		struct sg_table *sg,
-		struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *))
-{
-	struct ttm_operation_ctx ctx = { interruptible, false };
-	int ret;
-
-	ret = ttm_bo_init_reserved(bdev, bo, size, type, placement,
-				   page_alignment, &ctx, sg, resv, destroy);
-	if (ret)
-		return ret;
-
-	if (!resv)
-		ttm_bo_unreserve(bo);
-
-	return 0;
-}
-EXPORT_SYMBOL(ttm_bo_init);
-
 /*
  * buffer object vm functions.
  */
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c61e1e5ceb83..51fbbd035c11 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -363,50 +363,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *));
 
-/**
- * ttm_bo_init
- *
- * @bdev: Pointer to a ttm_device struct.
- * @bo: Pointer to a ttm_buffer_object to be initialized.
- * @size: Requested size of buffer object.
- * @type: Requested type of buffer object.
- * @placement: Initial placement for buffer object.
- * @page_alignment: Data alignment in pages.
- * @interruptible: If needing to sleep to wait for GPU resources,
- * sleep interruptible.
- * pinned in physical memory. If this behaviour is not desired, this member
- * holds a pointer to a persistent shmem object. Typically, this would
- * point to the shmem object backing a GEM object if TTM is used to back a
- * GEM user interface.
- * @sg: Scatter-gather table.
- * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
- *
- * This function initializes a pre-allocated struct ttm_buffer_object.
- * As this object may be part of a larger structure, this function,
- * together with the @destroy function,
- * enables driver-specific objects derived from a ttm_buffer_object.
- *
- * On successful return, the caller owns an object kref to @bo. The kref and
- * list_kref are usually set to 1, but note that in some situations, other
- * tasks may already be holding references to @bo as well.
- *
- * If a failure occurs, the function will call the @destroy function, or
- * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
- * illegal and will likely cause memory corruption.
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid placement flags.
- * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
- */
-int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-		size_t size, enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment, bool interrubtible,
-		struct sg_table *sg, struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *));
-
 /**
  * ttm_kmap_obj_virtual
  *
-- 
2.25.1

