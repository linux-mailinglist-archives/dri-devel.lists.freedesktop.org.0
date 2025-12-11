Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7136CB5CE8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D8610E7F3;
	Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AhueDlyx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3992F10E7ED
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so301285e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455856; x=1766060656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Hce5C1nspfSp6lJoBmBcpKxG2pvG1GeGisuj2PvlXY=;
 b=AhueDlyxzbzL264irT1Qs2yv60ux2NjlAREQgS2+fgcfumrT7L1tjz444GKaswuQVc
 BKa/P4Rqn8klSYOeFwx1VP7U7FoKqct8BIlfD9KteuteruYUjz9myE3oO5LEbbwLnyuo
 kCvml5SJAILgg8QgjPp1EkZIwIz62GpNZp46rRHCB5TtEpV+ljDOxeJ5Xgni0H8WZgul
 qoYMPetAZduWXOHv7Ppqmj//17dgEi586aSdXEbDZ+aJm5Hrb7qg+08aQzpfbmOzt3+/
 EGIYd/O3VvLeQwgKS6PeCxFbKxCKg4V7OHX7SaPd/9sf02db2iUChIpkHCEYmeTyAB4Q
 CBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455856; x=1766060656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5Hce5C1nspfSp6lJoBmBcpKxG2pvG1GeGisuj2PvlXY=;
 b=koIqtESMmPDC+vYthJcS3GMG12QrHYLuBX5LuFxrqWz4Yio7RY2Hl9x9DjTsjNoVa4
 hnWr7AzCYYUEoWuxBf9AgtCGtJs6TK3vxiBvcvK+58YONN62pSujGlNhuxX3UkTOKEym
 sQ2V7BpP+/kmravzn9RLrwqHOOpflgTW9C+1JPoW2cehniFh41kjdLw0ixHvgJqt/rNE
 lcIL2wzhneUJsHPvwnxoG1TYk9yFXXeujTG7Av8/LUMxrMJay+pYXj+NozfciNksjiOF
 VPoiufe2oYGKG1txaKx9AASO1OxP6Lnv8GH+sIRJ3SA8QYbu8njoVYaCQdzKed356eS0
 dO+A==
X-Gm-Message-State: AOJu0YwLqmt9y40z07HvmXkA5l3e7BA2zW0NtjEH0q832b/YatiKANQT
 habZ5hXe+m4PIsA8DMDlc9oZ4xWwuV4B/sc/GbLraGUk9DJiO2TG9CDJ
X-Gm-Gg: AY/fxX5ahJZxY8aGQXQd1vVnrp9X6u8APaYHCG0hV+7Fp/fDofTml0P0Qfp/Ik0TAy4
 jyxG2HzOYNjWakw5wxpEq7jw1iH2Iil3M0varahbYXifoO5yr9ak1NQ292c/RyslpS3/xXKd3o7
 qrK3HgqbiGbiJkbkkYmSwoeFVyl9nR96TJoKdJ8c0gibZcyr9bcr0U/va4EbWGMmEBr9fbwi2tW
 10JZWy/VsDxT8z+y38+0VP5xeBEtb0ioY3TwVbG+LxwDO8ymEfm0q8eDdesouTkksynTHieioT1
 UVm4QzgvQfFxxVTjEuUqP+dUO8wciUcNTPrc1xf6mSersMQ/oer+Pg5OD+AIydo/oXumIuJtCAh
 EUH3g+4kSKFRL7XOIiwlRXUxXDPSubiP7UScwEkNvu8IWPc+WtNWS3+yjV5qujR+Vrs47FZDcTb
 tmaYIErja9K4Mp0UyS4xpVl9ag
X-Google-Smtp-Source: AGHT+IEwHuUSi7Vps6RXsKW9MJSSoj5i4GSLWZDKYpHJEY9Mm1ABIJndgpykxk/5jrfSj0nRUJlrGA==
X-Received: by 2002:a05:600c:198f:b0:477:55ce:f3c2 with SMTP id
 5b1f17b1804b1-47a8380c866mr57150495e9.14.1765455855662; 
 Thu, 11 Dec 2025 04:24:15 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 06/19] dma-buf: use inline lock for the stub fence v2
Date: Thu, 11 Dec 2025 13:16:37 +0100
Message-ID: <20251211122407.1709-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211122407.1709-1-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
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

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

v2: drop unecessary changes

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/dma-buf/dma-fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index b3c1fb990621..d1a9a1cdd64b 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
-static DEFINE_SPINLOCK(dma_fence_stub_lock);
 static struct dma_fence dma_fence_stub;
 
 /*
@@ -123,12 +122,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
 
 static int __init dma_fence_init_stub(void)
 {
-	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
-		       &dma_fence_stub_lock, 0, 0);
-
+	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&dma_fence_stub.flags);
-
 	dma_fence_signal(&dma_fence_stub);
 	return 0;
 }
@@ -160,11 +156,7 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
 	if (fence == NULL)
 		return NULL;
 
-	dma_fence_init(fence,
-		       &dma_fence_stub_ops,
-		       &dma_fence_stub_lock,
-		       0, 0);
-
+	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
 	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
 		&fence->flags);
 
-- 
2.43.0

