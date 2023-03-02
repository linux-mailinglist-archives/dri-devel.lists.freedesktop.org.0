Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BC6A8D77
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB1E10E5B1;
	Thu,  2 Mar 2023 23:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7F810E5B0;
 Thu,  2 Mar 2023 23:54:06 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id a2so1001177plm.4;
 Thu, 02 Mar 2023 15:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=NUH74MoMlFjyHOoQOc3Tof5RqeryUU+TpxADwdecLbscsf67tEJFGhdRs5OWz2/eTD
 TiLDpF0n8UeoLj2nlfhjnUo8HWIroTQsFdMjRz3T8ZqPaP+qGQXWYPlzbuX5L2PKmK2A
 0jC6PSe+O7Q2xNLrCnTVKAUdK3IXA7sY0mler06fvzHsOkx+hfv+ibsPiqd2d9neDEgs
 w/RMn11V5lkdSlkYR+t6K3Zoh6Qlc8CBHrHcs+E9+BSxFMdEs6ht9x3dpgxcLNnK/RYU
 L6QanlZS1tad8ALNEB7qe3o8tbuTg/z0in+tZN4tPjzXP7abOw6YrX5drli2n2JuAPdO
 tZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=puOMz0m8jzWHrQJlCw7NLEDjFvnbDuBJRxeo1LiMAe544uEUYedf6kQMn/vyaUoobI
 NBk0ATwIVCRjmGwVenc+uEaHY45rZQXa65boORHijt+nMn3R5grJOryxV159ZlbgGL45
 15kmmbEaR5seizHaig9dENs0DJCYMg+4fidPxF0HcoDLg0dzdgVmvtgJYItfdiPQxX13
 snyFaZ6+DnHojzCYA9NdclfZrl/Y5HAc/W5LQ+gsedomLTauFy8VhqqdFVVeXHSL7c6h
 wIEqAoLqzc4yOlFPTVK5HPwnMGBP1dZulzSlsq+t1cWefClhZMwN2bkIfcGJ0Q05es93
 V8pQ==
X-Gm-Message-State: AO0yUKUv2SoyZR4RyAe2ZvjOYocWUpLR6/1qoenMGYWihMGS5tvoT7Pb
 Vtp+MWGJeV2whbZ6P+AIumdBlA5mICo=
X-Google-Smtp-Source: AK7set9yFD6Y5yJLKU6vm3DlNq9ITibopHzdU7+nBSZ1Vfy3oUeJJSkMSehminR0BguhikQjch98Ig==
X-Received: by 2002:a17:902:ea0c:b0:19a:727e:d4f3 with SMTP id
 s12-20020a170902ea0c00b0019a727ed4f3mr4273475plg.5.1677801244532; 
 Thu, 02 Mar 2023 15:54:04 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 ka3-20020a170903334300b0019e21d2ed2esm226622plb.88.2023.03.02.15.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 03/15] dma-buf/fence-chain: Add fence deadline support
Date: Thu,  2 Mar 2023 15:53:25 -0800
Message-Id: <20230302235356.3148279-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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

