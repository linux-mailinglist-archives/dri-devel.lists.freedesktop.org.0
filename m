Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B214E408C5D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1941E6EC99;
	Mon, 13 Sep 2021 13:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E536EABA;
 Mon, 13 Sep 2021 13:17:37 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q26so14650054wrc.7;
 Mon, 13 Sep 2021 06:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yu+uANfSVtr9RYJDKCjIWM/agN/tBH1C9/EMJmqSKvI=;
 b=a+/bhKH0jW9epgYrHnpIdEsBMYm0jm1t0FDhEk9F7lXVcqgduaiSs+VnX8Np9p6AcU
 JvuZPm1F3lpM1dMVEcXSpeFaAeku0FYps9n7Zy7LIlAAr3rKIkLqgy/E46+CCIIFOu1+
 QChFR2z6JMS22sm5OdOYt834Y6HQXYt3z5k/Cnw1a0peu3zrKNoZNVrL4Mffaq/NFdu+
 7HXic7NNPAnaHDW5uTwUKceMM0UZGBcoyMsuTaYTrpxtRkVHg+xV5Xw8L69xuBtzQJQU
 rmKt57SYv1S5LrZETWQCTrp1s3m6ifWTysLqX+8BZwUoUYFc5Oc67bBx+18SUEspN+xo
 XcaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yu+uANfSVtr9RYJDKCjIWM/agN/tBH1C9/EMJmqSKvI=;
 b=WY+m7DFJYkH7hqwe4ltbZMNPe9fJ4R4bnKIf0wXe0jruv53o8AaS9is0u/3K52dTX6
 P8DPylYQvgQS4uLP0PngmWqu5r4u+Tp0LQApetTX2AA4DOybzoRxwRuXKZ8nt9zbxpUn
 e9uQ5Cx17B/nGRGKK50vYgyrcEtr+SVid+B4ME/7ikjd7Oza9fkeKcz2bO3bmM5E6Uof
 3cMmiDkSQbiyHKnGydqXOYIFaVeU/eG5sKpr8jqDbDi/CnxJvS7/xCxgxRsGtiM8Wen9
 9cPPdTMcJ/apR9M4FY+cBzbyUIBACO2s26fZYm2Renojb3lmOs3fQ9/v5B5Cpfq65ihw
 xbrQ==
X-Gm-Message-State: AOAM533Qkr/bGDwty9shhzmmckrduX7OZPuNU1HZoU/ePR5ca1UtL7hv
 U15KPT00vYOIA3DNupYZBJM=
X-Google-Smtp-Source: ABdhPJydXs0asWZpyrRJrMmjsSDul5X8jlQvC2GehIIYBg8yV+HU7Q1UFpMBJjKJ4JU1wkLZ+baPQA==
X-Received: by 2002:a5d:47a4:: with SMTP id 4mr12693618wrb.329.1631539055735; 
 Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 18/26] drm/i915: use new iterator in
 i915_gem_object_last_write_engine
Date: Mon, 13 Sep 2021 15:16:59 +0200
Message-Id: <20210913131707.45639-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index e9eecebf5c9d..3343922af4d6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -500,16 +500,15 @@ static inline struct intel_engine_cs *
 i915_gem_object_last_write_engine(struct drm_i915_gem_object *obj)
 {
 	struct intel_engine_cs *engine = NULL;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 
-	rcu_read_lock();
-	fence = dma_resv_get_excl_unlocked(obj->base.resv);
-	rcu_read_unlock();
-
-	if (fence && dma_fence_is_i915(fence) && !dma_fence_is_signaled(fence))
-		engine = to_request(fence)->engine;
-	dma_fence_put(fence);
-
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, false,
+					 fence) {
+		if (fence && dma_fence_is_i915(fence) &&
+		    !dma_fence_is_signaled(fence))
+			engine = to_request(fence)->engine;
+	}
 	return engine;
 }
 
-- 
2.25.1

