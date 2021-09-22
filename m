Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C313E4144D3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6216EB43;
	Wed, 22 Sep 2021 09:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3896EB35;
 Wed, 22 Sep 2021 09:10:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so4623699wra.8;
 Wed, 22 Sep 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=NZTcio66H20o4+aUG46IMbNGw/gsR2MLvFXmQmrJ1OvckTnHYUtbx4r0nCCpJ9Y/dz
 8BKfVinC47zlJHH6rS8n3bD9UN7mY7dVjy9mtZhsCbvB7pOdK+u5UVa6moyghTviVXty
 JKWpDYxOO97TlVUvPZ+JverRMrAH6NJVttL14cvQr0t4Ep3DnIzH9wWEx3WFkKtpikou
 qak0OwH3VMEabNYCOUN9WhPoCO4hzX9ziRvsBq9k/tc41rqmVm/wPn1FgKIKYV+Mr4Wj
 hdSTPEeOHlQy4LcT3krw4byAtBl0DBxq+7ZwIGKifvVu4P2T3fHDvO80to/Aa9HvoJho
 Tlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=wVfxuRQQWgj1XVy0mGz+9GkpXSoGRGLKa58VToML47QkLBhZEaaemdUlJhDVzO68rt
 Uso3XQOefT87Sq07PxiLi76SoDNz0E8WZQyN9632wTgmAW7iqhur6RpYzmFsvaJRpN9E
 l3k/X2mc9eas8Cd8jv+XJXI4bEVScJZmuY4OdcSpEDGe3ebEFwK3YpcsSxJtBInIfN55
 6v2Bttiy5PgvGwM49vpAS496iGkBR6yR8fAynVXHu/OqLxJ3bWDbtyhjhZXNUJxj9Mhh
 fj4Mcg2rXmYGrUmKDftEqDB7uiGX2c1uQkQRz422yA18gXd/mVI8nR/wQFTGFr8YoIys
 xgqA==
X-Gm-Message-State: AOAM533/opK6SjQ1HKp8lZ+W86roBmSCJhExS2sa+e7LA0fGrCgkl8n7
 7ih5l0ieRB1t2c7EavCT0CU=
X-Google-Smtp-Source: ABdhPJz88bvnw0jC1PGYz8LxLw5TlE7TvUYTgbj0Klim7fWgvO2htMt4CDF1oeNQCrfg3JzBmHIM4w==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr9147612wmq.26.1632301858176; 
 Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date: Wed, 22 Sep 2021 11:10:29 +0200
Message-Id: <20210922091044.2612-12-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..b991ba1bcd51 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_iter cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(&cursor, resv, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

