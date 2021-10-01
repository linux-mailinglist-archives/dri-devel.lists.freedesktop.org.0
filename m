Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0054941EA83
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED186EDD2;
	Fri,  1 Oct 2021 10:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8186EDDF;
 Fri,  1 Oct 2021 10:06:32 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k7so14492543wrd.13;
 Fri, 01 Oct 2021 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
 b=iUXLLrRCq5VuGu2ExmMH4st6B9HD43VM9DJT6/ZnZvDe5dY8UJcmZw/7bHADMGew98
 X5qjl5pixMJWAizCZC+xcI96OQvE1T6Y0Ga2Ev/igknIV+22UlBkXgHS3UVaC699y1BX
 2NqO/Y6typ4mrDx8pVzvybXnwv8hy2ijaKmnsAm1KK+raafFRqYBhPDM6Vl2IUSIvvF4
 KgT++elvcWdIHjzP/8Tno5yFjM/9+ouQC42NYIPVG+w6++shImH0A0arnN3Mf21HcpW4
 xj7STaXMpQBGLXeONOoz/xPIPzLZp8llBiYhbQXvK6Vw88K68eb/EiCTqV8RSpepBYuT
 FbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNte/ZxHyZbzH1TCe5eQqnVIdZH6R4S8//YNPJMBVTc=;
 b=M3jOHUBmM45J9nW1VHXaYqHo9AyE2ssWHLqGfBttJrrWAoGddrrlEOLlf/4mKiHLEW
 1mwnk5/pffi1TvCqcbjbftdwLUPQObC1Zf9IOl1Oe/4ed5GKd0doHTFpMq1RarXFwh4o
 KycOBSj9xQYUy17mEIKG4FcSZPGhAxa+UoxGui6vTRMcNKnvUYER0Mixb7w7L90DDFsK
 vADkG9Sy9MBFtD5HFwYxnEAb8gMYqKjLu1T0k1gHn6ztVKjN2D1CZihv/KHayWReJRli
 Px1f9duMSJ05T2Y0nts5TM4SXoJXU/pjNAVzXx0AA0OarSGAx5QAKnO0qGo8yWgu6DIi
 J4eg==
X-Gm-Message-State: AOAM530AmZx2XIvweeZzZ3tJJpgerxZ6feO4Ykduyp9NhCgfFv2pzqPc
 L8mG25QYnIlCTRdqakaO7JU=
X-Google-Smtp-Source: ABdhPJy/Lma0dKGkX6dySp/8hr8i6mnCAwx2pE0jNyRvnW7knDgZ2dEgdpqFi27v5N9LBGbWo6v8Xg==
X-Received: by 2002:adf:e906:: with SMTP id f6mr11377619wrm.207.1633082790787; 
 Fri, 01 Oct 2021 03:06:30 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
Date: Fri,  1 Oct 2021 12:06:02 +0200
Message-Id: <20211001100610.2899-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 51 +++++-------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index f909aaa09d9c..a13193db1dba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -37,55 +37,22 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
 				 unsigned int flags,
 				 long timeout)
 {
-	struct dma_fence *excl;
-	bool prune_fences = false;
-
-	if (flags & I915_WAIT_ALL) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-		int ret;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 
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
-		}
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
+	dma_resv_iter_begin(&cursor, resv, flags & I915_WAIT_ALL);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		timeout = i915_gem_object_wait_fence(fence, flags, timeout);
+		if (timeout < 0)
+			break;
 	}
-
-	if (excl && timeout >= 0)
-		timeout = i915_gem_object_wait_fence(excl, flags, timeout);
-
-	dma_fence_put(excl);
+	dma_resv_iter_end(&cursor);
 
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

