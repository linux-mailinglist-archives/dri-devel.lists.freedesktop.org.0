Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F9408C60
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67B46EC88;
	Mon, 13 Sep 2021 13:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438506E1A5;
 Mon, 13 Sep 2021 13:17:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w29so13884621wra.8;
 Mon, 13 Sep 2021 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bKAQHY4Xeuziw06SdV33IAa0ClPBsmLs4nux6eiiOrw=;
 b=CrnHSbYi6TvXO5lyMKh7RJfU3Xa4s0V+wY9O40UQWrxQBNnV7bD4hXyK2p1hIC9rYk
 7FxtXuAkUYTfh7shO5V+xDy7Ax4GAFM8Ps+fcjqRTBZxSbWoRNUx/k9EUsgpOZaenLVn
 ddpY1dVyOrNV6fjc/YSnA46byJWTsv340oQef/C/9QjoW4DKGi8IFe2hZLU/nhiuInux
 /5TKpnJMexJOyl7Wd1laH0hLAeEpuZYS6yhyGy6Z0S0UdTQ8VbGXAUYSRHQ5YrS/E3Q8
 hME3/Se/UrnIFuomu6ZRPO4Fjr8oZZ0Hrqe/QAhzy4WURj5vuMc5pw9+s2NW42uWopjn
 fI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bKAQHY4Xeuziw06SdV33IAa0ClPBsmLs4nux6eiiOrw=;
 b=DFLdpPrCcYQHq8ShO8VM0qAajgDGVGElQxm5fcGJnyRjR5UIEkWMTK0EHcVJR8d3Ba
 qCE3Sib80I1xSq0E1JT/P3S8qk66B+dhij06z5TteSvS0PNgBoI+Avc82oJW77/jzy5w
 cajFE1H26YNGYCHB/9k+eMoO8NAPXqIVG7HNL0uLDXNyn/Fbycnm8ZcQ/peY6CLNcYYu
 ZdsKFBW0QrkfDhSCOoVuSyFLtSQnoTaXd/KCJnwOBAq+ds8KAi/EpMRE2gTn/WuDPukD
 4RQgNhpYzaZP5diEIxjbJpt2KtNfioKkkKvtprRmbd7FJ725Y0Z+mscGxUWWEZXrmOKR
 WB4w==
X-Gm-Message-State: AOAM531btjcCSxuijpHwFqokJP/XFBeIz89HkzYyFgeZK5JR1QXyrZth
 fdWv8uVW6fm+imib0wVGqhA=
X-Google-Smtp-Source: ABdhPJz7WNMbXswxujEpSHrQYGaaxUUrUs6tHCs/mUGI2195wSxF+ircdolil7LhOv9eq1jdr1QwYg==
X-Received: by 2002:adf:f084:: with SMTP id n4mr12386191wro.362.1631539053358; 
 Mon, 13 Sep 2021 06:17:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/26] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
Date: Mon, 13 Sep 2021 15:16:57 +0200
Message-Id: <20210913131707.45639-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 49 +++++-------------------
 1 file changed, 9 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 1e97520c62b2..13174541f6c8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,24 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
+	dma_resv_for_each_fence_unlocked(resv, &cursor, flags & I915_WAIT_ALL,
+					 fence) {
 
-		ret = dma_resv_get_fences(resv, &excl, &count, &shared);
-		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			timeout = i915_gem_object_wait_fence(shared[i],
-							     flags, timeout);
-			if (timeout < 0)
-				break;
-
-			dma_fence_put(shared[i]);
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (timeout < 0) {
+			dma_fence_put(fence);
+			break;
 		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-
-		/*
-		 * If both shared fences and an exclusive fence exist,
-		 * then by construction the shared fences must be later
-		 * than the exclusive fence. If we successfully wait for
-		 * all the shared fences, we know that the exclusive fence
-		 * must all be signaled. If all the shared fences are
-		 * signaled, we can prune the array and recover the
-		 * floating references on the fences/requests.
-		 */
-		prune_fences = count && timeout >= 0;
-	} else {
-		excl = dma_resv_get_excl_unlocked(resv);
 	}
 
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
-
 	/*
 	 * Opportunistically prune the fences iff we know they have *all* been
 	 * signaled.
 	 */
-	if (prune_fences)
+	if (timeout > 0)
 		dma_resv_prune(resv);
 
 	return timeout;
-- 
2.25.1

