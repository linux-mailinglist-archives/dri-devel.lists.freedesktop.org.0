Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA09422552
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F386F5C1;
	Tue,  5 Oct 2021 11:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE576EB56;
 Tue,  5 Oct 2021 11:37:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e12so16507715wra.4;
 Tue, 05 Oct 2021 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFRvQ6RV96jBX25654PxBqA2cF5GdsX8IuqjMmhPmaQ=;
 b=J0goe+paILeDCstwX5dO+h/f5bdXMgwbJdcHxWzBYkDA/HeUVVb7H7f3ZT71kzpH5S
 wH07Kb8OjSYBSh6h0vemMtzWYVVxScn0nAHYsugxnRIzpyjxekPsCyu/N32zTzHKMuhN
 uvdYf6xWJyTe9P4vEc/nxdliS4yYEBaFmu+b3KHp2nUgOFzkFxsoNuz7zW99HglZHM8D
 1W0ti9/J7LfMY/IlTioCpKEWHfEbhUYRcrtXhuRLexAJ/xMP5aR5ZSITuW8bx4zDwpon
 sRhO9T0gjPqBROkajLhR6xgWMi2VBficySW04o17XHg5jMgmrSbFtO3Y+BFu3MjDKVxn
 nRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFRvQ6RV96jBX25654PxBqA2cF5GdsX8IuqjMmhPmaQ=;
 b=yOYyMYvaIBy0RVInH3qHIHpPolMn+6ixZ1YDJTeo3fRmLrDAJw5zckxpqs3bhZljKP
 dQ99gIozMNu5MJ8f6iL0Mx6xTcDycfv1VTo99kSv5j3bKwg8l38sIc8XFGwBo75iQHHQ
 lwzr29aD/qwmV+yE7lJ8YZ3tNan4SZFSwY7pLcEHte2zKw2ofOiArU5jRHdU03rOKbNi
 TiP6cjiht3s1RWKXxiExPOftHLvjfjlD7JbARF+NbswcXmETmzy+yImV+JsDYxqBWero
 NN+4uwcqoHQMiEsJ1yZSRUp3+Hk+7tL7fegS3kDpodQdk0Wx4tLcr7H4vdGmpcxnLwvX
 h2yg==
X-Gm-Message-State: AOAM531MoNPRwVTenA8bLK5qEB3Fcl9mwvfoJXCeRU7Y3sWe4C+REBL7
 kTruzYraMx/6hnfydzz/X1/R/NQKb60=
X-Google-Smtp-Source: ABdhPJx9O8AMO2EbzbaaLU0qYPUVdrF8sww3tGKZar9j615pxOcLezJVK4/CW3wMxw/5Y8lCl1penQ==
X-Received: by 2002:adf:bb93:: with SMTP id q19mr9464875wrg.423.1633433872113; 
 Tue, 05 Oct 2021 04:37:52 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/28] dma-buf: use the new iterator in dma_buf_debug_show
Date: Tue,  5 Oct 2021 13:37:22 +0200
Message-Id: <20211005113742.1101-9-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/dma-buf/dma-buf.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 61e20ae7b08b..8242b5d9baeb 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1356,10 +1356,9 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
-	struct dma_resv *robj;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int count = 0, attach_count, shared_count, i;
+	int count = 0, attach_count;
 	size_t size = 0;
 	int ret;
 
@@ -1386,21 +1385,10 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				file_inode(buf_obj->file)->i_ino,
 				buf_obj->name ?: "");
 
-		robj = buf_obj->resv;
-		fence = dma_resv_excl_fence(robj);
-		if (fence)
-			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
-				   fence->ops->get_driver_name(fence),
-				   fence->ops->get_timeline_name(fence),
-				   dma_fence_is_signaled(fence) ? "" : "un");
-
-		fobj = rcu_dereference_protected(robj->fence,
-						 dma_resv_held(robj));
-		shared_count = fobj ? fobj->shared_count : 0;
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference_protected(fobj->shared[i],
-							  dma_resv_held(robj));
-			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
+		dma_resv_for_each_fence(&cursor, buf_obj->resv, true, fence) {
+			seq_printf(s, "\t%s fence: %s %s %ssignalled\n",
+				   dma_resv_iter_is_exclusive(&cursor) ?
+					"Exclusive" : "Shared",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-- 
2.25.1

