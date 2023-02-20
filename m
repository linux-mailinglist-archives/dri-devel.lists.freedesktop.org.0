Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD3169D4B4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4861410E79D;
	Mon, 20 Feb 2023 20:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1821B10E790;
 Mon, 20 Feb 2023 20:19:23 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id n20so1180216pfu.12;
 Mon, 20 Feb 2023 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=eNWnZdY7bb0sIPeM/dP+nfuIuObMIanncbZ+NRD8X1XJMJ3PtrtrWEi9KbjDnT/8w/
 4868uK4c3a+o7f87mCfBXFuvYydQ0cuDb9mH/m5cPTpxn/qovKcax5YMahSlLSjYQWnj
 cOhgi+GA0fYpdhHXJew7nHx03aK8aUQ8p5ZFGvXeOjgRTpbbfDaG4dcHiobo8k+1cZdr
 rdBw52ruPwcHMxTkGp2qw/JKV4NNoevhSbXnwZWXIRBNhlsTWdgG+NiAWOZqCVkeVTPm
 EKNybgNSFZ+jaB3UZq7n3CyDCiF7d7P5sjMF/me3F6e407AydxnfmvvF+ZJZ22/xu8M0
 auhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=x2VmZV6Z9U/s0NnFjH72EY9FW5utP2ujndanpuB/OuawPCR+9tJt0Jm6dOCjz54Ze3
 RdW77TMcMLtsaFYBlaYzvuoXdqu+J8mzpXI210hToigjOjydP3x/vKJOnM9pAXo6agwi
 WEpCtxQm9jMtdzivuqGHwxtmpaO2GZ56nQEnQnXU8iRFV1Oc6hNZZBDjnXYwPKoloZnE
 puoYtB/2KeGBO4Geoh7IbVW8emxY+wkuZbDNmp6xEPEHgIXspLM8kydUKEETCurZgftD
 pNquBizvyrWLTxXD/TphujobkTYBq2q6cOQXaJWa/iUhzBBoSOdyfq62VLUafFVCxvd9
 WFlw==
X-Gm-Message-State: AO0yUKWbL3Hw9uijMWsEjztUlqlEZLjmD+hIXzF6HlYD7Ljrz9MsvMGS
 ln69hW+bmgSIWQBbylZyoq/Eo80QX4s=
X-Google-Smtp-Source: AK7set/IEnsknqrg1Kvv1r90ECUxuHVfyDcG96xSfQIiNKkRh0eFALUg+af5KU3PpovvGnGW2S9fJw==
X-Received: by 2002:a62:52d7:0:b0:5a9:d4fa:d3c7 with SMTP id
 g206-20020a6252d7000000b005a9d4fad3c7mr2485352pfb.7.1676924362392; 
 Mon, 20 Feb 2023 12:19:22 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 g20-20020aa78754000000b005a9bf65b591sm7029643pfo.135.2023.02.20.12.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:22 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/14] dma-buf/fence-array: Add fence deadline support
Date: Mon, 20 Feb 2023 12:18:49 -0800
Message-Id: <20230220201916.1822214-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Propagate the deadline to all the fences in the array.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 5c8a7084577b..9b3ce8948351 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -123,12 +123,23 @@ static void dma_fence_array_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+static void dma_fence_array_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	struct dma_fence_array *array = to_dma_fence_array(fence);
+	unsigned i;
+
+	for (i = 0; i < array->num_fences; ++i)
+		dma_fence_set_deadline(array->fences[i], deadline);
+}
+
 const struct dma_fence_ops dma_fence_array_ops = {
 	.get_driver_name = dma_fence_array_get_driver_name,
 	.get_timeline_name = dma_fence_array_get_timeline_name,
 	.enable_signaling = dma_fence_array_enable_signaling,
 	.signaled = dma_fence_array_signaled,
 	.release = dma_fence_array_release,
+	.set_deadline = dma_fence_array_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_array_ops);
 
-- 
2.39.1

