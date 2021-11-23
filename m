Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF445A553
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D186E7FE;
	Tue, 23 Nov 2021 14:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97906E573
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id u1so39232053wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
 b=akxICZXzLT9qtfacHcLRkxnnH4e1GhkjSh2NfXBDrFUxWDM0CP1y0XpXg/zOJaAQqS
 CkuBD1CEOo8tlhe2JFZ8flhAhx/8iEmveVxWH9XRkXbyQBfJaXJ4XwExglAnvBW+M9Hf
 RUtoSugHiY20kI7TAookU8Wudy+fiUsIek1LKBiRBjvlRXt8Wsr2R0Gczi1efK7I2jni
 fEPCuI+Gbme2NajqmrMc75CrMDBp9o/EXq1SnV6tq0h9HikqCjIIKg1ChE+71uWgOGxZ
 aGOnwEt0w9P+DIXzmzPYZcCrd+6e7gxjwuUcfTLFUyoS9eflr6A04/T4A/QQGPDpFT67
 UBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dLcViOC9XeBrn0i9874Oh2sdjjvie7K1Wv9yyTZ+XyU=;
 b=nih2+Bf/+yVlZ330rui6Tc/BdzIKOJBZ/3wXTgAfmoErDkFEBRBP6eMO9V8z6gHrka
 02a36TwkysKuKGM9e1xKfIIZHY83CsDVw6TZuO7zixjuZEzDR0bQ5FhZxvhFBw/kh7Mv
 PdniDiL4yIFsGMMKMARjYnMjBMJaivvDxt2RAIOGhHWxCeIlqpSip8Y/tfHQ4oW5I5tn
 szuuJLwMCe38cDHLvd9QAvF6Bzkbg8jeZvz/FPsjGjJ5hsCUXJbBWakChsRlrP0aLYqv
 Ip7hFFDJP/i/HIX8+EO3jcnqXfak475mAvngrK2KpKIc+XgGn//tnzRYRXzPSH4Tp9L1
 Q3tg==
X-Gm-Message-State: AOAM53346ao//5KUTxQYIm4Up5MlYzJ0Y9m9Ccj78sVknaJbocDn2G1A
 Ac21AwmgOAyhmeGhZyNe9lc=
X-Google-Smtp-Source: ABdhPJwL0j2p6QTFl0fJ4Pb+Hz/6hTqyAYg8+HAIBA7AcBESaZ9Hk4Pop+uh7AuarwcCBR/GqvX45g==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr7509995wrd.179.1637677291125; 
 Tue, 23 Nov 2021 06:21:31 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:30 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 09/26] RDMA: use dma_resv_wait() instead of extracting the
 fence
Date: Tue, 23 Nov 2021 15:20:54 +0100
Message-Id: <20211123142111.3885-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

