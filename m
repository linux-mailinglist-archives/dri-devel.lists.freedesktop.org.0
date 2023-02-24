Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6356A22EC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 21:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5233310ED07;
	Fri, 24 Feb 2023 20:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A9C10ED21;
 Fri, 24 Feb 2023 20:03:13 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so4014536pjb.1; 
 Fri, 24 Feb 2023 12:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=MmJRRhMlaxk2Tg561LzgJumOupNCmYxSqE7V/Ec4vvD7vgC4kK8CHIMXMadg+Xn7fz
 WRhZENogAOymwJlIY3/ReOiPI0zxW8vspbonbRb93B5Q8kxBWWoBRTQ0MKyVDoVKIJwa
 ufThHyWP8vkdS6gWl7RjDPFM9yNrIjO5d4yS0b+RG146pN6q8ZO96+XVjSdhRWaZ26+J
 HHOUr2cqCDB4qy3+aT5idFgJyBcp3zw21dthn2udYd881vQ2HwePLZbEh383xwwMTPEh
 pKfuNef1SIGCQ65/2/Qh1OPqT+MpiDaAFbfHeeY6gPX9MQA+4ExkN//uxnS462CbtA/O
 B1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=AsU/qBuFAEiTtw+5OTPS6tN9ifKh0sogy2wDF5KSaV4HCg3FQHkIOmhnRcwu4Lv2ul
 BJeOIbSNkMXvwLPGd2S/tQd4clK99FY2F523jHCy5LVvBNoVboqw2MlTx117eI/iB/px
 Rq9bupxKc6BvE2YDVdXcdGixqUYvg04vpNOFTBlUJ+5VQWxT3fEKwU32ug8uGsHTh7g4
 Y05kznj6tn642TGms/4vibdIJjK29MU9Yyqpe71Vh57Wq7pX//oV8cLZ5fRnK72WT7ou
 7nbFR+YJB41kLdGEMY/5lC7x9ddHOwsIHDjylRzviYVtDIYlYQ/cXLiFlZYbwBJjw3/w
 yOHQ==
X-Gm-Message-State: AO0yUKUbckw3o4DCvhCBSsGCSpXqivLfNYrQopLM4GA877S3fhiDwyGx
 inVMop99/oOX6Rnr7tw7NyhCyf7MAkQ=
X-Google-Smtp-Source: AK7set95tBC99k0jthHkFEIkO7gTyH442ymUGtLpwciZhI446KatM88hJ0Xu7olLG076L8fTPf5nTg==
X-Received: by 2002:a17:902:fa88:b0:19a:a516:ba46 with SMTP id
 lc8-20020a170902fa8800b0019aa516ba46mr16886185plb.41.1677268992534; 
 Fri, 24 Feb 2023 12:03:12 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1709028c8d00b0019a96a6543esm8237986plo.184.2023.02.24.12.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 12:03:12 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 15/15] drm/i915: Add deadline based boost support
Date: Fri, 24 Feb 2023 12:01:43 -0800
Message-Id: <20230224200155.2510320-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224200155.2510320-1-robdclark@gmail.com>
References: <20230224200155.2510320-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

v2: rebase

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 7503dcb9043b..44491e7e214c 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dma_fence *fence)
 	return i915_request_enable_breadcrumb(to_request(fence));
 }
 
+static void i915_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
+{
+	struct i915_request *rq = to_request(fence);
+
+	if (i915_request_completed(rq))
+		return;
+
+	if (i915_request_started(rq))
+		return;
+
+	/*
+	 * TODO something more clever for deadlines that are in the
+	 * future.  I think probably track the nearest deadline in
+	 * rq->timeline and set timer to trigger boost accordingly?
+	 */
+
+	intel_rps_boost(rq);
+}
+
 static signed long i915_fence_wait(struct dma_fence *fence,
 				   bool interruptible,
 				   signed long timeout)
@@ -182,6 +201,7 @@ const struct dma_fence_ops i915_fence_ops = {
 	.signaled = i915_fence_signaled,
 	.wait = i915_fence_wait,
 	.release = i915_fence_release,
+	.set_deadline = i915_fence_set_deadline,
 };
 
 static void irq_execute_cb(struct irq_work *wrk)
-- 
2.39.1

