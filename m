Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF29CB5CE5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2666410E7F4;
	Thu, 11 Dec 2025 12:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LkMAxzPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8EA10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:24:18 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so468215e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765455856; x=1766060656; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbpPVrzPAlKs0sk1NH70zC7B/mKS9m8HRr6Hh0Ntmuc=;
 b=LkMAxzPUsHNqHlmOQc+72767NMXHoOnYxQUsNz1JlFE6x55mjOoJUMIHuaa3+6QkvV
 c29pdf5PvHKPwhTJ09QXtzNFBVwl1K4dulNtPLXiT1qJZkw7pRfUnpg+GAHPkVoWWJJE
 bcSNhcO73MCydrL+qaqD5Grmt31YE6CoScuB8UK5F5YKOX2HachTaG5sX9XfrCpc8oDo
 9QXD1J0Z+gYwDHD0jx8lfsifDUtqtpaYZYKiBWyModC3/GCi+MUMUk022F/M8xeBlu30
 ZU0GcM/frfncPSP5QqsmlA7ZnClayvY02S4db7Di6m2lyozbgn1qd2b33yd/CL4qFKgZ
 LAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765455856; x=1766060656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbpPVrzPAlKs0sk1NH70zC7B/mKS9m8HRr6Hh0Ntmuc=;
 b=FJsHeXpVZepVIfmkfCHKmfACPWPPNX6k1UUmMMfAMxw1LvTiSo8d8x9saCcCc/fGH5
 NjYPQp+a7T+OacUygKQVG2xnhix6m0HVWqxmH8THxoMoskxl2/xOdS+VdLLvXB4Pakpa
 KN1reMdDpU0S4flQDfysqqvlKE6Dqharz2T9aT732ExQyZFmQs8rnLySBNtN6x4GfoPY
 Dg4N3i+jfbgtNxXaJan49VozoYhdb3ee/I47ZurI0qqBAODVpqIwJlefwL0J+RDgp8Ib
 OdqgSkw3TLGSWkfikqHRm8tWEuPbotV3PZgaIHNYDh7jjniOQeFxQJFoB6XW8c0iMYRC
 SP5g==
X-Gm-Message-State: AOJu0YwCrMw8F72Q1DwaWry6jZ+mxcZ+SOWfCy5x4tIj7Jv11XMwhdiN
 +ibC3yNoyVbn0qsaAVheRTLU3KK5bR+7exzbl3AGJ7t8ukLP2PWwTWQn
X-Gm-Gg: AY/fxX66PxEq29Z0mrv23PrLcOXTvUEJNQzPnjonC6QNUB+RYIJ1oDebcX5NmU4LRrU
 68rlp8I3vOI+jTDd8p+7I1oKZjWqRAjkf6kMLjtilvPWM/x3ohsovBc6Pv+CEzqiQMnpZTACT9c
 nU+PCL6OGcZ1TNQWPu3iZrfrJdgVipkt0jxsiql3D6aNUUg/tUYN5iTmhOBjw2VywP2uOeiQzgl
 ejNn7AQy+bwDpE87udbfMHQlmWlkGef/wFeCkuqgApNn5UNkyeHN7tSOeuQrmD0WGzclja5Zedc
 QSYKN7a3qdvXqlqCRPbRNVGqbnefbF1c6I+JvkZea8Ta4b5U0XVkkF+JS10C2SWZlkKQNWPR7ir
 OITJHZ2pth7L2W03/DqChKcBTkxhu9PC2GM9xyIIdgxPa/hQSvTWGFVXOgoEtAFBhmnL0ek94cq
 Uvi4PObwj8S81v03tVtAzfskSr
X-Google-Smtp-Source: AGHT+IEObtek3SSUISo0BK//+wOuSD6ufacxtT8fJlRFsxpyjHrhmJGAbig7vCojM0CY/HKswlW/NA==
X-Received: by 2002:a05:600c:8a0c:10b0:477:98f7:2aec with SMTP id
 5b1f17b1804b1-47a856439e0mr39020445e9.3.1765455856396; 
 Thu, 11 Dec 2025 04:24:16 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:152a:9f00:dc26:feac:12f7:4088])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89d8e680sm12172785e9.6.2025.12.11.04.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:24:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 07/19] dma-buf: use inline lock for the dma-fence-array
Date: Thu, 11 Dec 2025 13:16:38 +0100
Message-ID: <20251211122407.1709-8-christian.koenig@amd.com>
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

