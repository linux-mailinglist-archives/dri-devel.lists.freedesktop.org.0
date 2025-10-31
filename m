Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3A9C254ED
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF3610EB63;
	Fri, 31 Oct 2025 13:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kiqthR5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD57810EB62
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 13:45:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-47721293fd3so13297595e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761918301; x=1762523101; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r+M6T90aofvVrx2e1vqwPoDjqCLdEjx6BHMLbVIttJc=;
 b=kiqthR5HkFJa3oJv4kf09BX6GQh+oRz4EQucKUfZoKTmLU0prRAQpggPuRn+jHAjeS
 IaNw4sLgLLYjcnfW8YDBkTAmAikm6hiN7j7LDTrJy10P62Vp4AxmfbF4MoTbM4P9jGc0
 Inelk1on+pK2r4O1bUU0I8jpB29cEs+po2MHZxPU5TyhoiVnfxVral5ArNB6P4A1iP56
 x59egKyvsdIzVEk4KdUDJyzxd8d+b8ds184pvSAeZL2ZQnkQXovYLOD72zClR3pz/Mch
 vtgi9qZVOYa+eA3OVEl/E4AbuSlTdaQNVAnniZ/BBOPAv/p5diVafuspmbwXpAQ171TB
 +FoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761918301; x=1762523101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r+M6T90aofvVrx2e1vqwPoDjqCLdEjx6BHMLbVIttJc=;
 b=mLoqpUXbXyWX5XMpGu0urJkhCBeew4xlVEzdY2x7glWEehZ1T4XBzSY5jjYo2q3i+h
 2CjgFtpmlqtJDAcMj+dD7ZmahGox3Bz77xLl+6DiAdEdWKnwMtD+9FR0nb1zYZWo2Y/j
 B7onXWsqCiC2pgfFZLfO1chdcdycPmIFadmwZ5bi5ISpCgkqKWQuNXvsmBbjnrTnm7ol
 wrKJtozqjqNjCV0TAiaevreOaD8Z5QYPSq3pAU2JVmw7a+kia1TWBT+/5RRfjSYX9z7N
 zdU2gOFI2lOsBQrJ8GqPNmjJ28yxDQs2rFaJL1P7GG1caj8brHpulFYxVuaHPthfrvFX
 5pgQ==
X-Gm-Message-State: AOJu0Ywrx+w3j1kXZGltzN0e6hqDa8J1UFGOHxOVpCP3PRi0dnc8/HgJ
 ZAXeLfjCjw4ae8BMecfO6TPy8mPo3eZY5OFFTG69e6EsJ3U3hWDYLcM+
X-Gm-Gg: ASbGncu0WLERMTx/ll4B/pWKJtiF/9PcILLOL2Y+ywsjPqtWPEt9rNYQtjMmMjoWAVz
 HfvcOUw6h+JcLWTLlqp3fj4zJqOUDmaFqntUzVIN3qTrpYxy3I/c9s2M/VYJaBwMelngMvhcvdB
 rVMJs33etjZA1hsHZPz/o6qTqhgTQavZ4ritylv4uX8NlPF+u7VVwwVHVk7wbXg11JlZqqtUo2T
 sTYkt/Opno0cSv/h7qgRcSvCt+sj96cB150uOKxOXGyjaIZxcFRC/WNEPv0BCDu14HhLS9Ctz25
 n2vYrCQ2Pxm5xzwWEFWOvYnYs2r4irR97xoIABr8G4I56cewUQvCH4F0rad8YV+EbGLefa7y7JI
 2OxZb9y/Fqgj9d0NgyCGbAUI92jtk1+5QmH7Q/0BHVy5QZ+haOJLa6peKnPDDWGIc4TzyvV6lm0
 xc0hIfmSqM+KUS2ltiDUYYu4cB
X-Google-Smtp-Source: AGHT+IFX7whiEu3T/ZniEyZKLJWgGOatI/5lyGdQEDOZSx8nSdql+w6Wj2GIpV8aiN9yL6yui9Uzdg==
X-Received: by 2002:a05:600c:8a8:b0:471:793:e795 with SMTP id
 5b1f17b1804b1-47729701baamr34765925e9.0.1761918301096; 
 Fri, 31 Oct 2025 06:45:01 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1599:7d00:73cb:d446:bf90:f1c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732fe119bsm34502635e9.10.2025.10.31.06.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 06:45:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/20] dma-buf: use inline lock for the dma-fence-chain
Date: Fri, 31 Oct 2025 14:16:42 +0100
Message-ID: <20251031134442.113648-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031134442.113648-1-christian.koenig@amd.com>
References: <20251031134442.113648-1-christian.koenig@amd.com>
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

Just as proof of concept and minor cleanup.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

