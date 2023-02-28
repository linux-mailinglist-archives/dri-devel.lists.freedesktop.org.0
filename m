Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443776A6392
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 00:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B510910E0C9;
	Tue, 28 Feb 2023 23:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207D110E0B1;
 Tue, 28 Feb 2023 23:03:11 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so4082606pjg.4; 
 Tue, 28 Feb 2023 15:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677625390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=j/ogsyjdQRA5zYnsXBpsNkXEvSmQoeBfNg6XeRt0KkElPbyzUKxGr8RwmSl86o4DMN
 ztLh7LsVCV+uaNjSNr7UOPriKIqPZgohUBS1K9WRnqz6MiLI0M6xfpzkxFrbp3D/lDur
 inZxwhFCKjIR5uryIkhxHHCHK0472BvmeDRdGKeRo068Tu+fwjEGlfJPRakzpVDuX2eA
 RSdRj47f3t31B0tjaZjiMGBpJGQz4jmEwFNCJc0pQ2DkaOY9EJXSzRMjshuEtbL/Rfrk
 buQHwrWLMfVQCmOW7uWpYyHwV+//irPDNH2euzWduAGbAbpYtkZS5Jau2HfkMZBBv44d
 AXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677625390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9VcsUu3unD+maL4g/jB1gMbq//XnoqiDQvEiNIyt7mI=;
 b=Do+bxzky5ZCzhOQGZhOxkOh/G9/Nxqy9FpaNU6+EcB3RuCX/FawA8YAyUEpe3N94n1
 SJxbiLApWv2r5/Gsoq0MKvFjZRYWoW0+cedxrhABlK4hTVv9cHUdoTkuVz/Y3XZ1OyEz
 NAGs8A60ohwHTbXEvjvWiQ4ZYnUi66+TdGXL9mxNGYQ6M4EwHDUq70vdzacjuwDcUMpe
 ughpi7PEhmyj87nP6mV8m4nTAhVt9aU37ajPkTNUNn0gtJ7MT1N0BNXxtlkjWuY0Iihp
 SNF3ncokjyjJsHJdi8chWhhNiK8YhXL3pI9LxCVTxJkUKeA7PC+hgDbSeUZC7cZZU1V1
 01ig==
X-Gm-Message-State: AO0yUKWkNdbKmmtjc55n2k9t2dg4b7C406dhJugn67ObFM7ma6rieqKS
 Dncd4c0SeXniWQj+uAKJZFWWhSA5D3G9+Q==
X-Google-Smtp-Source: AK7set+uhL3oAEBWRGfMU0kz/dsgPtKf8mVqXm9u6mnBtkUHEgwo3uBk0J4jg6vnUxxbgGVMP/FFbg==
X-Received: by 2002:a17:903:41c1:b0:19c:d550:8cd4 with SMTP id
 u1-20020a17090341c100b0019cd5508cd4mr5350380ple.7.1677625390440; 
 Tue, 28 Feb 2023 15:03:10 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a170902d38900b0019251e959b1sm7004856pld.262.2023.02.28.15.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 15:03:10 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 16/16] drm/i915: Add deadline based boost support
Date: Tue, 28 Feb 2023 14:58:20 -0800
Message-Id: <20230228225833.2920879-17-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228225833.2920879-1-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
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

