Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C14138A3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7AA6E9D7;
	Tue, 21 Sep 2021 17:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019A76E9BD;
 Tue, 21 Sep 2021 17:37:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g16so41543011wrb.3;
 Tue, 21 Sep 2021 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
 b=SQNKYNDBEKD/Krc0eYgIJCbARqB0jxCcVHFFLAJZyGwCLxepZQfLSbQK62sAv7hKWD
 Co6OidpKDF28iTlSSA5rXFVLAwskepEPwH4gt+Q7RSQ6AETiI/iYrXxtyAPNGWsMs1ar
 mprcS/3pd+9mPToOYKPqZhDJkPOqRnroNiYjO+d2IqBFiwVsBNYsdUAzWmzNFanizmyn
 sQCYeCwQremHDmE6by7MDFPzPv1Inc0Af0kw0OFOxPwyg3zWgDJaSMJBW5aQ8As9X+KV
 vM9ciR3dlAThxZBFyLhNZgk5MWOGvbp3G5YQLAdai4ikWIxoWHEUyoQ1D6fBViPaZUnW
 4QyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WIVZE6XCLajAHsuGZVfuYRo6jHzbL0m2blvNoQKDL8s=;
 b=wTpl4LRIXkqZHvOeY8Sj59Pp/7H92cTo1uvhfc0Gl7RFEVDdqKjCC+NxEcQ06QAqzg
 muzv0rkaNwERP95r4piPCAPfO1nS1qPEziVQNJ/GWSImcZ6gQLeGJSvdWPghUKbY6Boc
 gedEtSh2aAqALCNYjx/5QgC9hS0h7+oP8QxcejIvzkDREASBmmAyLUYkB5TZhA9hByDf
 Dj3Y9eJym73FjOORYve/P/C5QBp80JrlyzUzjsrsjB+k+jGGL28raWln0JYCF4PLmL12
 5HAyhjIkgw1bAlNBwGx4aID291c6axlT6LdjeUtF3cH5YeVUqoT/+lgpsVll8+6ixpBj
 nmiQ==
X-Gm-Message-State: AOAM533FBW7QZI8ma4mE+W17QnGXjgck+EfRTkeT6FLn5ys91qe4JVyI
 QJ8UtyhbGwJDOmMWWXEZqIU=
X-Google-Smtp-Source: ABdhPJyOsbeXyUSUTQjwf5UAx36Wk4P1w0ATAaDgY9vHZJ9O2dOi6vpMASUeSf5Z90QlK2synazUrg==
X-Received: by 2002:a1c:192:: with SMTP id 140mr5916069wmb.186.1632245834575; 
 Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 13/26] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Tue, 21 Sep 2021 19:36:46 +0200
Message-Id: <20210921173659.246165-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

