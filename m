Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008140D8CF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281188E84;
	Thu, 16 Sep 2021 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74536ECE7;
 Thu, 16 Sep 2021 11:31:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t8so1934631wri.1;
 Thu, 16 Sep 2021 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YnWvdXxqHgtmxN+angscxrScd7gs7Wadba51xLqnh8c=;
 b=ZbIjs3A0ol2lDS+YQJ63Dd6wEcgQGUklh2TgGcGARe6MZLf5E3BJL1Q1XNo7+gzHUw
 6G7qBU2xqjfJK6Y7IC+zG8J9Hla2MW/dphAfH+pfaiFf8qF/QNp9kQ2vvzmoIUAEnbm1
 B6kH4ea11pDHrKNScs0IN4e3UuYt9PR1vPJ1KlNCxugZMcaUF7Com2VhSQ/t169aCrHO
 JZzpqTRTQ8r9CorhtLTvInAE7OIW1ofe+ncZXHsDlhDeEAEKDDl8E3INeIVUdPQo0GqQ
 3QekC9peTt2XK++WLl98bZndQMKKaWIAAtJs/vspe/yWK6CKNZ4n4hQ6Iqs3BIRX1LWn
 3z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YnWvdXxqHgtmxN+angscxrScd7gs7Wadba51xLqnh8c=;
 b=G5fehWDsTRyKfn0p6zXDMSW91n3YuyV1Dp2L1DIM+8nLR8q8BrIW9lWRGT+riXL3U/
 TTvnpMlnsVow3RzBOcGQXafm5rIfccL1rnMmBTt7c/f33Jwz/xMfAviPXKyI2G37IaU5
 kHcvFm8CTx9+z0+CxIpcgW1AXM0SNIxHQ9DyumGegxFmWlEZ4KBuCrXUuV3Q/75mWrVL
 3Pac6F6sAtNjjsDoQtZMmiJdZ575ZS9p0psA7oiT6pCwipvZFOmZD4+vrKWyPL6bNb9B
 ZSLe9djsVZRIOhXPisJnI+VoT1JOsFpJy+nN/8usC0ZstQgyHnxg0aY5Z0SPwk2L7kkY
 Pvcg==
X-Gm-Message-State: AOAM533CEl2JHhfqbDT6fqOVUMPnpWXWPzPcGX/AK6QXWkBuTKLr3bvp
 sFYXnoRAxb4H8E6zYB4Ft+Y=
X-Google-Smtp-Source: ABdhPJw7Pw8Jd6budWz34hzE3bfaQgHcni7ZD1vc1X0EsnbfmW213d/RBb7GiMDjO5iklVt7hu2yvA==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr5509070wro.418.1631791859320; 
 Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/26] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Thu, 16 Sep 2021 13:30:31 +0200
Message-Id: <20210916113042.3631-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/i915_request.c | 40 ++++++++---------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..221df2edcf02 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,39 +1509,21 @@ i915_request_await_object(struct i915_request *to,
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
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, write, fence) {
+		rcu_read_unlock();
+		ret = i915_request_await_dma_fence(to, fence);
+		rcu_read_lock();
+		if (ret) {
+			dma_fence_put(fence);
+			break;
 		}
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
 	}
+	rcu_read_unlock();
 
 	return ret;
 }
-- 
2.25.1

