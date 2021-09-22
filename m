Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAE4144C4
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03126EB3F;
	Wed, 22 Sep 2021 09:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0176EB27;
 Wed, 22 Sep 2021 09:11:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i23so4766254wrb.2;
 Wed, 22 Sep 2021 02:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=pBrLo2ylFHnmgwC9Fv66FBGPDQvt0AVgsUNeIjzsju8Mir0zM4NILqjJFDk1sFN38q
 SPm76dym7XGK0ATzGVAsOPUYs1h5LgGxsuPmxX3uxA8gNqM1b5IhiRkfmgOYWArv0qJJ
 Z8XBguoc6rgyEY5mYq5B44bR21z4Fk4REE+Mjx7VGZXRxDuUeHGMH909Crq3ISebnASv
 ZN/HDeWVczA+5w5FVAjdb4J+Dy+Q/a2G3rQGMrVctnaj9KLrwRUF1ahJTN+iJUudQuAB
 Mk3fxtusbMfFmO+sn21XH0JdEjssw7xP5IEfsvoeQQs3P9ATsnMHy1pmHKH/gfnQt0vs
 t4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPdZK7BIOkQEWY2TG92V49o75qXMdIlfGURkWq4Gvi0=;
 b=6eNK+AX1oE+S2lOiic00WwuVIRBZ08o7bX3M6dOWteqPpKvC4d9rKp0kDhcAkPfSYW
 9/QMBFeR8M2Rp0qDkaU5WLpsnmM2UbAZwNNF8EuwlsQL8TFycd6XK5prNfSZXNN2mgwb
 gTAv+LS6AbXDv09G6kFu5S7zpPRaKsS1wx+bRuv48ECgACuDWsNgi9A4EnRuH+rxX3QZ
 j63+gYSAaC1K/pBTAWmgvJUsCLNJ9Z6IqFdJ2DKc/QBe9PpO6dPr5qXYhDgp+5G02fVO
 XZb89bwRgv/kod8TMFgg/mKryvxHH5beCLZW3ainpq3apU9gtUz6r9Nl9eVAOZNf0uXT
 Htag==
X-Gm-Message-State: AOAM532NR2FDygbX8ymBgTx98duJVZaTL1KG6iL68E++8aT67p0FZ3BX
 Cm/A474MsnoB7sijQUhA+1k=
X-Google-Smtp-Source: ABdhPJxnBNxiNE8nNtZqI258Uzz8x6CGbJOiAaLC1lAoINYI5ojiHVW3S8gxEOHPpOK52+GCRqmrDg==
X-Received: by 2002:adf:e408:: with SMTP id g8mr40698543wrm.138.1632301861906; 
 Wed, 22 Sep 2021 02:11:01 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Wed, 22 Sep 2021 11:10:33 +0200
Message-Id: <20210922091044.2612-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

