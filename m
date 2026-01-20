Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28DDD3C650
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 11:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB13C10E5B7;
	Tue, 20 Jan 2026 10:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kqsHKQNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B1710E5B7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 10:57:07 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so33193985e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 02:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768906626; x=1769511426; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLWyZeyXsbIZSumeJDMiBvdpxO3idF+WenF3yOzVdKw=;
 b=kqsHKQNGumDOyGtcw5bDYPuiMQyV7Fh/nzfw6G4n5enwPiNOnC49glGhcRNSTYPpCZ
 KEcdVq59f1x10UqtccD9nAIi1GvaHVp5TmC547ST9k1fGkRUD8WfGLIGD3mlAsMJU2xx
 MtfJiNSpuroopHqPI4XFq4OF6y6gP2JBC0Hzdd5miUW6zfXXig9tnmU1fBsWHw+JWTE3
 clsGV+KAJzgAaK9XuacqqSJVaUP5GhDgCqkMnnNbwoKrGp/XgXPnXgfLZm/CkNhTXiqJ
 sGYjOdMml6pttFrjzbPqYj8z+qqQ0+OUDCOnjeZqVsvVWJafu5uJ/YOcWbgHfxls3ONd
 ro7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768906626; x=1769511426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GLWyZeyXsbIZSumeJDMiBvdpxO3idF+WenF3yOzVdKw=;
 b=Tdr1/EdFO+TSsxXDGcyazyBUkARGR1y3FBsOuArevuJuQEgbCqeohT7g9bn0HjsxBF
 iWdyfGTOmhyIJ+U+/iRfcJWQWAHa+cPrK9jVQrtV9PJzjzqVnYsUhb2dB/52pZV8L2gW
 mQeKf2nvyjix9/SwlKurY4QqfJDd79xogTn5o5keuh22NIRDXFewkytMwKstcpRohF0X
 cFAC8dxND6Wu/sqh0fK5TtwY46OtAuUghA1rL3axNQ8NyMWeqOX+xFkY5KMHuj8e02p5
 B7d5ln4FLg0ww24LAuYv59jd8p8KfTtT3shw02itVAHo4HAIeoZF8JPAtTqGcxyK+av0
 MF5Q==
X-Gm-Message-State: AOJu0YxD+05Ek3jhwsqkY5/7SyGIZpNkG60JGaHolXkVwHl0arQIZIy3
 LIFx/aTmvDV7DATixcx6UdJryaTwUxLV/94rWjJ7/P00brT3rBUox24Q
X-Gm-Gg: AY/fxX64D4GzUvzKSOzgxRX7yo0CMe31L7/7H8aJoIgUmOg5+yS31p6NmK27Mst6Yy4
 2uprC8Ruzo1JBRzjfZUqgliINoo0QR+cAu2YswGkDTRwDkJZi4C8rIZx5DUpc/6hQRetIfr/y69
 GbcGHaGf8ucLhSydYsR+TGiYo3wWrXrAJDYFh/SK3trqW09I42TOHOAwYsDCIa2gxvDUNjBQDbq
 RxDLG2LnJIZgYpKJVR2bx0coVLI1DgLgMxCIwNGnF2HqjH5kmcfM23CZymLz1YH9Xd1fnJVI4Fr
 extZ82O3xz8h9rIAUqEVdVf8E7oU/XkHmFDz0ZD8c4a4ELhKTe5x79xxlUCyi1nbPDaw8M+JO+z
 99UQHZ7uuPZwh4gfb6RDk3R9MLW3R6RAPlrQ8OygomCk2+HdWprlBDm6lr4ruhqG5RleZokoQgb
 N7VW2zu57q10AnwXQxwlZubUbD
X-Received: by 2002:a05:600d:644f:10b0:47b:da85:b9ef with SMTP id
 5b1f17b1804b1-4801e2fef40mr157647125e9.16.1768906625921; 
 Tue, 20 Jan 2026 02:57:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1563:d000:1067:f6c4:3bf8:ea8a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe67780sm99418105e9.16.2026.01.20.02.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 02:57:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 9/9] dma-buf: use inline lock for the dma-fence-chain
Date: Tue, 20 Jan 2026 11:54:48 +0100
Message-ID: <20260120105655.7134-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120105655.7134-1-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
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

Using the inline lock is now the recommended way for dma_fence
implementations.

So use this approach for the framework's internal fences as well.

Also saves about 4 bytes for the external spinlock.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/dma-buf/dma-fence-chain.c | 3 +--
 include/linux/dma-fence-chain.h   | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a8a90acf4f34..a707792b6025 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -245,7 +245,6 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 	struct dma_fence_chain *prev_chain = to_dma_fence_chain(prev);
 	uint64_t context;
 
-	spin_lock_init(&chain->lock);
 	rcu_assign_pointer(chain->prev, prev);
 	chain->fence = fence;
 	chain->prev_seqno = 0;
@@ -261,7 +260,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
 			seqno = max(prev->seqno, seqno);
 	}
 
-	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
+	dma_fence_init64(&chain->base, &dma_fence_chain_ops, NULL,
 			 context, seqno);
 
 	/*
diff --git a/include/linux/dma-fence-chain.h b/include/linux/dma-fence-chain.h
index 68c3c1e41014..d39ce7a2e599 100644
--- a/include/linux/dma-fence-chain.h
+++ b/include/linux/dma-fence-chain.h
@@ -46,7 +46,6 @@ struct dma_fence_chain {
 		 */
 		struct irq_work work;
 	};
-	spinlock_t lock;
 };
 
 
-- 
2.43.0

