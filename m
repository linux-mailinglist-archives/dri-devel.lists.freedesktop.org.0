Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E24B2654
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE44810EBD4;
	Fri, 11 Feb 2022 12:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC2010EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:13 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id fy20so22561819ejc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kxslsyj+YVWR4fxH+NR1YM+/iQHS982bc+OURLvUclc=;
 b=WAHQPCvQwzxZfhQyUJ3kgG9ELRpqd1OixxsZ+UETNZ1oZii9WeVJGwxoxN+9EMHLEC
 laKx34f3CTLZ1iBEUpzOzmVUdndWc1OtcOwSvhAGyEPD+ZsNx1cLT4sAAiGrQwsskI9F
 LPrP+K+24xGiY6eoDWFutL4RsYYwZrW4wpuG3WPJrA5w8hJBd4F1KsNqB+AAFg0MTLDh
 dgkfkSPPAkboukLyLrF452V74pwKCyVbEqnXWYTGATuGw/3Gs3nWCcwalEWAjWQlb2Gn
 x2ehAUOOWkSRksxTdeY5LtMi8IiCI3xNCXrz1DRzd5IJ0luL9RXROQ1LQC6Jg3X1GjOX
 Fk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kxslsyj+YVWR4fxH+NR1YM+/iQHS982bc+OURLvUclc=;
 b=1QxfNMIWG/Y4NWzN9cTqeFaVs4f7Ywm6OoD+v7og97qenXdq7qMnyWMCUSqWTFQMe1
 eWFzf9fFm48xdGDuKANST+gtwo9aVi9SDKVqrZdEtejE//uNOvAnxvY93Gp/zIfMdE7l
 2TvTBMZxejWi2pX0b3JlEqQJdAgCNmwqzzoKGYEsxrSB6w/0egjMd5HpyqfpuZcNm2c5
 MLJYz5N9n8SN3EEUDEQM44n8pLy0jsAAVRO5oxP0gHlQdvnXKFd6kXVLMLEh8jK2Q7sG
 NKiitadss06lXquYaHBEblVgo7EBNGZVZisCtaifzHsWGVOam6dSbTs0Bz5AVKvxcNiL
 EKiw==
X-Gm-Message-State: AOAM532m/iR86i/26RrxeGq0iEUd7OZtXbMHcW/WUYKuz6l+HWr0sgJS
 PElbLt/EumCrD0w+GbbXxLU=
X-Google-Smtp-Source: ABdhPJxHwiPYW3/6mmo1D9V8gkWE0qvnvJnxJBR26j+QlRWOlhMzX7dfEj9uguD8Zoiova3kdd4xtQ==
X-Received: by 2002:a17:906:58c7:: with SMTP id
 e7mr1164975ejs.743.1644583811522; 
 Fri, 11 Feb 2022 04:50:11 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 05/23] drm/etnaviv: stop using dma_resv_excl_fence
Date: Fri, 11 Feb 2022 13:49:45 +0100
Message-Id: <20220211125003.918447-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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
index 58f593b278c1..21d1777d5bf2 100644
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

