Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3840F79F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134F26EC4C;
	Fri, 17 Sep 2021 12:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B06EC42;
 Fri, 17 Sep 2021 12:35:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 b21-20020a1c8015000000b003049690d882so9830266wmd.5; 
 Fri, 17 Sep 2021 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=MnWtggex5Ail8JVsmN18gU4UHQ3jSuSrLinUisjzQ2SEGe7ScDEXLvZt37dLvaCXEj
 du2do7tClOucHFUpb9UKhlIdhfOspxZgKMOQUbhf6nCD1OcyOLYsvrnV5wsJoEj+sox9
 VgCRw4SbsOyj4zo3LUhEu60i6BndNeR40dViKCQjblRx6HHbZGt9k3TQs0AlvdTw4Nd7
 ZBcif4iXQsEHzhbiNT9r+Z6InOC8GT1NcXUAGfKCBjbniX6l7/A+w3+Ugy1d85rFE1Ol
 vwG03IAHCY9BaSz5+bpmvRHoPWQ3WfM0RfrofDrI/JrW81ulln7xZ+xxXtBpe50sdixs
 ql3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IkVWp2cRgm41mlWFdiuPcdEqOEMHJpLCxm3yFN2dD0Q=;
 b=OQBMZPPmK6Q7PQYQPErPNyF+2hVoEGBNc7kYw9RTs2u9ZHQoBEbIF8cbegY+0dEGcf
 aCgvdLG5n2ktmYERWkuCtGmdlE0YfLNh7Q498xBjRsgHv+iIhpavHLAkCWcbJOaNjFsy
 ZCTOx4r+cI8WRjbz8tXKb8NHmwzBvDwYunWjIs3p2gbynsrZ/oDjMxoWUBJ6zsi2gUc+
 yHOo5ncO6loRRDxRqDDAtpwdet3/fm+cFUR8HxSFC6uywYVaHnZ1jrJbd8rb3clgFtU/
 cKzTqmqcFtRF/nSscc1dfooqq2FA0T8CkC+6segWhO79XFwysbcFKYrxV7+N0VRukHDs
 00eQ==
X-Gm-Message-State: AOAM53174yuWlSLoaP7Zw42jGPECt07HQFI6PapMMDv9N9EAKGRagQDV
 aPHiWz5VC38D/bhceps1yb4=
X-Google-Smtp-Source: ABdhPJzdFJRubHKlc6TxRV8emqLHCMF/tBXOi790xDh1XujN5nwcSLxOLOSNyq5qMuPOn9xUhM5OtQ==
X-Received: by 2002:a05:600c:40c4:: with SMTP id
 m4mr14792529wmh.100.1631882125635; 
 Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date: Fri, 17 Sep 2021 14:34:58 +0200
Message-Id: <20210917123513.1106-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

