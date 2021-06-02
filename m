Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC639903A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 18:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134596ED12;
	Wed,  2 Jun 2021 16:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD6C6ED0E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 16:42:00 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id t28so2611989pfg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 09:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gPVNq3xY6/pVhK42Qp957298GnOdq1x2LLqM9lPcSF0=;
 b=WwIZN77eYfoJ1K/hpdlXAfsBsosrcxsjt80seY3+/6dr7oWCnGj51ZBiJy2woMqt0C
 +8BJ2GHg+hJs8owJOO1RK3FyvbAnjwpmsAxzzS9InZP8e65RGM5pMTJ5VnDI93yx/6tX
 Nc4Yw/C6dYPdSU/dDxYD+tqgDTrAX+cE43hJGGQ/02vkv2+zwLemKDFEV7TNupN0txqk
 Xomz1eJ8T0MnOgpFjqXuqatz/OXsCRUCJzjvGKknUWG0h387SFc2N+/vueMreiMmzXVt
 LscFzQkInVvCrpP3aAEBmhPxNv8iEqsLmFe62VA9HIW6XUpha1PtAodV0fTkBsUcDvQI
 Wg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gPVNq3xY6/pVhK42Qp957298GnOdq1x2LLqM9lPcSF0=;
 b=UlYseu5hUUwQyAw9S4c5eyNR1YuHA/UQ9dkvpan2+okj+9yqgfluxHLRcI7gKSZ9Yr
 YCCRI6kS1HCjp9Z4YL/i191zFAWVYW1jQQHDZNVOQY59KcTFbhOdyjGXvVzgmfQHEEOJ
 DWbSPUv5QFcK9WAJ3eSkooDSAPhzKQSfXyK99bez7OD2hmIbIplxRAXlRsLYu2v0cwlK
 LItwYWy8FXWLh5UryWa3ex1NwT0lf8NZ/R71RWYeZ4mIFjFSeQ+aVEH6JhpMtMV8Q/+6
 aFyZLJFF2jTum0EDBa2sFZoLnqGM4vDG/Pn79QXzrB2OGAMMEdBQxC1mRY2yOOrM4Whq
 olfQ==
X-Gm-Message-State: AOAM531l5Ojq3aXHpQgvqtKUgkdm55iSjxFJlI3CLIYVjHmybBIC5tVr
 DSXAyGI9lscHQqvzeyEDeafjPzoYaWTfWg==
X-Google-Smtp-Source: ABdhPJxlqXWTNaqRa5erKgD5YGNKy4A/O7o19m2tpIvDsZcU/e33F551nOmmOZC0UVcLlzWTNFe8aA==
X-Received: by 2002:a63:f344:: with SMTP id t4mr19286061pgj.314.1622652119744; 
 Wed, 02 Jun 2021 09:41:59 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id h6sm75803pjs.15.2021.06.02.09.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 09:41:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/5] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
Date: Wed,  2 Jun 2021 11:41:48 -0500
Message-Id: <20210602164149.391653-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602164149.391653-1-jason@jlekstrand.net>
References: <20210602164149.391653-1-jason@jlekstrand.net>
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

This reverts commit 9e31c1fe45d555a948ff66f1f0e3fe1f83ca63f7.  Ever
since that commit, we've been having issues where a hang in one client
can propagate to another.  In particular, a hang in an app can propagate
to the X server which causes the whole desktop to lock up.

Signed-off-by: Jason Ekstrand <jason.ekstrand@intel.com>
Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
Cc: <stable@vger.kernel.org> # v5.6+
Cc: Jason Ekstrand <jason.ekstrand@intel.com>
Cc: Marcin Slusarz <marcin.slusarz@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Jon Bloomfield <jon.bloomfield@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index 970d8f4986bbe..b796197c07722 100644
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
2.31.1

