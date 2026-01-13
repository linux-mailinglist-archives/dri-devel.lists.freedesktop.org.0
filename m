Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E694D19D41
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5606D10E4FA;
	Tue, 13 Jan 2026 15:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RuMlAkYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B2110E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso44655565e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317695; x=1768922495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbpPVrzPAlKs0sk1NH70zC7B/mKS9m8HRr6Hh0Ntmuc=;
 b=RuMlAkYImCuu276IUoyimlz71hcYS367eKUDvVqhQ406NahrNhCf/vfpMURRZHFOKE
 Rh92mkwURkStW0LHap9rJp5egNtPBLluBBVlvjzN0Klz0WFQe95IOSPteLe4G3HdnSUK
 8kOCLQWT86+gYhOYpAvUqd4ItxMn0X0VknIr6f12nIMrkbTTxyq5NX2rkd7NrKXy8W7u
 /grsgEqWI46GuptwXyCPhs/e6iupc2/IzkmXPCskiDr9HlBb3oyKwSMaiFYjNr5ye3Xv
 tbfTPmTz/UQxmbHfNRv65NbwxMrHPJ04KSPdClql66608BXEMPfpKzHlrrJBmQMOFH9n
 Zi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317695; x=1768922495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbpPVrzPAlKs0sk1NH70zC7B/mKS9m8HRr6Hh0Ntmuc=;
 b=PWToCBn85INaPClv2i5q31oPdHdn54wfZFcYWYExUhRx/S/6jXB93ws8wVtH7XfcmH
 lkuDn2qU+P9vFqs/Pn5x9jaX2eiD5hrxj92Gj6BKY2tcvsJw3MC59PB8kPsvUGm/TMOK
 36ks/RPtvjMKiEBcU3OrBNf6DODKjm5zt0ILeiUHcTEMEeYo8ZuTJQvcyn4DF4s+pNkY
 4bpYHqgWuQzFCbdH1j7tT380l6sMuW+xpQvtYSJjIHX2dJkjvhEcdYe6kZlD2gj+yzcI
 k3wHyGW5eVAkCxfjVWaUSoM4uteOyDmB/NPEdCLZlyB7ohFaUvSFLTNS9Fb5Szhx0pCU
 ATEw==
X-Gm-Message-State: AOJu0YydquMX+n9vKFgCGKBowGsCnRJUr3YfviyCXZGN54uNedvCmOC0
 PMrhUmTmHv4Hh2jPuPMF/ku/WGyd6xVPbO9zCopvFpncaDrEBEa52C7/
X-Gm-Gg: AY/fxX5HR/oTIjJ4lBq0kAxvu2KOP6z5Pz1OKGo8s6nbQxz2Ib91el+7PCwecjdn1rJ
 LnwyjFd9P+N1qPMRjjhxRGtYLsJkLyUhpyXOJVyvbc0SvODlrMbYFzzXlBPmBGvrEQx/EhcR2CJ
 DKMj1RJ4l92YNUjfQvV2+Q7i3NISWlmmnmLrL1U4NANIO6tcpdrOJAJJEBaT6huYG6h4iLyHnLg
 5L5J8po5vRHXNygQonBO06b/scCkxd616431zJ80S++LyYP1YfmVAD9YWJTKpk0U76Yfhi5kTvd
 0RzGNM02YVxah5lphoUjecsStVQPSggDcuGDh69bXbSQONNqjzgM4ysCyaojkYonUTbLqDba4dx
 BroVhl3Wu/uXreCaUNT264JmaLcq7Mke2eA0yzYovN7iEYzvTIsvUr4MZ8GAF/Wqq2INlockQCm
 M4wjOi0bTPuofW9azKppyhUNM=
X-Google-Smtp-Source: AGHT+IFfDcW9DTWNYbgsZJYWnfp9RR0W8unVvXlkipYHM1zn9dG94+cG+2Ps331dUSUgps/rEuOAUQ==
X-Received: by 2002:a05:600c:46ca:b0:477:aed0:f403 with SMTP id
 5b1f17b1804b1-47d84b0a288mr270178005e9.8.1768317694564; 
 Tue, 13 Jan 2026 07:21:34 -0800 (PST)
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
Subject: [PATCH 08/10] dma-buf: use inline lock for the dma-fence-array
Date: Tue, 13 Jan 2026 16:16:15 +0100
Message-ID: <20260113152125.47380-9-christian.koenig@amd.com>
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

