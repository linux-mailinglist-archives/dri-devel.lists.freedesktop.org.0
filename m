Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E4641EA75
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2617B6EDB7;
	Fri,  1 Oct 2021 10:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1606EDAC;
 Fri,  1 Oct 2021 10:06:21 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso1049044wms.3; 
 Fri, 01 Oct 2021 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZyEDI8vSHJnpr1jQdm0wne+UPSjEKtih6sz0wcxBNk=;
 b=OYTh8vKmtrav14mFz8uIdkFtVVJHQhZYyQPeaXN5qFQHZ7/ULXl/4PxGUUzvj03DNI
 40e3/JxSh6SCcK6I11YGTftVpWLZv4yKuyXFKalqYAKqUiPVSEkQMB4v7KM4Gre77pO/
 7b3t5a86MLfWfoQq900zPJ/ePr4Qng5Akw3PC6W0S4TRqbpaCpA2Kx3WQArBQVDoRyCN
 7BklFre1m78aJ9sEqbiU2Y6bdBFJ7TW8Z1jZqYyXJ2fqOJrkSXNuMAE9JjBkHAWf2E87
 uLcvyiSml6I2qDS5EsDXkuKvowIXNfs6Aa+ppTvJRF3G52tUvSJuCVsf7GyjDqqjt8AL
 vpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZyEDI8vSHJnpr1jQdm0wne+UPSjEKtih6sz0wcxBNk=;
 b=IpVUh4wnDfQZP6ObOl3+gfq7Br9/c+/70orKZserQ9/9zTqOFbwwgXiv8b0JUZCfyH
 QIe1lh06CY7Nj6SoneMq3G6kk2A0YzIzzLEFnlsS+GVAGKsPHzn7bijD7T+gzdMuiay+
 91nVuNPx9Qic4kK7Bo18PSD/FAf5OnbDusP0PCf+KRIu/oCHXN0ph2uUIBWKZVHjP00U
 iYPFt84I5sjFLzNpTZEJ3ATaFqykDF8cGTN57diyKTRcSie6HeHyftcj0Y2GaJRn1smv
 8i1dMWPwdzReIt0TXIpXgJIzEWwO+0ND4rEu3L6RGWJ8Luxrt4iLJcw+ZWl2y4/BNJQa
 JODQ==
X-Gm-Message-State: AOAM532MTCzyjkyOXL+h3LSgaNvgCI+j4crkwCupUi+ZmlP+YMIb/URK
 QBa+Nf4E3L7iW0USKQcj9cw=
X-Google-Smtp-Source: ABdhPJzp/6YpInBjtTPgP5OEoDFJyzZkQNVa1ROWKLVSqv2qBL0iNks8TNepIeCpIrbwqPJhRvxQpw==
X-Received: by 2002:a05:600c:1d16:: with SMTP id
 l22mr3637600wms.44.1633082779853; 
 Fri, 01 Oct 2021 03:06:19 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 07/28] dma-buf: use new iterator in dma_resv_test_signaled
Date: Fri,  1 Oct 2021 12:05:49 +0200
Message-Id: <20211001100610.2899-8-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled elsewhere.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 57 +++++---------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 510e15f805bb..324f243cb56b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -630,22 +630,6 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 EXPORT_SYMBOL_GPL(dma_resv_wait_timeout);
 
 
-static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
-{
-	struct dma_fence *fence, *lfence = passed_fence;
-	int ret = 1;
-
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &lfence->flags)) {
-		fence = dma_fence_get_rcu(lfence);
-		if (!fence)
-			return -1;
-
-		ret = !!dma_fence_is_signaled(fence);
-		dma_fence_put(fence);
-	}
-	return ret;
-}
-
 /**
  * dma_resv_test_signaled - Test if a reservation object's fences have been
  * signaled.
@@ -662,43 +646,16 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	unsigned int seq;
-	int ret;
-
-	rcu_read_lock();
-retry:
-	ret = true;
-	seq = read_seqcount_begin(&obj->seq);
-
-	if (test_all) {
-		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i, shared_count;
-
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; ++i) {
-			fence = rcu_dereference(fobj->shared[i]);
-			ret = dma_resv_test_signaled_single(fence);
-			if (ret < 0)
-				goto retry;
-			else if (!ret)
-				break;
-		}
-	}
-
-	fence = dma_resv_excl_fence(obj);
-	if (ret && fence) {
-		ret = dma_resv_test_signaled_single(fence);
-		if (ret < 0)
-			goto retry;
 
+	dma_resv_iter_begin(&cursor, obj, test_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_resv_iter_end(&cursor);
+		return false;
 	}
-
-	if (read_seqcount_retry(&obj->seq, seq))
-		goto retry;
-
-	rcu_read_unlock();
-	return ret;
+	dma_resv_iter_end(&cursor);
+	return true;
 }
 EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
 
-- 
2.25.1

