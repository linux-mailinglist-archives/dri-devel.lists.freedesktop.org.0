Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9558FDC75
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6910E80E;
	Thu,  6 Jun 2024 02:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RAvD+7LC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7494E10E80E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 02:02:40 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3748ca2a21eso2055515ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 19:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717639359; x=1718244159; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y2QdOJgbAl50VR+ODfvH7gZ+/T+swJOLHiP22D6L4FU=;
 b=RAvD+7LCoIFeGwWaKGTyUoK9nk9IEv+nFhfYP/4+UK6HcYZWmhex4zeNHmlYAqlitY
 w8bElesdZVLbDKHOCHl4XCoafZPLHwionPgY0smZPVRKquHCcMjbeNmpQckPLWUrPrvP
 V8ajjXhIUV0XbNLxIY8NFaOnUNMMGq5do2GloqMdt7Vb1OZfFsbImg4Z5mOpXCUiQRkp
 VT2XDkZLo4CL8zyPTAzrF5nD9GPTIl1d/kWOY8E0NXStuwg5yS/H48OB75xkIvlT+H4Q
 VgjdtDjVKRQJs5sCNKMk6ncYAZpPevebsWaQIM4sXfuKhYkkPuXITf2TeWZTA1T7trAd
 nOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717639359; x=1718244159;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2QdOJgbAl50VR+ODfvH7gZ+/T+swJOLHiP22D6L4FU=;
 b=RTN0prx7fhIXxnHogzD3FG/VwE95rX2lTdZDWxVoZxqaJveCO+C1tTH3p0G16ujIdW
 Asm8ou/wwwo2cJ3rVq/Mz/7BzrbRIGJPhGUWxgxpkHBLkZaE8s1owxNQcuXYdRotNf4r
 HguVIJEVseUcsxGqyjrcQtpazy2WEw+yjpJsOwO6qmiY8IhpZQoJE5zbvbvlw9qolfIg
 gbVSFBFXMkosZuv+aIKqVx2vZspurAHzr/uJ1UzhnrOBAoxlXWIWyie4gaIqdlNU7UfK
 DZRaRE4SeiPLzjJ3A0sZoFTOEae6BZbccXfethKffiS3SenIw3Rq9TK7BSRVJxMq17he
 +oyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+9PAchJorHoovJ+40BLQ156EpX2p6fes/YZwT22b95gvpYRFx3WWQjllINz0PDT2ihDE3IZbi9MYq6CcuqznhmuSQHOb7tRuMYMqWpm2o
X-Gm-Message-State: AOJu0YycuJ1t4gzpQDv+bRhgJR1ql5qg/v/e3q8zrOVpkIag0lOlW5wU
 mWhBRKlIM9noP9Yzh+3k3KqAdVOtQwoYV03A04hB0mnqCrf+7jBt
X-Google-Smtp-Source: AGHT+IHSlq08K6ZWDsLBXbZsGjCQVfOxpwCNbb3VH35IvWPENt/ubsieRel0edwXuueEaRAnR54btw==
X-Received: by 2002:a92:ca0b:0:b0:374:a7d0:b0bc with SMTP id
 e9e14a558f8ab-374b1f3ee14mr47382305ab.23.1717639359104; 
 Wed, 05 Jun 2024 19:02:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6de28f37482sm164515a12.94.2024.06.05.19.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 19:02:38 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 sumit.semwal@linaro.org
Cc: Brian.Starkey@arm.com, benjamin.gaignard@collabora.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jstultz@google.com, linux-kernel@vger.kernel.org, tjmercier@google.com,
 v-songbaohua@oppo.com, hailong.liu@oppo.com
Subject: [PATCH] dma-buf/heaps: Correct the types of fd_flags and heap_flags
Date: Thu,  6 Jun 2024 14:02:13 +1200
Message-Id: <20240606020213.49854-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Barry Song <v-songbaohua@oppo.com>

dma_heap_allocation_data defines the UAPI as follows:

 struct dma_heap_allocation_data {
        __u64 len;
        __u32 fd;
        __u32 fd_flags;
        __u64 heap_flags;
 };

But dma heaps are casting both fd_flags and heap_flags into
unsigned long. This patch makes dma heaps - cma heap and
system heap have consistent types with UAPI.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 drivers/dma-buf/heaps/cma_heap.c    | 4 ++--
 drivers/dma-buf/heaps/system_heap.c | 4 ++--
 include/linux/dma-heap.h            | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 4a63567e93ba..c384004b918e 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -274,8 +274,8 @@ static const struct dma_buf_ops cma_heap_buf_ops = {
 
 static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 					 unsigned long len,
-					 unsigned long fd_flags,
-					 unsigned long heap_flags)
+					 u32 fd_flags,
+					 u64 heap_flags)
 {
 	struct cma_heap *cma_heap = dma_heap_get_drvdata(heap);
 	struct cma_heap_buffer *buffer;
diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 9076d47ed2ef..d78cdb9d01e5 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -333,8 +333,8 @@ static struct page *alloc_largest_available(unsigned long size,
 
 static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 					    unsigned long len,
-					    unsigned long fd_flags,
-					    unsigned long heap_flags)
+					    u32 fd_flags,
+					    u64 heap_flags)
 {
 	struct system_heap_buffer *buffer;
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..064bad725061 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -23,8 +23,8 @@ struct dma_heap;
 struct dma_heap_ops {
 	struct dma_buf *(*allocate)(struct dma_heap *heap,
 				    unsigned long len,
-				    unsigned long fd_flags,
-				    unsigned long heap_flags);
+				    u32 fd_flags,
+				    u64 heap_flags);
 };
 
 /**
-- 
2.34.1

