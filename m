Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80D40F7D4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823706EC65;
	Fri, 17 Sep 2021 12:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63716EC50;
 Fri, 17 Sep 2021 12:35:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f62-20020a1c1f41000000b0030b42643f72so1776919wmf.3; 
 Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPSU1DXFCGE7WDMspzajAb5+e08n2RYsOOJEReWtL6U=;
 b=G7GZR/a3uftoZUOQE1c5/xOo1bxgEpGvghaVs/z0MIKYtjDRjokQ7n9avxKHenfJmP
 QJpAsdMHxHBym8ybMepqG99FkHP3tRqLVtRAzRFUZBypbd+VXJUStpFWHbDo5iiVCgn3
 Pbvps5yJ8rmr9efaFRBWkvaz8BarNd/aexogI9NPT7fHt/P6Dyl16sGMXHbZKkPWhT1L
 qFMnnDBkaCb+iz+HInXNKlKtuO9s1Apg9hXVe07nLBnntrGUmKflElYKOw7/qyMdOOOa
 r16gh0Q625ASoLJMdrsIWYI8ud+9xFbYuUCCUqSU9RwfLAo9dQiRgQb5UNk7i6huNurb
 cjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPSU1DXFCGE7WDMspzajAb5+e08n2RYsOOJEReWtL6U=;
 b=xQKSksIxyYOHG83y5KqXsdG1m4bq72jurys9ZR2tdMG8QkiCExA5B+gzQbt8pLu2Xd
 ZpGeFwyf7YFudK9LHYcwkera3u/vppUVMhh24e3vsnOrt2iQQrxl8aCJu+EvnkwqcSBu
 dCU7wTWgZYF7m72Cc0LFVADj2KPOwowBL18hy8nmhca95UYKAGZB7DGhS5B4X4J8hvff
 DZfGjFlQPXQh+y63VqxuQLJvZ648Lb2C17TbBOlDRH0ZQSL9mfOJDuPlTENS7E3FbD4n
 QW5iv/Njo+tJzw2GHbhOKFVjTLCAA7otLxds7yb3aSPfI40CBV78EK3VhKgmKJ07t4Uq
 b4BA==
X-Gm-Message-State: AOAM53135ztaosFo3Uw6/uWI0VurAoPU6RLBCzi11YtpILZF4nSD7OEY
 UNRTddOyPk+HvF3GrABI1e8=
X-Google-Smtp-Source: ABdhPJyYZOZM3qHZmzmJADXhbU1qBTWv4kCQvYb25PVLMl4AWhnK4e6h1RUh9Oi/FX1k49dfTAyXWQ==
X-Received: by 2002:a7b:cbc4:: with SMTP id n4mr15128737wmi.93.1631882131496; 
 Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine v2
Date: Fri, 17 Sep 2021 14:35:05 +0200
Message-Id: <20210917123513.1106-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

This is maybe even a fix since the RCU usage here looks incorrect.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 48112b9d76df..487329a96e92 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -507,16 +507,18 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
 	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
+	dma_resv_iter_begin(&cursor, obj->base.resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
 	return engine;
 }
 
-- 
2.25.1

