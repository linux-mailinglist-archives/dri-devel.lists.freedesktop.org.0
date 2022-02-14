Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A44B4654
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441BB10E26B;
	Mon, 14 Feb 2022 09:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F18F10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d10so36065586eje.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FL9AR2FSJGbO0ntktiM6638wXSp7jFGTifywuu4m5o=;
 b=d+05swOb0JNYQ5SnATt6NY1KrbxdjnHBML0Li9GdGsQlftgX/22zuEO8d8FnkM+3dV
 CvEmDrO/fXAqtziCcYs7YGjBduWuz1BNbGBDkWJlwCcM5M9xq5LBKxHQB/G/sfSGgNa6
 1Ni9GKLP27JsWVmfyq4MlNn+mH2bRm3CNR9PNuoeDiNbGEvfttUAjPBVk5FxMxZJRRhD
 EjoJM0+dlVjWrMNHige4ailZl7hHSF4jm+w9flf0OUHbUJYFO3LB2KcgbPnEOlqyJb8T
 hI/GwnZqu3xJlP0q2+1V1Uv3OEr31qDtZnmLMEJS/ria3LiKOYuEim3v/z7zjlA11eaX
 VPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4FL9AR2FSJGbO0ntktiM6638wXSp7jFGTifywuu4m5o=;
 b=OooL17lARprOXf2dLpRZSLnvEWU7S73+zXomq9Scd7FfpIQYfdfxG+J8cQ0XJ85enZ
 VOQoS7gKuw25vt95GR5qpaerA4meR0lx8ja169KF7gYN9hPLQmF/Pebgf2VVFfs4bdWh
 LrNradXAG/RHdbk9PktVQ9mqTIXocq8wcCpzVlKO3pdnjkXL6qatagApUL5vJpjjY8mR
 3ZPfblKpFZC0uOEWyKKpkv3Onm2bmRHBqx0CKOdGXDlRn/5AQymo1o/ClyhAadIIE+tm
 l6FGQMxJD6sudAibGQ4UF+ssCNbJxyJqiWuuQP0mVMxKQDDlUkyYwBh8Jp9/VrVh5kdh
 umiQ==
X-Gm-Message-State: AOAM533kFvlQD9k24ls4AQeZv2C+3Sl0kA8tNtPiWlZYqge2rhhMoh50
 65rH+x+Bx9cOP590SYmjZJI=
X-Google-Smtp-Source: ABdhPJxZrBVt2ARsthY2jKxNQRDeyERcWNHs5KZXs7OgTwjk4r3/DrYL+t4Ges+NoMW8WdyGYy+PRg==
X-Received: by 2002:a17:907:2d08:: with SMTP id
 gs8mr10933941ejc.106.1644831280794; 
 Mon, 14 Feb 2022 01:34:40 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] drm/ttm: fix resource manager size type and description
Date: Mon, 14 Feb 2022 10:34:29 +0100
Message-Id: <20220214093439.2989-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That are not pages any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 6 +++---
 include/drm/ttm/ttm_resource.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 68344c90549b..ae40e144e728 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -153,19 +153,19 @@ void ttm_resource_set_bo(struct ttm_resource *res,
  *
  * @man: memory manager object to init
  * @bdev: ttm device this manager belongs to
- * @p_size: size managed area in pages.
+ * @size: size of managed resources in arbitary units
  *
  * Initialise core parts of a manager object.
  */
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
-			       unsigned long p_size)
+			       uint64_t size)
 {
 	unsigned i;
 
 	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
-	man->size = p_size;
+	man->size = size;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 69eea9d6399b..555a11fb8a7f 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -278,7 +278,7 @@ void ttm_resource_set_bo(struct ttm_resource *res,
 
 void ttm_resource_manager_init(struct ttm_resource_manager *man,
 			       struct ttm_device *bdev,
-			       unsigned long p_size);
+			       uint64_t size);
 
 int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 				   struct ttm_resource_manager *man);
-- 
2.25.1

