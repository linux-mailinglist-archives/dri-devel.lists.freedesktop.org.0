Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB53A94F5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39AF6E524;
	Wed, 16 Jun 2021 08:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE886E523
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:27:02 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n20so1536039edv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
 b=IPfZjfHVbG0OCn+KKeCOXK5UK6WlYoq3WBGAITBYT177wcs8YEOrG/D5j6Pp+dx+XV
 vSuDXkWFGTMI7iX1g1KUfz8RItABTnIqmtbDDAY1AWZpafqbDjoaJXVzvEeAeEIwfgaX
 BFPj5kDSgkf4OrxL5PxuTu8KmnfFPOrk1HGMANOPQDIg8H2qYtp5h0nW16B430t54YiA
 MnOxWddiKvBCw6XlkdZViIlvwxe7tfrdg/PKmkm/tQ/RDvOhtvjSZVMHsF6KaTq3m9nA
 dUz3Bob1iSVI11XSMvyWBeYQTflU+vBQWBbgL04E4SnPh1maV/mIVlGaMJQQ8Wty3SNu
 JaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
 b=SJc1cOwf5s4G64KUUNmu+UKVBHSIIKIzgdA93FSs9jC4Xj++PNvRNZAyYUYi233B0j
 0AFv6I9JWTPtTccWWdlPq0EgW8WlhOiotwFEV12ri2T7z8CqX8Wwm1bGz9NCbVxXYupk
 7qBuwpo2JRajcMP+gfyOYuZNOxxp3seBj4D37DmTpHUOZiWY2zG7TpO0hFQ9OD8+Zq8Y
 nGG9NITtcn0A0EihVj7vMETDGSUejTqFzDj2Ba/uYfcpZrA2O2WnTdtPaTiJtzZ0iImE
 Jx0+VxNuLyLYvSFNx/mQd1MPBMWEfIpl9UMu/QWNoceZIKmCiBOt8hwe5tN/RcWzjFnE
 /Asg==
X-Gm-Message-State: AOAM5306Djei5nAVQkKt0h52j4WC8m3MF0wCPQHzormTlL1nI8p4g00s
 HyyOa2zzeVUlp+nLHLOvlYk=
X-Google-Smtp-Source: ABdhPJxMIYtsfV1dgkVNP3Vy0nsp5M8aYGD7HNMOvq14lrRQdJQKg7mZZynBVSsqgsANM28ZJBEXJg==
X-Received: by 2002:aa7:d288:: with SMTP id w8mr2730674edq.276.1623832021459; 
 Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8b88:17a4:582b:121f])
 by smtp.gmail.com with ESMTPSA id v7sm1152639edx.38.2021.06.16.01.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:27:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Subject: [PATCH 3/7] dma-buf: fix dma_resv_test_signaled test_all handling v2
Date: Wed, 16 Jun 2021 10:26:51 +0200
Message-Id: <20210616082655.111001-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616082655.111001-1-christian.koenig@amd.com>
References: <20210616082655.111001-1-christian.koenig@amd.com>
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

As the name implies if testing all fences is requested we
should indeed test all fences and not skip the exclusive
one because we see shared ones.

v2: fix logic once more

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 4ab02b6c387a..18dd5a6ca06c 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -618,25 +618,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
-	unsigned int seq, shared_count;
+	struct dma_fence *fence;
+	unsigned int seq;
 	int ret;
 
 	rcu_read_lock();
 retry:
 	ret = true;
-	shared_count = 0;
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
 		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i;
-
-		if (fobj)
-			shared_count = fobj->shared_count;
+		unsigned int i, shared_count;
 
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence;
-
 			fence = rcu_dereference(fobj->shared[i]);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
@@ -644,24 +640,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 			else if (!ret)
 				break;
 		}
-
-		if (read_seqcount_retry(&obj->seq, seq))
-			goto retry;
 	}
 
-	if (!shared_count) {
-		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
-
-		if (fence_excl) {
-			ret = dma_resv_test_signaled_single(fence_excl);
-			if (ret < 0)
-				goto retry;
+	fence = dma_resv_excl_fence(obj);
+	if (ret && fence) {
+		ret = dma_resv_test_signaled_single(fence);
+		if (ret < 0)
+			goto retry;
 
-			if (read_seqcount_retry(&obj->seq, seq))
-				goto retry;
-		}
 	}
 
+	if (read_seqcount_retry(&obj->seq, seq))
+		goto retry;
+
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.25.1

