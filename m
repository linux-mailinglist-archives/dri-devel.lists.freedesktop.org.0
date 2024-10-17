Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B229A25A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 16:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327310E204;
	Thu, 17 Oct 2024 14:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0YeIvZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908C10E204
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 14:56:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43123368ea9so9657765e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729176983; x=1729781783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
 b=c0YeIvZPITyYoZtJN7o7n3y4v711ITmBLX02rsY1zDUB+p7TrnStsf0GP3TZSr0qX8
 /mlYbh0BRVApuMLassB/V/8bGfTpDpi06VD1BcDBiylCgYnyhmGzZ0/J6WD3aC9i3xzM
 wVVcWyH5+yrimvVW2h8DAPbFBbjgx/W9Xa4wB6oBS3Avrewi8qX42uCVjb9D3/VbjmBU
 o/FHmDVV+auaBhFtLRveiqR6xLPSp3ERRV12iNdlmogCL+k/Wlh9C/00I8efi0aMUF5v
 F4Foc0KNa1qVA6EM9hON4/i4/go2E64sJzWe6kJey9G9SuT5cBN4ZWiNZ2CAUd2P0ioG
 UDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729176983; x=1729781783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c6lgZ2s7gZvIQeVKB3cBzOcMl3XHl1CU+KIuW+CzuIA=;
 b=CZPIKZ7JLCbNeXdnVtuKm7JE5fXQsCdL+JosdFdSlQ9o3QIio1SY66BWTqrM7d9kCG
 J1V4JBvqyxAKakIzJ6vAf5FvY/4DV79GMqmq0+2AHZ71VsM9gJza6jDd4izlZd6Lcntj
 K00oryi2JB9VBGDGVmOFHDLEGy5q+rG33odwJ5Xyvu7TgrMcFNVtbNnopyLyKBsFXb/8
 4i1/lDtdUgUqSxdqL9leD9vxIDky9U6tB/gt0Oc2OGLoTVdGSayXFgRzBeVITdgQKr76
 4lPKyRfBCy2o6Tg/9DrguHQsoKOJCW1Pahr6MbmhlgW5U4FT8Xx3ekF39H52/SxwjWaL
 Juog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwXxZCo/0vmn/nXkaNeWhB3VPQVQRGW25AMcyI6MKcWLFt6WO5xCX4pwBeqY5kub0mrqFIwbOrt2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymdb8VEuFALtj+Whb1K5/zv9uLrrr4oo9IFFh7bk7r9rQgJbkF
 B/SIVsgk/XWRiycflLnsPFpRk0VDkhu0Eh2GVlFKQgSSR7xC6i5u
X-Google-Smtp-Source: AGHT+IHpmJLXV8xpXHikQQwDgsMns3py4eeEyAuR4qodjetWJLTKwogwGJrPxlwEahxuEo9YZRu/CQ==
X-Received: by 2002:a05:600c:511a:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4315aea0c65mr20192865e9.16.1729176982326; 
 Thu, 17 Oct 2024 07:56:22 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15bb:6500:de04:97f8:9651:925b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43158c37f36sm28670365e9.7.2024.10.17.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 07:56:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Richardqi.Liang@amd.com, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf/dma-fence_array: use kvzalloc
Date: Thu, 17 Oct 2024 16:56:21 +0200
Message-Id: <20241017145621.3045-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

