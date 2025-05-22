Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23C2AC1484
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 21:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CE710E74B;
	Thu, 22 May 2025 19:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hwC53SBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F4C10E706
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 19:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747941295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=hwC53SBnaqniRN1e83ePfiqzIeZNqzXQCApG+6EknL8SLOfXUHswFgXF6qHI1jr3hEKsZj
 ACyZ7+O6BXOJs7X1IGQLMZdzE5Nw0S01Ly6MhhCT+v5WuZlhmH2OES1dBRAAG0la7a+AYT
 YBhf8h0cUYbMe0Iru35Dj3CtQeicXh4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-5jA_NPcRNe2VzCx2rDMubQ-1; Thu, 22 May 2025 15:14:50 -0400
X-MC-Unique: 5jA_NPcRNe2VzCx2rDMubQ-1
X-Mimecast-MFC-AGG-ID: 5jA_NPcRNe2VzCx2rDMubQ_1747941290
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8d0c8e917so47303096d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 12:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747941290; x=1748546090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=wQsB4evb8yGcNNS6GWe/4GuvERaIIBceJ7+qD/ZdHzdgbCauN5FNTx77igKfqV4n2j
 eZzgwVZdRnLCB9MEJRHrMmAkl0jzts6QfO5C92XMTqSJg1QyQTPtKLV8GOfLTxUB7JF+
 FhohWErFVpZIcofktwDVs0VhZ1dX0CESmfd9eG6bxf3fq7HrIAd7ROkEynqiX6250aW4
 GoxSr6IJHoJcjUypQG7GZY7TTAws+QQuhXiJfb1VMCyS9DHf7N0yU5bt+byZQpy6BrxP
 xWNCZwnGR+VEqf1mpi2IDf1dhqB82AGQJYeZOvfatcXiQz4XcI2m7M+EgGLnnuz5haH3
 oRMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFV2YuptSFEzxJ/monjqTfiUPTNyTDSbJkuXIOeKeYTC/NHQ74hQHk0KJes/Yf/Uum2ighBHk6R9M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZRxEkWaFF8CD7gVQyQdeTa+GxyuotzP27r4UequyY3DmWjfHt
 N4ZarMrAlrm6bo+U/GWDs2x6ZTIJggW2DL0Tpj3EKIa35ufy7LOV1aqTs3T+F2FnH9ISyAWVJnW
 L1Ra3hTrgxUS8On0NcbJAswbtj6FaND1jYDRi9k6/cmZnGMdVCMt+TctpypKI2EbC7Coe/Q==
X-Gm-Gg: ASbGncvZe7xtNyamraPoPjlu5GFlRMvN/BmgLDpNu8jVhPQcGHa8BQOvAy5hTx4TAZr
 CiwTImKak7iSYvEOCGN/v83FcNSOq/zldgkIWYNcLbbrif92k76mpX2is20Ik43E3hHIzjKWWUx
 PSt4n1MGloxzuPNUcHjufDM3y1V62jkZiSkqtKucbF6gbVu5QsL+S1hiIuXK81fu0ZlhOqMfY1W
 4r2mWGsgV49IN9X8sqfMQ7biTZHkwy2oHBoXohGG7zYL21iHKqgJE8NznilqXkWfzSS8L7ycnBW
 /z6so202OR6ANFBlXDPvqihdGrlHHCySgwXdZLoQ04k=
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id
 6a1803df08f44-6fa93a3329fmr5223826d6.14.1747941289862; 
 Thu, 22 May 2025 12:14:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUDT8yQqi4n4RTYXy8azlp/sJFJlAyhLHZ60JNEKpweDC9ye+5j/Kk6h96Y/dCMxu9PAXk8w==
X-Received: by 2002:a05:6214:d03:b0:6ed:12b0:f181 with SMTP id
 6a1803df08f44-6fa93a3329fmr5223506d6.14.1747941289482; 
 Thu, 22 May 2025 12:14:49 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:14:49 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 2/3] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
Date: Thu, 22 May 2025 12:14:17 -0700
Message-ID: <20250522191418.442390-3-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z91G80Dmnbv2D0ecHJq20g5MfYesr_tTNZSwCPomEl0_1747941290
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0

