Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF3452EF9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 11:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884226E986;
	Tue, 16 Nov 2021 10:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12B36E092;
 Tue, 16 Nov 2021 10:24:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w29so36466691wra.12;
 Tue, 16 Nov 2021 02:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=aE6l4NuYKZntvX18ph7Q5o2EYNVJMQNc5RA+RnsTb4g=;
 b=TQXLcMc9k40XyejLlDnNaPtfq2p4yMMKBRaez3W6EjTDBslR9RtJhL+CdCNJJBt4/D
 eiiea5zQdpNQCJ5Cd35Goxz3uWCgn/C/LBDNpXB2r44AbfA5KWeAbLjp/jRHwehApLU/
 UXnkPTxa16a/OLVa0hWs4EUeVrQ9vAOiXKljYjWtBK3FUmDQNVml8SCkORDKgtzF+M7o
 FOApEKhDqabxJYg5uiqgqXa9VZYmWeMxRtmkoZPmXhdvTa1CVzqe+5AW2Y5WplDFs4Ay
 eIrw8IQht031aMFTcengNn8WugA2EQofgrAUhDJkAqYKBq1VizqFwHkz7wPG6HffmRAc
 CEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aE6l4NuYKZntvX18ph7Q5o2EYNVJMQNc5RA+RnsTb4g=;
 b=02gVlxoxejNNYkruUgtiKSBJ2zAP7mdIAmbz420vnNETyF9bBEGYRNeteFVLLVahJT
 owJZo+okoaSY/kyypNeZ57ijDRPzqsdMIzcGxSCFiyoiRshToCUex3FRFiDpaDEgkrsN
 0bHW02fG4EpASIclXc+lCWs2Vx670sKnDIjRj9DNIRwJ5gVhZ2MhyY2uIePh0GgVplzm
 6wPeu343vE2NkUH+slBCaXu+oqg8Km+rPQ0b/+lpLJYdqvzw7+wK2cWx7BJwst98+kbf
 Pw42sGgWNZapz0WvEwQmSOGveGBndMsxhuYSy73uxMmhHuBhz2EOSTB2maaY2m41NhYO
 yXnw==
X-Gm-Message-State: AOAM532rg1wdKuXQuWEzXMQtcWkKosuG24co9xOrPppPb17yAuNVVGB8
 +4xGWdn3PmpWpGvNumO5aLtj51oXXPEKOA==
X-Google-Smtp-Source: ABdhPJwqK9iy+6VBb8JBGWD3+Ieb3KpWWSs1OLz7ZTz/DwTk1n+BKRFemtKJ1T1DfbwmtHs2WmdB4g==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr8033404wri.92.1637058276224; 
 Tue, 16 Nov 2021 02:24:36 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id 4sm22119334wrz.90.2021.11.16.02.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:24:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915: use the new iterator in i915_gem_busy_ioctl v2
Date: Tue, 16 Nov 2021 11:24:26 +0100
Message-Id: <20211116102431.198905-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116102431.198905-1-christian.koenig@amd.com>
References: <20211116102431.198905-1-christian.koenig@amd.com>
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
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_busy.c | 35 ++++++++++--------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_busy.c b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
index 7358bebef15c..470fdfd61a0f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_busy.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_busy.c
@@ -115,8 +115,8 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_i915_gem_busy *args = data;
 	struct drm_i915_gem_object *obj;
-	struct dma_resv_list *list;
-	unsigned int seq;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int err;
 
 	err = -ENOENT;
@@ -142,27 +142,20 @@ i915_gem_busy_ioctl(struct drm_device *dev, void *data,
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

