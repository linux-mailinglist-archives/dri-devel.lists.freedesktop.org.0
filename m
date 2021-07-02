Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7343B3B9F9E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD736E116;
	Fri,  2 Jul 2021 11:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7DC6E106
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:16:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id hc16so15533892ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
 b=oWFzcmFQMVix/X4CnXPXfSwg6tEvBPEI7TWNN/47CdPI09vqB/tiQCa8A55wG3DryN
 Sy1QPtbTk5HEKcyIMO+pwCiG18e6WvTvIQA02ayAH7jjwEFsqxMsuANnOPSaHJhP9+qv
 032ZfLq4iS7eqo3krPmEvd8/fWtrA2IAHMv7hU0FS3Bz8ikSgTplBL8gk1nh5TEiUddt
 HdBE2aF7u5pFQvROB6bYZo6ewnnVsEtg9HfMkq0yE93+WFe3rTLxGnnvWZpTNDKY2oLb
 SgQJF/JbYbx1Z4pz7h4lIkCefJY/2RD1HFlRTqdDRhDhrQv9nuA8b8sKctU7AyFsF84+
 vUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yylOD234iuv0OMUdGg2HNgmrF+LL5FUxi7mZp3iTQtM=;
 b=poj6Q9hjoZXUEWy+7MdaR7cNzVOmSGZVnTuuYwJPGyHN/xyV0A6Eqwh1Rsulhd3ima
 x3rRGxsYfJXHeXfjJYEMWu7M4qoeDgcvSuHKF6g0GJaRjgAkPLiQf9+k+a+UNdn1a/fU
 AuIg+Wy4hwIgGlL/7kqVxqopRe09+Njn/7FfuN7uk/tHAvRBBUFMCIiKe5QtNSHaSTZm
 NVEKXKf5yAlW0tef2XYA1LBLVGgWUvhAlqtBdVzBpeN3NTDelC7HO8v4CrTHxWLDUHq0
 uvyu4516WCWMmSAGRzijhJm9OdwjsxRjaLTqAgo5E0JF6rJwzqCsjbep/pACN7qQWguP
 p1Nw==
X-Gm-Message-State: AOAM532D3L1ae0NPVw3d9tnGIE8skAy7DuY2XXoIUk8I5EtXsR60XZvc
 ZcPkQyG7D7AUR6aYQ9LGLcwImajbHg8=
X-Google-Smtp-Source: ABdhPJw+7ugiGjKWGVtxeaQKsJ31zvdkBMdV6SnOSPskPM/HhRft7dPc68JN6LySfLbHjbh9SO9M+A==
X-Received: by 2002:a17:906:2312:: with SMTP id
 l18mr4940229eja.414.1625224605836; 
 Fri, 02 Jul 2021 04:16:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9bc7:a922:a595:15bd])
 by smtp.gmail.com with ESMTPSA id g21sm937286ejf.25.2021.07.02.04.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:16:45 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 2/4] dma-buf: fix dma_resv_test_signaled test_all handling v2
Date: Fri,  2 Jul 2021 13:16:40 +0200
Message-Id: <20210702111642.17259-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702111642.17259-1-christian.koenig@amd.com>
References: <20210702111642.17259-1-christian.koenig@amd.com>
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

