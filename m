Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706723D6A45
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A8F6EAD5;
	Mon, 26 Jul 2021 23:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382936EAD5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 23:34:57 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so1438403pjb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOCwRi9hxpNHgxPfLImA8XjRn0qGzkVI05nd0NTq6uk=;
 b=UMdDGkO5sH4beFwSPlOOtv6JRzN+gpzELhacSFi7vvaQQ1PwmNbkfYf44YSJQaBLpr
 vVV0beEQqJV0NuTrh3WVluml5kosYKXPr9U5iyNbGEHEnWPREtu7FUB2q7w+oJTefR1N
 nxhrxUsL/yhwl8fKcflbrIpY5obQR2TALxuMCayo8c8wDQO0eaI6GFbUCJf3pr8RanC3
 lpKxIhzu44oKfzHbedvRslZeVPkbiBMj0MBXvllJzc/2Ok4djmZsXBK3c9DbPUgVz+GT
 Ad5XrI/AMY80dotYjiTUCM0Zb4DP3NOJpJAs9lA+0Yu8rBP+Sisqs25ugYEbBPneZq4S
 A5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOCwRi9hxpNHgxPfLImA8XjRn0qGzkVI05nd0NTq6uk=;
 b=dn/o4+EHfOZrAvN2qDZ+kKftBOxZULxHkj+efUgErp4JtJsvAMFkl0f4tdfGr1hoFl
 XOwtkxF3fUZqoDDAz4zITpXtNAVxH4F7VFIXMda6/gS/t7PzV2SRFv3Rsd6CW+6RjLKc
 T+NMH57qckRi+TzUYlXO+h20X9Kdw5CMvm1n3okSXHzeXoz7eUbO+dTU2V0qmjw5qx8T
 +piiR4F4slNBRTofmHrSs4DHZKwuYoDxVdyS5cJ/yysUYguTDV1ljQhbKDvzMtX3m7Pr
 I6L13yf8YtrXU/1FQ5ryjFm2wKPOEDIn7+eyXkfACJdHH5rhRacM2NbuwdQ2zeRVqE7d
 ZoBA==
X-Gm-Message-State: AOAM532Fh9hjb4jMi7YS6sirf6vPWLvKv28JVn2yXqfP51tA8opO4GS7
 TvgyyiAc58odzYgmRfdEJwEmtcMhC+18VQ==
X-Google-Smtp-Source: ABdhPJyKNvvOsVEx6SQdxLRvjXmblFnYyDE+d88dd2vCChknqQFuJLEJg/rykB5kBwIJAy520O/kiQ==
X-Received: by 2002:a63:3445:: with SMTP id b66mr20626420pga.141.1627342496218; 
 Mon, 26 Jul 2021 16:34:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id t205sm1171971pfc.32.2021.07.26.16.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 16:34:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 4/4] drm/scheduler: Add fence deadline support
Date: Mon, 26 Jul 2021 16:38:51 -0700
Message-Id: <20210726233854.2453899-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726233854.2453899-1-robdclark@gmail.com>
References: <20210726233854.2453899-1-robdclark@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Rob Clark <robdclark@chromium.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

As the finished fence is the one that is exposed to userspace, and
therefore the one that other operations, like atomic update, would
block on, we need to propagate the deadline from from the finished
fence to the actual hw fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 10 ++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 69de2c76731f..3aa6351d2101 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -128,6 +128,15 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
 	dma_fence_put(&fence->scheduled);
 }
 
+static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
+						  ktime_t deadline)
+{
+	struct drm_sched_fence *fence = to_drm_sched_fence(f);
+
+	if (fence->parent)
+		dma_fence_set_deadline(fence->parent, deadline);
+}
+
 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
@@ -138,6 +147,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
 	.release = drm_sched_fence_release_finished,
+	.set_deadline = drm_sched_fence_set_deadline_finished,
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a2a953693b45..fcc601962e92 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -818,6 +818,9 @@ static int drm_sched_main(void *param)
 
 		if (!IS_ERR_OR_NULL(fence)) {
 			s_fence->parent = dma_fence_get(fence);
+			if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
+				     &s_fence->finished.flags))
+				dma_fence_set_deadline(fence, s_fence->finished.deadline);
 			r = dma_fence_add_callback(fence, &sched_job->cb,
 						   drm_sched_job_done_cb);
 			if (r == -ENOENT)
-- 
2.31.1

