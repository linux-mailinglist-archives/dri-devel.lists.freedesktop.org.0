Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B03AB23A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DC86E8EB;
	Thu, 17 Jun 2021 11:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FD126E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z12so3501102edc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=sOQGBXqPZYb4VhHiZysul1mv0Y5S+MhCCItbz9UHtXicp3kUgp/stG1N3WEDg0WQNA
 KuX+kWiSQcyHtd+4Q3yVKARfSprDU5SoZya210yjZ+7yxgF472bhYHycnphV0w17aEmG
 cl/w93GKuJUqiPTDj78CNuPHdSmnWgrvFEeb3nHdfcN9j7kiP402JJsocFKh7gawRlVf
 F4jfa+uvDDSOQ/3a4A675gYsIYpd3q2aJ5Yhp+qGdcYgJrohoHSxXL6YNEisPGWS0PgT
 +7e0clwZ6uX0erSLNWWG9pQLaPg7eBt7DNTTXQ9KuAt6xohb5sh6m1AC5RGGNAn/KKpg
 bjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byLSDqjdKi3+cE2IMMDe/R3eVJ9OpfF5t0/Jijtn6q0=;
 b=U1BV7zb4Mig0XdmimpnPMkw9WlUYWw2bG1b8Pe8qBZaP/noRb6ia843SJqIbs0KyEd
 YOqX3PXYXhwCizka1Iq94/sAubDBMSkoFOaj56LgJZ9SmxOY26JnqwvGHGbvb8hxTgPg
 /wrpxi7vtQFLJP3PzkZfxNlY8gzNEksx/HbZO+SACVjcEXAd5eHr6duy0hq4ES+TXzxI
 vR82bHLuG0d568XXwDHUGCtkXzpqzSQLVOhZjQoq5IMtFkrOHbk5nvqgHsIUhnlZjkFX
 Fw7mSqMhVVnNajGOmNgoHehyFSUbtv86zw3sJBMJqKDATa4bXYVIcdK+IKcRTFwM8PgZ
 lkqQ==
X-Gm-Message-State: AOAM532CHPchKy76ypdKgaPwlzl3GU9vZQJkdlwKBe4WFdofuiiUmQr+
 5kbDxvzzx08wt1WseGtR3rU=
X-Google-Smtp-Source: ABdhPJxPES9M3EFm+goK97aBV/aqBmulWsvrxZXDpmswFtsIKGYgZSrLa6HNl26BpQgDFlDZEnIjWw==
X-Received: by 2002:a05:6402:27c9:: with SMTP id
 c9mr5838983ede.371.1623928566809; 
 Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 08/16] drm/i915: use the new iterator in i915_gem_busy_ioctl
Date: Thu, 17 Jun 2021 13:15:50 +0200
Message-Id: <20210617111558.28486-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

