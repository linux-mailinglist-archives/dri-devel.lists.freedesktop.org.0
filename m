Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE43A3598
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 23:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595D56EDF6;
	Thu, 10 Jun 2021 21:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88AF6EDF4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 21:09:52 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 69so1714043plc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kpuShIAkbiGFN6gLy371MVITT27m9Spfgc+keQ5GPoM=;
 b=uL0D41d37amGArotKPYR8wqlNuDDLl0LY+OArR3uShB7B5rgoww0tvS6H3KFqUSND4
 yuEP989l3fxMyCHVhTbOzfIn0KexS8Hl+OB96GtlUT44xkxp29qGJjbpNnah6txrCy7e
 ZVBliLCVUqBkBwiFh7wtgTEv56QjItocaSwCrp/vdgfd5R6h3iQQ8sdJuKEbbJAEpprh
 dlEJbr7ip3GuyjqaFKSRlM1a90rh2MntQSon0IWZL/23AqNCBWVgNQAnLnszLH+7G/7l
 Z1nGyBDjcpLzoPh5Cgs2Nhh4dQx5C16XYDInVOX2vXuVwQvJ3aPK24szS9JmW2bOcy6K
 WqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kpuShIAkbiGFN6gLy371MVITT27m9Spfgc+keQ5GPoM=;
 b=M3iPmXAXecENvnFThWO56WxDDB84UWVRKXd+C5dYhc4+HzEqySwZ62LVDe+kT6t0Nu
 uR/4+TmltSRy02Y0mVqckXYGnR2iOzad5aru0Jzqz+R737u/VXo2nD+mG1xSLTmQYLj5
 JgIPqSN1Cxg0138PV6704u4LEdtS/7ZrSXISY3T2ALvG/HCQvkXs5h25pHrc1jhDDB1G
 E+jUWFbh0shWEn206TbyVgVcB99u7QFuB+c5zEfKLmP119RVJIDWCQogh9oeMbyRacRI
 35cnRq7SEzQ+3PARdO8kkNj4ArWxbqonFh3jwPsnqCNKC983s0vR6I+hhVQiNwOa7/gt
 q78A==
X-Gm-Message-State: AOAM532qr1JceyyRr9AB9KPK0ffT8p/cHZbhSEvMjEgKansqG6EnjRBl
 bWfb4ovkaEF9YoWDcyzGevGWYvEUAVGsQw==
X-Google-Smtp-Source: ABdhPJxzAD0cuTzwUqC1YFEWvRpCVi9i7ogFsTZT3JyWKjAm3GitkK4UI4+kMO/uJS4dHExXvL1awQ==
X-Received: by 2002:a17:902:7792:b029:fc:e490:ff9f with SMTP id
 o18-20020a1709027792b02900fce490ff9fmr634846pll.27.1623359392135; 
 Thu, 10 Jun 2021 14:09:52 -0700 (PDT)
Received: from omlet.lan (jfdmzpr03-ext.jf.intel.com. [134.134.139.72])
 by smtp.gmail.com with ESMTPSA id o16sm3145288pfu.75.2021.06.10.14.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:09:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] RFC: dma-buf: Add an extra fence to
 dma_resv_get_singleton_unlocked
Date: Thu, 10 Jun 2021 16:09:24 -0500
Message-Id: <20210610210925.642582-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610210925.642582-1-jason@jlekstrand.net>
References: <20210610210925.642582-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For dma-buf sync_file import, we want to get all the fences on a
dma_resv plus one more.  We could wrap the fence we get back in an array
fence or we could make dma_resv_get_singleton_unlocked take "one more"
to make this case easier.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c  |  2 +-
 drivers/dma-buf/dma-resv.c | 23 +++++++++++++++++++++--
 include/linux/dma-resv.h   |  3 ++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 41b14b53cdda3..831828d71b646 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -389,7 +389,7 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 		return fd;
 
 	if (arg.flags & DMA_BUF_SYNC_WRITE) {
-		fence = dma_resv_get_singleton(dmabuf->resv);
+		fence = dma_resv_get_singleton(dmabuf->resv, NULL);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			goto err_put_fd;
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 1b26aa7e5d81c..7c48c23239b4b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -504,6 +504,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
 /**
  * dma_resv_get_singleton - get a single fence for the dma_resv object
  * @obj: the reservation object
+ * @extra: extra fence to add to the resulting array
  *
  * Get a single fence representing all unsignaled fences in the dma_resv object
  * plus the given extra fence. If we got only one fence return a new
@@ -512,7 +513,8 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences);
  * RETURNS
  * The singleton dma_fence on success or an ERR_PTR on failure
  */
-struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
+struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj,
+					 struct dma_fence *extra)
 {
 	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
 	struct dma_fence_array *array;
@@ -523,7 +525,7 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
 	if (err)
 		return ERR_PTR(err);
 
-	if (num_resv_fences == 0)
+	if (num_resv_fences == 0 && !extra)
 		return NULL;
 
 	num_fences = 0;
@@ -539,6 +541,16 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
 		}
 	}
 
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				continue;
+
+			result = fence;
+			++num_fences;
+		}
+	}
+
 	if (num_fences <= 1) {
 		result = dma_fence_get(result);
 		goto put_resv_fences;
@@ -559,6 +571,13 @@ struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj)
 		}
 	}
 
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				fences[num_fences++] = dma_fence_get(fence);
+		}
+	}
+
 	if (num_fences <= 1) {
 		result = num_fences ? fences[0] : NULL;
 		kfree(fences);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index d60982975a786..f970e03fc1a08 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -275,7 +275,8 @@ void dma_resv_add_excl_fence(struct dma_resv *obj, struct dma_fence *fence);
 int dma_resv_get_fences(struct dma_resv *obj, struct dma_fence **pfence_excl,
 			unsigned *pshared_count, struct dma_fence ***pshared);
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
-struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj);
+struct dma_fence *dma_resv_get_singleton(struct dma_resv *obj,
+					 struct dma_fence *extra);
 long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout);
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all);
-- 
2.31.1

