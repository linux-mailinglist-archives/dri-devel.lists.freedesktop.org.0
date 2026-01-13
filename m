Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3BD19D44
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DCE10E4FB;
	Tue, 13 Jan 2026 15:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XgbQpvQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B0A10E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so49065485e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317695; x=1768922495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYku39UephPzH87bV5o7gFOD8YTXLIOvx7ykqyQPsdg=;
 b=XgbQpvQDrUzHRBvh1DLPMwzYBmp1tM0jJvMoru/Omk6Nom43ryKzwVAk6y5Cx3X8H+
 fFmFdR7nVfI4aRUNTGD9T1yGSJHCuQ5b3KpKtzN8imKKfyN/fGCdFOzduhmhNfD+Zksc
 lj8aK+S9J78fgZJbp36T1ow62gFKZ46BYlfN7wQXZ+63Jdul6yLsdHyZZ4mMZNw7zlvW
 ejGga1JBU6rCnPCwUIfsQP7bHORyu8Y9XWZzkOx5gjukxoFO2RqBx+JPLQaeW1FybGzQ
 NpGSCsyVJxoLMj0jDJQWORxT8OlF88wkzIk5utidXokfiCbTXADK+mIPq9tuJwkZL+yW
 ARVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317695; x=1768922495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oYku39UephPzH87bV5o7gFOD8YTXLIOvx7ykqyQPsdg=;
 b=LtGF+cdQNoPlqCdA7GmANkXFRWyktVYC29FZtHK35GKBPXtPIrU+lQsm4EgWm40PAZ
 VEmjkuzKJ0358+LqANc55TA3jViN3oSUQngWD8lwyAhvcnhy+mC5vqQhWTDIpJa6qDOk
 7OmOB/fnNO184B+OVfN08ueDuTf/HOrrbYzJMox/KYpdUXgy4r9z/K5OuOMGinzKm5NG
 JZq5nF8QFY9HDKqF5JU2vfXODh1U2rjVDr227I9yud3oHOB+628EqgDpJm3IQRI0kbNQ
 CsFtHtCT9QscdeRWReKgJ4sIWu5KPbfPoJlsJLC8BhBIwwPfXroDlL2MaeNH6/TPdJtG
 mekg==
X-Gm-Message-State: AOJu0YxL0phzIb+Vxmr/te1BAy7WhGxKXTJL25L5HHBBwIDrOPkwj0+g
 oi/iNKONez3YK8FLFHKG2NajnfkDXFSJvJNSmHBvzOKNg/J3An+fzEC9
X-Gm-Gg: AY/fxX5jOMQBUsdj0rrHMq+ZhjEcwPvJWQSqdsgGSa4n+Kle5n3+BcLFiSTnxrtOhaI
 n6W0Q3Utd/TDVnBF5Td9zXM+ICd2CQylvOOskW4gWJzvVTcnXkKBWcTpcir7zQKZvun0RGQW8f+
 7zT3Ry0aWLd/jAxx0VTHK66TA2N5kI38LOapdBR9Mfv/1kRc2fhIU/tXFg2lu3mwnSTQWa3nKjz
 hHMJWzaT3DvKVZGc2gfFNv7x2CJpeVr+RariML2Z3lxirnH6wLCgH+pLZDkXcxj7UHZJZI3WnM9
 0rfgdR9XXu9cQzCeUSlAoJfflktI6fswWP5bWWqPSt3h6xFmHgTgf7bYStvs4565Xkxh2NQ1dca
 0BFqSUpzYCE6pdrZ+7OgSHV4X/cAjM3NsWCpwXTT1wIt7rvdh2+ymL14sq7F4d1OnENocVi/3iv
 CX+LbKA0BJwK8mQGVCnJ6/TqI=
X-Google-Smtp-Source: AGHT+IHFYLjOHfL9xnfNlThReRHo1eKo1qhi7F4npLm0SFdgbWx9FFE7CSCYMvhtegli5oewEaJ2jg==
X-Received: by 2002:a05:600c:a03:b0:47a:7fd0:9eea with SMTP id
 5b1f17b1804b1-47d8e56625cmr202698065e9.3.1768317695246; 
 Tue, 13 Jan 2026 07:21:35 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:34 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/10] dma-buf: use inline lock for the dma-fence-chain
Date: Tue, 13 Jan 2026 16:16:16 +0100
Message-ID: <20260113152125.47380-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
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

