Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C16A4B2C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 20:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB8210E51A;
	Mon, 27 Feb 2023 19:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721DD10E47A;
 Mon, 27 Feb 2023 19:36:37 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id y19so4252030pgk.5;
 Mon, 27 Feb 2023 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=b8736n309kh1uRXrJE2k/Um3KXaZinC+6/mnagsKOXeEGCtqaoZLgHv9EkxoYXJRwS
 zyfCbEC9JCFtyMY7WQZQPA8QXUcFZpDWSYCWxuW4uo5KMmZNxa3byyQC4DpXMEz57VDW
 Zw5iYZd+QeBYbIOF1BQ1Eia/s4rwzzlK2s84N1dnJwf5tGJNaxNafY0Cpat++4+DvNxA
 QTZIhRflMHWIC2tqDzr8HnGn2dB3Tbtf/FH9dH0okN2XWWTyh3gILz3ZL7r3mGxDZkTt
 MB+UWg7+BAmCJaxpPhV7lKnZdCBx78OnQCLcpiO9Kk3Ymo4t4WnLNcx245/XFreVCcK2
 zh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=onCBq2KZCDw5OowvMAoRkKZRbiVKd1Tfl91YyznK62vFtq5ycagM9whmwWoLIZiQ/F
 R82xrCFTr8FiOGw30pRy50dm6oz00+sC76HWjchQs90q9cdChaeF/oSRoPjbXn/ibWNj
 AaFi5Q44Z59zxBGhn7tu0d29GNaoE/cYMjNMQcTKvFtbfoSI3DNWKcEhNb7gXBpT3fLg
 QI68JR2wAnuOZ/mjzrs+lv1PBcbm7oLXr1oeVkGyT956XtDOzcRQ3Uvc5QNztL6gb8AT
 njElmkcA+7UxtE4f1eL8JlrIV8Pq35RoBYf4PaIW35/O9/6KFwKtGMzeQ6bS0xUBznHl
 t2Hw==
X-Gm-Message-State: AO0yUKUp9ZRGAVsVVDOE0owVY0i94+o7j2z4WUlXgKTdm70+0GSrT6Wu
 h1+YO9OqaH+mG01AaGkk76RH68gWR2o=
X-Google-Smtp-Source: AK7set/P8itus1p3okGBUFN9rk94RkS0E5Ql6lniMhVceVdpcIjzF9h/Mu+zklRPMkDx5JHA+kdklg==
X-Received: by 2002:a62:1881:0:b0:5e0:a86:a76f with SMTP id
 123-20020a621881000000b005e00a86a76fmr189244pfy.0.1677526596830; 
 Mon, 27 Feb 2023 11:36:36 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 k23-20020aa78217000000b005d4360ed2bbsm4551115pfi.197.2023.02.27.11.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 11:36:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 15/15] drm/i915: Add deadline based boost support
Date: Mon, 27 Feb 2023 11:35:21 -0800
Message-Id: <20230227193535.2822389-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227193535.2822389-1-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
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

