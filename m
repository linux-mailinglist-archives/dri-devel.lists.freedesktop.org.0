Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2964A4E28D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF3410E449;
	Mon, 21 Mar 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627DE10E436;
 Mon, 21 Mar 2022 13:59:03 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so10348590wme.5; 
 Mon, 21 Mar 2022 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7BBhMg9QuQqxVd+IklnAcIU/4hqgmqH6LPO+wfRgFs=;
 b=d7SsiTKpDKWsiwU2iubQA8KCqF9vffU1SefPMF38KkvS9T4ifmmL+/w148sWT53g4c
 YiytgZJLdE2sXKB1kaxmtNgHT9rQnvao3weiA42VT9ONiP5TXdOApRFqn3Nv0Rm/rYyr
 qQq9Www1KnTD1BFcXhQdWazMIoCCBWSr3GKFDf1HXf1WwNwZNAtKze6uBmxVroGzH8U0
 89AWUQFumu5vnfq96c+eUWo+QpRALE7upvjXg++pAkwiTbPazKyhSWnqJXbDfYO0UyHl
 YXZXnvd3ZnWgq8zfLcEO8LFHAaJ1mSjurjyffqIHoUhOWoQ6dLBYMWO8TXDY/c6+YAhd
 tAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7BBhMg9QuQqxVd+IklnAcIU/4hqgmqH6LPO+wfRgFs=;
 b=EE9Z3mIIY0AzcntZQYPrXDo/hscW59nYN8CGOkGXdlB0+xIBSx1bs+UdagsIdqDDAd
 cOt/5hUGfGZkzOnM239mdchuI7FaTY8bDAYpdlOwJiDtPK+bDAdfgPXPeIXH1qy/FLbi
 KHH7WNNJk7Zc6YJUXh1vWd076BRqw98Q/AuKsc4QOxeik4DcesB/PwtW6hAavpkhw7eG
 M/d1+eteOXdcMMg2A8CpM70lXo2XFIOe9upgJbqoNCHu/z8S5wzRPuYWoQxPk8a5uyDp
 imccMErBS3q0vmZB13GcH+dVSYSDftgR1lmZMUSbZR+ZZHJQbIrMFo8ouw4w9hfL9Q6J
 DRCQ==
X-Gm-Message-State: AOAM531N8m+0tkyZAxP6kLvEKK49iJ0k7Lx7nVyYZ9ycbZ8cDmKcoINi
 va9ACgExEM/2aPd+PLfkXmovOn9zjiE=
X-Google-Smtp-Source: ABdhPJyXwsrDer2N/3QqGGUFkBs+4k/CACrLQQ+cRzyLqsQDIQQzeb2riwAdm+G21nFsdEG0ivnMWQ==
X-Received: by 2002:a05:600c:1d88:b0:38c:b121:c669 with SMTP id
 p8-20020a05600c1d8800b0038cb121c669mr1754845wms.150.1647871141991; 
 Mon, 21 Mar 2022 06:59:01 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/23] drm/etnaviv: stop using dma_resv_excl_fence
Date: Mon, 21 Mar 2022 14:58:38 +0100
Message-Id: <20220321135856.1331-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can get the excl fence together with the shared ones as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 14 +++++---------
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 10 ----------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 98e60df882b6..f596d743baa3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -80,7 +80,6 @@ struct etnaviv_gem_submit_bo {
 	u64 va;
 	struct etnaviv_gem_object *obj;
 	struct etnaviv_vram_mapping *mapping;
-	struct dma_fence *excl;
 	unsigned int nr_shared;
 	struct dma_fence **shared;
 };
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 4eb00a0cb650..385ea141c23e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -188,15 +188,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
 			continue;
 
-		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
-			ret = dma_resv_get_fences(robj, true, &bo->nr_shared,
-						  &bo->shared);
-			if (ret)
-				return ret;
-		} else {
-			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
-		}
-
+		ret = dma_resv_get_fences(robj,
+					  bo->flags & ETNA_SUBMIT_BO_WRITE,
+					  &bo->nr_shared, &bo->shared);
+		if (ret)
+			return ret;
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 35e5ef7dbdcc..59277dc62011 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -39,16 +39,6 @@ etnaviv_sched_dependency(struct drm_sched_job *sched_job,
 		struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
 		int j;
 
-		if (bo->excl) {
-			fence = bo->excl;
-			bo->excl = NULL;
-
-			if (!dma_fence_is_signaled(fence))
-				return fence;
-
-			dma_fence_put(fence);
-		}
-
 		for (j = 0; j < bo->nr_shared; j++) {
 			if (!bo->shared[j])
 				continue;
-- 
2.25.1

