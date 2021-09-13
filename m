Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E1408C4B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3325E6E1A3;
	Mon, 13 Sep 2021 13:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F28D6E193;
 Mon, 13 Sep 2021 13:17:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t8so9615258wrq.4;
 Mon, 13 Sep 2021 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXwMb5OzeQZCq2ep7DQI78NOviskj8HdDAhnVXfOFMU=;
 b=LQIuxs2NluvtAbILKztkthcoLKkqD6fyLabolUUj647rumDSoPZx0BeMEvboQ+otzy
 BJWXRJbhsrllWKo8MHY+kg0rQV6ZQz1jBoo4flqC+Jf12xv7pvy9hBZeVBStFeSM0OEl
 vSCO6Pb1oowtrRQI7Oc49+ul3KFm8QsBr7MeMFSWWLmxd/xrqtwK+AA6U9IkVMkm7JfP
 xpKxgXLPHIGnosFmvOPCa2ZzDdq/26DoXKxqZ7Qfb5/6XQRBoPqqbcezehbE1vtdXyMq
 56wSMp66QCJ03AA4sGtZU3tHVWz7BK/HJBLJ4HZq8xQvLF6rOg35EdEnSOVzy67ANWOU
 OT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXwMb5OzeQZCq2ep7DQI78NOviskj8HdDAhnVXfOFMU=;
 b=y1Q+BPk16aQAEPLOw9uj8rGPXk4Ld8B+8c5Oog2tOvfxbwCZVHz5w+ellwQAyhGVHQ
 kvnHIqb7Boz72yo0j29SGAriUI2oIGNyI5b2tv9JhKjsn0ytZpKEwMEENHXtsJ0GSmsF
 5ta6ZhI72HztE/5OT0ODWbaJxVWJwXiukALuuRumRlyNlhxzUdySyDQ9QTmHPsMtvjlV
 Pvw0o054Av0gEA8Vg0nmKSwZcD63b/6k88f9cmle7B8iXjPK4HRYU0K1ry3mQgXK1IpP
 8eyYhtDchjY+eZbgHqP13qbFWkYHd9pSoYBcgAyASwj7okpBdapn0B0dER3ixj66ehxC
 pzjg==
X-Gm-Message-State: AOAM531n8/xgTUBCVHZPD+xR0MeKgOmCDaXBXKk0yIb3+N5xSFT+UNcR
 2e2Ir/gFMaoQxXTBCfThGRIiNb1wNcD2aLoR
X-Google-Smtp-Source: ABdhPJx5SFCa5irhc3GPkkSApCKQ8UhOmfrRvH0dWTDeu8jsU/lOtQoYl+gw39TN1DoV0crmMql88A==
X-Received: by 2002:a5d:4b50:: with SMTP id w16mr12487586wrs.71.1631539039806; 
 Mon, 13 Sep 2021 06:17:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 05/26] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Mon, 13 Sep 2021 15:16:46 +0200
Message-Id: <20210913131707.45639-6-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 64 +++++---------------------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0a0e3ee62648..3ce929b770ea 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -571,74 +571,24 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
 	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
+	dma_resv_for_each_fence_unlocked(obj, &cursor, wait_all, fence) {
+		rcu_read_unlock();
 
-		if (dma_fence_is_signaled(fence)) {
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
 			dma_fence_put(fence);
-			fence = NULL;
+			return ret;
 		}
 
-	} else {
-		fence = NULL;
-	}
-
-	if (wait_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-
-		if (fobj)
-			shared_count = fobj->shared_count;
-
-		for (i = 0; !fence && i < shared_count; ++i) {
-			struct dma_fence *lfence;
-
-			lfence = rcu_dereference(fobj->shared[i]);
-			if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				     &lfence->flags))
-				continue;
-
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
-
-			fence = lfence;
-			break;
-		}
+		rcu_read_lock();
 	}
-
 	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
 
-		ret = dma_fence_wait_timeout(fence, intr, ret);
-		dma_fence_put(fence);
-		if (ret > 0 && wait_all && (i + 1 < shared_count))
-			goto retry;
-	}
 	return ret;
-
-unlock_retry:
-	rcu_read_unlock();
-	goto retry;
 }
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
-- 
2.25.1

