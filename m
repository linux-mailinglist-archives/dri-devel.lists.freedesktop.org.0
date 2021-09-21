Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228241389C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18816E9CE;
	Tue, 21 Sep 2021 17:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9716E9CB;
 Tue, 21 Sep 2021 17:37:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t18so41546559wrb.0;
 Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=QzMA/MJYLzsk3fKoS93pNaqQULxZ7tIKjhecJyxX+My31cSMztTOIDiNKFaGZu7+sM
 Zz2XQj3G6rwGASa6eUmy9UpTfIJX0YfdpjEFLFo4EM4rmP/K/ixcmqwT/Ud16sk/+Zgq
 igUcslde55qLgyiVrjiQ3Omt3sKzUkX24IEpoqYCLDc6x9J0bY7Ktw2kEYc6Cf+Ke21m
 0FkxYIuv34lA9y1RDhJHy8/pINXoD8JHA+CD0OrOLATne9Aj63mB4C6sJKkY0lrpG6Xd
 IaNto0v0qYmSGP5zQ8aSvcGp0/wlfB2aMtYqNeGNtxqK1PTeNyApddXNQZfOJbK1sUXT
 iZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=Bv8PjYfZxTHKEayCuk7QJq32Cxwon9S90ary4uYkJwEwsFidyuNBnPf2NM/SgCumQx
 uFDqsjNxuw+cvfQMoy3ajggMa3o56W7uXVscG13kP/1RlbBL6Ed7lGOIh5GYY7gJ5Wzn
 ZBb61vE6xY/Xg/znrE7x00mvLE8NF1O0VZng4eiUgqQbrc1IKwY+URJ4zKi8k6Zx6gjU
 hIRwxb8G6luuUhdR/wui2UsWX2RmiLDd3wQojn+RbfKQxayHd4uw0xuyBgriuDaaMvJf
 T+8yNiTpuBobPyUygGJj15hfpdiKz4Kxjq4wPwP/3tA4U+IrPwMPKIUgQ2sNRmemWqQr
 mhpA==
X-Gm-Message-State: AOAM531R64/rIQ+hdBeiA0Ck6MJY36EQDiR7hNBOty7/htZX+at6ed5r
 kYU88phEOkMt8h0vrWup3Ro=
X-Google-Smtp-Source: ABdhPJx9BSlIPy12vMo8UwZ/k1sZ2Iu5q5ti+N/kgo5j7w4UmBjHDnDHWN7dwqPuLhZdrHpzyicmVw==
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr36265102wrx.413.1632245832661; 
 Tue, 21 Sep 2021 10:37:12 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date: Tue, 21 Sep 2021 19:36:44 +0200
Message-Id: <20210921173659.246165-11-christian.koenig@amd.com>
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

