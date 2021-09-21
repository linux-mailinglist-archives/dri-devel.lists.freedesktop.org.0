Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCDF413887
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89CE6E9C4;
	Tue, 21 Sep 2021 17:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923DC6E9C1;
 Tue, 21 Sep 2021 17:37:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t18so41545825wrb.0;
 Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
 b=f90LXtFRXtKJDn4uKSQnEBW8D1SlWElg5O4xeEUOqGVkwdBPNP/q8LJYXvMSmVlEmT
 qVgkUrV2iqSXc3JyfSV1HGVZSR+HEO4zuaoP0pGWlse9f3W9Hdscnt3CO+gqpv5lc1aL
 9bfbs4m1hfr4lHxxkaBlmX5+SOoJFNh68TG3f4pg62cltvOsYtxOewJjWhOL/BgrHRnp
 Lw7YgzjP9T4Mp82ESB1ImssdMR3uou+yDcLky9LWguv9W+5TQzFVJSjzFVRuvUt1nTX/
 dciLLbCqC+IX2tyabgMUWY1pnfnhdfClexC4voHBtSqFfd4V1aMvxgNSK5JRdLWAdSAt
 DJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
 b=c3LN5xSU7PVtsDbxqpKYoLLs5BtKbPz/w7DzOUsZWP0xqsdRIX0rAt8wZ99SV05hdw
 7ztzelzwDFfreOSMqUIYsCYAZOE1sBKX6VVpQDKfNI6cCxxz2v5PTG8iRp1Wl+FLpEJm
 SDU8bJ8w1K9AEZfPx3Q+89nq9bQmgbiTHx68vRi2/ol1IlNjuKOwpUKI2UnMb0uWNoYg
 6Y9biAaRNra4MYhqgdPrE3w2Kh+CYBVvfiHI5/zElFn9S+Z1wk1bmqTIBghn73N/pCYA
 6lzuaFq/L29JSQ69qBJ0sviGuyIWc4ja0id61IFmFiHQDrWgs+ovn3oYRwGFbXg6KAIY
 zUBA==
X-Gm-Message-State: AOAM532l69TP4G8GoPwAULOXsfe9Xwlnjqnmlq3+KoADqsAmc7HPrN6R
 tS/wqfqH2EO34jjqeVCR68g=
X-Google-Smtp-Source: ABdhPJwjPZB/DU++bulTsI5pVdxKg1lMKPfow8+x4fcDYyYQLiGzaVVz3OqzT+5zXi11WvQ7Em1M0Q==
X-Received: by 2002:a1c:1dcd:: with SMTP id d196mr5795434wmd.9.1632245829165; 
 Tue, 21 Sep 2021 10:37:09 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date: Tue, 21 Sep 2021 19:36:41 +0200
Message-Id: <20210921173659.246165-8-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..f7d8487799b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_iter cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(&cursor, resv, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

