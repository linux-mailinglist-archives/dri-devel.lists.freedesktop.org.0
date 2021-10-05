Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18D6422554
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D016EB6D;
	Tue,  5 Oct 2021 11:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ECD6EB5C;
 Tue,  5 Oct 2021 11:38:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso2645052wms.3; 
 Tue, 05 Oct 2021 04:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=e4mi27Oq3YlVEcrneTSljO0iFxdWD6NSy7KfjN6JQzzLGENydQHNaD5ZXlQNS57HXg
 V6z+uw0e0WrbV6rjdUVYQ1M3TZiMjwZMhAhjobIbwwweFSgEYjaLcoaVRp1L7qfsgkhx
 pHuB/6uOZNkks6QAEIKvILbDhp9bZ2a1bzk1ZHDeAjkpfO+UEAYayUqsMxyZ6vMZERDW
 U6+s+HZwqPFEhr+hCCx8eWYBtMD0yLyGaCxdH+UlZZkePyis8FO3AGhEqsypTsfJB7ys
 HiOciUOxMqeoI+29d1rYnMnm3gLDtMsNw4nwwEwx3422rr1jLyzstXRF5n3smYVo49lr
 g9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=b0G3ceFgUjM79M/fNBzyEzRHahhv/yxo/hClLAuqvlLIQ2Z6DzOI6iPxtskerV4vnE
 jQfCpbTH+tSVD4EANNamPm0OZeiA5dpQXFw/Zlcx+3/1E+Ll1Rdsi/mqjIIgJJN2Pl6R
 DOdqHIqD/YOaXoA6mpWTXf9LOn+dGkLVU3EkBJUGXwzgrzCIeUc+Pko9VXPouM22pgjv
 IdYY4fzd4Z/p0q0pxGZanQHXfXyWSfrmpZM6AU8L7BuFyFHLMth5EURfI2ICAEva0ONH
 s2T1cDyZ8XB4i2zG6iHGJenVix95rtrmtBJQGtqdRYvfV3DZYfgfJsC9T2Ub6EOPDYcP
 LnTg==
X-Gm-Message-State: AOAM530wmfUKvzHg9FDqSvWUX17PNKcI50zAUl8lZiyf0x4JFQIK2rNF
 dUiJ/YK9N0dwyiVayrebKY4=
X-Google-Smtp-Source: ABdhPJyslNVLhU/j3RKfrcNX0BbLvueb4NTsL8tx8+qiCeSNd6VOcfLk+ssWP2IJh2hj44goc3yijg==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr2861064wml.41.1633433882153; 
 Tue, 05 Oct 2021 04:38:02 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:38:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 19/28] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Tue,  5 Oct 2021 13:37:33 +0200
Message-Id: <20211005113742.1101-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

