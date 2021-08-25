Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13393F7C36
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 20:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B276E402;
	Wed, 25 Aug 2021 18:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9716E402
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 18:31:04 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 j4-20020a17090a734400b0018f6dd1ec97so430509pjs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qfk6BSvcgBI7Pc/jE3YW7xZmx9KCBB6EdbOOmvrD6Qc=;
 b=o/kwIS9r/jytIoTEBqNyRfm1IR4OcGddRWAo+yF9fpQLIb+9crwAo912mpdNTPka7k
 jEua+cYFJcUHhwXbdudbENPFHXpuVrdJGkBWbMgP8Yv3O9J1NT+qE4YQBsMDrHss0aZZ
 mATbCEQd0H2F5LDvP/Q+3vnLxXjVKghXtt5BkXNTr5o5yFTuj94hQvHvGCIfSZVCb4mK
 0ADz6SCGJEbjL0NoMsqBC2DXVteR88Zr8uklUMYOT1vFoR1QGC+VhR9OuTG6p8+OIto0
 BtmIqhLO9WQ4QLXP+gcM1TbJmvC7qhoC8xFqXKlb3PObbxREqOe3oodksIkkajQ6e2ku
 nR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qfk6BSvcgBI7Pc/jE3YW7xZmx9KCBB6EdbOOmvrD6Qc=;
 b=aUvoHLaC9LPrmfzNGsmim8kelU9+65/IHSr7ZvNkVacVE/wso/+YHICEsRkmLNNCRd
 0yk69Sx+V0ScsoXH/6+4id2WtFeRg1btHKsqjnRX0oKG77WeCJ2qagTT3PL9hfzg3S1A
 W7X/bscy9OMCX/+23HohAbjs2d9zBQxyG/4Xy/y/e+s8N0rH7pj9ebZQWYzdDTuYu+S0
 AekvQGHWhCBPwGxPgJOhleVY+FNmx9GRFwGflHvL/pPvHXBurNMG6Imw531EeIocDFac
 g34qIOo7kohb+Bjmc4Ew085I+zX7EZDILGjFvRPRHI/Q3cyZ7CI508JvWp410HP1wUiV
 79Ag==
X-Gm-Message-State: AOAM531YyUaHxmkErly7z1j3huKWpAVdb2k3tC+CLiiCa5L8NNdrdwYy
 Iq5kkNFiJCkwcVx2T7EFzBckVA==
X-Google-Smtp-Source: ABdhPJxVRQSxOVe/2e9Ph5nzkeeO5xcy1nbYxdf35mJm41j0UOFiUOzNVz5K4WJ/FtwIgoSYLxNmiA==
X-Received: by 2002:a17:90a:eb0d:: with SMTP id
 j13mr10470703pjz.163.1629916263928; 
 Wed, 25 Aug 2021 11:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 x20sm382813pfh.188.2021.08.25.11.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 11:31:03 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Simon Ser <contact@emersion.fr>,
 James Jones <jajones@nvidia.com>, Leo Yan <leo.yan@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH] dma-buf: system_heap: Avoid warning on mid-order
 allocations
Date: Wed, 25 Aug 2021 18:30:59 +0000
Message-Id: <20210825183059.1085561-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
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

When trying to do mid-order allocations, set __GFP_NOWARN to
avoid warning messages if the allocation fails, as we will
still fall back to single page allocatitions in that case.
This is the similar to what we already do for large order
allocations.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: Leo Yan <leo.yan@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/dma-buf/heaps/system_heap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 23a7e74ef966..f57a39ddd063 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -40,11 +40,12 @@ struct dma_heap_attachment {
 	bool mapped;
 };
 
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
+#define MID_ORDER_GFP (LOW_ORDER_GFP | __GFP_NOWARN)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
 				| __GFP_COMP)
-#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
-static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
+static gfp_t order_flags[] = {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
  * to match with the sizes often found in IOMMUs. Using order 4 pages instead
-- 
2.25.1

