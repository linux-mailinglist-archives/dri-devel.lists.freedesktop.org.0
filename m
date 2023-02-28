Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975DA6A6311
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9E610E0F8;
	Tue, 28 Feb 2023 22:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC6310E0FA;
 Tue, 28 Feb 2023 22:58:42 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id a7so6797549pfx.10;
 Tue, 28 Feb 2023 14:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=hjK19G1y+9t6kEMLTgqI6C/R9VHYBU8KBYhFV7faYo5HB8p84Etyo1UAtA4iWCe1Hw
 uvND31JQjTYo2r32ygNrWaVDjWv/k3qvc7jrwqSIvMOAvHHpN8jKYTOwjzjPEBwJF+xk
 fixbNihhLTq9GC9AHCP7pa2dUcgktiXvIpq6ywnlV8qD4FM2Cf4nmfnqsdyA+tM9x6dC
 PUZLj+wlw7lH/NXnxKpo3cMYVn1Az9DXvTODKEgwKa2d8nXZplZnzfnMCiBrQ/52lH1z
 G/Ib2B5EMaZT8bcidj1SSHKcOYNFX+rk8Z++HJWMFKHxBKm9i//i20Kz4CS16SO3CIxl
 uL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625122;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MohZmh6ZcfzJn1OmRfs/o8+oM4ZPKLi2FB+4LPpL34o=;
 b=HLHmIQLClSavjTMlu9YhxNXsTfgKChDydJ9pREIWlpL2TDBnmRQ824lEINUg2YDlAf
 Fi0vihW6+2ZCs902ekcrEi4rNgiVXcml9220fBdZIR1SXY/Ak2uBVov6M5qCfG9tCZmF
 d7pb9qXpdtC/Y1uF5sXkm/Zg6oB4J7M2FidKpsvVV+WTN5qScVZ8svJDudI8c+K7s8xb
 L4f+8mIxdeMCGIplga3boK4gCrrdNOsMVuKFJfl3bvVUxd/tNmv+y+MesMqjXJQe96Nb
 Cm+6GosxQhNeVMpexoJ63RqgWSAmcz2Z/MkA8s/QjLHKfFjV2sL4MATSR3uvJN18zyHp
 pY1Q==
X-Gm-Message-State: AO0yUKUUvRVGy5Vb2joV1XMZNK3Y/dWV1ptJJUciQQKA9cNsvS4NpOHY
 VYJHUBBhckGqy9CQzrilh76vfJAKCUY=
X-Google-Smtp-Source: AK7set+hi0qZn6Ym8wkRncFCDDbYo/eyvE+1U2XGQCuwaskjeQT9FqYxsMx6ZcsoNBBDuF7tCnd7MQ==
X-Received: by 2002:a05:6a00:3002:b0:5ff:f1df:d82f with SMTP id
 ay2-20020a056a00300200b005fff1dfd82fmr4217882pfb.1.1677625121947; 
 Tue, 28 Feb 2023 14:58:41 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa78b56000000b005813f365afcsm6552280pfd.189.2023.02.28.14.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:58:41 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 02/16] dma-buf/fence-array: Add fence deadline support
Date: Tue, 28 Feb 2023 14:58:06 -0800
Message-Id: <20230228225833.2920879-3-robdclark@gmail.com>
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

