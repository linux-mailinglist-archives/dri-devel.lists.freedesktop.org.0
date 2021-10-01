Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5D441EA7C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520576EDC5;
	Fri,  1 Oct 2021 10:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99A86EDBF;
 Fri,  1 Oct 2021 10:06:20 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t8so14655223wri.1;
 Fri, 01 Oct 2021 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLn0ZmdbAH2RzPW/tcdHG/ty+pcMQGDFLOQ2PJC46s4=;
 b=NnfkMsQhVQWp+VnHgA4QOViEoonm7dolqt+Q+FjQOGMRuaaz0cXgLDrRVRcRedMDup
 kRDPMlSFOdbZU7jwq0tjQhlPU3duqxg99UpWsUBnodzqWKWWpetIeH1ePZuGy+RHfHAG
 LQQ6i5PFFXlGnyVOVZx6CTAYV7LG16mvi7qbOB7gXt0gEblm226RcpYZ0wWFVuYMHRFU
 sMMCMdTEbZcdKZw0YI5mogh8BsIB9V6opYA9yM0XSz9JzYor0/Lud/GTsePfepSguJZu
 xxRNdcNKJ5DSg56p7fqG9tUs9oc0OvYzCyL4lmPTrCjyIGlwCJMn+MtrnUzlMaFCobb8
 YU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLn0ZmdbAH2RzPW/tcdHG/ty+pcMQGDFLOQ2PJC46s4=;
 b=QKfvYEnjalI5fFKyFHbrOPrZYee1ueE0eL7LDYQLM1luCMwL/UsA2fP1bbCAQslVMR
 fjqTKnYy+eT/MqNB0KGvrekXapze+LeG+b3pvo12CZdhA1PcvJ52Jdw/GAWsVHeO8RZJ
 d7q8C6Tv32nN2TBmZdinojt7Uv4YjlGcpfmZpuRsdx2JT4+fa/pX+zxuWn6md4pjKznf
 H0qM+VV5Wu6cj2dyRo+eS0v8gF7dbkdL/7MaPTACVDsW3x9p3/MzDlr2lOg4iHHUmkYT
 ZhHsfibQ6Hgxc2FkiUhLj1/UR8ujNZxFne7xJEdl+5LJz5Xyi+w8fGjP74v2dk6X+D25
 p1cQ==
X-Gm-Message-State: AOAM532J+eN+42rsbjT3434i5FiMALoIbcbjff6TrS73ppCaXS9DRXm5
 7g0AcTnxlTMTMSvnryLken8=
X-Google-Smtp-Source: ABdhPJz/aW5sUJgBDhsPc6PbxZWz95pBOKKVeJgdt0cjwyv9AG40FNPNmoDglQ/xHFW1pSioYbjPQg==
X-Received: by 2002:adf:a2c8:: with SMTP id t8mr8546800wra.215.1633082778942; 
 Fri, 01 Oct 2021 03:06:18 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 06/28] dma-buf: use new iterator in dma_resv_wait_timeout
Date: Fri,  1 Oct 2021 12:05:48 +0200
Message-Id: <20211001100610.2899-7-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 69 +++++---------------------------------
 1 file changed, 8 insertions(+), 61 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 9b494828e7ca..510e15f805bb 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -611,74 +611,21 @@ long dma_resv_wait_timeout(struct dma_resv *obj, bool wait_all, bool intr,
 			   unsigned long timeout)
 {
 	long ret = timeout ? timeout : 1;
-	unsigned int seq, shared_count;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-retry:
-	shared_count = 0;
-	seq = read_seqcount_begin(&obj->seq);
-	rcu_read_lock();
-	i = -1;
-
-	fence = dma_resv_excl_fence(obj);
-	if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-		if (!dma_fence_get_rcu(fence))
-			goto unlock_retry;
-
-		if (dma_fence_is_signaled(fence)) {
-			dma_fence_put(fence);
-			fence = NULL;
-		}
-
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
 
-			if (!dma_fence_get_rcu(lfence))
-				goto unlock_retry;
-
-			if (dma_fence_is_signaled(lfence)) {
-				dma_fence_put(lfence);
-				continue;
-			}
+	dma_resv_iter_begin(&cursor, obj, wait_all);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
-			fence = lfence;
-			break;
+		ret = dma_fence_wait_timeout(fence, intr, ret);
+		if (ret <= 0) {
+			dma_resv_iter_end(&cursor);
+			return ret;
 		}
 	}
+	dma_resv_iter_end(&cursor);
 
-	rcu_read_unlock();
-	if (fence) {
-		if (read_seqcount_retry(&obj->seq, seq)) {
-			dma_fence_put(fence);
-			goto retry;
-		}
-
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

