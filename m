Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE745A55C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1CC6E7F1;
	Tue, 23 Nov 2021 14:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0326E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2407249wmr.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
 b=IZZJm5wBcrUw5S+SV0DKy9QiVgxymjOR1JQhuUoWkg1bCpNsQkqMwSrSv6D8LTRV57
 MIkZKFn/6/OMUOeJvWvBfjJ5Too5L/A4vMWbkzToERXVSHue1i1df6RpFjH2h8a0dXSG
 TbOznsKwabznnnt4s5NshynHZxaTV9qPXvjna9Yl+5S73tXfoJiwkz2BX54zHuQ4dauo
 7eX7IguwjBJDZ/BB2v5InrL7EYbPYLRcLrJhXkHhn/v5NVEmEzY277OHesnTzdixPAgo
 +c3VaSap3DGW9WTjVmwzRRzqwF4SW6a1kFgM6jcy4cw1uYzJ5l8P0o8KtCsr+5ZptJaJ
 ggxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPKJq2Wt16wetIpfIT15/6v8GODpjJBfKyDGmSXKrmY=;
 b=15ODOFALJ3noKDDnDeaj40rmKg7m3fpVO9OYZAykU8ju1VSPybqToyN4gBR8L+GAWS
 Ti/kDp42nmnyQFQ6+LSIEuWXQQWK7IbO3VMXznL7zZECbwKOOTLAecbwTH+fkltwNG3T
 kR8rzTeqy9wM2INfyrkK6VctTbBxFoqpBlnzkRO+7/pwkV8W6HTsUVXr2XMRGSlP72wR
 B9Ep0gtoTLY01vp6Zg88OnDgEU+44rJS3IISYnJ/iB8xwQAbAtifHz135pzfpIVzp5+K
 bgOaF5XItB9cyIOVwyTdeSdGJCZ8WFs5e99FHxS2xTglS67UokEDK6aUVP0hRM6EMiGL
 VtHw==
X-Gm-Message-State: AOAM533Mbjt731yJ3dJbW9sT4u5vZsaV8qrFwR1ornVV2K9x/EjSBJC5
 ApG840QVJCSDyCgCu7tajGU=
X-Google-Smtp-Source: ABdhPJzExkfEmvQQbn+dzA8SjGvNJAesPqLUleluPP95rkU+PB6EWtrF6hZ828idEP7AoWJqT9uNkQ==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id
 f13mr3660138wmq.7.1637677293126; 
 Tue, 23 Nov 2021 06:21:33 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 10/26] drm/etnaviv: stop using dma_resv_excl_fence
Date: Tue, 23 Nov 2021 15:20:55 +0100
Message-Id: <20211123142111.3885-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can get the excl fence together with the shared ones as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
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
index 64c90ff348f2..4286dc93fdaa 100644
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
+					  !!(bo->flags & ETNA_SUBMIT_BO_WRITE),
+					  &bo->nr_shared, &bo->shared);
+		if (ret)
+			return ret;
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 180bb633d5c5..8c038a363d15 100644
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

