Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAE6A62FF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:58:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE11910E12F;
	Tue, 28 Feb 2023 22:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B745910E103;
 Tue, 28 Feb 2023 22:58:44 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id i5so10419371pla.2;
 Tue, 28 Feb 2023 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=ZagXoGgot3rF1P+jOmf47rOJFpEPyUG8PwWfOLPRh3xSQUqeeHDID7n0sh9Q00CXC3
 sgTAdPcGx0vTAaf91U7QFRQd7BtzPU9/xzZDsh6+1971e+/qbZEV4cga/gyzupQeV8K0
 JtSSXHn8OFX+595H3ttUaMjri3lpZR1Qu5ue9p/fl15Spmpkv1pspaa/8iap75dnBL9Q
 EnhUyOhaR/b2xtpJelKtQ96TzFznKM+M3+8KNNxu73yr1RsQVXCsCEu/YCrCjgVl652J
 s83rIBMH4UG72ZcVEGSRMUU9NDtiOfl+jopPOZqjr96ypXHI03MMtB8OixiovnAuGT4Y
 fyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=DwyWQxSHeEB7MAzJxjqTmg0aH8R47PyPdqHJ2ZO3LVjmedm9ancN7U/yUcTZ6TKhMx
 ORhLEgdiCxnsa9AHeAvA7YHdob56OxKky6G7T7QTYHvxYdtFKq7MW7ZexA49XGywHymm
 Dec69mMMv4bAeLaIatkTcNqo2fWDoYlaGjFeIHZGERzwOI/JVipIne1kaDVDYuFBncnb
 oqUNmuStxKGGHVyjFD2PWcp3UvQSjqpSDQVisu5fCKLEX/NGnlZtO5OTaybf9k8i7Ngb
 srfJ1KlHOya/w/9qzAQkjPT5I/yCkhcHxLJZHxF0Ikwr6dlg5nmYgcQjYn0i2NwBQqwY
 xf1Q==
X-Gm-Message-State: AO0yUKUl0TVjToVvSfpYwuqfyuiOMdqqQOvUXHOyAV7t/VQXzlIwIFGU
 FX4cFXbxq+7wMVInazCzvsUiW1X4yN8=
X-Google-Smtp-Source: AK7set8hoLg5bctNWbZ+82twM3+oK6UKHMtI4y7UbnnGjn/K5pWj4/SUHfnn3a/bFr2b/Fa26YHa9Q==
X-Received: by 2002:a17:902:d507:b0:19c:e9c4:cc13 with SMTP id
 b7-20020a170902d50700b0019ce9c4cc13mr4994218plg.25.1677625124037; 
 Tue, 28 Feb 2023 14:58:44 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170902b78700b00198f73f9d54sm6996620pls.117.2023.02.28.14.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 03/16] dma-buf/fence-chain: Add fence deadline support
Date: Tue, 28 Feb 2023 14:58:07 -0800
Message-Id: <20230228225833.2920879-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the chain.

v2: Use dma_fence_chain_contained [Tvrtko]

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
---
 drivers/dma-buf/dma-fence-chain.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a0d920576ba6..9663ba1bb6ac 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -206,6 +206,17 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence *f = dma_fence_chain_contained(fence);
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -213,6 +224,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.39.1

