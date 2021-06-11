Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585DA3A4199
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 14:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D673F6EE7E;
	Fri, 11 Jun 2021 12:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943FC6EE7D;
 Fri, 11 Jun 2021 12:03:03 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so5251221wms.3; 
 Fri, 11 Jun 2021 05:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1e/SbMbCf5qJDsFem7oEWojdln1rq60P/UViM2oZ51I=;
 b=P5jX7UQ3XtdtLYqFtl8P4xcJyC6r9W4LK4G5Qnwsa6wLNoNdV+dHeMhPdGUmQfF3i4
 tLeV5Kwtz9T1ZGWoOxUJqUpZX0ao/4iCw8UQLQ+a2ifibuKqoue5u2bbIQNNPl90XbDn
 dpi+Tm3AjuRqUEbL7zTmyMoirKvFl/1C9VYaw3gz7ZE0yq++7N8TgUw/n/0xPexXkVNn
 4AG3OKnZfAX68S2kMHWfS/yvJYXDGDSr4c20L2RY2Qak1PsI+2qxLr5ewrsu2GR0sKqT
 2tqCczA1M1R8Wu8UPoDFOEzVkZ9QonMZQ0dMDQiYynQQLAUSV5cXjVhnbQP5ViaZabU1
 ViNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1e/SbMbCf5qJDsFem7oEWojdln1rq60P/UViM2oZ51I=;
 b=DCiOnaBmibtyFWeEn8F7wbHt82DKgJsJBlWMdstig/TVbkmu7WRVlXGXjJtayCyp/y
 NiIDUwKeZJi4K+7v3ala2bCTTes3hWlWZ3cws4BskYeg1P8U/mmNcGNJYqmUuVkm9A/J
 1agyBPvevNOQbyqSaiyiLCbMAQsvDIdC6CSiKGkhae8Pt2d6gMTBJ+j+BxqsIcKqFtIh
 ofFAkazgnTURaYnOPA1LXnVfcBkbwSa7yknYlPyA2B++MyAwin2/2C+/eHiJ8RflrhT6
 2FjjGRvcIR0wMyBuj3RURdrvd+tF26shCrlDRCfbD1+p79rI1WmvQ/VHYDn9ZGEqwbF4
 p5cg==
X-Gm-Message-State: AOAM533MXLH2PqndgNcxIEbnHLKkJVbcCszAw436zVQ7xExGChlViXVu
 4zSL08DPRs+ThLjukPiEOARnB7x4a5M=
X-Google-Smtp-Source: ABdhPJwS8YWPiFfPJlQs73UG0eCo9FSB8F5w9X7Q6HMZrXS2f+N1aQfRbXHQkPEQ+eXAHgMpu4kTMA==
X-Received: by 2002:a1c:3dc2:: with SMTP id k185mr19891415wma.15.1623412982297; 
 Fri, 11 Jun 2021 05:03:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:657d:4ae8:def3:d96a])
 by smtp.gmail.com with ESMTPSA id f13sm6898361wrt.86.2021.06.11.05.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 05:03:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] dma-buf: fix dma_resv_test_signaled test_all handling
Date: Fri, 11 Jun 2021 14:02:57 +0200
Message-Id: <20210611120301.10595-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43..c66bfdde9454 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
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
@@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
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
+	if (fence) {
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

