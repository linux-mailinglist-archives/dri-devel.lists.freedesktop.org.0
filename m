Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B655E4144BB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994926EB35;
	Wed, 22 Sep 2021 09:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4836EB27;
 Wed, 22 Sep 2021 09:11:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w29so4624795wra.8;
 Wed, 22 Sep 2021 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=Ua1WTdcULCVJgyuOvvfgOq9UKM6ZT/ugK3x8DSROR31LC/bzEtDJKSpn9wN+Oa1+iC
 5QQiBwuz2KUY0d4ev3JsfeSNM9p7o2mUpGKHfUXnubRAOf1d97WBSmyQkFkucFHCYwCS
 qG1S66N9Ff1/DGJOyZP1Vd33RRL34FRqP7sdtUS6vlPQEWZUmxbgLCJnbN3xw4IU51Pe
 vqbTj1L/FTQzRntNRxky4xEJV5yc1f1JIWY65V80gtwkTGEPvYfpucuMS6pL+ukOvJ6L
 Q6PKskYsBoW5erXrsxIabA05RlKIGxaQpDlols8wd3FcOXLTsBTepAoYwCckAWKnDccm
 lsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=QJeJt5SDuMZm/ZRkIU4pVlpvmGWgMaEYjgsBMLWAEJePuCmlZyZ/e5h4wSSXa/jfAL
 pV3IY5eoHuBjphHj8drZxEk96QZc/lqpQakVzyT89PAfdc2/bcG3gi2Zw0tNxJswxNYe
 eytLtVvhCfDdE5MJhbEIbSmKEedMHrjz5WW+spIqWvDB7uL+2gUPooaoRGxiSRIu2Yc3
 N40IA0hhCceTm+EmNwWViJTKHROe3sOsI2fcNrYrrSTpT0m+kwcJnAOFk/2DLBJJXKhz
 enbqM/VHkYRvAxldOjkYqqF1/CAi+aGk6du1+XXIskI15pWNPvwew3azRHE0bWPP482b
 z6JQ==
X-Gm-Message-State: AOAM530j/MsGDw5NQf0xa7EtOAOCBfLNWWbZONZN3jmDl77E99QgS3+U
 mG60QA5H0f77OI3nWX9Fu9k=
X-Google-Smtp-Source: ABdhPJwEnHZflQbZNIvlY5UfSsq0l60zNStoX16GjYgyxjqV6JFzPSHp+xvb2qeAILGpSnOZhNb/rA==
X-Received: by 2002:adf:f183:: with SMTP id h3mr39765708wro.32.1632301866385; 
 Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
Date: Wed, 22 Sep 2021 11:10:38 +0200
Message-Id: <20210922091044.2612-21-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

