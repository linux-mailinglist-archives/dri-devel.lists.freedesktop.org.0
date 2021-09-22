Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B94144E1
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971786EB37;
	Wed, 22 Sep 2021 09:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B056EB33;
 Wed, 22 Sep 2021 09:11:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t7so4541009wrw.13;
 Wed, 22 Sep 2021 02:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
 b=MTS+8CxT71Oe7hMOt5KRA2yUEnaBP213RX88NXAbzUEHOeCZ93DaA8pTcHWaj8dDyZ
 h7RXT/obLhKoTk59ve8Lj15yGywz/u2fmJ74RoicC4oxRHfYMXReIlKc7k+SeoG9Doz9
 xM6OBGZlNfNqWhk1ed2lxGKzycWTpW6CDkoLUIjG7Lk8azTSkuTirraPT9Kr8fxWO9m2
 hu+1TZFBExqLZiwkoym6mhNiHDVSUYVoidGfjSGJ1dxiNYBb6wr6FYCYv31mZsZLnf8C
 VxZdDsCjdVH5Dp+wBPEvE8cOJJ9/aIh6w4OZocXdY3sEvGGIU7pnD+A3Jde6NqVxOCZy
 Xn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
 b=27DY//uFJO9mYbXpk1TE72oBfs2JYLWMmB3FD6XWvGjhtKvElOgJttdfPLa2oVDOd9
 hTuN6qSuH/pcB3Ta9QPqoQPHNADfQ7/jh15fBLYFxA+VAqNuuadC89yn6ntgSPEokiM/
 aojxdZNflm65ONPP1QXhLRo+4rJGcnEDA8kEmKjV8mRQpsJwmk02fnurKdBZrUSDWzB+
 gheIjhC/IOFS1gjcEyhbXJCDX80Kx16WO/GAXCEUsNfZKAJwpTlk/cv22Y3FgRB9hKaJ
 KHmOc8ZfqtvKn4gfEEXjZoIPRgBYHu8buIX5qbqOkMmChsAhhbg+vJBVi4Li2KG0A8yQ
 B9Dw==
X-Gm-Message-State: AOAM531bp90+gGsZT0+w1rzmQW571Vi35U7rdwVwOZYBED8vW+o8B25h
 jfca6VNxwmgikLQGG8JMYg4=
X-Google-Smtp-Source: ABdhPJzCbC82QhHH5hdyWRlXJ4Bk6zDGjppXG8JDIjAeP4hhouA56wVcY38fj8lDLIwgypugjBclrQ==
X-Received: by 2002:adf:fd92:: with SMTP id d18mr40757513wrr.28.1632301860060; 
 Wed, 22 Sep 2021 02:11:00 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Wed, 22 Sep 2021 11:10:31 +0200
Message-Id: <20210922091044.2612-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..313afb4a11c7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -82,8 +82,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -109,27 +109,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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
+	dma_resv_iter_begin(&cursor, obj->base.resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_restarted(&cursor))
+			args->busy = 0;
+
+		if (dma_resv_iter_is_exclusive(&cursor))
+			/* Translate the exclusive fence to the READ *and* WRITE engine */
+			args->busy |= busy_check_writer(fence);
+		else
+			/* Translate shared fences to READ set of engines */
 			args->busy |= busy_check_reader(fence);
-		}
 	}
-
-	if (args->busy && read_seqcount_retry(&obj->base.resv->seq, seq))
-		goto retry;
+	dma_resv_iter_end(&cursor);
 
 	err = 0;
 out:
-- 
2.25.1

