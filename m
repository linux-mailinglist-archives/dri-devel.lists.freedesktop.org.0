Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9894614A9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2766F974;
	Mon, 29 Nov 2021 12:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3816FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id i12so14376757wmq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
 b=UABOkQkMsx3b8AE1aqUWcIzMoJSnDFss/wAcVi7moSF4GxMLp+EGkwq9yFczUrxQUu
 ePKRe8KRkZwHXSxu/iKJJ+JXX+Kr1G+tOfUivTevI2h1ca7+vY0BCRGUuLmtZAm9dRfz
 dxXy+b9K058OCKnr6fxX1f28InMGiYiFU1PLQYpOL0tyPsc2TH9+KzngzqH+sIVrzPha
 7N4moqf9vms6aJuwP1TpZepoG78hnC77m6g8m1TGudoROpZuCEq6A+cd3lwztJoJ80iH
 BpCCWqRTbpNQd7kA9KHboKit7cxBHAM1uD6h7Z39RLgvhVp4rXLKKvLhPIL1pGRoRLjW
 lXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
 b=TZnC/G6I6IIKRAKda0sKWrlfc6R4keg+QSREj9MkJCh1ev3cNM1CCdA+StMUkddcLL
 oqGwa7BZczyL2eJY7rK65/F3y04JFcXlev713H+tBL/mtt63a7z3TcdbgIH0NTbFVq9q
 YpRvnZzh1Mrn/lUE2C2M0z6wLtylulks06KGqv6FM+3au9WnJk3yjyBgZol35pB5REFs
 vKZBt9a0utdFju71uCa5EQ7I9TeeN1zxKbUqBm91iXKldnUYoYnnCEz1RNYJ3yMz4tFg
 5lpSytHJaBqfFAl+Wfu4z0iFnPckvUK+nnCHQOS6fG5CHpFZkdeGRFTU5CYmv6c/X6z8
 D5LQ==
X-Gm-Message-State: AOAM532IkblYvRrPucIdUdm0EWySM3npzNC++UA3tZJA356WBmg6y4pE
 66tckOZIjb232bFPYwa7SUIim+LjkMM=
X-Google-Smtp-Source: ABdhPJyBuq2+7jBLai2fJFG+lkGEmimW29kV0AHD/bcGITv/dKdippw+QrURG+ltqW7PdZ7iFqd+Jg==
X-Received: by 2002:a1c:9d48:: with SMTP id g69mr37049157wme.188.1638187630956; 
 Mon, 29 Nov 2021 04:07:10 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:10 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 09/28] RDMA: use dma_resv_wait() instead of extracting the
 fence
Date: Mon, 29 Nov 2021 13:06:40 +0100
Message-Id: <20211129120659.1815-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_resv_wait() instead of extracting the exclusive fence and
waiting on it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/infiniband/core/umem_dmabuf.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f0760741f281..d32cd7538835 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -16,7 +16,6 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
 	struct sg_table *sgt;
 	struct scatterlist *sg;
-	struct dma_fence *fence;
 	unsigned long start, end, cur = 0;
 	unsigned int nmap = 0;
 	int i;
@@ -68,11 +67,8 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * may be not up-to-date. Wait for the exporter to finish
 	 * the migration.
 	 */
-	fence = dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
-	if (fence)
-		return dma_fence_wait(fence, false);
-
-	return 0;
+	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv, false,
+				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
 
-- 
2.25.1

