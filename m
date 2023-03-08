Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49436B0DB5
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4616610E62C;
	Wed,  8 Mar 2023 15:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB88910E62C;
 Wed,  8 Mar 2023 15:54:30 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q23so9885401pgt.7;
 Wed, 08 Mar 2023 07:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRQ1dHdIY/cau10a8E821pdOJBm+YYqmFlRisJrtcpU=;
 b=VInRsevL5hoOa24Y230bcVyeMLhH1aYIW9bUbR0nGfdeB6sMlUDfsB/IW5G+fFUrdS
 xq6loIUgrztEsywE69ZAUqsW/L7mtKOytKAxltZ3p9YKFi2P++DogG9K8Wzc4VJz9IkR
 eIWO7Ytce4BgJ/1k5T/PIexTpPW9HU/10m6MSvCYXZGAWm6rKl2YTRWJh9dj9zV/5Xcm
 ECw0NTffFqx4DWlIb59auEPRrYN6tUrv0DAG1fPg6lIXMqGtWwUlR9x0+Muci1Ohe032
 oiCRyrQ7zikzViwwCe93VCwvd/UimZPs2bcwJ5HysU/y6zbQohofGorhDeC9UnlH4d6l
 t5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRQ1dHdIY/cau10a8E821pdOJBm+YYqmFlRisJrtcpU=;
 b=1BotfAEDiByJzWh1HVWKVLdhh7C6y1mP4GN/7oe1KWBdQyralk+F3GS+DcPMhKFele
 xvPOeiUQkkyTwX0GXdze/K/7nBAqi0Ub5w169X9OzS7SBjx2eJVQG8pCmSesTm4HSMi0
 dPYgxrJ2UEiCM98Esou0+ozRNQrnMRN79YhShoVBXU+eRxM7kUlQOSBXlLEzZ+BVk1WY
 SKRQyKo8hRVd7pL0/QowDbnbhl4xnE8r3DTr880rLz1R7ZICmHarDu51o16B92/fBfLh
 VEm83Dk/xPr/9pyJc6e1X7ezDZHk/u0Z7+4NrTJVi7StJ7uVnT/+ypKJ7JDb7jmoF3SG
 Dlzg==
X-Gm-Message-State: AO0yUKUSsMJrLOO5wIz3+bdmfQ8Wr2IGLVJkeCJnJy/uAoPN9C1SSWXG
 9PEGsMP0V5ea7NvLSyd1ZEHLnCRxliI=
X-Google-Smtp-Source: AK7set/qurbajmx0drbw1A0UnfJ3nB9Otb6mpv7CbrkCjVlUVasHmbmab9vdSeIaq9fwrT8DYoD/PA==
X-Received: by 2002:a62:7bc4:0:b0:5e2:62b7:f785 with SMTP id
 w187-20020a627bc4000000b005e262b7f785mr15546331pfc.29.1678290870363; 
 Wed, 08 Mar 2023 07:54:30 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 u5-20020aa78385000000b005a91d570972sm9486660pfm.41.2023.03.08.07.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:54:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 15/15] drm/i915: Add deadline based boost support
Date: Wed,  8 Mar 2023 07:53:06 -0800
Message-Id: <20230308155322.344664-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I expect this patch to be replaced by someone who knows i915 better.

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
2.39.2

