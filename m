Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBEE41EA84
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B568B6EDE3;
	Fri,  1 Oct 2021 10:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFED6EDDA;
 Fri,  1 Oct 2021 10:06:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id k7so14492332wrd.13;
 Fri, 01 Oct 2021 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
 b=ZsjIr/vefBbHHiUwrD7XJy6MswdJEEhiBaLuWXQmIOhOiycUXnK4K0Mr6yl3X/ZLXN
 01ZHFiF7Bcchgp+oaYJ6GzVkisSKo6t3pZKQuA1E4988bGs6bEeuPLIDTWv6oWbmD5AC
 YokBuiOn3ytUFAvyaZH6zfeVIRuI7sE0ZjbAEiT9tUi/VWmFAyYZIrIuUSCPNFwoSOk7
 knnoQIZICNp7V1xeCANmtyScQ3pL9y0AdIHstGD1+yFaUjG/KmQ6mbWLKDNR95opqfMI
 rVFjPTkPYXfVxv4pwgc96ORquSUQO2yvHhwsqn8AQQbBhT6+5PC6Nw9+Yki15qkSQDai
 P+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ue7puBcgohS+7D/zNLeUPSF3Sf1Ar8z9127abKsq3w=;
 b=VPvPQbc9OdDw7RlcJHCXjQm6NpnbJwlK3LE6VoLhHBmO6UqVRNjJh121Cg5lL2/ar1
 iKm2aFbK0ujGHsUtRIWLGptj0Pwo+dI4vfoxfrMGrXDjoZsDliw4FdfvxT47gLL+XpNW
 eNvAIVbKfuGzcsTQWCM6lcRdfUartVOSFFqyjshgVKwEoYGgguNb69lvtrwMlxZt/REN
 DfV2rFB3noQnc61moSwywcmaJki7haNq/ZL3ec3yx7ql+OJc1uQ3VBKdX8D/ikjYcxdy
 Xjr3ceN+T3vC6tgGR6W2SJwdG2Ixh5Nkoa3aXDG+jBbhPTABbA1CzMoiSXXD33SURC/k
 zIYg==
X-Gm-Message-State: AOAM5301DvkNYN7LTuk/Dd62nefeURlSgGYFv1RunUHH0rjx+8Eg1n60
 GUi6yuW3Py+EBQPG342qUFs=
X-Google-Smtp-Source: ABdhPJzm+9VExwWXqnVNs6G8xbrEIBMs86W03GOK95wzmAH6ZIKsuQCZRsC1otcFgzk6whqQoGRC0Q==
X-Received: by 2002:adf:97d4:: with SMTP id t20mr4627990wrb.34.1633082788233; 
 Fri, 01 Oct 2021 03:06:28 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 17/28] drm/i915: use the new iterator in i915_gem_busy_ioctl v2
Date: Fri,  1 Oct 2021 12:05:59 +0200
Message-Id: <20211001100610.2899-18-christian.koenig@amd.com>
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

This makes the function much simpler since the complex
retry logic is now handled else where.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 6234e17259c1..dc72b36dae54 100644
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
+	args->busy = 0;
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

