Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E626408C51
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1E86E19B;
	Mon, 13 Sep 2021 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B406E193;
 Mon, 13 Sep 2021 13:17:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g16so14683890wrb.3;
 Mon, 13 Sep 2021 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQf+EG1LqOYQqT40zZYv5ISTQOpig8QPja/gK5mvSkk=;
 b=o0FiPQTwN18HlAj3IMAzdpZhNgUkwaOWPzbtIBRFMInNJnGiYMOctX9OPqVk1DHHO9
 SKmb4SZfoQ4HOdQdPSOiojjB8PWUv4WR6fD8Q1FdZYGF3ah0eMfncDKfOk4qD/h7uCci
 HcT7QlmrhxFCtre14LVVCzq+5DpaCtTHb5crySwbNhzxiZ0Z18kXpYA5tTuFgGddeoJ9
 SP4RZGJYTxpm/Xyi8pakNrIgAqDih5R7gcNHjtOU1KVvi/yjTUQNBpU6ov9jb3wfzYAg
 KckU3VW/kwn85Ht0hLjiRhezQ9wf3ZTuUzrzQjiDQWDU+JUPyARlVMjLNEVzSLgtft2Z
 gdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQf+EG1LqOYQqT40zZYv5ISTQOpig8QPja/gK5mvSkk=;
 b=jOkldqi6rR1QMtJlI0EW3gnNlbDrxqHxOcYrnRYCnGNiESybUHGb4ZyVSk/YS0KmT2
 82/MA/wNOOtXY4vFXIsIeqKQzqLfkzRI1FHgahvTbSeU/LL62Hg6RE9wMwqybtYAdG3s
 rQYDeKt1ocJ2HJYDpeL5qBCp+V7YEMHJs0isSY9IH/ZWIn8Q97IiQzobScvghr6tJvj/
 BoSi8/6ulSX9V/CM1ypO3X6emRcf3omXQwLgUgdJqgj2Y5OQ+XZUCHo2vwh7YTH97+BT
 lvIHPw/Wfmg52pU/f66GSfw4wuI2R65JqPbu/k/93JdaokBHS1jZGSgIzgwJs+ttMT17
 MGmg==
X-Gm-Message-State: AOAM530OeS0dJh7UVkjuTUHj4woe5/EGSJs2KFOeVR+Si1TvQrhTPZkH
 czIBNCVK9qJU4MppngVE0Y7oQxADcffjZJQn
X-Google-Smtp-Source: ABdhPJyVv83AoFCYbid5KVzm+8jM4rad/1rkOdsJV57v03IVN4TJUfiogyz91xsQU0YnKxNdMe/pUA==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr12627007wrt.417.1631539042306; 
 Mon, 13 Sep 2021 06:17:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/26] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Mon, 13 Sep 2021 15:16:48 +0200
Message-Id: <20210913131707.45639-8-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0a3127436f61..5dd0c3dfec3c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,19 +269,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_for_each_fence_unlocked(resv, &cursor, true, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-- 
2.25.1

