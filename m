Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D069BC32
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEDE210E55E;
	Sat, 18 Feb 2023 21:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1441110E09B;
 Sat, 18 Feb 2023 21:15:53 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id 21so319092plg.8;
 Sat, 18 Feb 2023 13:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5If47abMxVvdOGe/2jH89dN5UVVTGLmcg6EQzMCdPac=;
 b=CNTa3icUd804RiMnh5GApmZCXhp0f7037aAPuvfSQytTW0npuSY78gEtlHqHCmn8NW
 5eyb8k4NDi+V7FS2GFNTsCMCbwtF/ltNdJ1R8lKpXjwlSuW/xA05CvMqFBhSSu07MEsU
 JH2yxu12s/Sag2BEmE1hSCDB+qldNLfSTvnE6oWJFCK0Mmjy4N6LpwoNiHLpYA46vDhq
 FKyzDBMCupniEDosM2D/oX5huHqWv+fGKFcFhLGvsIObJuL5txuSIxuJcq6Ha7jB3e5N
 8lvmchf4xOKnqQmPJFYTIwbQW4VQVAXjRPv2OhBvHAUvo9YyVyaFKXVLfvp2bURupKsZ
 whYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5If47abMxVvdOGe/2jH89dN5UVVTGLmcg6EQzMCdPac=;
 b=0TjiOZ46L2x6T6R0P+lLxM7BDhE2CjeJJxqNf7TjEBIb6qCXs0uhV8VZX6pqGZq5Hd
 ukCp4R4OjoP/mZOMdFZyISbS/ghDQ1+LI3YlSbx2L63WPgUE/IeDX7umTbxzcdh5d1pQ
 dfHExrIngDY1rT0NGiBsDihv+RGoHmc+R3Z5CCHDwW7gP+nI1InWdQlTOWbCsQwzAY0V
 MH8QgJx6OwFXaW21HpjATOjIXu6uAMUTSFPpsGpqrj/PQ9QVkdcZ1Keto3GtpgJiwkL6
 YMyYOPSdsF+aZeJRsZctZQJbRB6KxGwyPpHAL3vM5SAWnH09+6W0z3smoR9pQpjrfiX5
 NFkQ==
X-Gm-Message-State: AO0yUKUn8xy6UoY+brJbvaoCGhCtvEJNfBCz1gwnrnsMBg3Z4+yRb2XH
 ll20sqcbef9VfYwF30F1F7nMTU69l4E=
X-Google-Smtp-Source: AK7set8+pwmvlN4/RTpTbvPrSu6bTCkr/ysSnaWTuvTnV/TRfDp/g41/uigNU2EfzQvt83CM+JnvNw==
X-Received: by 2002:a17:902:f9cc:b0:19a:fd85:1891 with SMTP id
 kz12-20020a170902f9cc00b0019afd851891mr1808045plb.14.1676754952290; 
 Sat, 18 Feb 2023 13:15:52 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170902d31500b0019aafc42328sm236770plc.153.2023.02.18.13.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:15:51 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/14] dma-buf/fence-chain: Add fence deadline support
Date: Sat, 18 Feb 2023 13:15:46 -0800
Message-Id: <20230218211608.1630586-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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

Propagate the deadline to all the fences in the chain.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Christian König <christian.koenig@amd.com> for this one.
---
 drivers/dma-buf/dma-fence-chain.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
index a0d920576ba6..4684874af612 100644
--- a/drivers/dma-buf/dma-fence-chain.c
+++ b/drivers/dma-buf/dma-fence-chain.c
@@ -206,6 +206,18 @@ static void dma_fence_chain_release(struct dma_fence *fence)
 	dma_fence_free(fence);
 }
 
+
+static void dma_fence_chain_set_deadline(struct dma_fence *fence,
+					 ktime_t deadline)
+{
+	dma_fence_chain_for_each(fence, fence) {
+		struct dma_fence_chain *chain = to_dma_fence_chain(fence);
+		struct dma_fence *f = chain ? chain->fence : fence;
+
+		dma_fence_set_deadline(f, deadline);
+	}
+}
+
 const struct dma_fence_ops dma_fence_chain_ops = {
 	.use_64bit_seqno = true,
 	.get_driver_name = dma_fence_chain_get_driver_name,
@@ -213,6 +225,7 @@ const struct dma_fence_ops dma_fence_chain_ops = {
 	.enable_signaling = dma_fence_chain_enable_signaling,
 	.signaled = dma_fence_chain_signaled,
 	.release = dma_fence_chain_release,
+	.set_deadline = dma_fence_chain_set_deadline,
 };
 EXPORT_SYMBOL(dma_fence_chain_ops);
 
-- 
2.39.1

