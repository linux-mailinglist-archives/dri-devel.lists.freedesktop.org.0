Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDyOLPoGi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678811998E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:22:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC49510E54B;
	Tue, 10 Feb 2026 10:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e5kVNLdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677B310E549
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:22:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-4359a302794so2529685f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770718962; x=1771323762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLWyZeyXsbIZSumeJDMiBvdpxO3idF+WenF3yOzVdKw=;
 b=e5kVNLdJoP3rLo6qKWj7XGhvr+83ZYcCMSMUYZaZiPSXQcos7aC45U4nQLJanh2UBe
 7Ier+AKTU2DhvThrGJYf1WTqJm9WQ4ylYYLt/yVyLOxPY3fdtJTRrr4gM2fMB6epEujU
 cjBVub6YPFcpLqFGRHS4h6sZsuT+3I8GoexnnmMw9FQnw0M0CmCZvbc0J/TaNMZ1ixQb
 BFVfQHy1KTqfZT++uB52f9PH/QEyPOrJ/poXc5PsjeWlxO+SlTq79kq5z+qPv9uXoA5L
 3o3lNSor6O0D+GJkRvCaLKkru6pQOU1fnuRc3gfg7vMOtZQ1pkkm8VFeHOTJx+UIO1jW
 T4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718962; x=1771323762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GLWyZeyXsbIZSumeJDMiBvdpxO3idF+WenF3yOzVdKw=;
 b=mDMBMQG1I3g2+JEl4nL/1yQW/AYcG49sJFBvNy063OJ1OuPoWDlXZqB5xVNfUV8xfC
 xb9Y7b4rTdNwCpUPkydtRQTyzUlLvU0THtJZQ7Rr9N2p0QVPl1oO3OpTA82CgO5kDItQ
 oowc5QByWwi4ExqwThzJUUgo3iAiBodvJyHx1YYhwQc5cWZp9xljNzq3HJs9/tWyMAN2
 5OLH+GDFH4iXwuV+Wf7H34lpTLFSP1ZcR8Bt6spDVwelFZMLVfKdjI3uACwC9y+9P94D
 REMcouYg8vp4CB1ZXKcbGSxW1wbu2OWr/zwU35ZvYGvwxXSfIDz5rUmWpbIxyF5U3QNY
 SSfA==
X-Gm-Message-State: AOJu0YyuLMhAggJWtlf83vZ5R3Ys67hsmMhM5tVEds9GD+3Qx4ijXojd
 XTEocpjUK9PFw4BK465uu+okF0cF8s6p6oxuj94dtM19vlHOGBRYMQEE
X-Gm-Gg: AZuq6aJiVsJ8+xkvdhPXzz7U9Xza2MNeQnm363FM9B9rUIES96apd/8M+EGG6m746ZB
 ntT7F8plPwoplJgOEiHn6T5EtPj/jgSb2R3i3W7p6xytd5ms+GPu3Po1xtprH4Q60osy9Lw/KRe
 x5tGgBDjyuJ0c7uCpjCmknlVLKsYeLI7+xUyRNlIPDRBDPhBBiqJXla72psGhnezv8LXQwifbY7
 FXgRwkd8f1tPyCr32S4TX357DmiapYJhvjXnn5JFE8uClLWkmft/4mMtuZj2FcYG5cxfyrqL7JV
 7bBCi4bVYuoPHKucRYvJMCcs7rBhFCflTcTL1q94OMjIGf0N6dI+8YRUAKFWCpR4nDJknu5Rbpq
 xhTYvPf6WyIuRhEu/OewYlX4wrK5VnDWG1zaoEkIdnkC/BDWZZ0SGqMMd6nXf3HK1xNZzisr4HR
 EGU0xQzSWqLQwbflvki00OzpZGmb+KdXta2rRa
X-Received: by 2002:a05:600c:6290:b0:47e:e78a:c834 with SMTP id
 5b1f17b1804b1-48320226676mr231371165e9.34.1770718961647; 
 Tue, 10 Feb 2026 02:22:41 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:6000:83ca:11f0:7e35:a75d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm81549605e9.2.2026.02.10.02.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:22:41 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 8/8] dma-buf: use inline lock for the dma-fence-chain
Date: Tue, 10 Feb 2026 11:02:03 +0100
Message-ID: <20260210102232.1642-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210102232.1642-1-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: 6678811998E
X-Rspamd-Action: no action

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

