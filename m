Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED14B7410
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 18:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A7B10E589;
	Tue, 15 Feb 2022 17:23:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048110E476
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:23:06 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p9so22856946ejd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 09:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qIX7FVBidE4aZJBGdyF8LyeHRHn+kZJibtX9+6oe+Rk=;
 b=ha8gaOyI3o5P6rssko4lqEHg4hZxJUdZ08Lxhd8AljFLz4xsSb6eQyymbhPK1mQINo
 ybOwB6IarbqfG4e4/5TIz3AgP4Rs3Ql7jQ0lvu2PFDtWXT3+eXvBc2j8Ot3OECCslBnd
 sRYKpxfAIBHpiwbRpQt2w9i6UmUIGMT1CDw9lEWD9yrnX1A4d9trtEgtsyBExbi83Bsq
 Et2UqmHg3RvLZiBcyPf4Nqi06YkhR2P7e2kHGZMqXC4WtxejkrSVTLQmcHCAW/s5GvrM
 SjRvu/N1wepF5cAFkFmJ4ed0y+Tv8Dq3rAyavUmk8px5y+Txt4jBbfH2txsVKB/E+ucD
 H2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qIX7FVBidE4aZJBGdyF8LyeHRHn+kZJibtX9+6oe+Rk=;
 b=0UNX5cp7LUL9Ij1qRGUrVyRPwBbOyqQBh0xWQeXMbauT6gSaXYi7Lyh19lV7uArlbp
 tO+8xOm1EM0lyktPncNM3CzbjeY3z8Jf9tzABoGxVJUPWxFfYZ1z+PGOQqXe7A+E0HXT
 nJ0CiVmXrDfyeykfRV5YHmNtc+2q3RIR3oSVopGX3LNzGXyUFyo3gsB5baktP4vpD7kV
 C4AEmc2J/Sgz8+zslazjP0652HWZOBTrN1INuu9feTMATbdtENkkLkz+DXFVpamXeUpH
 8kfncq6Ws7pBtQRB9wh+MaaBUDM2a6jcMFjQJVBjLwQHxTHxz5ln0TSIUxBVEkVMLu5C
 jShw==
X-Gm-Message-State: AOAM533CIeYTqtkXykNKQ4CkiHwDNl+fPMSd3g3n9Sa3RlJqfsfomxB9
 DDF1A5QbTeUuxHhdnq46UzM=
X-Google-Smtp-Source: ABdhPJyPGiPyl1C6fHYvNcUZdTDLh9YKY7Bi86fNsDDQt5QxYemtLeKWe0M+Rhg3w6/m233F03z5yQ==
X-Received: by 2002:a17:906:7a43:: with SMTP id i3mr63481ejo.371.1644945785344; 
 Tue, 15 Feb 2022 09:23:05 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id 18sm3521310ejj.1.2022.02.15.09.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 09:23:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com,
	felix.kuehling@amd.com,
	daniel@ffwll.ch
Subject: [PATCH 4/6] drm/ttm: de-inline ttm_bo_pin/unpin
Date: Tue, 15 Feb 2022 18:22:57 +0100
Message-Id: <20220215172259.196645-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215172259.196645-1-christian.koenig@amd.com>
References: <20220215172259.196645-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those functions are going to become more complex, don't inline them any
more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 31 +++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_api.h | 30 ++----------------------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 11e698e3374c..ed28a4229885 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -634,6 +634,37 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 	return ret;
 }
 
+/**
+ * ttm_bo_pin - Pin the buffer object.
+ * @bo: The buffer object to pin
+ *
+ * Make sure the buffer is not evicted any more during memory pressure.
+ */
+void ttm_bo_pin(struct ttm_buffer_object *bo)
+{
+	dma_resv_assert_held(bo->base.resv);
+	WARN_ON_ONCE(!kref_read(&bo->kref));
+	++bo->pin_count;
+}
+EXPORT_SYMBOL(ttm_bo_pin);
+
+/**
+ * ttm_bo_unpin - Unpin the buffer object.
+ * @bo: The buffer object to unpin
+ *
+ * Allows the buffer object to be evicted again during memory pressure.
+ */
+void ttm_bo_unpin(struct ttm_buffer_object *bo)
+{
+	dma_resv_assert_held(bo->base.resv);
+	WARN_ON_ONCE(!kref_read(&bo->kref));
+	if (bo->pin_count)
+		--bo->pin_count;
+	else
+		WARN_ON_ONCE(true);
+}
+EXPORT_SYMBOL(ttm_bo_unpin);
+
 /*
  * Add the last move fence to the BO and reserve a new shared slot. We only use
  * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 3da77fc54552..885b7698fd65 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -524,34 +524,8 @@ ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
 int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		   gfp_t gfp_flags);
 
-/**
- * ttm_bo_pin - Pin the buffer object.
- * @bo: The buffer object to pin
- *
- * Make sure the buffer is not evicted any more during memory pressure.
- */
-static inline void ttm_bo_pin(struct ttm_buffer_object *bo)
-{
-	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
-	++bo->pin_count;
-}
-
-/**
- * ttm_bo_unpin - Unpin the buffer object.
- * @bo: The buffer object to unpin
- *
- * Allows the buffer object to be evicted again during memory pressure.
- */
-static inline void ttm_bo_unpin(struct ttm_buffer_object *bo)
-{
-	dma_resv_assert_held(bo->base.resv);
-	WARN_ON_ONCE(!kref_read(&bo->kref));
-	if (bo->pin_count)
-		--bo->pin_count;
-	else
-		WARN_ON_ONCE(true);
-}
+void ttm_bo_pin(struct ttm_buffer_object *bo);
+void ttm_bo_unpin(struct ttm_buffer_object *bo);
 
 int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ttm_resource_manager *man,
-- 
2.25.1

