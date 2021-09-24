Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE1D4177C8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C497D6EE4E;
	Fri, 24 Sep 2021 15:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE6189155;
 Fri, 24 Sep 2021 15:31:32 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so28583279wrv.10;
 Fri, 24 Sep 2021 08:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=h75DPlfzvi0Y5L6JHOzXyzPJNHfjtxZfuvuYNARNXh37ufDGKFdCsSz920sBteo4Ff
 2+ZyPBESlT065wf3LBrNWNS/9G7wsxcBfJy3Eqk32hn43Shwy+pM6U+kJ9R0ZejuR+Vz
 yLXzbd9Fqh58hReqDGcLpg5cRhUJS1FqN9OB8KTqMrHIiZ4JuNtRBeI1pPj2jOt8Skri
 u0LDjp7UCnj2gZ2CFnDl8PaexMJygajFPVi7CRCis59A6Ez7Ikfjf32Yi5LUm+uc0SSG
 mLfBDsQ5wQIYfQHwtMpWP5Yhja4lWiRV/2XgAq5g2TWJONo8xDiz0PWZ4axw3N3EayBb
 DzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=WNWP4E065vXvHGxULFXNQMsT9EG/gsPlf6wBwSixwppAXqfMhndm9qOKQh9/qEz7R4
 xeqrbQuUiP53LisZdN5Mcb2yIwnb/1CWeJ43uk7RbUA6WnzfW0N6wktkozYgc9eK+ue4
 amz/IvamVffZpy+SoXH2et+XIZ5V1pk2ljvh9ynZXpcgr8BIxB6j/mVx2XbaiqqLi++R
 E4xanc9W9udpMs6oFsx8CwTbGe+sL1QxkMWZyEj3RanjW9IGIGs+WTA59NilF9Uk0/X8
 utyJNQw3BczBEMQ9N8ASkZlFE0Dun1sht/8QWc95lns5EjkBPid6kTdFL0MOk/Hq6fR0
 ZoNw==
X-Gm-Message-State: AOAM532Cd3iWkcrAG2QjS3JflSpYV1t+9fQ2RFatF1xKeesV+9vgpoNC
 I5doPo6gp0u2nIZOvvItAt1as42E2pU=
X-Google-Smtp-Source: ABdhPJwyWAVMcyXwelTSK6xbOku8WjdhPsn8N1Gqe2DhnPKS7Z/zmZ1yQ1Z6lfpvcNwol/KLubCcmw==
X-Received: by 2002:adf:fb04:: with SMTP id c4mr12282673wrr.244.1632497491274; 
 Fri, 24 Sep 2021 08:31:31 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/27] drm/radeon: use new iterator in radeon_sync_resv
Date: Fri, 24 Sep 2021 17:31:00 +0200
Message-Id: <20210924153113.2159-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

