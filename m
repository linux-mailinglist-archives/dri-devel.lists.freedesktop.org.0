Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FBC9AE530
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7688610E92B;
	Thu, 24 Oct 2024 12:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AyA+tCDh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AF910E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:42:07 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c9404c0d50so906117a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729773726; x=1730378526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
 b=AyA+tCDhyK9vpcwK91aJABDSJ52TlfUQBhTjCQK1aO6LV7FmcbbXU6u2LsJLoZJyNv
 zf1Uycm/La1rb5jpgVtrxeA1Vhsd5JBoN/ouKRNDWNXCO6cftUeSIze6a/YiICi6eGRX
 fFgMhRpd7Smqx155H46IV8GF7KbmvE2pFDrCni64WJhvTsFHM7tx4OPxvbCuhQ25Vi+z
 TQ8ZPR0koSQTFgHfIrqJecAis7q+srcXpEzgonOAkfQAgUadIV+WvsXr9ZhVPfcij7Z5
 kcholn4MsbZi3by8aBzO5uxbSGYkooH2QH4rcMq1Y1/gwI4J1Juvw50iYwj7Fm87NWkc
 wyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729773726; x=1730378526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
 b=SxY+hUML8GEH82md/KdtkCwIM5MimVPyC+u6QK/Q1idDk3lCFKkfS9i4mzhQCll3UJ
 JXXzwDfRfqsiXd6kp5FYoJmpdvdul0Oz6+5Zp6FsbVmoqUSLbTSetvJsm0GAaX1+ZoQm
 LH/4HJ0nIcfmWGDito2aP5V4NuBV2pGObvcEOTEHbgvYr+k/gYul6HEu/g1RrWFi8Ex4
 vcBfiBXH+YFMI8dqCFyVxAmbTPvSHHi5bzDm2vVG1Z1TLmk3cHIhHlzkujNWFFk0iBM9
 faqTDVg/aRPnEc/X1L7MmEVQE1WCS+hFJ1c3HDhQHkaIgjYeDZ4NFcViZenS96EfvtK+
 iaSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqKlW1x3y2QP7sXmrHoUUCWfWn1F6GTjxW53N6sSOYKxHZxK9eY5Yh+JQY0JUjq7mnmoJVPeD0cFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyawhoX1+QITHVMg5jexA33WL7vmndN4X4LTLQWgBrc/BHW3pbT
 tCHia4wLxg9FuMgflt4XLCiAS6Sp5n/2NhrdHFZBVI4+OSnksKjQ
X-Google-Smtp-Source: AGHT+IEUBGWWQn+Dk6Xzmic0E/nCMs656ZBtST4vy2Vu3op4POs8oDMCCCvVt/vWJpaFM6t/9QMhog==
X-Received: by 2002:a05:6402:13c9:b0:5c9:709c:24ab with SMTP id
 4fb4d7f45d1cf-5cba242831cmr1565779a12.6.1729773725326; 
 Thu, 24 Oct 2024 05:42:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:42:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 1/3] dma-buf/dma-fence_array: use kvzalloc
Date: Thu, 24 Oct 2024 14:41:57 +0200
Message-Id: <20241024124159.4519-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
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

Reports indicates that some userspace applications try to merge more than
80k of fences into a single dma_fence_array leading to a warning from
kzalloc() that the requested size becomes to big.

While that is clearly an userspace bug we should probably handle that case
gracefully in the kernel.

So we can either reject requests to merge more than a reasonable amount of
fences (64k maybe?) or we can start to use kvzalloc() instead of kzalloc().
This patch here does the later.

Signed-off-by: Christian König <christian.koenig@amd.com>
CC: stable@vger.kernel.org
---
 drivers/dma-buf/dma-fence-array.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 8a08ffde31e7..46ac42bcfac0 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -119,8 +119,8 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	for (i = 0; i < array->num_fences; ++i)
 		dma_fence_put(array->fences[i]);
 
-	kfree(array->fences);
-	dma_fence_free(fence);
+	kvfree(array->fences);
+	kvfree_rcu(fence, rcu);
 }
 
 static void dma_fence_array_set_deadline(struct dma_fence *fence,
@@ -153,7 +153,7 @@ struct dma_fence_array *dma_fence_array_alloc(int num_fences)
 {
 	struct dma_fence_array *array;
 
-	return kzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
+	return kvzalloc(struct_size(array, callbacks, num_fences), GFP_KERNEL);
 }
 EXPORT_SYMBOL(dma_fence_array_alloc);
 
-- 
2.34.1

