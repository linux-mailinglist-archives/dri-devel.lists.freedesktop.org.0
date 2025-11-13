Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742A5C580D8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AD510E842;
	Thu, 13 Nov 2025 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PmRGo1ok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4762210E838
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:41 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6418b55f86dso1508879a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045620; x=1763650420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ok2RdBzpSpHLhzykCdEYH0j446EshY49nM35p1BHvz8=;
 b=PmRGo1okMEZ58QYnLKMm7o0nisCwhjekgHnaSNC/6CkCZRWDGxD/ZI7O16aPqVR7Qb
 JZfrz0DUORngcHGm6XODlxFYM9S3vkY1PJGIFOWqKjoax1QgDcoXklxFLg6xevqcfHBl
 l/RdIC/LITYHGuAB8rFA2vZLcZMxycdJ6TWi8dH4Z79Mklf8xGxaN5JwWZvkwQFOSvlA
 HMSrkyv2EQeAnJKSraHCxRcclk6L3Y/nSOJkZQXOEmmk1xnpfKdb1j6tVgYmxCYhSvlz
 3GzPIose4LNbUY2X3z+Ym54R3EqCwgx/3L6vVJKQ7Ygbqvbsb1sArLUylW0ihFAjBJSr
 MvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045620; x=1763650420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ok2RdBzpSpHLhzykCdEYH0j446EshY49nM35p1BHvz8=;
 b=wVUY1K5R6b9SGt8kwDX+N5TGZwLdU6ERsehUK89Xp7jwuRm/2DRjwiRE8/bLylvYB8
 0O0n12zn7cxbdjoE2zxF7Hx/Z57VP2erhFouxR1B14ekqz0+NfcgXF3zK0cEu6iswFMX
 zqUVfZ3r7n9MXTb6uPNe7BbKiyBLiM4O/X0bSXYlk1SvgscR08lO+ivd+scwxkYNqIGN
 ud32I06EMVfvcsuyyeyug7JhBt3nj236bCA/NTzSD3Rko7z/uqT1MYqFkVIl8ip6XXTc
 zq3odtgeUPi8cNNHtZxPsCYfuj99GI2ePi2L/nmrwmBPyr4r2q6ui0s0uxvMxPIANxlJ
 7R7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZAPa7rScbso2kNyf3AG5KFYNdkPQZjIBmydpsqXBQvPOJWyiu0nNP8kX5hyVeHGnFV0ZAhqQXEPc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj29eun/+l/MZSZaASkv883k0rknID83IUbmmzPmPhoSkD9JZI
 FJ3I1HsYkI7Ph3nomFUHProOqeH+0UIoGA+yFhpgCnq5PjaYfK7eHex1
X-Gm-Gg: ASbGncutnHEHaqtJIeywcrsVrbvDnI31uybvSb5558qh3gHzbJB+OtUAka4dEy2vde/
 LFOE2dBk5bUnGmG7t/Zq+WVB/rRRgYmgq1ZJhBtRcc8GfZDV6Au2Vk+ycTyWTKp0dpC4xTc9vNe
 TgOPFL8GS2F0aCmE2hYS0etnQdb+X/JyUl4ub6Rm5I+yab3r2B2BPqj5yYMqn+5AMB0vmc+D5a2
 MdwDBnLrztkDczQcmLshcfJu6ZnJEQV22sytmkdEQfQQOjqE0/51nWQBZcUOa1XkxAFsA6Qve7X
 72ntFKMvk2QxhtAmNhsgRh8wIxsm5kPCRK5Pvb8kvomcGtBl9FpQH3BYwP6RZCjtb96D2+mTCK+
 nkNfHrYe7eDCh65GbD9ctr1kjux12SvWxVNoiQjs7eoFSBA3lPyD9+LaB7r4ZEhTgAfft7loh9z
 3TeHSGhvbfsSI=
X-Google-Smtp-Source: AGHT+IEVO0VWis3bbMJUiE8uRIugN/ybdSy0+PSRpX0sJIqHqRSuLB5xwAdqwXMsQNdKZzGuzi4zRQ==
X-Received: by 2002:a17:907:6ea6:b0:b72:91bc:9b35 with SMTP id
 a640c23a62f3a-b7331b5f4e2mr767267466b.39.1763045619679; 
 Thu, 13 Nov 2025 06:53:39 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:39 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 06/18] dma-buf: use inline lock for the dma-fence-array
Date: Thu, 13 Nov 2025 15:51:43 +0100
Message-ID: <20251113145332.16805-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113145332.16805-1-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence implementations.

So use this approach for the framework internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 ++---
 include/linux/dma-fence-array.h   | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 6657d4b30af9..c2119a8049fe 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *array,
 
 	array->num_fences = num_fences;
 
-	spin_lock_init(&array->lock);
-	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
-		       context, seqno);
+	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
+		       seqno);
 	init_irq_work(&array->work, irq_dma_fence_array_work);
 
 	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-array.h
index 079b3dec0a16..370b3d2bba37 100644
--- a/include/linux/dma-fence-array.h
+++ b/include/linux/dma-fence-array.h
@@ -38,7 +38,6 @@ struct dma_fence_array_cb {
 struct dma_fence_array {
 	struct dma_fence base;
 
-	spinlock_t lock;
 	unsigned num_fences;
 	atomic_t num_pending;
 	struct dma_fence **fences;
-- 
2.43.0

