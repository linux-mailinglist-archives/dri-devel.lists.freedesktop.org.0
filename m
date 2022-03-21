Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EF14E2777
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6065D10E2C4;
	Mon, 21 Mar 2022 13:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1B10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:26:08 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h23so20073917wrb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wggrCaYo7rB+cgkWQ5u8FNKHnRfIlb2egtWxUkHOQsg=;
 b=mgRmLm/xTdeGLhfmGbhh4FPjc0c4f8en01z2nfoywhM5BU/jpZ624xkV5k85J+mo0m
 3BpM/HiJtsZK7LAZs4y5fgie4GlpnC9Knzugb3+8sTmn+1Mb+/lTomypJH2uFPFlcX2/
 TeAaOu1nQblGIDQOAd/Kutj4O7bl6L6ApngCxbCDgtaUccbdnLvEHoHQG+aMkHXvd4La
 CTPqm4EV4c9D+Qoxav7asRkVSzM1p1wtgiolUrmrXxjAZ1YdfJr5yh/0jQIQ80uBtLqw
 8qFrFjQPpgOIJxVZit1WO+j7R2upbqgTIQWwW/xkiWTgXGp5tunjMhxIZ0WsJ6s6nIAe
 XRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wggrCaYo7rB+cgkWQ5u8FNKHnRfIlb2egtWxUkHOQsg=;
 b=Rw+5bNahK0QehwRU9PfhLX4tiQE5AkvHFxzPu+qaY38qxU7sB0JyRg6EiceLAUDARV
 aUZR/ptdwsWtbkZakIBaMn2YoWOGu7uMaRUiRqWoatMm2BzXvEaNdwh5vi5hNRHotY4R
 NkN0fkaZ5kFliRHoDVvA19Li8ZGWHW/IQLOvJX5Ca3WtPxmYl9rZLvv9qYipvlHOedJ1
 WrOTwlVlFEagJAxhoS/RuiICsjHxLphRUqxui660TO3vJBd4uM0h2Ej0bonCIhqyjwyg
 xIEElu9c/kCHE7smqTiubZlQZ3fUrLz4gtJ/tySJAO5XLICrIdwu+1WjFVy6PJ5pVp01
 rxoA==
X-Gm-Message-State: AOAM533hNesOgVJq6/ovSy7mrJugTSJh+4a8Jv718cvDj4w9EstK51/l
 77+fWOBZywHlK9udE7LAotjkLDMrqsI=
X-Google-Smtp-Source: ABdhPJz6S4ykPKO3oNUE0dV+FEtApKmzQSaKxxaGw8XbLQnRyVcw7h0apYdPw++pNZKetlNvUIJckw==
X-Received: by 2002:a05:6000:1841:b0:204:ebf:1181 with SMTP id
 c1-20020a056000184100b002040ebf1181mr5279106wri.681.1647869167092; 
 Mon, 21 Mar 2022 06:26:07 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1cf403000000b0037d1f4a2201sm13714494wma.21.2022.03.21.06.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:26:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, felix.kuehling@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/ttm: de-inline ttm_bo_pin/unpin
Date: Mon, 21 Mar 2022 14:25:59 +0100
Message-Id: <20220321132601.2161-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321132601.2161-1-christian.koenig@amd.com>
References: <20220321132601.2161-1-christian.koenig@amd.com>
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

Those functions are going to become more complex, don't inline them any
more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 31 +++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_bo_api.h | 30 ++----------------------------
 2 files changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b119af33e7d7..502617ee9303 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -633,6 +633,37 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
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

