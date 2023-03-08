Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 329706B0D80
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64BC10E632;
	Wed,  8 Mar 2023 15:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3C310E62D;
 Wed,  8 Mar 2023 15:53:36 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2169036pjg.4; 
 Wed, 08 Mar 2023 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lcraofrhRDAdrHGa0UzQfcfeN59LkTANHVsK7xkfU0Q=;
 b=hpCfI9KDoIpsurVFvi6JvaCUXX5V8whc+Mt2IXW2uSOKz1Q5dxdtHiQPVq9AM6tUPq
 sCk6nrAsOY0qx5qi93O60+KSvFUlcqYXolDmY6IaV1mxU2SPBhwXNjArN22qgCeWCJJe
 fSRxj7YAkbEoJg+AsCJxxqqPGDHWTusIaKafAqQARUTvnru8GsWdU19lLWZjfZMnLG5q
 2aGL4M/jwCBSO49iC5E4wCZyOeonSOiwMDtNWhIQAZqezZ/H8I9KLd5FmTgctqbptQGE
 b0Jp2fx5HIZ7CuqdQOX1R9PbAc2Yj9x8cvWgU9S1PS2hlr985tWoNfwGVqQ33VOxtSUd
 DmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290815;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lcraofrhRDAdrHGa0UzQfcfeN59LkTANHVsK7xkfU0Q=;
 b=gkmlRI0AmeqC2cok/sJVKZlzvA42b5trtbHfDQGAk1WWwjTspL5oX0zMHuf6IybT9D
 H4OFrUzbs1JpvIHxtOw2cQYeW4w7lCm7xDn1erbHx0w9TwrYnExgTg5wvxEZVT53dTNR
 8kcDDC9y7IwYCMHIuJqFLT3WsEMHxAdn2naAve8VM3WXH1xiMjKKBMugh/MqTtsAwdCs
 sWddMf6GwMrjDRKmsh+VFW3vSURSW+dIIDpmOn2ur6rdIOPGUKUbSfgUbTBWs99taDQq
 dBsQDAQ1G55RYCV3MCUl/VEQRZRLrLj94Jo0Nygz2Y9Gam7Jsm1YnhivLTmYH3aQH0+J
 bWwQ==
X-Gm-Message-State: AO0yUKVXYHEaGSr1tmbhDpWQF0qgviH9Qp1gmLBIuQpigVQLctZSSA2g
 Ehim/ptLQQ1czxcWN5MNINqRGlAdM74=
X-Google-Smtp-Source: AK7set/2eF5m88UMlszgcFp7cgo5yOQOxbJycIrpK9ko8JpPSABVkued0J6pMJtqfFLipyBKXl6Sjw==
X-Received: by 2002:a17:903:22c5:b0:198:fded:3b69 with SMTP id
 y5-20020a17090322c500b00198fded3b69mr23560954plg.53.1678290815231; 
 Wed, 08 Mar 2023 07:53:35 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902690700b001991942dde7sm9951550plk.125.2023.03.08.07.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:34 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 03/15] dma-buf/fence-chain: Add fence deadline support
Date: Wed,  8 Mar 2023 07:52:54 -0800
Message-Id: <20230308155322.344664-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org,
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
2.39.2

