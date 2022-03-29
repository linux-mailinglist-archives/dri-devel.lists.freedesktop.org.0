Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186254EABD3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F8410EFF3;
	Tue, 29 Mar 2022 11:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C313E10EFEE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a8so34205289ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ccwzl2Xbf81FB+uc38jTDrFIfxjE2p8x4F93JCBC8w0=;
 b=YlUOL+MFJE5bT0OtFoQQUc8c5Jd4n4vwxrWFImjfC0k76jYQlcJV+mt25r4R7dQtyG
 XLDHnDsb0fOyEGyT9qCL2zfOjF6z93pHO5gXNFA7SnbCs1h3UxjMQ9mWUyLUx9rvBS6U
 ZG3ITa+f0NunF18nfjoLAeKK5q/qsNpUSENyrdbkbK70HuGz4ZdiWMVmMFw5FxUKtnyv
 alQ8iJUtOwHkhUMrJFbx0JNF9u/xnUj0EjW63nDpQ4XJMiuINexC1WunT17vGItRXeaP
 fK1ES6g/VMKqCcnuZp4YrM/dNpBKRlDyKtU0jzWL1Ddo8riXQHjHb3BSoCdfEc7CElJW
 6fKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ccwzl2Xbf81FB+uc38jTDrFIfxjE2p8x4F93JCBC8w0=;
 b=469N+Agz99bM9J8Xo5iaGSp+lmHMi1aU4ZadcXWbvAra+8Uv/7ogyHJqF+0nkFTPhx
 l5QxXL5zXNdcFiQIPQGJb8jJ17m1sur8B2omBVQ9KnSj2IQW7pUhp3DNyFoAF7kma1vi
 PHhG2/1s/tkV+KH7xhg+VytrssaLcqL8UUpTzmL75ZX5e9FJYduBpqy5qgJNlY7M5X2Y
 yQ8WULGFfEIPgsckVJ+Pb1DS+RUatSJiNAZca5U1myPHlvAoTRLxf4pvY4GeNxDtD9Ps
 UrlgQuM/nBuU1i9tdPxfDeOGoIIZr0OxeNzTVXfoVtyMAJNtJPjFS+lAER21sBU68iBq
 VfKg==
X-Gm-Message-State: AOAM533q7D0CyDn/vxBsi9/EPIQG5+B74JSQyycvZoxBL8ePPTD3sqGW
 RW/+gr11l0/X2/dRbBRzZD/vx2tKnVE=
X-Google-Smtp-Source: ABdhPJxnlRf0Vg31LJhAmvR/Lh3+e82VkWs/KqLo9Jdeupqeomiy2Dr4KsKpa+ixhgIZpmyuzjSuUg==
X-Received: by 2002:a17:907:6d82:b0:6d6:da31:e542 with SMTP id
 sb2-20020a1709076d8200b006d6da31e542mr32601936ejc.135.1648551773322; 
 Tue, 29 Mar 2022 04:02:53 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm/ttm: move default BO destructor into VMWGFX
Date: Tue, 29 Mar 2022 13:02:36 +0200
Message-Id: <20220329110243.6335-5-christian.koenig@amd.com>
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

It's the only driver using this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c       |  9 +--------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index e5fd0f2c0299..7598d59423bf 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -44,12 +44,6 @@
 
 #include "ttm_module.h"
 
-/* default destructor */
-static void ttm_bo_default_destroy(struct ttm_buffer_object *bo)
-{
-	kfree(bo);
-}
-
 static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 					struct ttm_placement *placement)
 {
@@ -938,8 +932,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bool locked;
 	int ret;
 
-	bo->destroy = destroy ? destroy : ttm_bo_default_destroy;
-
+	bo->destroy = destroy;
 	kref_init(&bo->kref);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 31aecc46624b..60dcc6a75248 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -378,6 +378,12 @@ void vmw_bo_bo_free(struct ttm_buffer_object *bo)
 	kfree(vmw_bo);
 }
 
+/* default destructor */
+static void vmw_bo_default_destroy(struct ttm_buffer_object *bo)
+{
+	kfree(bo);
+}
+
 /**
  * vmw_bo_create_kernel - Create a pinned BO for internal kernel use.
  *
@@ -410,7 +416,7 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 
 	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
 				   ttm_bo_type_kernel, placement, 0,
-				   &ctx, NULL, NULL, NULL);
+				   &ctx, NULL, NULL, vmw_bo_default_destroy);
 	if (unlikely(ret))
 		goto error_free;
 
@@ -439,6 +445,9 @@ int vmw_bo_create(struct vmw_private *vmw,
 		return -ENOMEM;
 	}
 
+	if (!bo_free)
+		bo_free = vmw_bo_default_destroy;
+
 	ret = vmw_bo_init(vmw, *p_bo, size,
 			  placement, interruptible, pin,
 			  bo_free);
-- 
2.25.1

