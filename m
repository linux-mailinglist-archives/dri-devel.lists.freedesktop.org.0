Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEFA6A22C0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BEB10ED06;
	Fri, 24 Feb 2023 20:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454B810ED04;
 Fri, 24 Feb 2023 20:02:06 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so355837pja.5; 
 Fri, 24 Feb 2023 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=DXggLen98SswuMy6LWqXGQsVk+Kl+HCfw0GV1eAOFvn+k5vSTK02Ocr5Lbsyxv6vfh
 G20mSjTIjOf259aIQo9lioVuf2337pFt9wQRSOGi8YqoroNnPJKx2D4Mr0xHfHSxCGT7
 akg3hVHnOWkFuSiethSqYeWo7JDzOhnrfIoSCv7bq9Cg9YoLldU3y0kGrbBbMx0pQ+2p
 08cG5QwY8KRM5ilt4+qiozXhQ1XkMPB9i3dsYB6XbH95KMc8X6/uhu8+apx8JqhHqY4x
 6FZc7CMmgBc7sW4c5ct5na3F6MPDyh0tfN48fiZnvYPLT38xxShI5xvb/D2DWLAmHqBB
 a37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l4ehVbwCT75xnP/ECU7XAGaXEnBwLlSeDxhb5qTgwac=;
 b=0TylcClZz/7ozVKh3g2JMH8TkTnbUwm6Hsdpe0lOS8tsjhsWDNx9sB2S/FHIy+0KFf
 yVi7QaIxqQJnTRcrHdFxYdylsNTUJ1SC8XKmyD3LDFFz36ZEK/087I3IxX8wImI7qlrI
 RX1RGIzIc5lOnne1052qDoO0cyhk1QsB/ANhKUgkmtuaL7wJz+aB3yL90+9Yn5yDVfx4
 6hW2hu1owj/5Sj8OjuIPrjifDCtv6julIfQ82E6GmySrVfcmko58tnSrhz8tp08Z4Kr7
 lRUn530bZM+t+2RjWMnCUsJ2kSwpREuKP5RMSCWgV6w9iRzTHUy6NPWHJ7V3aUa63o2Q
 s95A==
X-Gm-Message-State: AO0yUKWoJIWthfFVltxyEkzH095sbIfDqUxx4CwUlBkuPwVXJgZJhi5C
 Fmh9ojpPJSV99nVxFESRrFm+wHbPL7g=
X-Google-Smtp-Source: AK7set+7gPv2NZgQnRNjYEEsoK8icNOajvOd/YFLS5f1LxWqWPzjxCeauf+X33arB9Ab3jCkqEV4GA==
X-Received: by 2002:a17:90b:33cf:b0:237:b92f:39d1 with SMTP id
 lk15-20020a17090b33cf00b00237b92f39d1mr644702pjb.0.1677268925626; 
 Fri, 24 Feb 2023 12:02:05 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090abf9000b0023440af7aafsm61128pjs.9.2023.02.24.12.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 12:02:05 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/15] dma-buf/fence-chain: Add fence deadline support
Date: Fri, 24 Feb 2023 12:01:31 -0800
Message-Id: <20230224200155.2510320-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224200155.2510320-1-robdclark@gmail.com>
References: <20230224200155.2510320-1-robdclark@gmail.com>
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

