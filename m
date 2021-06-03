Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C339A4D9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 17:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863C06F4BE;
	Thu,  3 Jun 2021 15:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E954D6F4B7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 15:40:38 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id c12so5191702pfl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNx+orAcFBlIoQQ1IaqOvr+hd5jyTpS3B9hPQkDBVcM=;
 b=s2wAYwLqtRx6adqavH5RZMLRoiRDBRLsVcXbIAaD9UnezFqmXZyhXgk5Ua/oBpARSG
 IYf4RW8yGyK8p11Ve0Ts2Bbjb0Qh6GZNvTfyCXcCR8+oGjIVfa3dkV0dae5bfCjpYscQ
 nEu/FgFf79H51S/HdOP5ZT4W7LGCzzfsf9N5m9aTlsGemovA8Zrxigh/2bPQUk8wspqN
 ZFHJeTKkSf47T/3Ciw9JagHEpqmnUmyeItsuMvXuupeQbG9+fez2rtLbGLNZ5hULbA8f
 YjHciUqVT0UI/IHqqnP8zdrsfJJP1g5axPvqwkpnk4UI4lIhovuoWoloJ3nq5/zuuA5k
 r0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xNx+orAcFBlIoQQ1IaqOvr+hd5jyTpS3B9hPQkDBVcM=;
 b=VxxVYp5kvz/imOs3m1WE6Q9p2qRX1QxuqVXkzfSG61Uo+zEGJ51dpqT6g7Bq+ZM5tm
 iDb/o9Xhh/0xCDsG667UXDmXKs71H/XyWAIkvp9buHN6Ya/6O8/pMZOnSJV6/zecb4Cg
 COzVK3qnnn7ZCI8wmOKNrhNYIbPzV5wsVi+A2b+Ing+MLaGFSqF9gcceGaweCOKyN3HH
 t1w503dXPSg3G8X6cV91QBeLRUkN/O5iPAuUwA9w9Cg4hXWaZ/rGkJiSDjyLiZSnuWCE
 7BNtG1HcRkzWhA/vgEjr2dNCl/DOr8Saee91oOSgWKQCfYWpVo+mOxbWSgYZYJ52wzxq
 aQbg==
X-Gm-Message-State: AOAM533ZdQh3F1nLqrSpGdGuy1VXtzA2xN5f/UJguY2wYRLBRHoBaJPA
 eL0NC8ZHRBTg3g4Ek1RSGJw0RLiJjiwNpw==
X-Google-Smtp-Source: ABdhPJxTFvmDeWylRort61MMfCnKq9X6uQFEbkGSzp80ux0O34MNh5Mtnj1NXolC1YQwt57zs/erjw==
X-Received: by 2002:a63:dd4b:: with SMTP id g11mr113407pgj.300.1622734837631; 
 Thu, 03 Jun 2021 08:40:37 -0700 (PDT)
Received: from omlet.lan ([134.134.139.76])
 by smtp.gmail.com with ESMTPSA id mp21sm2681789pjb.50.2021.06.03.08.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:40:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] Revert "drm/i915: Propagate errors on awaiting already
 signaled fences"
Date: Thu,  3 Jun 2021 10:40:24 -0500
Message-Id: <20210603154027.594906-3-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154027.594906-1-jason@jlekstrand.net>
References: <20210603154027.594906-1-jason@jlekstrand.net>
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
the right option here.

For backporters: Please note that you _must_ have a backport of
https://lore.kernel.org/dri-devel/20210602164149.391653-2-jason@jlekstrand.net/
for otherwise backporting just this patch opens up a security bug.

v2: Augment commit message. Also restore Jason's sob that I
accidentally lost.

v3: Add a note for backporters

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
Cc: <stable@vger.kernel.org> # v5.6+
Cc: Jason Ekstrand <jason.ekstrand@intel.com>
Cc: Marcin Slusarz <marcin.slusarz@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
Fixes: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

