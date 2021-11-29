Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A600E46148F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE99E6FA66;
	Mon, 29 Nov 2021 12:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B2F6FA60
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s13so36334244wrb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
 b=jIfLMHNOyiH6re4iFPVufnCfjZ8Ud/UjDFcuL3gUDJeKvCM3UbtrY8kJmmEmlsP5fV
 qlkSfwlaxZrJ+hCkSFVi/Id51YS65GNfGxlg7bw0kaRcDf7z9wWRCGWpm9nzwAXxXL+J
 no7IQqLrmVVIJ640E/VKVEF8UmEu2dn7tN+19wYQsgmbQKe+1YuP0xWowOHfgt4Ph/Tg
 R7QhEXs/XbU207fAX082CPBlQn+6j+5NUBqUpu2Q5vN24e4U6UIC4zvqjZiTzjrx/Gz9
 xtM2FG/o1ejpyR4pKBuaQY5WJZptHaHbTWteWv5yFjf60qykyI5582jbvDZ+UmNsUesC
 K5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qBmtGbBu1QXhKmWazU6APumSvKhR6nIEoW+jVAv5tCQ=;
 b=IoS3BWY+wgZ4R7P/uwRMLJ9+wRqNGLjbRuLjTuAMa4zWgPdIe0Z+ngh+RM4JPkkHzf
 soBRWMYoW4gt4fXWEVwHHJWn17pZX7Fw7q0IgfJJeBv/y1mK/8fVyLSlcXWlU1SkxFYC
 0F0nhurYPO98wgJCx5BpKRwXsbciVVVzQo+Bx8HfM1Y1Zemb/D+qjztsK2oj/K8eNGYf
 2CUXnecMqA7hQjSq4TNcIBeGoSDA2cBNXGvzdBhNNHsqGDBJTGR4hKz2ubcNGGro5niZ
 gIs3ygMPfPTiMnXViqtil6xbsyTn/585juhEzOA4yJB7BHdQqIcwLGzlowUuSfCGpj2t
 lpsQ==
X-Gm-Message-State: AOAM531Pj9PA8MfeBxGpwONuUZdgNRyc3+6HLWLPgCA1aETYvcP0kKSZ
 9bP05DOOs+eeifr6BK95cLQB5YsXQEA=
X-Google-Smtp-Source: ABdhPJzkgIuWSPb21nIZ1tZEj2iYSO3+RCOYkVkqHCgSj/4koXRSCMg5iIXTa5h0RyArWlxqmIB4ww==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr32676183wrh.51.1638187637874; 
 Mon, 29 Nov 2021 04:07:17 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:17 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 15/28] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Date: Mon, 29 Nov 2021 13:06:46 +0100
Message-Id: <20211129120659.1815-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the write fence using dma_resv_for_each_fence instead of accessing
it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 53e407ea4c89..7facd614e50a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		struct dma_resv *resv = e->tv.bo->base.resv;
 		struct dma_fence_chain *chain = e->chain;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		if (!chain)
 			continue;
@@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
-				     dma_fence_get(p->fence), 1);
-
+		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+			break;
+		}
+		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

