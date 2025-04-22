Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5723CA97554
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 21:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869EE10E39F;
	Tue, 22 Apr 2025 19:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="V5f71BTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8CF10E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745349590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=V5f71BTdnA9DkD3ArCBZyy/XZLn10MUAxS/eHnkqsyoexKQ0m2KsAhcl7XL1V5Qa+u1pK7
 lLkiNqwRQC9EC+zWpHU2se65lP5auDMa6iZ6jXs1OhQNsdw/Ghp25x6OpflbSU6fMXQ3Vy
 W69o5MnVuGvfAtpMs2kxnUGJzhMjAz4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-iLjutlkeOvuvZ-kIwwhBSQ-1; Tue, 22 Apr 2025 15:19:47 -0400
X-MC-Unique: iLjutlkeOvuvZ-kIwwhBSQ-1
X-Mimecast-MFC-AGG-ID: iLjutlkeOvuvZ-kIwwhBSQ_1745349587
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4766e03b92bso110064951cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349587; x=1745954387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
 b=J42BDm0D+ibXGgULiDmbcComIp0kmsYQ4+0Ad0iBwPNia+9JdRCMx5lUy2nWrbBGD1
 5exurqLZAkKDM7gT1V/m4hHas83aBuwzi8TWMcqr6eQhM7f8PCyo8upASrHOkucegBWD
 moUscRWyFXP3U43b8dt1zBrlZzJdLPL+CLnJIsChyT/nLcy1uXP3KHq0w025CWB5pCnq
 0MAc2DhoyzsA3rj73qT2Dk6D+/Z1vrxqgw8AkOnKLWkBYNmhAoEeij8wF1EE86od+c6E
 ospzWMKivESgxn+YtcOlk01DhDXm0sRWSMDYOc0DJk+60iiw7TBjnBbzeFOhX+eKHqi6
 FSxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW12nUfgpHJGURtuMTXDCrlDjPkfRE2Ktpfq7UuC45ocMgminMhTAJ6ltiihv4a5+KP9ZFS0WhWXYM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhgtIkW7/EeqSvo8MEala1/ct/FW1Wgu/3G7n3avWt/zQBfIdr
 crwwSZXj5Ei+FANII+lsd0rwZcJyC1AeOhIQgsF27aJHB05dmJHj8cyr/pGL7E/SMYJPddDcF21
 BdKNjKL7dt+0fjHAZ7lbhggxfgbh8LEm8EwSasCHaKudHX0VmlS5I/7wD9tMSyAnLHQ==
X-Gm-Gg: ASbGncs1T4f1BSp0kcDdz4UmYLDxkgv748YzqetaBEpoM6UqFbtNuQVMlLgBF7P47wm
 ZiAnZGHeVj0Aq2GKHKPHXu2G2/MfHq4/vrFRUwX5Ouq+WFxz6iARTS+MAAFffONAkmbnKbIejtx
 xPwRNykfSW/s7HMk8bB8OZslVRjaLRWOK+rwfC1L9uo32R4dJ+kd81GzFc4JIL6cfCVAA/22VfK
 AFQKsP/yp4PSQgJddImWHx15GABeqggFm+Ww8PRhqZzd0YVabenTnZYVnxC9ZeVHARzobxrLrLg
 UuzTCGrvha1b2VFRTDX2qABNN8d4JENoheX/xD6WRYA=
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id
 d75a77b69052e-47aec3ac014mr303867631cf.18.1745349587302; 
 Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyYuKD1qhPJ8ch5NTGQwzuHZqeIg/SkaansDtfBqNfdQ+I0LBmtC0h/nphRC3WEITMYo7yrA==
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id
 d75a77b69052e-47aec3ac014mr303867281cf.18.1745349586902; 
 Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in
 __add_cma_heap()
Date: Tue, 22 Apr 2025 12:19:38 -0700
Message-ID: <20250422191939.555963-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
References: <20250422191939.555963-1-jkangas@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yM7QXabYrG9-0P5w1tgAV26_RUO6182vvGepCOdD-ts_1745349587
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

