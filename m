Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AB9AE532
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 14:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1633B10E92D;
	Thu, 24 Oct 2024 12:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PDgdx5hN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0010E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 12:42:09 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c94861ee25so491036a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729773728; x=1730378528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sj6gTNhuF8KQ+mC8FcVavaAooc7DkgFZVC/sO2AOejw=;
 b=PDgdx5hNglIVp0NfehRz5AcHqzQoDRfffk/ZKc68XK+3RCdTDoRt4U9r3MAyauo21H
 uny93Pbclc14viFKdjo3+jSlRaUY4Sfb33FX5oYivxvJmW0Etu9ZjQIIyB2EXaVu/tbT
 zHhcsBhEsmo7xrIOQjGPSOJrvxODPtRbPc+153cWp58CjLjw4YvPm1D2OzrUeJqBBYaV
 XZdgq2MAF9xk/K8twkXomLcR4BZ3Ub8uUhKiNhlW6tf6lPjwBUb+hqx5RQVdorcOHBRQ
 LjCF7/PYROkvJoxU63uuv5MW2Q1vQ2m6+G4Vslqdg8/XXWk68qqLrIbVfC9RTddwWJL3
 RiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729773728; x=1730378528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sj6gTNhuF8KQ+mC8FcVavaAooc7DkgFZVC/sO2AOejw=;
 b=bUH4pM80X8bDqhw5K78Kg49ryuW/J7f4uovq0LINoEkPVC64L/C53hK2z31oZVTHMM
 Im60hQCLeyz4a8n5fptNAvMKkUijjy6EPuAZ+wnyRSdztK8NLxFhVZQyrVV+drBgxdiq
 aa0W3FBonS/z2w27x1lZXM1vYAah/+hAmBdfsDJnBw/b0/eUK2GRFXeeT6viJQs+kYZJ
 rO7qObo2LQypjqBHzIL1KLqpKLyGZJ0SIlqnT+AKQg2MvrKmrmDrfg3sPu3Qdjb2qnOg
 P72bJB86cDa8eTk8wadDwg+2xZlCEHTwlGMvUUibTx9NzxnOnriAs4Zrsk/h/qQ5lYEN
 6oGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/hdYr4dQN5MCBIyofkIlAubQlyrm71HDdWdK7Yp9olxHvZWE89ipARkxIGGHoRUIiYsmwBpCrRFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZT/vjJRmvpoLxHCt0VHso2WyLh75IvWUl3r+ILZv9K5DlMt6S
 8iktWeLkB+bmqZcJCEeHbs8lnQaMgFY37YJauXG/mW/XHfGKFNSP
X-Google-Smtp-Source: AGHT+IEEuTA8PMmVuhARSpT0IT9Dw6qAIi5njqx7dcLq/evV3H2wVxDBE4GcYae26HsdPCERft1Agg==
X-Received: by 2002:a05:6402:5d3:b0:5c8:9529:1b59 with SMTP id
 4fb4d7f45d1cf-5cb8b1e9c71mr5459788a12.20.1729773727785; 
 Thu, 24 Oct 2024 05:42:07 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1550:4200:da3c:7fbc:c60c:ca4b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66a65419sm5623026a12.25.2024.10.24.05.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 05:42:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: friedrich.vock@gmx.de, Richardqi.Liang@amd.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/3] dma-buf: sort fences in dma_fence_unwrap_merge
Date: Thu, 24 Oct 2024 14:41:58 +0200
Message-Id: <20241024124159.4519-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241024124159.4519-1-christian.koenig@amd.com>
References: <20241024124159.4519-1-christian.koenig@amd.com>
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

The merge function initially handled only individual fences and
arrays which in turn were created by the merge function. This allowed
to create the new array by a simple merge sort based on the fence
context number.

The problem is now that since the addition of timeline sync objects
userspace can create chain containers in basically any fence context
order.

If those are merged together it can happen that we create really
large arrays since the merge sort algorithm doesn't work any more.

So put an insert sort behind the merge sort which kicks in when the
input fences are not in the expected order. This isn't as efficient
as a heap sort, but has better properties for the most common use
case.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 39 ++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 628af51c81af..d9aa280d9ff6 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -106,7 +106,7 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
 
 	count = 0;
-	do {
+	while (true) {
 		unsigned int sel;
 
 restart:
@@ -144,11 +144,40 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
 			}
 		}
 
-		if (tmp) {
-			array[count++] = dma_fence_get(tmp);
-			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+		if (!tmp)
+			break;
+
+		/*
+		 * We could use a binary search here, but since the assumption
+		 * is that the main input are already sorted dma_fence_arrays
+		 * just looking from end has a higher chance of finding the
+		 * right location on the first try
+		 */
+
+		for (i = count; i--;) {
+			if (likely(array[i]->context < tmp->context))
+				break;
+
+			if (array[i]->context == tmp->context) {
+				if (dma_fence_is_later(tmp, array[i])) {
+					dma_fence_put(array[i]);
+					array[i] = dma_fence_get(tmp);
+				}
+				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+				goto restart;
+			}
 		}
-	} while (tmp);
+
+		++i;
+		/*
+		 * Make room for the fence, this should be a nop most of the
+		 * time.
+		 */
+		memcpy(&array[i + 1], &array[i], (count - i) * sizeof(*array));
+		array[i] = dma_fence_get(tmp);
+		fences[sel] = dma_fence_unwrap_next(&iter[sel]);
+		count++;
+	};
 
 	if (count == 0) {
 		tmp = dma_fence_allocate_private_stub(ktime_get());
-- 
2.34.1

