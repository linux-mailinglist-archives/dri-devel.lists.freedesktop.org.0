Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B12640F7A2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124DF6EC48;
	Fri, 17 Sep 2021 12:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B16EC53;
 Fri, 17 Sep 2021 12:35:30 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso9862095wmb.2; 
 Fri, 17 Sep 2021 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=PxG28CRq7SfLj/CUTWydHmk4006k5rR2IcS9TrqiJsXEYfqf0xRqgYbOeW61NOovrv
 TT+d2LzxSF+ISst7yiR14Ik1DX+RUFzk4hPUgnow2ooP8xHIGy9oZi+r0N3wCnfi9Z0u
 eiddWPTKbHGqQJ29/9ocVpZI/qq/0Xg+ZaYRJjLfjUwfY2IeRb9gbQQat6SKPVfph3m7
 jXqA/NmXccNQ98ql6Aqjpi8JrfqtJle+nhYoo7/m/eIX1t4jfTr+/Xo0pOt4wW82SSvp
 xbpVhyDrY5kZzBIgOJfaSLP/EJncnSc0KGjo/CQnWtDK32674h6MrGnN0Fi/vaa6FvDT
 fk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=YypMXEljMoLGMBYKJUm3Q+dLWHYaDNYbKccLwlV9NuT7HkdhElAlhlMFYnKqWtUfde
 aI71r01u43VgPWxReGC94ne1xJ4uu8/Z0jX6+2uFP4irdQ/lTCC1T1YdBRb126yE95WR
 g/mzqwp55tu4zsTFkAdmIDV8aHXxmmrsg0uFu9mXF3T7hw9tN29MY5B/wD+puHwrluc6
 Qa8rlhaBJbjaKN5xcok1e+0dPt4hQNlQv+g4KUWJZgC3EfjwVaGLNoQdtzx6FWs2oMmg
 i+BDhMbu4/MCV7mxJJWfNnM8rmjc+IxU7E6SEzgC33FAMnRgOICgOuFWCHNcueun0OF2
 59WA==
X-Gm-Message-State: AOAM5334kNNINt3LzvD7HNZDI5OyXbljb9ugDZ/S3AP7ScYTDqRvfBQU
 psMSMUjzqgUkyK8c+NW7ieE=
X-Google-Smtp-Source: ABdhPJysDKC6VyP5ngCiTm1WvJqQsy1dzDim5DxuE39e6K262Xtj1qJmz5tuTO2Pa0VzjGCm33oxGg==
X-Received: by 2002:a1c:2289:: with SMTP id
 i131mr14845111wmi.113.1631882128987; 
 Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Fri, 17 Sep 2021 14:35:02 +0200
Message-Id: <20210917123513.1106-16-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

