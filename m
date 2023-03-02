Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625586A8D98
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BA210E5C7;
	Thu,  2 Mar 2023 23:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CF910E5C5;
 Thu,  2 Mar 2023 23:54:38 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id kb15so825404pjb.1;
 Thu, 02 Mar 2023 15:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677801278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=ilNhgi7gA9g5UF3JdbyQJ98pGE28jeyXokpoYZgo/4oGV5MZDWTuptdkD3ZA1ZMJvZ
 rCQMSfGH0oH4lksZHwpeD/Tvqzs9/xczhovoCeEZIqu+we8vWtqvV/g64xYPZBOzhU1V
 QGu9jUSw8WMjx2PIomcktDqHUO7xacblyp2KMC5q78bDv3NEgIgkgoCPdMJnAvemOlq0
 9t79FhU9jlhR3S52crrH45gg41OmGuWea1o9Q1kELGp/FR+eOT82YQpRgPM16l3yr3a3
 UI+Wv1rxy6t7MsrV2Q3tj9nng5KYC1vhTYNOeTQBs4OxwcDzwEC6rRK2Po63yuSC+VY1
 NvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677801278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=hgZkB+KtyJcdGfjMI+muu/SqGV9TjbNYQJ3UDam5CHKpkAgmYbEuIjyxmPghlZjIwB
 aXgEssW7bVV8pouET7eU9FPzeU8tae7DjYaApTHJErfyyXJQUnc6Y/Q+O85DGwKM64ob
 UuuEmi18y6PkKvJNE3G/10CEmP/lBzo4b2HV7Fmn/hsHOT8om+Ay3hNat6Obr5+NZbXO
 CfKIRgdubWuEFCXKZ6czTN80M6y8p73TqPI98ViqjNmkYcyf4X1oshHkEnfw7VguCWm+
 uEBVq6mZ4Y7ej6yyGLinKP3r8Wv5jYdxUzu1/2t6t0JdP5QcnGTwVq79k6f2oDwzNyat
 IWOg==
X-Gm-Message-State: AO0yUKVJ3ULgb6kXlgIinPxBjhZUp/1rG9snJvEEGdRSWNwsBoi85OGg
 8mUBSO8ggHanIwWl0/FeZrHjZZxkrmg=
X-Google-Smtp-Source: AK7set8MMNMyoxi1CQFIM96JL5lxCKCAgiy9KtwRs4PV9rjzDG2oshbAyTSE0x8FSQcNt9BUvoOzxQ==
X-Received: by 2002:a17:903:1c1:b0:19e:72c5:34df with SMTP id
 e1-20020a17090301c100b0019e72c534dfmr17373plh.52.1677801277784; 
 Thu, 02 Mar 2023 15:54:37 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a170902768900b0019ac5d3ee9dsm218526pll.157.2023.03.02.15.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:54:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v9 15/15] drm/i915: Add deadline based boost support
Date: Thu,  2 Mar 2023 15:53:37 -0800
Message-Id: <20230302235356.3148279-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302235356.3148279-1-robdclark@gmail.com>
References: <20230302235356.3148279-1-robdclark@gmail.com>
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

