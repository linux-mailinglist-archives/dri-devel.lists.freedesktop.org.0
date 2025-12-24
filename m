Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F0DCDCC8C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 17:00:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EF61121B5;
	Wed, 24 Dec 2025 16:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="DO9sPwlH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED711121A3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 16:00:34 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso3633175f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766592033; x=1767196833; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WPLV3wvL9NAE3UtsIE23YG8DGQ+PHmmnrJgd3EHtL0c=;
 b=DO9sPwlHJ3mXMJX1GTGPzo40i/Rgqpd8NGRfJ3wiNa3PSFcoT0UX4GhwnBPT7SSq8t
 FRaLTIdF+j5exKs00Ww7ALtR5s9dRAtKbK7/F5rIWiC9l0qZS0fT7iibcRm8yf25UBQu
 zboQdNAoau9a6caj2CRCO1zmUAt3LvGx+ndR+GqgzBSerF+0NAysB5C+8Znso9/gMKtt
 kp5oWEX5W958nH08kTxsO6bI2GJ7HtkkNXoC+Whveg9kHV433t/Au2KeChqrBZ0YhHpx
 GKk2kfVe2s2FVs3jhLExdUcZWBQ0aCAybq6NoxezmeWRbm6FSrdgyh3Eq9yLNYgYMFng
 vJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766592033; x=1767196833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPLV3wvL9NAE3UtsIE23YG8DGQ+PHmmnrJgd3EHtL0c=;
 b=MtIClD0isb2xodTOuFZ0RvkFwm1nSWGb/MG3CbHgRUVXpqEz2gRloWSuVBd0rbTP+w
 9jZJ150uDR6Ng4rFCQXqSkZ8yOVtWXg8aJJQgMZLjxFE7BKLHyZpGpsvIyi4IsKEsbs4
 OIM4UyHAS9tNuioqk44zjsHP05Lk+M+1EN1Kmq+NHQz4qKUR2QW8qCX2xt8TqD9mjZSU
 BFc7CIAdZ8yNyDMCJi0rIBT2sQdtOwLR1iJ/YwCm2ceMQtcVHoqkLN+7UcJNCVd7ME5T
 NEn6OCv6zXZYEUI074pa1Eg4Ar5q1p6O/3b+9xaoRzm0VFyMDeK5iwdk2UoTVeNH4Ltm
 /w9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwurmgwOnsRmt7yZabzwUjecgjxrQDEw7pEp931nWrCE/Mf2WAwJZKSYAbblgXJoLrF47BR/cLN5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd2aWM86XeYXzsQiBk+4YOx24epQm1G5AsgRL27UFdKUBJ9UVa
 x/MJ2kRh/FRCa4275kVbqZfg6l7lb7+agogLCMqtzCp3JuuegdRCISqNsPame9Dh7mI=
X-Gm-Gg: AY/fxX5FEXSg6GX1BDHwDVTHk84oeuF5c6uL1JxXoXAi1jwgCTxo2WmBQ0ORBc8UEbY
 2Y5K9seklvzrdAyHG3cWqs7bP7p0mZCdE8b6QODrX4QhsLp3u3Qz2zBGDuCBFquxaGFvjFgzP1G
 q+B+/6A9D0T6xBTJ9b32y1k3FQZ6dF0Kv+xrRy3lSYbtp7TOoB/9x2ICfQ9tWiT4Mo7KHdTz2sK
 mjkMEuhi2hIW3TcuxLUcuVX9Mt0nm9ZM2YDaB12EXVFs5uXCJ2lY7S1bM2N6PukmQdewcHdFMCL
 xSkjTgbCU5gplfCUhF5OalyccBDy9ub4MFpBIbXv6vXGTX2HyAZLq7fyIpeNOox5c5nREUSeSZ+
 7hKq3rjUopE6KBU4tSIPKwOPxzjFLF/XhxCELTL5OsdVfMa43iCRQg6txp3MEFqyctLaZLgObp8
 kKbYyT0eRsGhnFw8BoncDmTXDSUQbpAv4EbPk=
X-Google-Smtp-Source: AGHT+IEtPcOSt2db6458wPTTR3gSirXBDv7upskcjRAWheyox8jLUmzLOEWtqp404CpxLRDdSHI9EQ==
X-Received: by 2002:a05:6000:2308:b0:430:ff0c:35f9 with SMTP id
 ffacd0b85a97d-4324e50d989mr18080262f8f.48.1766592032731; 
 Wed, 24 Dec 2025 08:00:32 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1aee5sm35553566f8f.4.2025.12.24.08.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Dec 2025 08:00:32 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@suse.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/xe: Replace use of system_wq with system_percpu_wq
Date: Wed, 24 Dec 2025 17:00:26 +0100
Message-ID: <20251224160026.124106-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

This patch continues the effort to refactor workqueue APIs, which has begun
with the changes introducing new workqueues and a new alloc_workqueue flag:

   commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
   commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The point of the refactoring is to eventually alter the default behavior of
workqueues to become unbound by default so that their workload placement is
optimized by the scheduler.

Before that to happen after a careful review and conversion of each individual
case, workqueue users must be converted to the better named new workqueues with
no intended behaviour changes:

   system_wq -> system_percpu_wq
   system_unbound_wq -> system_dfl_wq

This way the old obsolete workqueues (system_wq, system_unbound_wq) can be
removed in the future.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/gpu/drm/xe/xe_tlb_inval.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
index 918a59e686ea..b2cf6e17fbc5 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
@@ -94,7 +94,7 @@ static void xe_tlb_inval_fence_timeout(struct work_struct *work)
 		xe_tlb_inval_fence_signal(fence);
 	}
 	if (!list_empty(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(system_percpu_wq, &tlb_inval->fence_tdr,
 				   timeout_delay);
 	spin_unlock_irq(&tlb_inval->pending_lock);
 }
@@ -226,7 +226,7 @@ static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence *fence)
 	list_add_tail(&fence->link, &tlb_inval->pending_fences);
 
 	if (list_is_singular(&tlb_inval->pending_fences))
-		queue_delayed_work(system_wq, &tlb_inval->fence_tdr,
+		queue_delayed_work(system_percpu_wq, &tlb_inval->fence_tdr,
 				   tlb_inval->ops->timeout_delay(tlb_inval));
 	spin_unlock_irq(&tlb_inval->pending_lock);
 
@@ -378,7 +378,7 @@ void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval, int seqno)
 	}
 
 	if (!list_empty(&tlb_inval->pending_fences))
-		mod_delayed_work(system_wq,
+		mod_delayed_work(system_percpu_wq,
 				 &tlb_inval->fence_tdr,
 				 tlb_inval->ops->timeout_delay(tlb_inval));
 	else
-- 
2.52.0

