Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29F408C4E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5626E1A2;
	Mon, 13 Sep 2021 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826DC6E1A4;
 Mon, 13 Sep 2021 13:17:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id m9so14676220wrb.1;
 Mon, 13 Sep 2021 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=mMMsaxM/vqjd5bLOQEvmmghM1+sHlOGCK5AYCcY9EWM+gfhyIMh36GOKiviHLgg4Ay
 ENpYvpHiuivUK55Ba0nru9D9RF10DOIJLDeN4a1LrTO64bUundiyJ+uzEgrGVTo+DBc1
 AR/WyEByuXIC9CEqqnHcXkcqd75rF9kkco8an4rQqqkn3A9l4OVQT9uClhy6Ru/jSmh9
 u2GPC20iWnuzQ7H/T0GGu4ip7BrIAfQzdTxULNLFiwrj7Qu2Q6G6/cG3eyU1vz9bunQ9
 Uy5IhHgLU76CgGheiqQVXfUW9kAWER3MI7/jMzTLo3bODrRDilW/SzF3mPwywo73mWJn
 vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=Fkhs6AZG2SafyoPeubFmRBAXIt+mRbOrpMB5m7Vvo53QwVI/wxtVuKztNk3yE7O0dR
 yPPyJRs2LY6dLObgzTaI/F/lNomgnsiZFS8DOiu/V7u2Iw9WjSKsBhqsYcNzWzlHVtBf
 xYXoxumKMZFptrubfV2mnIsmAnyhYqA0xfxnhQWbTEjkGekni2Ch106VCANBR/A0yvqF
 gDxxO5Im8vPgDWjc/jsyDdjIxpc1pwqJSjZRmv2/AcoEk8IDxihUsQlhn6Woz+FFrR3A
 91pJi8elbTOnU+e46xQEzQxp0GFycxGRUEMvSVNfm4VHm41PXaXloGO3+PMRaHHiTu/4
 DY+w==
X-Gm-Message-State: AOAM530isRTVA88xbi4HOHtTFVGhpl4cbO25ebzW6R5lPpIYycuJztKe
 JvcFxQdEbOsJkP6w74hgYg4jjtqOwlyV6zLf
X-Google-Smtp-Source: ABdhPJyUciFZQ3By420tUv3xvxnipAiMOetjs7jLCuB17bFGBNKPMPEX2Hft+7f69h5t/ldyAUvkOA==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr12589510wre.85.1631539049145; 
 Mon, 13 Sep 2021 06:17:29 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Mon, 13 Sep 2021 15:16:54 +0200
Message-Id: <20210913131707.45639-14-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 30 +++++++-----------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..c6c6d747b33e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,28 +109,16 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 	 * to report the overall busyness. This is what the wait-ioctl does.
 	 *
 	 */
-retry:
-	seq = raw_read_seqcount(&obj->base.resv->seq);
-
-	/* Translate the exclusive fence to the READ *and* WRITE engine */
-	args->busy = busy_check_writer(dma_resv_excl_fence(obj->base.resv));
-
-	/* Translate shared fences to READ set of engines */
-	list = dma_resv_shared_list(obj->base.resv);
-	if (list) {
-		unsigned int shared_count = list->shared_count, i;
-
-		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence =
-				rcu_dereference(list->shared[i]);
-
+	args->busy = false;
+	dma_resv_for_each_fence_unlocked(obj->base.resv, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy = busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
 
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
-
 	err = 0;
 out:
 	rcu_read_unlock();
-- 
2.25.1

