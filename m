Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B301CCB5CF4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167D10E7F7;
	Thu, 11 Dec 2025 12:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DjETXr+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF6110E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:18 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so93195e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455857; x=1766060657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYku39UephPzH87bV5o7gFOD8YTXLIOvx7ykqyQPsdg=;
 b=DjETXr+WahL86zxDUuiyEzsKxZPGOhPqWpuWoaJFkmMnJ+vo1exDlgQBpkOYAwsLa2
 l4NqstUKVku2LEubaxibZ0LBITRNId0mqUzFTjoLYnBg6Rl7lUSuhYyKeiZjXri5MAGH
 ErRB82KdWx4g0Jqa9o3gCo4ILrw+AilP3oPv3XNwwGn+oscwLQtcIAqu2/dlAzfQEM1H
 EIBY9NtBypS9ycI198Kqca36TvS78k3MaBsnNS7XxP5Y0w7Cvsn7QkrZ+yXFfLEsSiTU
 O1gClvXmhVcEcbUlb1u3C+Z7iMAtrGsePpheGyIxfrBMNVfuA9lACVdQxeD1jc8hEPNB
 dWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455857; x=1766060657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oYku39UephPzH87bV5o7gFOD8YTXLIOvx7ykqyQPsdg=;
 b=abjilY0VaLTZreUoPbZl2O/scvto4OrDqWT037Aili8Ak16s/rB/FEEd9owmrjzWLD
 uFRw7XoHwLcNzWZzr1tsDfqwbvKvcvXS6+bUgW79067VbN0vUO4C50wzF7IM6sCXkz12
 bOBVqxPem5b3SisGyhvFtZETO/rolAZv5YKpW8WTMHHM+jLKJZKJ7VwH+CkYMMU50hyi
 /Dw1Gsk0Iq6HcMGuPzNDZCLp3Ej8DqEDrG9Uouxe8l9RY+1RiPuqcitmJ7vf2dY0tJEz
 Gi9P+STLotx7WW0rvCfoEW6B2v/5NiXJ0uZnhNM0IScVuqvddAzwagls5i0ZR4xNQUWB
 Ijog==
X-Gm-Message-State: AOJu0Yz2bfazAstTpoGMjfPTZQN3x6nqOzbFUSs2VvQkBLXc0O9GpXmA
 pGD2iW1LnEx0KQ0/02p/kdEbLxww+MzYq2WwyGr/406U0MOA8eNVNKtZ
X-Gm-Gg: AY/fxX7DjNNRbjMDvKLzM8uX6b0QjfI8t3Z3XgeSw45TyuMpRtTZpXtU2oPPcMguPNr
 OEqt5sI0OgBN38Mwg/eafn4lmLBMyusK+cLxmAx2eokYWI30X/N1n6OMKlFNHpo8zcrZWPwZ7m9
 ZNReS1CIVr2tia8tOMmJAPJ5VeW6JnNUNGTvjE2Bd8nfE2XZwHd1V5+pVgAU9UuHVCOVsxQHH/U
 Ro41sLSOgX+7DNF5Y7q+ELxJin5IzE0rv/4/xG88dr/XpXn7jwyuOhURaTjSRkqigfYITeQplJG
 pa2+ca1ar4xAKTD1HDv+MRaH6ldrPCgKLyKQfJoVpOtlWNpZXGM0AuD3RUQCCT6etA/YgyrLjYv
 W2itccSSYBLALsNnLFuB0c+pE85sOScJv9FhGVath0poIEdLr9+HL3RzZxNRHt7cqviQl5fF/jV
 YJ2r47pw9vSfNtLpwCZ/bvAcHySMyX9YHTv8o=
X-Google-Smtp-Source: AGHT+IGFmkpbOj40NXr2kAYDhZLKuQD2WNIEnQh1NoJbEoelz2+0s7vsqtoYbSLROSWYxTm9bn5NzQ==
X-Received: by 2002:a05:600c:811a:b0:471:786:94d3 with SMTP id
 5b1f17b1804b1-47a8380695emr45289525e9.22.1765455857158; 
 Thu, 11 Dec 2025 04:24:17 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/19] dma-buf: use inline lock for the dma-fence-chain
Date: Thu, 11 Dec 2025 13:16:39 +0100
Message-ID: <20251211122407.1709-9-christian.koenig@amd.com>
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

