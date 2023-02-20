Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100AD69D4D1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E64010E79E;
	Mon, 20 Feb 2023 20:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4032910E78F;
 Mon, 20 Feb 2023 20:20:03 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 132so1155448pgh.13;
 Mon, 20 Feb 2023 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=eFd6WKVkDjMERL0NUJwdZTkwaDz0OjPOGjnuwSqBIjiEyMvPenvK4sKtmZyxPWgSI5
 WzMJ7uiuRFqsr+eNs7HnTFRMZMbN/YDiqBuD4ndq4yNYXEZLdGcxi3k805YFDaRTM49H
 btsQGnmcp+Jjet2+wIFLHC8jDiihHqY6cv/dPw9x9644Qa2EUek2cYNr9GJNbS8dgyFQ
 P4BpZWBP0fPeYBPaJP/C+GnuHA8Ghph1mcX47CION2s+/ZlxKblgjj9wQSBLyzCt5Nee
 8vZ4iojT33oWnJ5z8yuQWQAsIzfLIZESfCxDG4TaE7N2JPqd9DRSZuJmNBVAKuuF7rDe
 FzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=b2D3GNfW3NpIQlnQe//o3kk64uVJoen59xzLskqNQh5FbogFFtAwGYGkCSYP2RzKSQ
 A0HkrojbDk3dmfWni/CD0UfdGshLl2JAhJO29AJqQI2ETmPJQQJc7hblLOrML5JzrkJr
 zKTZHeV8MkohToShUovi8XyVx90gi1cJqiAxUMfAT8pM+oR2y06dZ58g6M8JUOGKEOXW
 d/DfOp0hUDAk/63P5gwhJGlwMK6j65uaCEeadGIgtjZDlIHbOyN22Kx9/voNh8RjnX6j
 2XvDmcY4sZFgXQvi1SV41irgFPCRElesyYz991C8tFEvDHa7jjNjh7o7XljuyOMNpLgn
 EfkA==
X-Gm-Message-State: AO0yUKXjNLod0BQC1zvgjC9YBbeP1AYtPx89dvd/OhHwjH+Q7eKDuVt/
 fTXfsO/U1anNooEIbnvQA3rpNnqNcGM=
X-Google-Smtp-Source: AK7set/lZ+AFzfPQmwQQNW8iN+Fzdh2s6fnv3atcgztBFxVgeLYdWwu6bkkmpStlqHcJMRsJSfDpoA==
X-Received: by 2002:a62:184d:0:b0:5a9:fcb0:e8a2 with SMTP id
 74-20020a62184d000000b005a9fcb0e8a2mr1540546pfy.11.1676924402380; 
 Mon, 20 Feb 2023 12:20:02 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a62ee16000000b005a84e660713sm1934218pfi.195.2023.02.20.12.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:20:02 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/14] drm/i915: Add deadline based boost support
Date: Mon, 20 Feb 2023 12:19:01 -0800
Message-Id: <20230220201916.1822214-15-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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

