Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2A41EA86
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237D6EDD3;
	Fri,  1 Oct 2021 10:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803416EDDA;
 Fri,  1 Oct 2021 10:06:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d6so14550151wrc.11;
 Fri, 01 Oct 2021 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=BP6jRFQE6j4XrQH1SqYs4MKpf087zibEfrPSq4Yl8tJ6hUX1Ct8GXdHKSdGUctrhzh
 MCea6G8WbuliBoevLNWxXBhVNzlhG2fB8TysQ0cz+JfdOUNjAHSFtknVTzVLnzXbNIrM
 RJDLwKb7N7t0O42P4/jYaZhwS7L6jGYoqgNLG4KXhMjl1BMQ5dNJ53PFlPZ8UH1D7x/V
 b5wgjp0a/CSZvGmOUZ7r4lnSgUdFysONd3bqENiql/yc76UMLPs6yWx1kCY6xZYKWsoc
 S+X/uiLbvXDSgVKviXTmawH8Q6LDskU/tJu/MnrL459scjRVUXqQuN4zsoiS29dOKwYT
 zb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=mlD+lNhMHTiLJdtV3K2t5CDCTDzcI8w63P7k5vVBF1CIzXdcoCrCwPqzcGkJUQLeqF
 pc6MMlZi2b1zy8w8xbnLsaa9rdi8zr4PPXU3cW/PNoDmyKhsi0lFmSWT9CVT9pqeX8KD
 POFyP7pgB8UOwUP01be1LtMfD7Q4PK85GhU1B2s2Gg7T622n38wQ80ZL4oQX09oQ5kW1
 0bas2c2VJgPZIMsvEDw7PeJ9htAA1LuJagZUh6Azl6GS/wzazMNETt5nnE5bc/FoK218
 XpiKj5VqCasV9Y7wvBVHjL2qeGHitR3d2NoY0jBxQeHI4n3812j/iUk0l6AWnjKROT2u
 4yXw==
X-Gm-Message-State: AOAM531UOSAZ63wv3dJRmgivEHzK0XQN45F/lF2n6dV/lI2Uumkn1ZWO
 DmM/4gO7qnxjAEleg59AuZk=
X-Google-Smtp-Source: ABdhPJxfUTaPbuI7VagQKKHsUlhxfQWHViZmyo/qnbH0HU/kn19HyeiJwQKHXYxtIJ5amoCPz2Lb6Q==
X-Received: by 2002:a5d:6ace:: with SMTP id u14mr11639570wrw.206.1633082789927; 
 Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/28] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Fri,  1 Oct 2021 12:06:01 +0200
Message-Id: <20211001100610.2899-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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

