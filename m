Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C03F999D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1A86E93D;
	Fri, 27 Aug 2021 13:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA8C6E93C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:18 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n5so10329207wro.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mVo6QL2otSkWlz3BNGQoToVxXIroVXY+I539FhGuJc4=;
 b=VMHuaH6HuSy7nYxCiYjNJIXWyDgMmIEutFTUgYKfoooLBZzoUpo4DTYPC4Vj/vre0u
 9BilEZ4of81AI8C96idLZjoZoU5/b5QPW5jTTODvUbHaOrCyBZ0u4n2P5fc88i88RUcN
 be0pEvsQBoGK214sP2wcXpuJREK0UijC9k/HooSmi130SdFxL4TWpN7lzk85thxQYG2G
 gCvezGNJBW38uomhhNAMpTTPl8p2OPncSeLw+by814f6aAhxwZ8GTFwkPZ3mAQqCJZxX
 91tmgAE3ylthpOjcJfZQb8CfWrnDWMtLqCn0X3tunzGvIR1gA57aL5UKFownu5YoPxCR
 RdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mVo6QL2otSkWlz3BNGQoToVxXIroVXY+I539FhGuJc4=;
 b=E9dGZkY4z/RC3EsMC2rtrnMaMvMF4c+FT31pZDu/4JPB6rYVEyGDvEVQszoqLZU15a
 WNw+/ZToHGjtHKPrEM+A4MyOwyFXpLmINZJAKv4NLzzxFe0NH6xaHmDqcBvA/sALyJn5
 YlIZzoptBl8KQ8h2MAkrgUfLWZ0Aedyl3edYjGkx2C8tbzi9+Lb3llH8k04QkBKJjkGb
 lWotKVP6BOuuzacVyyhOeL81KgwOFAQoytkolGJ7tvcLlSkti1kCzcea9Zd4+yQEYkqP
 UZ6q+0WjEVbGXZpyxAK04YeSaf3tesbslZdjRLNAeZhp6QBBB+rd9LkGX2FkX/VqsNmu
 Pzcw==
X-Gm-Message-State: AOAM531fJXil1NL26D3QMEXoYkB+FGrSVyCSugXrX+XX7BxXLn5cRANH
 cfslltIdyWDnSIl1U+a1IS0925IfLR8=
X-Google-Smtp-Source: ABdhPJxj9fWPvQT7+wv8J9Cxf6JrAYRu4RsFoZU0mr2BIVBXMeWD8DaRSGY/7wWzNBMgKUBIBPivpA==
X-Received: by 2002:a5d:6301:: with SMTP id i1mr9969579wru.423.1630070597150; 
 Fri, 27 Aug 2021 06:23:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id 19sm11331098wmo.39.2021.08.27.06.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 03/25] tegra: Extract common buffer object allocation
 code
Date: Fri, 27 Aug 2021 15:22:43 +0200
Message-Id: <20210827132305.3572077-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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

From: Thierry Reding <treding@nvidia.com>

All of the buffer object allocation functions use the same boilerplate
code. Move that code into a separate function that can be reused.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index 94840ad42795..bf8e5c9213ca 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -101,6 +101,26 @@ drm_public void drm_tegra_close(struct drm_tegra *drm)
     free(drm);
 }
 
+static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
+                                               uint32_t handle,
+                                               uint32_t flags,
+                                               uint32_t size)
+{
+    struct drm_tegra_bo *bo;
+
+    bo = calloc(1, sizeof(*bo));
+    if (!bo)
+        return NULL;
+
+    atomic_set(&bo->ref, 1);
+    bo->handle = handle;
+    bo->flags = flags;
+    bo->size = size;
+    bo->drm = drm;
+
+    return bo;
+}
+
 drm_public int
 drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
                  uint32_t flags, uint32_t size)
@@ -112,15 +132,10 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || size == 0 || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, 0, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     memset(&args, 0, sizeof(args));
     args.flags = flags;
     args.size = size;
@@ -149,16 +164,10 @@ drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, handle, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->handle = handle;
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     *bop = bo;
 
     return 0;
-- 
2.32.0

