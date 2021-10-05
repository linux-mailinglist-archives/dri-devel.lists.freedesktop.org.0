Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67124422545
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB75A6EB6E;
	Tue,  5 Oct 2021 11:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ADD6EB53;
 Tue,  5 Oct 2021 11:38:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id v127so16078964wme.5;
 Tue, 05 Oct 2021 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=pTVG+71nd7hFTAn7vT8ADHpYkOAwXoN7alL2V8B/B8XRtr68wMKD760W8IsjROzTjf
 daOoQI+w3mQp4okffCYLdwFeEdI4Kww51diGSgF5KK/AlV5F1NEanftJ3tHe2UEwxnd2
 yrM/cfyq7SKNYs8aa47E+kV6ewR+K2i6tGHTMWKOh3XZGPoqa+f9i0AU9U8OrLUqkPZe
 wXrmPWPNEwQIBk+e/b160ZhPHO6eRZAqBtv3RZPsBLwaqdglP9vd5yPzYGy+GwuKlKoU
 Wf4d5XDskZSjB5eNkjweClkhhPJQWMfYzudDKHjZRdEK+YLwun95vH6RR3L/i9OsU7FP
 MQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=WSM5UH5MF53QdiMb0MzhdTwR4VAwQ+u8isIkJBo2+glQ8ZLKdHmLvPaBVm9XxPgcA2
 AKgmjNQycKZaUrYiNn+0ZxTIM2rl99cpE7UCQKXSHKsbMVPMGAVFNjjlSX8rhf//uOcc
 FXqor5LZb73EaUOUMx9Z/tLqk6DJLKzM9V7r93kZvgW/plhUB+43wdZQoduuYnEORIa7
 /w+bL7ZfIDqYtCK/j9SKKmDywdMqaQ19RBPRQZdpOV6knL3epVjyhNbhtCj/a7zVG3MZ
 r1Rx8hYZsG+SgXcU3OYqda2nJeETYHLtvr7HBRv3noHbidbSzUPlJElU2tlXl9p2C0s7
 l5UQ==
X-Gm-Message-State: AOAM531ysyr8+OrQ2Lyicq2sM8D2gwHnOMcqCosdbjQIiFxrbBr4ZkF+
 o09vyZUPobRKOGbNl4O1WPw=
X-Google-Smtp-Source: ABdhPJxtMhb11FqUzAvg+4vPZuCSefKCT26RL7LZnDsiEtcSoWAVGR4pB8VkqMa0acsjIkWXJKnJ/w==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr2854002wmj.14.1633433878659; 
 Tue, 05 Oct 2021 04:37:58 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 15/28] drm/radeon: use new iterator in radeon_sync_resv
Date: Tue,  5 Oct 2021 13:37:29 +0200
Message-Id: <20211005113742.1101-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

