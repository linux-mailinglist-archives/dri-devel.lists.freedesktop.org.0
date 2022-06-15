Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E1954CE94
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2764F112407;
	Wed, 15 Jun 2022 16:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87410E079;
 Wed, 15 Jun 2022 16:24:25 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id h192so11835997pgc.4;
 Wed, 15 Jun 2022 09:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=py6GEyuDmZJFdYOHYjHaNYQonIUxCggLBa4xNxCVPiI=;
 b=lwp84MUy8aVK38zeHShl+5sWGRLOP7YtFKjClNzK9QETCKTdvHtTQwSV7YX7IAleTZ
 hhnASLIQAYmpoY2kT26DOKUhr2JdllSmRc/ZsxynkeE0cvqwbGz0+vHcrRo8Gi7uhX12
 ysn+n/bEjOIcuJZ3cnSbZW8ySuu9jn0j+ZUEl+6E8n+sKXzkerb14hAAvpnD8r+UxN5L
 tCi6GW08Nr/0izW5Y1Q6z7d3jsfSNXxD4RHVmKG9w1y5tRsyzZZrYEe3pPw+0E0ffeZF
 /7YEtZUUD54Et7Xnv60CWfGdNQlX9zgEHStpar6E1h725mj2spJZ9ioTck4nEZsyoiLG
 yp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=py6GEyuDmZJFdYOHYjHaNYQonIUxCggLBa4xNxCVPiI=;
 b=Sp6dUuIltvlcz+eMCPPLyL6t16iqpt8K6Hj2o/e5O2WB7dENcdlRETQfj+3VW6YmmQ
 OXkmuP3l/tQeos8L7dRSJqjfpzQUHn1QX4EPMFFcy3wnIJmb1FDj7nNFcz4afJL4L372
 8TrqMHdbCqlXTXTZdop1DFTaI0TNn/U2VOQaCCmNkV55mzbLsvOvL5ZqDP5A3GJDHLDu
 9PzyF0NOVjhWJotc++cNILXpoiU+Gn41b7Z6Kcublx9nYNOL3onwe8jBjzf+K+378DKc
 3G4LNpVmWuBTCGMIsJYzKDMObhbBNX7RV7ZKqaQReqQc05k4dVlOfqB8qe3BPgs3cmlE
 g4RQ==
X-Gm-Message-State: AJIora+4rhczKCOIkAroQ8F9KAwDpV9g371U5a6KlqF49qjndyxx2t2P
 18ntBIxNYlHHGcJCqFjCWvoxMRNXp9g=
X-Google-Smtp-Source: AGRyM1tGREJNu5awib9cAUO8GkgnbOfiIQsGUbIPOrc/TUh8iC3c1m0/3l/Ns5AH207ke8bLqFgObg==
X-Received: by 2002:a63:824a:0:b0:406:59b2:b5b4 with SMTP id
 w71-20020a63824a000000b0040659b2b5b4mr556905pgd.190.1655310263864; 
 Wed, 15 Jun 2022 09:24:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a17090aac1600b001dff2fb7e39sm1995523pjq.24.2022.06.15.09.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:24:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix fence rollover issue
Date: Wed, 15 Jun 2022 09:24:35 -0700
Message-Id: <20220615162435.3011793-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

And while we are at it, let's start the fence counter close to the
rollover point so that if issues slip in, they are more obvious.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_fence.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index 3df255402a33..a35a6746c7cd 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -28,6 +28,14 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 	fctx->fenceptr = fenceptr;
 	spin_lock_init(&fctx->spinlock);
 
+	/*
+	 * Start out close to the 32b fence rollover point, so we can
+	 * catch bugs with fence comparisons.
+	 */
+	fctx->last_fence = 0xffffff00;
+	fctx->completed_fence = fctx->last_fence;
+	*fctx->fenceptr = fctx->last_fence;
+
 	return fctx;
 }
 
@@ -46,11 +54,12 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence)
 		(int32_t)(*fctx->fenceptr - fence) >= 0;
 }
 
-/* called from workqueue */
+/* called from irq handler */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
 	spin_lock(&fctx->spinlock);
-	fctx->completed_fence = max(fence, fctx->completed_fence);
+	if (fence_after(fence, fctx->completed_fence))
+		fctx->completed_fence = fence;
 	spin_unlock(&fctx->spinlock);
 }
 
-- 
2.36.1

