Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA2388B78
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3426E3F7;
	Wed, 19 May 2021 10:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6266E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:15:33 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a4so13432073wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLSDac+zFZCvuOxhlqODKoOPK9Xt9GPFhoNCyvTD8Gg=;
 b=VE3Te1/ELmmu2l86Lyr6KvezntZCLWf3JxFRLBAdIc98DxKufyJcGGYNgU6jEpk1us
 MePhBlWICyHVnWm6snPH7aXxkaEjHarlT8pnHfK0kBuBwRXIdYViL8BJYIifkmOzh/iC
 57UyC4tMTfhAVC1r/33TyCzLN6Qwpars8fO4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLSDac+zFZCvuOxhlqODKoOPK9Xt9GPFhoNCyvTD8Gg=;
 b=msZLhtxD4SkmRczfz9Bj2Y/m3d1dKnAt+/xVdpF9X1tl6tSq5AeRLrGp0dA+mw5IaH
 sbwen/YtsSA5cyrWO+x975ugtQeojWcW2Mx52D+vP4WnXX8dZbVNcPzbTLGU7IlvJS4Z
 4BZDIyExSQbBVVk2+AUhuwNJ1RQxTB8lhjh9YXJAGbueYRTx6jT50V3Iz/Adet57mrPe
 JD1Dua2mPo/OsDAgh3qOPTD6pRVI4CusLNR86nm74y+xjjqkSKygS5y2U5dOTI7y34it
 tF/dN9HrgKKcT9oLay986ULl7YIwwo+Ds0AoNUFpAL9vUPbBJzKN+Q34D6QjH/nXTSyd
 qAqw==
X-Gm-Message-State: AOAM533cvUb9jPJpSUFznYoepRV95Cf1H3yMycy3lG/hQRRfCfRjE4JN
 Vxbv5ufWAuE03igAtYcasfthNA==
X-Google-Smtp-Source: ABdhPJyO4uSwCzhB8EODPl4WGgU0IKdKHfwW8l5xIaB3JUwY+ZsaqHCkvbPehwjj6lBFCrttZTHPBQ==
X-Received: by 2002:adf:f309:: with SMTP id i9mr13931576wro.307.1621419332273; 
 Wed, 19 May 2021 03:15:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d3sm25215307wrs.41.2021.05.19.03.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:15:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
Date: Wed, 19 May 2021 12:15:23 +0200
Message-Id: <20210519101523.688398-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210519074323.665872-2-daniel.vetter@ffwll.ch>
References: <20210519074323.665872-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org,
 Jason Ekstrand <jason.ekstrand@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Marcin Slusarz <marcin.slusarz@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Ekstrand <jason@jlekstrand.net>

This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
since that commit, we've been having issues where a hang in one client
can propagate to another.  In particular, a hang in an app can propagate
to the X server which causes the whole desktop to lock up.

Error propagation along fences sound like a good idea, but as your bug
shows, surprising consequences, since propagating errors across security
boundaries is not a good thing.

What we do have is track the hangs on the ctx, and report information to
userspace using RESET_STATS. That's how arb_robustness works. Also, if my
understanding is still correct, the EIO from execbuf is when your context
is banned (because not recoverable or too many hangs). And in all these
cases it's up to userspace to figure out what is all impacted and should
be reported to the application, that's not on the kernel to guess and
automatically propagate.

What's more, we're also building more features on top of ctx error
reporting with RESET_STATS ioctl: Encrypted buffers use the same, and the
userspace fence wait also relies on that mechanism. So it is the path
going forward for reporting gpu hangs and resets to userspace.

So all together that's why I think we should just bury this idea again as
not quite the direction we want to go to, hence why I think the revert is
the right option here.Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>

v2: Augment commit message. Also restore Jason's sob that I
accidentally lost.

Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com> (v1)
Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
Cc: <stable@vger.kernel.org> # v5.6+
Cc: Jason Ekstrand <jason.ekstrand@intel.com>
Cc: Marcin Slusarz <marcin.slusarz@intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_request.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 970d8f4986bb..b796197c0772 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1426,10 +1426,8 @@ i915_request_await_execution(struct i915_request *rq,
 
 	do {
 		fence = *child++;
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			i915_sw_fence_set_error_once(&rq->submit, fence->error);
+		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
-		}
 
 		if (fence->context == rq->fence.context)
 			continue;
@@ -1527,10 +1525,8 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 
 	do {
 		fence = *child++;
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			i915_sw_fence_set_error_once(&rq->submit, fence->error);
+		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
 			continue;
-		}
 
 		/*
 		 * Requests on the same timeline are explicitly ordered, along
-- 
2.31.0

