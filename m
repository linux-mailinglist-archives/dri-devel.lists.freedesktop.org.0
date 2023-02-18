Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6369BC4B
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 22:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A53610E588;
	Sat, 18 Feb 2023 21:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCAE10E562;
 Sat, 18 Feb 2023 21:16:19 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e6so1637139plt.4;
 Sat, 18 Feb 2023 13:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJRWjyogOQnJ+5yTXZeR/CA8uKgjfGlQ9M7/4cay494=;
 b=HlVIEobOB1fK4orz/vfjScfvfTmsM2Ff4tRZMVa4xdM5sCf4zF5X+pa/NEvV0jRFap
 d96y+vkl2FVlKyaS9S7zCK5ePnuhaaEY0SmBx5WF6VNh/A+Ddw4lzPwCsRykF7v5tW+G
 j6OTAh+IKDR2F+7ntwLsA2YAPfoL15U9CCJgJRqqpH77DSuZ6QgB7jeDf4EuDi1zovoz
 WqdVKpv8e/55Xn9GYpUy3oewxQ91CfDFS/Ljoeg0C7AuiGQkPCu8IGY7ptZcCfOFyu0F
 3XanlgorSS20WKL00Ktx8XMMNFwITyfSWzjmfWs+jSzPH1rSFkjSLEdZ6yYHveznktpt
 eclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJRWjyogOQnJ+5yTXZeR/CA8uKgjfGlQ9M7/4cay494=;
 b=1YyXN3afO+HCJ1OBAIGMbIjkw81PAgNkAI+a4A/EYR1Pgb0lmMeA+UetIa4DTQOe9F
 jBuhk4M+3J7E73ZZvi/oZ7VLRGpfta/kAFJqQApIf+kubAOd7JOd2ILz1E/Ijp3MKkYj
 fbCNWEAcV+1Nf50S32iV0aFqhgZAzOPTCMLi3ys8CflksIeBKbRpm/hQvoq24Q++bmzH
 DGSfBASDIb74RtbPeBI3dOE6u+LlkszOLz/ylk6dVy1gdcxLCpGscert2taO3B1pNeqx
 FQlAih8XxaIoaARI2AvZRPHh7vUzMjrZMKuQUGDKvVXCZbWZYEnGnqLtAO+YCOOOBNM3
 0oRA==
X-Gm-Message-State: AO0yUKXtn9aK8RqQlBFTbfFMj5PI85PdTsL3t8xzhSavvD0CPt7TVp6i
 Q6S9CwWwY6d3ucQoBcAlTxL55485HIE=
X-Google-Smtp-Source: AK7set/0yqp/q3/jslTp6QxBhdRo+Dy4M24xdmTIftytbmsLtB5hmbelVCK/TX7kEgjPGP3InbTQCA==
X-Received: by 2002:a17:903:2447:b0:194:5c63:364c with SMTP id
 l7-20020a170903244700b001945c63364cmr1849203pls.62.1676754978760; 
 Sat, 18 Feb 2023 13:16:18 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 ji11-20020a170903324b00b0019afb7a02a1sm4785944plb.218.2023.02.18.13.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 13:16:18 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 14/14] drm/i915: Add deadline based boost support
Date: Sat, 18 Feb 2023 13:15:57 -0800
Message-Id: <20230218211608.1630586-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230218211608.1630586-1-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
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
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---

This should probably be re-written by someone who knows the i915
request/timeline stuff better, to deal with non-immediate deadlines.
But as-is I think this should be enough to handle the case where
we want syncobj waits to trigger boost.

 drivers/gpu/drm/i915/i915_driver.c  |  2 +-
 drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index cf1c0970ecb4..bd40b7bcb38a 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1781,7 +1781,7 @@ static const struct drm_driver i915_drm_driver = {
 	.driver_features =
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE,
+	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_SYNCOBJ_DEADLINE,
 	.release = i915_driver_release,
 	.open = i915_driver_open,
 	.lastclose = i915_driver_lastclose,
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

