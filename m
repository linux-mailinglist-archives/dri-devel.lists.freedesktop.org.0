Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F49C580DE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 15:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE8610E845;
	Thu, 13 Nov 2025 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="URCGf1TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245EA10E83D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 14:53:42 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b73161849e1so148161466b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763045621; x=1763650421; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2ma830UDBT4pjVp7KvmyTGIRgR1+38znq+/rAoJE0o0=;
 b=URCGf1TT95AziNZ92auo7pIYEUemjo9N3XnsqyjHccMR0qmSuIx24r6jQ0LMkyPpNl
 /3zqGFUasIwfCpHQbzKysAhjVqm0whNNDfTswRUeOFMgk0k+xcenL/LbQjIYFxFHpLtd
 eR5M4tzkJIxZLD9DEcH7k3ra+WIYQIFxKF0M4GYJPpAS8POZcL70yUruA6vljAL5NKDA
 J7Qh2E0A0O2nCmvJRtUItrG5N59ePUa/a0YFPVYQWOdkUBWPtsIUvtNg1cop/iKfY+af
 WgxVyK+9Boc3GfzG3CxZ+8TmyhSjmIaeM5Bn9fRz0Z7RqpFz7eS3Ih2KdR2GM3IsTKlZ
 2JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763045621; x=1763650421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2ma830UDBT4pjVp7KvmyTGIRgR1+38znq+/rAoJE0o0=;
 b=YvUigeq1OrOwUfUkmobIJ8h/43V1VD3yRO/vxvZ99DjmqRYhy0er+ul6r1o6JBLmwG
 T8MYtr/+3NjrFOzIKMz8IyaxXASrXnWETwm/eMUkehk0MNKqRDLkjBuaPlAbM8XOwjxZ
 lkiYu0VPZ+SV6dmldlH6/4LCBMkdi8nRX0Lg+JSTMS+BtQuFhKlYFz0GimZwuG2mFJiX
 OdXSy6pqq0QfuzIhAlDGjM36dJ5DiqXlGb71toFvLGKSc8ruZx/Iq6NZzLEms1poB3EV
 FIdog9vixjLzH4N+viaCZNrM4W/L7CSZRYii7XctljkWZDN6dWMVPnZMnBO+yv7uBGI4
 wyvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTMDUwSo3AK8jpxccZGcGGvidevbSBW9YLmEv7ACMpipCKOTo2MsEilVNliOlPIH5Fr3sv2j0JDlI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuPNTOQZCNvhr8ULzydmZcy+nfC+t+MSiE72/riYivRfmumB8M
 zXxAOFpepbrazwS18nRw/k6MANXrDKAqcHMznKRuev4800mA2+NX1hgD
X-Gm-Gg: ASbGncsQAd4RK7Lo6YW98jRX8zzlDnzPSRcPAui6v1yvGc6/EdN2P7EG5EQ9NNxsKIh
 Tdh9x+yC82LXZiLbuS5aAlWHB7iOkvejWkRWofR30Zxa7uhd+N+Pls7OmFXkvYOcKnYc8s+4rs/
 RaSemFzzk4E3aUcgLlC2oh1bJq0kvttDSqoApr0718NyMeMRIe+hyp+stFVnnWEFqM1pM6+XyqR
 cP6JT2pQIln2HM+U8Gp8P0s8sGwktg1e3d1XSXCTYX44LtUxiwX7BBBT1OZjYkgjAOLaAuuN9jW
 KTovpu6NA18UmY2Tn8vRJp+/g8Dga6GeWynJm4kk4BmXwHaJ4BEI3ewjLOhjSyUn5cVdx3vT+jL
 3dfSCuaKtWCFbOGx7SPS4/UwHJy3rcpnGyif9YbQ48o6jma2/g2/OxsBXqIp7nPTv48eM3QCvg1
 sn9l7+6vVk4XI=
X-Google-Smtp-Source: AGHT+IGmTxRltBDCj6Rm69m8Ui1k6YY9cv5jYHS0CdN2mzixtVtyrx5F6p+iFVQIfWYtnTMy2kFBfw==
X-Received: by 2002:a17:907:96a1:b0:b72:1ced:f213 with SMTP id
 a640c23a62f3a-b7331a5d757mr684327766b.37.1763045620550; 
 Thu, 13 Nov 2025 06:53:40 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15aa:c600:cef:d94:436c:abc5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73513b400fsm173747166b.1.2025.11.13.06.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 06:53:40 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Subject: [PATCH 07/18] dma-buf: use inline lock for the dma-fence-chain
Date: Thu, 13 Nov 2025 15:51:44 +0100
Message-ID: <20251113145332.16805-8-christian.koenig@amd.com>
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

