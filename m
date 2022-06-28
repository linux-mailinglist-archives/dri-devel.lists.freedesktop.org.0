Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6D55F1E7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 01:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D0410F3F4;
	Tue, 28 Jun 2022 23:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1CE10ECDB;
 Tue, 28 Jun 2022 23:35:04 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so8807668pji.4; 
 Tue, 28 Jun 2022 16:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaT+UkiJ0ehVxWBX9B2xr4KFs7OszTBK9ROkHufIgOI=;
 b=KvgMfYwW6bO55xcTYS78EXDK4KyhYC0I79n7UFAiv2oN71X3dozvuw4IO/4buB8v+z
 jSY4/vmjn/YWkv1VA0fXbnAQ8lEnx7tzxW+7HBn965F1o0tFf5ZUvFesbqT0vQkbyfgC
 tBJUb8I3ZgWgRaKe7sHMwsCO7UKVz5NBGCP73L5pYPad6ZFcBPaMAa3U+LlTj6OIzvWI
 bJDParRTOMiCxmQC/w6Yo/mcsNeG4HsKfL/T8MMbsRZJ52L2/7BtP2kOoIWVgQpqyp+n
 pIN38FzDT4JnIUsO7w0zTxMFLJrnM+3J9CmsMpmTG//BhE//lVAi77BucSPj6qKp6qYu
 de8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vaT+UkiJ0ehVxWBX9B2xr4KFs7OszTBK9ROkHufIgOI=;
 b=MQDrAghWlTNNkHWF94kthriwL+KlCUg+WusA5o5EkoTADGttJwFPwxJUJpPoPpEUaR
 4N7fX30t94rXwoD5S5Tp1o8ooKQhze+w2ggwlJV5AqfpVwy06GlWqw7VFCD/YcDjQPdJ
 b5h+gOpF2BUOLBsb/JBCaRfkrdzdOWDkF5p+Judhyl+1yL6SLqTmsOUvKzz8+Hv4BIVt
 FiN115T9/kbWrlSKKsrT0vHb8UQWzJ81p+SX5cbbFH6U2Ze+0y57t+Ah3LLrGQIpXgUR
 RGrYaLUnUSIZqnDJtVmObgonfxvYO5BR7TUIgp5PkwgvQXkWNjdxCxcNxMFOLnGm9z8s
 CIdg==
X-Gm-Message-State: AJIora/tF6RjdcZqyMYu4dvWaELCIYEqwYcHWLHI9gM9mMc4Vo9WqQ/9
 m48XdcwsWE89sgSyBhL85gwfzq6IRnOmjg==
X-Google-Smtp-Source: AGRyM1sEQP7f8OdcQ+NHqVS+ZsMay7AZxS/jUEG5b2E5pTElpDRfM9aO52b21oP6lqw8UgauG19pog==
X-Received: by 2002:a17:903:1208:b0:16b:81f6:e992 with SMTP id
 l8-20020a170903120800b0016b81f6e992mr7409363plh.55.1656459303698; 
 Tue, 28 Jun 2022 16:35:03 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a17090ad48c00b001e2ebcce5d5sm442323pju.37.2022.06.28.16.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 16:35:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove __dma_fence_is_chain()
Date: Tue, 28 Jun 2022 16:35:07 -0700
Message-Id: <20220628233512.439555-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

drive-by cleanup

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 319936f91ac5..667841780514 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -73,11 +73,6 @@ static void fence_set_priority(struct dma_fence *fence,
 	rcu_read_unlock();
 }
 
-static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
-{
-	return fence->ops == &dma_fence_chain_ops;
-}
-
 void i915_gem_fence_wait_priority(struct dma_fence *fence,
 				  const struct i915_sched_attr *attr)
 {
@@ -93,7 +88,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
 
 		for (i = 0; i < array->num_fences; i++)
 			fence_set_priority(array->fences[i], attr);
-	} else if (__dma_fence_is_chain(fence)) {
+	} else if (dma_fence_is_chain(fence)) {
 		struct dma_fence *iter;
 
 		/* The chain is ordered; if we boost the last, we boost all */
-- 
2.36.1

