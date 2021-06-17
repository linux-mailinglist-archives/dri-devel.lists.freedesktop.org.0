Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535363AB236
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663546E115;
	Thu, 17 Jun 2021 11:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F496E115
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:10 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id w21so3473735edv.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
 b=RIin5nZI/rpjSAo5R/hPF0Y/Mqr8Yq4tPJjB9KCgi1NwScGxumI9QfNhDpG/ocMPlL
 V7hyyE1Ne0mYBRkKYqDLJqQ49roJLNg12GRTc1V/jLkh5BFfQ+jkoD4unN0oWK/yOGAd
 PHI7FvSo4kzHBf30s/Bi/pVIkUaoSRle68FxqzlpGnpscWmkKNiGyfzMewTAOpBLjGYT
 yItfwLjrITYcM5owdPmOyrInM6mVSDokQr4zOWs/AGvg/Bzjl+ufk39yZtsvOxk4qRkj
 BLA3zb7Shrql6XGErODXjemVG5dWF3rolFdDfJSX3qPyLYLHmgqDgj05csKa2J/0ZTfq
 SI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvNXqtq5mdZJpJK7jpCUZ+hsh9G2TDoGYYpRx9Mul74=;
 b=mBCSuXrKs6x71HzrCPNBaVKyYW1JSrdx3uZ1alG00DYBLHJilQPIgQf4zaJKgDBDck
 ZYYnuEbrOpvAKV68zkKDS0Gwen8kWdOkbLA4Q9HnHk+E5EsSodwHYSJT3sQEBNOV+F9K
 c4ZCRrpBBAeFAIZQYOddPG86m5hE881rBn6eYnIiRFNP0/mbw05RV9+yQimJZayGtAqi
 alC4McJipjMMEK4Xv2rLG1M6Xrjub9miC+Jo/0rhRTEakGPGU8WOgD6TKj5e3uPikGHJ
 2k489jA2qbTjGaBNtJ7qNirWg21ZPqq2+NXL1kDEb3OCwsGM3OoHQ0dmh4g88QXnfkcU
 lMaA==
X-Gm-Message-State: AOAM531X22KVCJNhFur61aC1dp/MyJWRQ1CQc6HMY6r3qXuDOeQJ2Av/
 fZJedKGDKupgaHvKn0mc31U=
X-Google-Smtp-Source: ABdhPJxdqm0xly694XIcLjrbZ9A76Y59S2aejU4bGXP1xl8mBcHQH3xduN5/LfUZEksy/oiQuJIoCA==
X-Received: by 2002:a05:6402:51:: with SMTP id
 f17mr5633820edu.359.1623928568856; 
 Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 11/16] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date: Thu, 17 Jun 2021 13:15:53 +0200
Message-Id: <20210617111558.28486-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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
index 862eb3c1c4c5..031ba20debb9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_cursor cursor;
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
+	dma_resv_for_each_fence(resv, &cursor, true, f) {
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

