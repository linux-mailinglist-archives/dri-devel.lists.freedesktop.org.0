Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH3xCG7/iWluFQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92374111F86
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 16:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7E610E41C;
	Mon,  9 Feb 2026 15:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="zvKm8x2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FD910E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 15:38:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-483337aa225so7501615e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 07:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770651494; x=1771256294;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xCp//tMOTqGacLZXvOrrIiaVx7JZ5khmQmJbVkzQNLk=;
 b=zvKm8x2o1DPGTLDCOr0huOi0BM4CnucPKklTF8duwBltlh4QyWgc8gaxR80fnG8hkH
 B6MLMCqY9tWawSyjcZx5kyDznFyafmMIemhbw8wqYpuq/HdAORpeO2vh0rjGQJL0mCTK
 Za7HsHGWfr9e6fRxIgO/YLi9jB7t81Z8QWuDfIqcI7hxiDRagkw023W14vHsRZcBPFM5
 cS1OKM2s4tnuPqHgfdrXu0qmqK8HwKXgyrs0P2uy4++pupmoPoLXDtDfaGREIXW/o+9f
 YkgOYkEkGvHEMXElS78kqwqhpIRWf277U7hl0MPYzCmUF7NgqnULIvByd4A7OA6CXQTj
 wCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770651494; x=1771256294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xCp//tMOTqGacLZXvOrrIiaVx7JZ5khmQmJbVkzQNLk=;
 b=VVOuVC9aGuMELEg2RuvHwDKQDEijtWu18pS8IqhRyevQoRJmlwnOl6zgToMSnbQHde
 H6q5d1Qr+w8ny8IcaM7N8+nz0K2YYW+XAFnvO/mve5DOSuA9K2WEkCZgjhh9A1akilrr
 JtefqSiWT/jjoD7eQsxYO2wkU+ctI9EM438uw6Bu0ZwVSeLCYUGygx4cU5QJzNKmRkgq
 5ISX7cd1INgGmTsSuS7dPhg8/ndcqpF0waH6mocLX/C29zW1wIPrZvT6QTzAqHw4RR/a
 fFBT5PUEpqD9dsdgjp6mPr2gEQq3u3rXv4BsWQkVfvKlVaJnyf+bN1itvTAcu7JaeRuj
 O6kw==
X-Gm-Message-State: AOJu0YxsT70VMlLeC7xTMyPzdo0GmZcDhNlUzhSwAvSQI1FuXpAUJHVd
 BcYyeyRs5rffbaoskpRwNayAcGYWy1I+vCoM7sFSIv0w0BVQp7s9u/FFR1SpZ3FuAfqt27AcQHf
 h2CAA
X-Gm-Gg: AZuq6aI0hOPFjdfVcAhfFBfD59EjuG2W5UHDcOX6pzZSjdj3awA3/aEuY/ro66WlyzQ
 UV+Me+cf4KhH71alod9tknmBeRbTqb/NB5z5eN3oKt2lGtkzGCvYV6jBOEJW7H9APaoN4sCZEZd
 spQONWvdBXQ/LJhNql9KPUXW5rwZ3AcVgNx3k3HO0VRbxM34qPhckKn7E+gJ0/USuMWfUjAZFMQ
 k5l065qGViuFe2e+4t4H0OUbQItMT1NWfslpWI75JNLs08cPsOuFr5pf9PEWVe3oEmZ6blOPcy7
 /kia6t07b0a+H8bQDlp+g2OI99BFN10C0v7UHsOpzYqp7gji4gHTw81TsAwg4VJFYtobWWRsXDP
 VIsi2/CEk6Y6JUkmBc0ABCQ7TTXviIgaPIvGR6+A3fnvUVJ7gIH9LKuTUuX4OuLrlwC7OoEC5aS
 sQRg==
X-Received: by 2002:a05:600c:c16a:b0:475:dcbb:7903 with SMTP id
 5b1f17b1804b1-483201e1895mr157429035e9.9.1770651493820; 
 Mon, 09 Feb 2026 07:38:13 -0800 (PST)
Received: from localhost ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206b8ebbsm382402735e9.1.2026.02.09.07.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 07:38:13 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com,
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: [PATCH 3/5] dma-buf: heaps: use designated initializer for exp_info
Date: Mon,  9 Feb 2026 16:38:07 +0100
Message-ID: <20260209153809.250835-4-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260209153809.250835-1-jiri@resnulli.us>
References: <20260209153809.250835-1-jiri@resnulli.us>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[resnulli.us];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,resnulli.us:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 92374111F86
X-Rspamd-Action: no action

From: Jiri Pirko <jiri@nvidia.com>

Use designated initializer for dma_heap_export_info instead of
separate field assignments and avoid the need to explicitly
zero fields in preparation to follow-up patch.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 7 ++++---
 drivers/dma-buf/heaps/system_heap.c | 9 ++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 42f88193eab9..d12c98be7fa9 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -388,7 +388,10 @@ static const struct dma_heap_ops cma_heap_ops = {
 
 static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct dma_heap_export_info exp_info;
+	struct dma_heap_export_info exp_info = {
+		.name = name,
+		.ops = &cma_heap_ops,
+	};
 	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
@@ -396,8 +399,6 @@ static int __init __add_cma_heap(struct cma *cma, const char *name)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = name;
-	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
 	cma_heap->heap = dma_heap_add(&exp_info);
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd4..124dca56e4d8 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -427,13 +427,12 @@ static const struct dma_heap_ops system_heap_ops = {
 
 static int __init system_heap_create(void)
 {
-	struct dma_heap_export_info exp_info;
+	struct dma_heap_export_info exp_info = {
+		.name = "system",
+		.ops = &system_heap_ops,
+	};
 	struct dma_heap *sys_heap;
 
-	exp_info.name = "system";
-	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
-
 	sys_heap = dma_heap_add(&exp_info);
 	if (IS_ERR(sys_heap))
 		return PTR_ERR(sys_heap);
-- 
2.51.1

