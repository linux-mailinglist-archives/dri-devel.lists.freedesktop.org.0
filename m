Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84402AC232A
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915D10E2C7;
	Fri, 23 May 2025 12:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cQuhZKT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3EE10E2AC;
 Fri, 23 May 2025 12:56:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-601c5cd15ecso8996257a12.2; 
 Fri, 23 May 2025 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748005006; x=1748609806; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KRowDDVntrTyorxPjeOsv26b3RS5lrdlmuzg/uFs/eI=;
 b=cQuhZKT9To0k7H/4wwz64V7z8Sa8nNVIkQndyoOiJ3ayBy+zdaykI1ILlO4LgkEzn2
 w844uXLmlRzDvdFyf3V5iGiuMcxhJn8THOdgmPvApJODxZ9SKqtjUDOSVUpx68g1SjL1
 qtfxF9YCkeFrdzMHkFunY4XHu9Crdf0OMOMcmhKUmpD4Jd4F5nD9S9ESCoVV8qHU603p
 h6AO+0bgtD9p+WhXWhqEVhKTYpKq8VxEajXBkfYeve/XBXWQnvcWGU6c1BXczCIcW0eW
 Le9shSCPr23kSefNJyqIlg1ASjbdblwCSLlIDiAjTAUKWLZY1FxwGqGpaqi3EqZ8v6pj
 NW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748005006; x=1748609806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRowDDVntrTyorxPjeOsv26b3RS5lrdlmuzg/uFs/eI=;
 b=vA7oOLEazT98WxMmXMdOTfCE+xdcpoN+O+ULanhEbHPLdjsm8WrleejmjL+CNN/4Tb
 KFotihw6eGUPoppEV59/FKBsJ0gkoEhCJafV1u4CS4wkyAnU5VtDF56hRN5EIW/4Ehth
 /bmruBuytZRalpQ2S+SpKTjWkZYOwMrzQMRvisBPE5q4qhUIW2FxgjCcbLmqCiQKy2lM
 hTgWV4n/GJnpVj1ferumPrBoJKipcMGuK19/OGwUfRv8nP8oXN8i/BHePWQuF+eVPg8+
 a2d1MGF7Xr5QHM8GNYb4p7srkmC6jiZRdT/3cZKXSij+wLlQItObTuKxbeTEb+8gqDPl
 TkLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQPYEHoZq5v40OTNf4HG4Dq52q2Zf6KVzyaBVyzkJ+UyPmMkXFSsBkrnx+XdmhtPceG+OZMrqa@lists.freedesktop.org,
 AJvYcCXivvS9jw8iiv4aB2cWl8DAUowb/Nbl0yLpT1GLnnHxy9Pg/ajT8Sd950JNwS7DyFbopP1sbfbjyCQA@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkd8bDG2R3NABDDIOS350r3pPX+twYdvqzE5dWenM+/yOFHLbF
 NqS6REwye+wD00qb8szXyJlmatJytfE6uORHi9Kl+ibYEidKkyar3iN3
X-Gm-Gg: ASbGncuSbDkRVmxlc1UbC1NA+n7GcIKpee/4IP7wPsRA5Mtw26y+qsF+3250zd8OzJS
 Lp858CFh5+WU4FXybV65/uHm/X+XCaqWOBOP379BjrReoz940ltXvp9AH7qB2MEmR39a96NaGPe
 7Aev8xmkn7XOXTArmw3NqxpVKZJ2JJ69FucUnwV/iGP0aSlwIh1eTZQjRPnnmJ7keN5MKzGugEE
 uLky1zdSDO8dZFHUDCpY45sjOxiKjIEEk6n5D9fwPctISoaiwSFcPcBLj4DxN4p3Y12URyNR1gR
 U4GNoUv5RIMhuRN17zd3Gew+V1BSVMk+INqlR314gAwrxmQ3MjUoRIH2PVh+z+wZ
X-Google-Smtp-Source: AGHT+IEEDVXlYYdEWgjGlSF4QRXBeHO97MGBnn3LTivQ/BL8KaJKldDt/oWKT8ZndN6U8KBLbZFq2A==
X-Received: by 2002:a05:6402:1e89:b0:5fb:1eed:cddc with SMTP id
 4fb4d7f45d1cf-601140a17eemr25671483a12.16.1748005006496; 
 Fri, 23 May 2025 05:56:46 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:9c00:c200:979c:6701:1954])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6020e441c84sm5863302a12.38.2025.05.23.05.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 05:56:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net, phasta@mailbox.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Date: Fri, 23 May 2025 14:56:40 +0200
Message-Id: <20250523125643.7540-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523125643.7540-1-christian.koenig@amd.com>
References: <20250523125643.7540-1-christian.koenig@amd.com>
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

It turned out that we can actually massively optimize here.

The previous code was horrible inefficient since it constantly released
and re-acquired the lock of the xarray and started each iteration from the
base of the array to avoid concurrent modification which in our case
doesn't exist.

Additional to that the xas_find() and xas_store() functions are explicitly
made in a way so that you can efficiently check entries and if you don't
find a match store a new one at the end or replace existing ones.

So use xas_for_each()/xa_store() instead of xa_for_each()/xa_alloc().
It's a bit more code, but should be much faster in the end.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 29 ++++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f7118497e47a..cf200b1b643e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
 int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence)
 {
+	XA_STATE(xas, &job->dependencies, 0);
 	struct dma_fence *entry;
-	unsigned long index;
-	u32 id = 0;
-	int ret;
 
 	if (!fence)
 		return 0;
@@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
 	 */
-	xa_for_each(&job->dependencies, index, entry) {
+	xa_lock(&job->dependencies);
+	xas_for_each(&xas, entry, ULONG_MAX) {
 		if (entry->context != fence->context)
 			continue;
 
 		if (dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
-			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
+			xas_store(&xas, fence);
 		} else {
 			dma_fence_put(fence);
 		}
-		return 0;
+		xa_unlock(&job->dependencies);
+		return xas_error(&xas);
 	}
 
-	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
-	if (ret != 0)
+retry:
+	entry = xas_store(&xas, fence);
+	xa_unlock(&job->dependencies);
+
+	/* There shouldn't be any concurrent add, so no need to loop again */
+	if (xas_nomem(&xas, GFP_KERNEL)) {
+		xa_lock(&job->dependencies);
+		goto retry;
+	}
+
+	if (xas_error(&xas))
 		dma_fence_put(fence);
+	else
+		WARN_ON(entry);
 
-	return ret;
+	return xas_error(&xas);
 }
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
-- 
2.34.1

